module ad7768 (
				input clk, //输入时钟
				input rst_n, //复位输入，低电平复位
						
				input [20:0]ps_mdio,

				input dclk,
				input drdy,
				input [7:0]dout,
						
				output reg filter,
				output reg [3:0] mode,
				output reg [1:0] st,
				output reg [1:0] dec,
				output reg ad7768_rst,
				output reg sync_7768_in,
				output ad7768_start,
				output ad_clk_sel,
				output ad_spi_pin,
						
				output reg [31:0]adc_data_1,
				output reg [31:0]adc_data_2,
				output reg [31:0]adc_data_3,
				output reg [31:0]adc_data_4,
				output reg [31:0]adc_data_5,
				output reg [31:0]adc_data_6,
				output reg [31:0]adc_data_7,
				output reg [31:0]adc_data_8,
						
				output reg adc_to_c_rts = 1'b0,
				input c_to_adc_ack
			);
							
	assign ad7768_start = 1'b1;
	assign ad_clk_sel = 1'b0;
	assign ad_spi_pin = 1'b0;
	
	reg en;
always@(posedge clk or negedge rst_n)
	if(!rst_n)en <= 1'b0;
	else if(ps_mdio[20])en <= 1'b1;
	else en <= 1'b0;
	    
//ADC转换状态机
localparam
		adc_idle = 8'b0000_0000,
		adc_reset = 8'b0000_0001,
		adc_reset_done = 8'b0000_0010,
		adc_config = 8'b0000_0100,
		adc_sync_1 = 8'b0000_1000,
		adc_sync_2 = 8'b0001_0000,
		adc_wait_drdy = 8'b0010_0000,
		adc_read_data = 8'b0100_0000;
		
	reg [7:0]next_state;
	reg [7:0]current_state;
	reg [5:0]adc_count = 6'd0;
	
	reg [31:0]data_reg_1;
	reg [31:0]data_reg_2;
	reg [31:0]data_reg_3;
	reg [31:0]data_reg_4;
	reg [31:0]data_reg_5;
	reg [31:0]data_reg_6;
	reg [31:0]data_reg_7;
	reg [31:0]data_reg_8;
	
	reg ad_drdy_1;
	reg ad_drdy_2;
	wire neg_ad_drdy;
	
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		ad_drdy_1 <= 1'b1;
		ad_drdy_2 <= 1'b1;
	end
	else begin
		ad_drdy_1 <= drdy;
		ad_drdy_2 <= ad_drdy_1;
	end
end

	assign neg_ad_drdy = ~ad_drdy_1 & ad_drdy_2;	

	reg ad_dclk_1;
	reg ad_dclk_2;
	wire neg_ad_dclk;	
	
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		ad_dclk_1 <= 1'b1;
		ad_dclk_2 <= 1'b1;
	  end
	else begin
		ad_dclk_1 <= dclk;
		ad_dclk_2 <= ad_dclk_1;
	 end
end

	assign neg_ad_dclk = ~ad_dclk_1 & ad_dclk_2;	
					
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)current_state <= adc_idle;
	else current_state <= next_state;
end

always@(*) begin
	next_state = 8'bxx_xxxx;
	begin
		if(en)begin
			case(current_state)
			adc_idle: if(en) next_state = adc_reset;
					  else next_state = current_state;
			adc_reset: if(adc_count == 6'd10)next_state = adc_reset_done;
					   else next_state = current_state;
			adc_reset_done: next_state = adc_config;
			adc_config: next_state = adc_sync_1;
			adc_sync_1: next_state = adc_sync_2;
			adc_sync_2: next_state = adc_wait_drdy;
			
			adc_wait_drdy:if(neg_ad_drdy) next_state = adc_read_data;
						  else next_state = current_state;
						  
			adc_read_data:if(adc_count == 6'd32)next_state = adc_wait_drdy;
						  else next_state = current_state;
			default:next_state = adc_idle;
			endcase
		end
	else next_state <= adc_idle;
	end
end

always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		adc_count <= 6'd0;
		ad7768_rst <= 1'b0;
	end
	else begin
		case(next_state)
		adc_idle: ad7768_rst <= 1'b0;
		adc_reset:begin
			ad7768_rst <= 1'b0;
		    adc_count <= adc_count + 6'd1;
		end
		adc_reset_done:begin
			ad7768_rst <= 1'b1;
			adc_count <= 6'd0;
		end
		adc_config:begin
			filter <= 1'b0;//1:sinc5 0:宽带滤波器
			mode <= 4'b1010;//快速模式 MCLK/4
			st <= 2'b00;//所有通道均工作
			dec <= 2'b01; //X64抽取
			sync_7768_in <= 1'b1;
		end
		adc_sync_1:sync_7768_in <= 1'b0;
		
		adc_sync_2:sync_7768_in <= 1'b1;
			
		adc_wait_drdy:adc_count <= 6'd0;
			
		adc_read_data:if(neg_ad_dclk)begin
			data_reg_1 <= {data_reg_1[30:0],dout[0]};
			data_reg_2 <= {data_reg_2[30:0],dout[1]};
			data_reg_3 <= {data_reg_3[30:0],dout[2]};
			data_reg_4 <= {data_reg_4[30:0],dout[3]};
			data_reg_5 <= {data_reg_5[30:0],dout[4]};
			data_reg_6 <= {data_reg_6[30:0],dout[5]};
			data_reg_7 <= {data_reg_7[30:0],dout[6]};
			data_reg_8 <= {data_reg_8[30:0],dout[7]};
			adc_count <= adc_count + 6'd1;
		end else begin
			data_reg_1 <= data_reg_1;
			data_reg_2 <= data_reg_2;
			data_reg_3 <= data_reg_3;
			data_reg_4 <= data_reg_4;
			data_reg_5 <= data_reg_5;
			data_reg_6 <= data_reg_6;
			data_reg_7 <= data_reg_7;
			data_reg_8 <= data_reg_8;
			adc_count <= adc_count;
		end
			default:begin	
				ad7768_rst <= 1'b0;
			end
		endcase
	end
end

//转换完成时，将转换结果输出到ADC控制端口，同时产生转换完成信号
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		adc_data_1 <= 32'd0;
		adc_data_2 <= 32'd0;
		adc_data_3 <= 32'd0;
		adc_data_4 <= 32'd0;
		adc_data_5 <= 32'd0;
		adc_data_6 <= 32'd0;
		adc_data_7 <= 32'd0;
		adc_data_8 <= 32'd0;
		adc_to_c_rts <= 1'b0;
	end			 
	else if(en && (adc_count == 6'd32))begin
		adc_data_1 <= {data_reg_1[23:0],8'h00};
		adc_data_2 <= {data_reg_2[23:0],8'h00};
		adc_data_3 <= {data_reg_3[23:0],8'h00};
		adc_data_4 <= {data_reg_4[23:0],8'h00};
		adc_data_5 <= {data_reg_5[23:0],8'h00};
		adc_data_6 <= {data_reg_6[23:0],8'h00};
		adc_data_7 <= {data_reg_7[23:0],8'h00};
		adc_data_8 <= {data_reg_8[23:0],8'h00};
		adc_to_c_rts <= 1'b1;
    end
	else if(c_to_adc_ack)begin
		adc_data_1 <= adc_data_1;
		adc_data_2 <= adc_data_2;
		adc_data_3 <= adc_data_3;
		adc_data_4 <= adc_data_4;
		adc_data_5 <= adc_data_5;
		adc_data_6 <= adc_data_6;
		adc_data_7 <= adc_data_7;
		adc_data_8 <= adc_data_8;
		adc_to_c_rts <= 1'b0;
	end
end
			
endmodule
