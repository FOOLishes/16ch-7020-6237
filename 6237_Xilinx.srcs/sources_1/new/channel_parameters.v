`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/07 13:30:11
// Design Name: 
// Module Name: channel_parameters
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module channel_parameters(
                            input clk,
                            
                            input [20:0]ps_mdio,
                            
                            output ch1_current_en,
                            output ch1_v_iepe_en,
                            output ch2_current_en,
                            output ch2_v_iepe_en,
                            output ch3_current_en,
                            output ch3_v_iepe_en,
                            output ch4_current_en,
                            output ch4_v_iepe_en, 
                            output ch5_current_en,
                            output ch5_v_iepe_en,
                            output ch6_current_en,
                            output ch6_v_iepe_en,
                            output ch7_current_en,
                            output ch7_v_iepe_en,
                            output ch8_current_en,
                            output ch8_v_iepe_en,
                            output ch9_current_en,
                            output ch9_v_iepe_en,
                            output ch10_current_en,
                            output ch10_v_iepe_en,
                            output ch11_current_en,
                            output ch11_v_iepe_en,
                            output ch12_current_en,
                            output ch12_v_iepe_en,  
                            output ch13_current_en,
                            output ch13_v_iepe_en,
                            output ch14_current_en,
                            output ch14_v_iepe_en,
                            output ch15_current_en,
                            output ch15_v_iepe_en,
                            output ch16_current_en,
                            output ch16_v_iepe_en                                                                                                            
    );
    
assign ch1_current_en = 1'b0;
assign ch1_v_iepe_en = ps_mdio[0];
assign ch2_current_en = 1'b0;
assign ch2_v_iepe_en = ps_mdio[1];
assign ch3_current_en = 1'b0;
assign ch3_v_iepe_en = ps_mdio[2];
assign ch4_current_en = 1'b0;
assign ch4_v_iepe_en = ps_mdio[3];
assign ch5_current_en = 1'b0;
assign ch5_v_iepe_en = ps_mdio[4];
assign ch6_current_en = 1'b0;
assign ch6_v_iepe_en = ps_mdio[5];
assign ch7_current_en = 1'b0;
assign ch7_v_iepe_en = ps_mdio[6];
assign ch8_current_en = 1'b0;
assign ch8_v_iepe_en = ps_mdio[7];
assign ch9_current_en = 1'b0;
assign ch9_v_iepe_en = ps_mdio[8];
assign ch10_current_en = 1'b0;
assign ch10_v_iepe_en = ps_mdio[9];
assign ch11_current_en = 1'b0;
assign ch11_v_iepe_en = ps_mdio[10];
assign ch12_current_en = 1'b0;
assign ch12_v_iepe_en = ps_mdio[11];
assign ch13_current_en = 1'b0;
assign ch13_v_iepe_en = ps_mdio[12];
assign ch14_current_en = 1'b0;
assign ch14_v_iepe_en = ps_mdio[13];
assign ch15_current_en = 1'b0;
assign ch15_v_iepe_en = ps_mdio[14];
assign ch16_current_en = 1'b0;
assign ch16_v_iepe_en = ps_mdio[15];

ila_io ila_io_inst0(
.clk(clk),


.probe0(ch1_v_iepe_en),
.probe1(ch2_v_iepe_en),
.probe2(ch3_v_iepe_en),
.probe3(ch4_v_iepe_en),
.probe4(ch5_v_iepe_en),
.probe5(ch6_v_iepe_en),
.probe6(ch7_v_iepe_en),
.probe7(ch8_v_iepe_en),
.probe8(ch9_v_iepe_en),
.probe9(ch10_v_iepe_en),
.probe10(ch11_v_iepe_en),
.probe11(ch12_v_iepe_en),
.probe12(ch13_v_iepe_en),
.probe13(ch14_v_iepe_en),
.probe14(ch15_v_iepe_en),
.probe15(ch16_v_iepe_en),
.probe16(ps_mdio[16]),
.probe17(ps_mdio[17]),
.probe18(ps_mdio[18]),
.probe19(ps_mdio[19]),
.probe20(ps_mdio[20])
);
endmodule
