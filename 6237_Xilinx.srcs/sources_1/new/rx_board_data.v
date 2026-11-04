module rx_board_data#
(
     parameter  DDR_BASE = 32'h30000000
)
(
        input clk,
        input rst_n,
        
        input [20:0]ps_mdio,
        output pl_interrupt,
        
        input [31:0]adc1_data_1,
        input [31:0]adc1_data_2,
        input [31:0]adc1_data_3,
        input [31:0]adc1_data_4,
        input [31:0]adc1_data_5,
        input [31:0]adc1_data_6,
        input [31:0]adc1_data_7,
        input [31:0]adc1_data_8,
        input adc1_to_c_rts,
        
        input [31:0]adc2_data_1,
        input [31:0]adc2_data_2,
        input [31:0]adc2_data_3,
        input [31:0]adc2_data_4,
        input [31:0]adc2_data_5,
        input [31:0]adc2_data_6,
        input [31:0]adc2_data_7,
        input [31:0]adc2_data_8,
        input adc2_to_c_rts,  
        
        output reg c_to_adc_ack,
        
        output reg pkg_wr_areq,
        output [31:0]pkg_wr_data,
        output [31:0]pkg_wr_addr,    
        output [31:0]pkg_wr_size,
        input pkg_wr_en,
        input pkg_wr_last,
        
        output pkg_rd_areq,
        output [31:0]pkg_rd_addr,    
        output [31:0]pkg_rd_size,
        input pkg_rd_en,
        input pkg_rd_last,
        input [31:0]pkg_rd_data                         
    );
                    
	assign pkg_wr_size = 32'd1024;
	assign pkg_rd_size = 32'd1024;
	assign pkg_rd_areq = 1'b0;
	assign pkg_rd_addr = 32'd0;
	
	reg [7:0]count = 8'd0;
	reg [31:0]ch1_data;
	reg [31:0]ch2_data;
	reg [31:0]ch3_data;
	reg [31:0]ch4_data;
	reg [31:0]ch5_data;
	reg [31:0]ch6_data;
	reg [31:0]ch7_data;
	reg [31:0]ch8_data;
	reg [31:0]ch9_data;
	reg [31:0]ch10_data;
	reg [31:0]ch11_data;
	reg [31:0]ch12_data;
	reg [31:0]ch13_data;
	reg [31:0]ch14_data;
	reg [31:0]ch15_data;
	reg [31:0]ch16_data;
	reg [2:0]rx_state;
	reg fifo_wr_start;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		ch1_data <= 32'd0;
		ch2_data <= 32'd0;
		ch3_data <= 32'd0;
		ch4_data <= 32'd0;
		ch5_data <= 32'd0;
		ch6_data <= 32'd0;
		ch7_data <= 32'd0;
		ch8_data <= 32'd0;
		ch9_data <= 32'd0;
		ch10_data <= 32'd0;
		ch11_data <= 32'd0;
		ch12_data <= 32'd0;
		ch13_data <= 32'd0;
		ch14_data <= 32'd0;
		ch15_data <= 32'd0;
		ch16_data <= 32'd0;
		rx_state <= 3'd0;
		fifo_wr_start <= 1'b0;
		c_to_adc_ack <= 1'b0;
	end
	else if(ps_mdio[20])begin
		case(rx_state)
			3'd0:begin
				if(adc1_to_c_rts && adc2_to_c_rts)begin
					ch1_data <= adc1_data_8;
					ch2_data <= adc1_data_5;
					ch3_data <= adc1_data_3;
					ch4_data <= adc1_data_2;
					ch5_data <= adc1_data_7;
					ch6_data <= adc1_data_6;
					ch7_data <= adc1_data_1;
					ch8_data <= adc1_data_4;
					ch9_data <= adc2_data_6;
					ch10_data <= adc2_data_7;
					ch11_data <= adc2_data_2;
					ch12_data <= adc2_data_4;
					ch13_data <= adc2_data_8;
					ch14_data <= adc2_data_5;
					ch15_data <= adc2_data_1;
					ch16_data <= adc2_data_3;
					rx_state <= 3'd1;
					c_to_adc_ack <= 1'b1;
					fifo_wr_start <= 1'b1;
				end
				else begin
					ch1_data <= ch1_data;
					ch2_data <= ch2_data;
					ch3_data <= ch3_data;
					ch4_data <= ch4_data;
					ch5_data <= ch5_data;
					ch6_data <= ch6_data;
					ch7_data <= ch7_data;
					ch8_data <= ch8_data;
					ch9_data <= ch9_data;
					ch10_data <= ch10_data;
					ch11_data <= ch11_data;
					ch12_data <= ch12_data;
					ch13_data <= ch13_data;
					ch14_data <= ch14_data;
					ch15_data <= ch15_data;
					ch16_data <= ch16_data;
					rx_state <= 3'd0;
					c_to_adc_ack <= 1'b0;
					fifo_wr_start <= 1'b0;
				end
			end
			3'd1:begin
				fifo_wr_start <= 1'b0;
				if((!adc1_to_c_rts)&&(!adc2_to_c_rts))rx_state <= 3'd0;
				else rx_state <= 3'd1;
			end
			default:;
		endcase
	end
	else begin
		ch1_data <= 32'd0;
		ch2_data <= 32'd0;
		ch3_data <= 32'd0;
		ch4_data <= 32'd0;
		ch5_data <= 32'd0;
		ch6_data <= 32'd0;
		ch7_data <= 32'd0;
		ch8_data <= 32'd0;
		ch9_data <= 32'd0;
		ch10_data <= 32'd0;
		ch11_data <= 32'd0;
		ch12_data <= 32'd0;
		ch13_data <= 32'd0;
		ch14_data <= 32'd0;
		ch15_data <= 32'd0;
		ch16_data <= 32'd0;
		rx_state <= 3'd0;
		fifo_wr_start <= 1'b0;
		c_to_adc_ack <= 1'b0;
	end
end

localparam 
	wr_idle = 2'b00, 
	wr_start = 2'b01;
		
reg [1:0]fifo_state;
reg [7:0]fifo_count;	
reg fifo_wr_en;
reg [31:0]fifo_wr_data;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
        fifo_wr_en <= 1'b0;
        fifo_wr_data <= 32'd0;
        fifo_count <= 8'd0;
        fifo_state <= wr_idle;
    end
	else if(ps_mdio[20])begin
        case(fifo_state)
            wr_idle:begin
                fifo_wr_en <= 1'b0;
                fifo_wr_data <= 32'd0;
                fifo_count <= 8'd0;
                if(fifo_wr_start)fifo_state <= wr_start;
                else fifo_state <= wr_idle;
            end
            wr_start:begin
                if(fifo_count == 8'd15)begin
                    fifo_count <= 8'd0;
                    fifo_state <= wr_idle;
                end
                else begin
                    fifo_count <= fifo_count + 8'd1;
                    fifo_state <= wr_start;
                end
                fifo_wr_en <= 1'b1;
            case(fifo_count)
                8'd0:fifo_wr_data <= ch2_data;     
                8'd1:fifo_wr_data <= ch3_data;
                8'd2:fifo_wr_data <= ch4_data;
                8'd3:fifo_wr_data <= ch5_data;
                8'd4:fifo_wr_data <= ch6_data;
                8'd5:fifo_wr_data <= ch7_data;
                8'd6:fifo_wr_data <= ch8_data;
                8'd7:fifo_wr_data <= ch9_data;
                8'd8:fifo_wr_data <= ch10_data;
                8'd9:fifo_wr_data <= ch11_data;
                8'd10:fifo_wr_data <= ch12_data;
                8'd11:fifo_wr_data <= ch13_data;              
                8'd12:fifo_wr_data <= ch14_data;
                8'd13:fifo_wr_data <= ch15_data;
                8'd14:fifo_wr_data <= ch16_data;
                8'd15:fifo_wr_data <= ch1_data;
                default:;
		    endcase
            end
        default:;
        endcase
    end
    else begin
		fifo_wr_en <= 1'b0;
		fifo_wr_data <= 32'd0;
		fifo_count <= 8'd0;
		fifo_state <= wr_idle;
    end
end
 
wire prog_full;

adc_wr_fifo adc_wr_fifo_inst0(
        .clk(clk),
        .rst(~ps_mdio[20]),
        .din(fifo_wr_data),
        .wr_en(fifo_wr_en),
        .rd_en(pkg_wr_en),
        .dout(pkg_wr_data),
        .full(),
        .empty(),
        .prog_full(prog_full)
    );   
    
reg [31:0]pkg_addr;
assign pkg_wr_addr = pkg_addr + DDR_BASE;

localparam
    axi_idle = 3'b000,
    axi_areq_high = 3'b001,
    axi_write = 3'b010,
    axi_write_1 = 3'b100;
            
reg [2:0]axi_wr_state;    
       
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
        pkg_addr <= 32'd0;
        pkg_wr_areq <= 1'b0;
        axi_wr_state <= axi_idle;
    end
	else if(ps_mdio[20])
		case(axi_wr_state)
			axi_idle:begin
                pkg_wr_areq <= 1'b0;
                if(prog_full)axi_wr_state <= axi_areq_high;
                else axi_wr_state <= axi_idle;
             end
			axi_areq_high:begin
                pkg_wr_areq <= 1'b1;
                axi_wr_state <= axi_write;
            end
			axi_write:begin
                pkg_wr_areq <= 1'b0;
                if(pkg_wr_last)begin
                    axi_wr_state <= axi_write_1;
                    pkg_addr <= pkg_addr + 32'd4096;
                end
                else axi_wr_state <= axi_write;
            end
			axi_write_1:begin
                axi_wr_state <= axi_idle;
                if(pkg_addr == 32'd1638400) pkg_addr <= pkg_addr;
                else if(pkg_addr == 32'd3276800)pkg_addr <= 32'd0;               
            end
       default:;
       endcase
	else begin
        pkg_addr <= 32'd0;
        pkg_wr_areq <= 1'b0;
        axi_wr_state <= axi_idle;
    end
end

reg pl_interrupt_r = 1'b0; 
reg [1:0]pl_interrupt_state; 
reg [31:0]pl_interrupt_count;   

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
        pl_interrupt_r <= 1'b0;
        pl_interrupt_state <= 2'b00;
        pl_interrupt_count <= 32'd0;
    end
	else if(ps_mdio[20])
		case(pl_interrupt_state)
			2'b00:begin
				pl_interrupt_r <= 1'b0;
				pl_interrupt_count <= 32'd0;
				if((pkg_addr == 32'd1638400) || (pkg_addr == 32'd3276800))pl_interrupt_state <= 2'b01;
				else pl_interrupt_state <= 2'b00;                                                             
			end
			2'b01:begin
				pl_interrupt_r <= 1'b1;
				if(pl_interrupt_count == 32'd1000000)pl_interrupt_state <= 2'b00;
				else pl_interrupt_count <= pl_interrupt_count + 32'd1;
			end
		default:;
		endcase
	else begin
        pl_interrupt_r <= 1'b0;
        pl_interrupt_state <= 2'b00;
        pl_interrupt_count <= 8'd0;
    end
end

assign pl_interrupt = pl_interrupt_r;
      
adc_ila adc_ila_inst0(
.clk(clk),

.probe0(fifo_wr_start),
.probe1(ch1_data)
);                                                            
endmodule
