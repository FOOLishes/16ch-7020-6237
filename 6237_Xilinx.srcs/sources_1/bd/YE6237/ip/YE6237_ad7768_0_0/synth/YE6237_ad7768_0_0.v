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


// IP VLNV: xilinx.com:module_ref:ad7768:1.0
// IP Revision: 1

(* X_CORE_INFO = "ad7768,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "YE6237_ad7768_0_0,ad7768,{}" *)
(* CORE_GENERATION_INFO = "YE6237_ad7768_0_0,ad7768,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ad7768,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module YE6237_ad7768_0_0 (
  clk,
  rst_n,
  ps_mdio,
  dclk,
  drdy,
  dout,
  filter,
  mode,
  st,
  dec,
  ad7768_rst,
  sync_7768_in,
  ad7768_start,
  ad_clk_sel,
  ad_spi_pin,
  adc_data_1,
  adc_data_2,
  adc_data_3,
  adc_data_4,
  adc_data_5,
  adc_data_6,
  adc_data_7,
  adc_data_8,
  adc_to_c_rts,
  c_to_adc_ack
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN YE6237_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
input wire [20 : 0] ps_mdio;
input wire dclk;
input wire drdy;
input wire [7 : 0] dout;
output wire filter;
output wire [3 : 0] mode;
output wire [1 : 0] st;
output wire [1 : 0] dec;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ad7768_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ad7768_rst RST" *)
output wire ad7768_rst;
output wire sync_7768_in;
output wire ad7768_start;
output wire ad_clk_sel;
output wire ad_spi_pin;
output wire [31 : 0] adc_data_1;
output wire [31 : 0] adc_data_2;
output wire [31 : 0] adc_data_3;
output wire [31 : 0] adc_data_4;
output wire [31 : 0] adc_data_5;
output wire [31 : 0] adc_data_6;
output wire [31 : 0] adc_data_7;
output wire [31 : 0] adc_data_8;
output wire adc_to_c_rts;
input wire c_to_adc_ack;

  ad7768 inst (
    .clk(clk),
    .rst_n(rst_n),
    .ps_mdio(ps_mdio),
    .dclk(dclk),
    .drdy(drdy),
    .dout(dout),
    .filter(filter),
    .mode(mode),
    .st(st),
    .dec(dec),
    .ad7768_rst(ad7768_rst),
    .sync_7768_in(sync_7768_in),
    .ad7768_start(ad7768_start),
    .ad_clk_sel(ad_clk_sel),
    .ad_spi_pin(ad_spi_pin),
    .adc_data_1(adc_data_1),
    .adc_data_2(adc_data_2),
    .adc_data_3(adc_data_3),
    .adc_data_4(adc_data_4),
    .adc_data_5(adc_data_5),
    .adc_data_6(adc_data_6),
    .adc_data_7(adc_data_7),
    .adc_data_8(adc_data_8),
    .adc_to_c_rts(adc_to_c_rts),
    .c_to_adc_ack(c_to_adc_ack)
  );
endmodule
