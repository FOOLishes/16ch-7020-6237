`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/14 08:37:00
// Design Name: 
// Module Name: data_debug
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


module data_debug( 
       input    clk,
       input   [31:0]   data_in1,
       input   [31:0]   data_in2,
       output  reg  wrong_flag
       
    );
 
 
 localparam compair_data={32'h0000005f};
 reg [31:0] data1;
 reg [31:0] data2;
 
 always@(posedge clk)       begin
    data1<=data_in1;
    data2<=data_in2;        end
    
always@(posedge clk) 
    if(data1==data2)
        wrong_flag<=1'b0;
        
    else 
        wrong_flag<=1'b1;
    
endmodule
