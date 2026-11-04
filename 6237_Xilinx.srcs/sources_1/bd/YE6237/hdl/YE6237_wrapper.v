//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Thu Jul 23 14:33:35 2026
//Host        : DESKTOP-JPPP25S running 64-bit major release  (build 9200)
//Command     : generate_target YE6237_wrapper.bd
//Design      : YE6237_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module YE6237_wrapper
   (AD1_CLK,
    AD1_CLK_SEL,
    AD1_DCLK,
    AD1_DEC,
    AD1_DOUT,
    AD1_DRDY,
    AD1_FILTER,
    AD1_MODE,
    AD1_RESET,
    AD1_SPI_PIN,
    AD1_ST,
    AD1_START,
    AD1_SYNCIN,
    AD2_CLK,
    AD2_CLK_SEL,
    AD2_DCLK,
    AD2_DEC,
    AD2_DOUT,
    AD2_DRDY,
    AD2_FILTER,
    AD2_MODE,
    AD2_RESET,
    AD2_SPI_PIN,
    AD2_ST,
    AD2_START,
    AD2_SYNCIN,
    CLK_32_768M,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    PL_INTERRUPT,
    ch10_current_en,
    ch10_v_iepe_en,
    ch11_current_en,
    ch11_v_iepe_en,
    ch12_current_en,
    ch12_v_iepe_en,
    ch13_current_en,
    ch13_v_iepe_en,
    ch14_current_en,
    ch14_v_iepe_en,
    ch15_current_en,
    ch15_v_iepe_en,
    ch16_current_en,
    ch16_v_iepe_en,
    ch1_current_en,
    ch1_v_iepe_en,
    ch2_current_en,
    ch2_v_iepe_en,
    ch3_current_en,
    ch3_v_iepe_en,
    ch4_current_en,
    ch4_v_iepe_en,
    ch5_current_en,
    ch5_v_iepe_en,
    ch6_current_en,
    ch6_v_iepe_en,
    ch7_current_en,
    ch7_v_iepe_en,
    ch8_current_en,
    ch8_v_iepe_en,
    ch9_current_en,
    ch9_v_iepe_en);
  output AD1_CLK;
  output AD1_CLK_SEL;
  input AD1_DCLK;
  output [1:0]AD1_DEC;
  input [7:0]AD1_DOUT;
  input AD1_DRDY;
  output AD1_FILTER;
  output [3:0]AD1_MODE;
  output AD1_RESET;
  output AD1_SPI_PIN;
  output [1:0]AD1_ST;
  output AD1_START;
  output AD1_SYNCIN;
  output AD2_CLK;
  output AD2_CLK_SEL;
  input AD2_DCLK;
  output [1:0]AD2_DEC;
  input [7:0]AD2_DOUT;
  input AD2_DRDY;
  output AD2_FILTER;
  output [3:0]AD2_MODE;
  output AD2_RESET;
  output AD2_SPI_PIN;
  output [1:0]AD2_ST;
  output AD2_START;
  output AD2_SYNCIN;
  input CLK_32_768M;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output PL_INTERRUPT;
  output ch10_current_en;
  output ch10_v_iepe_en;
  output ch11_current_en;
  output ch11_v_iepe_en;
  output ch12_current_en;
  output ch12_v_iepe_en;
  output ch13_current_en;
  output ch13_v_iepe_en;
  output ch14_current_en;
  output ch14_v_iepe_en;
  output ch15_current_en;
  output ch15_v_iepe_en;
  output ch16_current_en;
  output ch16_v_iepe_en;
  output ch1_current_en;
  output ch1_v_iepe_en;
  output ch2_current_en;
  output ch2_v_iepe_en;
  output ch3_current_en;
  output ch3_v_iepe_en;
  output ch4_current_en;
  output ch4_v_iepe_en;
  output ch5_current_en;
  output ch5_v_iepe_en;
  output ch6_current_en;
  output ch6_v_iepe_en;
  output ch7_current_en;
  output ch7_v_iepe_en;
  output ch8_current_en;
  output ch8_v_iepe_en;
  output ch9_current_en;
  output ch9_v_iepe_en;

  wire AD1_CLK;
  wire AD1_CLK_SEL;
  wire AD1_DCLK;
  wire [1:0]AD1_DEC;
  wire [7:0]AD1_DOUT;
  wire AD1_DRDY;
  wire AD1_FILTER;
  wire [3:0]AD1_MODE;
  wire AD1_RESET;
  wire AD1_SPI_PIN;
  wire [1:0]AD1_ST;
  wire AD1_START;
  wire AD1_SYNCIN;
  wire AD2_CLK;
  wire AD2_CLK_SEL;
  wire AD2_DCLK;
  wire [1:0]AD2_DEC;
  wire [7:0]AD2_DOUT;
  wire AD2_DRDY;
  wire AD2_FILTER;
  wire [3:0]AD2_MODE;
  wire AD2_RESET;
  wire AD2_SPI_PIN;
  wire [1:0]AD2_ST;
  wire AD2_START;
  wire AD2_SYNCIN;
  wire CLK_32_768M;
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire PL_INTERRUPT;
  wire ch10_current_en;
  wire ch10_v_iepe_en;
  wire ch11_current_en;
  wire ch11_v_iepe_en;
  wire ch12_current_en;
  wire ch12_v_iepe_en;
  wire ch13_current_en;
  wire ch13_v_iepe_en;
  wire ch14_current_en;
  wire ch14_v_iepe_en;
  wire ch15_current_en;
  wire ch15_v_iepe_en;
  wire ch16_current_en;
  wire ch16_v_iepe_en;
  wire ch1_current_en;
  wire ch1_v_iepe_en;
  wire ch2_current_en;
  wire ch2_v_iepe_en;
  wire ch3_current_en;
  wire ch3_v_iepe_en;
  wire ch4_current_en;
  wire ch4_v_iepe_en;
  wire ch5_current_en;
  wire ch5_v_iepe_en;
  wire ch6_current_en;
  wire ch6_v_iepe_en;
  wire ch7_current_en;
  wire ch7_v_iepe_en;
  wire ch8_current_en;
  wire ch8_v_iepe_en;
  wire ch9_current_en;
  wire ch9_v_iepe_en;

  YE6237 YE6237_i
       (.AD1_CLK(AD1_CLK),
        .AD1_CLK_SEL(AD1_CLK_SEL),
        .AD1_DCLK(AD1_DCLK),
        .AD1_DEC(AD1_DEC),
        .AD1_DOUT(AD1_DOUT),
        .AD1_DRDY(AD1_DRDY),
        .AD1_FILTER(AD1_FILTER),
        .AD1_MODE(AD1_MODE),
        .AD1_RESET(AD1_RESET),
        .AD1_SPI_PIN(AD1_SPI_PIN),
        .AD1_ST(AD1_ST),
        .AD1_START(AD1_START),
        .AD1_SYNCIN(AD1_SYNCIN),
        .AD2_CLK(AD2_CLK),
        .AD2_CLK_SEL(AD2_CLK_SEL),
        .AD2_DCLK(AD2_DCLK),
        .AD2_DEC(AD2_DEC),
        .AD2_DOUT(AD2_DOUT),
        .AD2_DRDY(AD2_DRDY),
        .AD2_FILTER(AD2_FILTER),
        .AD2_MODE(AD2_MODE),
        .AD2_RESET(AD2_RESET),
        .AD2_SPI_PIN(AD2_SPI_PIN),
        .AD2_ST(AD2_ST),
        .AD2_START(AD2_START),
        .AD2_SYNCIN(AD2_SYNCIN),
        .CLK_32_768M(CLK_32_768M),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .PL_INTERRUPT(PL_INTERRUPT),
        .ch10_current_en(ch10_current_en),
        .ch10_v_iepe_en(ch10_v_iepe_en),
        .ch11_current_en(ch11_current_en),
        .ch11_v_iepe_en(ch11_v_iepe_en),
        .ch12_current_en(ch12_current_en),
        .ch12_v_iepe_en(ch12_v_iepe_en),
        .ch13_current_en(ch13_current_en),
        .ch13_v_iepe_en(ch13_v_iepe_en),
        .ch14_current_en(ch14_current_en),
        .ch14_v_iepe_en(ch14_v_iepe_en),
        .ch15_current_en(ch15_current_en),
        .ch15_v_iepe_en(ch15_v_iepe_en),
        .ch16_current_en(ch16_current_en),
        .ch16_v_iepe_en(ch16_v_iepe_en),
        .ch1_current_en(ch1_current_en),
        .ch1_v_iepe_en(ch1_v_iepe_en),
        .ch2_current_en(ch2_current_en),
        .ch2_v_iepe_en(ch2_v_iepe_en),
        .ch3_current_en(ch3_current_en),
        .ch3_v_iepe_en(ch3_v_iepe_en),
        .ch4_current_en(ch4_current_en),
        .ch4_v_iepe_en(ch4_v_iepe_en),
        .ch5_current_en(ch5_current_en),
        .ch5_v_iepe_en(ch5_v_iepe_en),
        .ch6_current_en(ch6_current_en),
        .ch6_v_iepe_en(ch6_v_iepe_en),
        .ch7_current_en(ch7_current_en),
        .ch7_v_iepe_en(ch7_v_iepe_en),
        .ch8_current_en(ch8_current_en),
        .ch8_v_iepe_en(ch8_v_iepe_en),
        .ch9_current_en(ch9_current_en),
        .ch9_v_iepe_en(ch9_v_iepe_en));
endmodule
