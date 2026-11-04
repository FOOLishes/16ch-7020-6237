// (c) Copyright 1995-2026 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:rx_board_data:1.0
// IP Revision: 1

(* X_CORE_INFO = "rx_board_data,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "YE6237_rx_board_data_0_0,rx_board_data,{}" *)
(* CORE_GENERATION_INFO = "YE6237_rx_board_data_0_0,rx_board_data,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=rx_board_data,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,DDR_BASE=0x30000000}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module YE6237_rx_board_data_0_0 (
  clk,
  rst_n,
  ps_mdio,
  pl_interrupt,
  adc1_data_1,
  adc1_data_2,
  adc1_data_3,
  adc1_data_4,
  adc1_data_5,
  adc1_data_6,
  adc1_data_7,
  adc1_data_8,
  adc1_to_c_rts,
  adc2_data_1,
  adc2_data_2,
  adc2_data_3,
  adc2_data_4,
  adc2_data_5,
  adc2_data_6,
  adc2_data_7,
  adc2_data_8,
  adc2_to_c_rts,
  c_to_adc_ack,
  pkg_wr_areq,
  pkg_wr_data,
  pkg_wr_addr,
  pkg_wr_size,
  pkg_wr_en,
  pkg_wr_last,
  pkg_rd_areq,
  pkg_rd_addr,
  pkg_rd_size,
  pkg_rd_en,
  pkg_rd_last,
  pkg_rd_data
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 1e+08, PHASE 0.000, CLK_DOMAIN YE6237_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
input wire [20 : 0] ps_mdio;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pl_interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 pl_interrupt INTERRUPT" *)
output wire pl_interrupt;
input wire [31 : 0] adc1_data_1;
input wire [31 : 0] adc1_data_2;
input wire [31 : 0] adc1_data_3;
input wire [31 : 0] adc1_data_4;
input wire [31 : 0] adc1_data_5;
input wire [31 : 0] adc1_data_6;
input wire [31 : 0] adc1_data_7;
input wire [31 : 0] adc1_data_8;
input wire adc1_to_c_rts;
input wire [31 : 0] adc2_data_1;
input wire [31 : 0] adc2_data_2;
input wire [31 : 0] adc2_data_3;
input wire [31 : 0] adc2_data_4;
input wire [31 : 0] adc2_data_5;
input wire [31 : 0] adc2_data_6;
input wire [31 : 0] adc2_data_7;
input wire [31 : 0] adc2_data_8;
input wire adc2_to_c_rts;
output wire c_to_adc_ack;
output wire pkg_wr_areq;
output wire [31 : 0] pkg_wr_data;
output wire [31 : 0] pkg_wr_addr;
output wire [31 : 0] pkg_wr_size;
input wire pkg_wr_en;
input wire pkg_wr_last;
output wire pkg_rd_areq;
output wire [31 : 0] pkg_rd_addr;
output wire [31 : 0] pkg_rd_size;
input wire pkg_rd_en;
input wire pkg_rd_last;
input wire [31 : 0] pkg_rd_data;

  rx_board_data #(
    .DDR_BASE(32'H30000000)
  ) inst (
    .clk(clk),
    .rst_n(rst_n),
    .ps_mdio(ps_mdio),
    .pl_interrupt(pl_interrupt),
    .adc1_data_1(adc1_data_1),
    .adc1_data_2(adc1_data_2),
    .adc1_data_3(adc1_data_3),
    .adc1_data_4(adc1_data_4),
    .adc1_data_5(adc1_data_5),
    .adc1_data_6(adc1_data_6),
    .adc1_data_7(adc1_data_7),
    .adc1_data_8(adc1_data_8),
    .adc1_to_c_rts(adc1_to_c_rts),
    .adc2_data_1(adc2_data_1),
    .adc2_data_2(adc2_data_2),
    .adc2_data_3(adc2_data_3),
    .adc2_data_4(adc2_data_4),
    .adc2_data_5(adc2_data_5),
    .adc2_data_6(adc2_data_6),
    .adc2_data_7(adc2_data_7),
    .adc2_data_8(adc2_data_8),
    .adc2_to_c_rts(adc2_to_c_rts),
    .c_to_adc_ack(c_to_adc_ack),
    .pkg_wr_areq(pkg_wr_areq),
    .pkg_wr_data(pkg_wr_data),
    .pkg_wr_addr(pkg_wr_addr),
    .pkg_wr_size(pkg_wr_size),
    .pkg_wr_en(pkg_wr_en),
    .pkg_wr_last(pkg_wr_last),
    .pkg_rd_areq(pkg_rd_areq),
    .pkg_rd_addr(pkg_rd_addr),
    .pkg_rd_size(pkg_rd_size),
    .pkg_rd_en(pkg_rd_en),
    .pkg_rd_last(pkg_rd_last),
    .pkg_rd_data(pkg_rd_data)
  );
endmodule
