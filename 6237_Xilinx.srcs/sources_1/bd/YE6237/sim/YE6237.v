//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Thu Jul 23 14:33:35 2026
//Host        : DESKTOP-JPPP25S running 64-bit major release  (build 9200)
//Command     : generate_target YE6237.bd
//Design      : YE6237
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "YE6237,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=YE6237,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=13,numReposBlks=13,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=5,da_board_cnt=3,da_clkrst_cnt=20,da_ps7_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "YE6237.hwdef" *) 
module YE6237
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AD1_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AD1_CLK, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 13107200, INSERT_VIP 0, PHASE 0.0" *) output AD1_CLK;
  output AD1_CLK_SEL;
  input AD1_DCLK;
  output [1:0]AD1_DEC;
  input [7:0]AD1_DOUT;
  input AD1_DRDY;
  output AD1_FILTER;
  output [3:0]AD1_MODE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AD1_RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AD1_RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output AD1_RESET;
  output AD1_SPI_PIN;
  output [1:0]AD1_ST;
  output AD1_START;
  output AD1_SYNCIN;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AD2_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AD2_CLK, CLK_DOMAIN /clk_wiz_0_clk_out1, FREQ_HZ 13107200, INSERT_VIP 0, PHASE 0.0" *) output AD2_CLK;
  output AD2_CLK_SEL;
  input AD2_DCLK;
  output [1:0]AD2_DEC;
  input [7:0]AD2_DOUT;
  input AD2_DRDY;
  output AD2_FILTER;
  output [3:0]AD2_MODE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AD2_RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AD2_RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output AD2_RESET;
  output AD2_SPI_PIN;
  output [1:0]AD2_ST;
  output AD2_START;
  output AD2_SYNCIN;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_32_768M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_32_768M, CLK_DOMAIN YE6237_CLK_32_768M, FREQ_HZ 32768000, INSERT_VIP 0, PHASE 0.000" *) input CLK_32_768M;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.PL_INTERRUPT INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.PL_INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output PL_INTERRUPT;
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

  wire CLK_32_768M_1;
  wire [31:0]MSXBO_FDMA_0_M00_AXI_ARADDR;
  wire [1:0]MSXBO_FDMA_0_M00_AXI_ARBURST;
  wire [3:0]MSXBO_FDMA_0_M00_AXI_ARCACHE;
  wire [0:0]MSXBO_FDMA_0_M00_AXI_ARID;
  wire [7:0]MSXBO_FDMA_0_M00_AXI_ARLEN;
  wire MSXBO_FDMA_0_M00_AXI_ARLOCK;
  wire [2:0]MSXBO_FDMA_0_M00_AXI_ARPROT;
  wire [3:0]MSXBO_FDMA_0_M00_AXI_ARQOS;
  wire MSXBO_FDMA_0_M00_AXI_ARREADY;
  wire [2:0]MSXBO_FDMA_0_M00_AXI_ARSIZE;
  wire MSXBO_FDMA_0_M00_AXI_ARVALID;
  wire [31:0]MSXBO_FDMA_0_M00_AXI_AWADDR;
  wire [1:0]MSXBO_FDMA_0_M00_AXI_AWBURST;
  wire [3:0]MSXBO_FDMA_0_M00_AXI_AWCACHE;
  wire [0:0]MSXBO_FDMA_0_M00_AXI_AWID;
  wire [7:0]MSXBO_FDMA_0_M00_AXI_AWLEN;
  wire MSXBO_FDMA_0_M00_AXI_AWLOCK;
  wire [2:0]MSXBO_FDMA_0_M00_AXI_AWPROT;
  wire [3:0]MSXBO_FDMA_0_M00_AXI_AWQOS;
  wire MSXBO_FDMA_0_M00_AXI_AWREADY;
  wire [2:0]MSXBO_FDMA_0_M00_AXI_AWSIZE;
  wire MSXBO_FDMA_0_M00_AXI_AWVALID;
  wire [0:0]MSXBO_FDMA_0_M00_AXI_BID;
  wire MSXBO_FDMA_0_M00_AXI_BREADY;
  wire [1:0]MSXBO_FDMA_0_M00_AXI_BRESP;
  wire MSXBO_FDMA_0_M00_AXI_BVALID;
  wire [31:0]MSXBO_FDMA_0_M00_AXI_RDATA;
  wire [0:0]MSXBO_FDMA_0_M00_AXI_RID;
  wire MSXBO_FDMA_0_M00_AXI_RLAST;
  wire MSXBO_FDMA_0_M00_AXI_RREADY;
  wire [1:0]MSXBO_FDMA_0_M00_AXI_RRESP;
  wire MSXBO_FDMA_0_M00_AXI_RVALID;
  wire [31:0]MSXBO_FDMA_0_M00_AXI_WDATA;
  wire MSXBO_FDMA_0_M00_AXI_WLAST;
  wire MSXBO_FDMA_0_M00_AXI_WREADY;
  wire [3:0]MSXBO_FDMA_0_M00_AXI_WSTRB;
  wire MSXBO_FDMA_0_M00_AXI_WVALID;
  wire [31:0]MSXBO_FDMA_0_pkg_rd_data;
  wire MSXBO_FDMA_0_pkg_rd_en;
  wire MSXBO_FDMA_0_pkg_rd_last;
  wire MSXBO_FDMA_0_pkg_wr_en;
  wire MSXBO_FDMA_0_pkg_wr_last;
  wire ad7768_0_ad7768_rst;
  wire ad7768_0_ad7768_start;
  wire ad7768_0_ad_clk_sel;
  wire ad7768_0_ad_spi_pin;
  wire [31:0]ad7768_0_adc_data_1;
  wire [31:0]ad7768_0_adc_data_2;
  wire [31:0]ad7768_0_adc_data_3;
  wire [31:0]ad7768_0_adc_data_4;
  wire [31:0]ad7768_0_adc_data_5;
  wire [31:0]ad7768_0_adc_data_6;
  wire [31:0]ad7768_0_adc_data_7;
  wire [31:0]ad7768_0_adc_data_8;
  wire ad7768_0_adc_to_c_rts;
  wire [1:0]ad7768_0_dec;
  wire ad7768_0_filter;
  wire [3:0]ad7768_0_mode;
  wire [1:0]ad7768_0_st;
  wire ad7768_0_sync_7768_in;
  wire ad7768_1_ad7768_rst;
  wire ad7768_1_ad7768_start;
  wire ad7768_1_ad_clk_sel;
  wire ad7768_1_ad_spi_pin;
  wire [31:0]ad7768_1_adc_data_1;
  wire [31:0]ad7768_1_adc_data_2;
  wire [31:0]ad7768_1_adc_data_3;
  wire [31:0]ad7768_1_adc_data_4;
  wire [31:0]ad7768_1_adc_data_5;
  wire [31:0]ad7768_1_adc_data_6;
  wire [31:0]ad7768_1_adc_data_7;
  wire [31:0]ad7768_1_adc_data_8;
  wire ad7768_1_adc_to_c_rts;
  wire [1:0]ad7768_1_dec;
  wire ad7768_1_filter;
  wire [3:0]ad7768_1_mode;
  wire [1:0]ad7768_1_st;
  wire ad7768_1_sync_7768_in;
  wire channel_parameters_0_ch10_current_en;
  wire channel_parameters_0_ch10_v_iepe_en;
  wire channel_parameters_0_ch11_current_en;
  wire channel_parameters_0_ch11_v_iepe_en;
  wire channel_parameters_0_ch12_current_en;
  wire channel_parameters_0_ch12_v_iepe_en;
  wire channel_parameters_0_ch13_current_en;
  wire channel_parameters_0_ch13_v_iepe_en;
  wire channel_parameters_0_ch14_current_en;
  wire channel_parameters_0_ch14_v_iepe_en;
  wire channel_parameters_0_ch15_current_en;
  wire channel_parameters_0_ch15_v_iepe_en;
  wire channel_parameters_0_ch16_current_en;
  wire channel_parameters_0_ch16_v_iepe_en;
  wire channel_parameters_0_ch1_current_en;
  wire channel_parameters_0_ch1_v_iepe_en;
  wire channel_parameters_0_ch2_current_en;
  wire channel_parameters_0_ch2_v_iepe_en;
  wire channel_parameters_0_ch3_current_en;
  wire channel_parameters_0_ch3_v_iepe_en;
  wire channel_parameters_0_ch4_current_en;
  wire channel_parameters_0_ch4_v_iepe_en;
  wire channel_parameters_0_ch5_current_en;
  wire channel_parameters_0_ch5_v_iepe_en;
  wire channel_parameters_0_ch6_current_en;
  wire channel_parameters_0_ch6_v_iepe_en;
  wire channel_parameters_0_ch7_current_en;
  wire channel_parameters_0_ch7_v_iepe_en;
  wire channel_parameters_0_ch8_current_en;
  wire channel_parameters_0_ch8_v_iepe_en;
  wire channel_parameters_0_ch9_current_en;
  wire channel_parameters_0_ch9_v_iepe_en;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire clk_wiz_0_clk_out3;
  wire clk_wiz_0_locked;
  wire dclk_0_1;
  wire dclk_0_2;
  wire [7:0]dout_0_1;
  wire [7:0]dout_0_2;
  wire drdy_0_1;
  wire drdy_0_2;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [20:0]processing_system7_0_GPIO_O;
  wire rx_board_data_0_c_to_adc_ack;
  wire [31:0]rx_board_data_0_pkg_rd_addr;
  wire rx_board_data_0_pkg_rd_areq;
  wire [31:0]rx_board_data_0_pkg_rd_size;
  wire [31:0]rx_board_data_0_pkg_wr_addr;
  wire rx_board_data_0_pkg_wr_areq;
  wire [31:0]rx_board_data_0_pkg_wr_data;
  wire [31:0]rx_board_data_0_pkg_wr_size;
  wire rx_board_data_0_pl_interrupt;
  wire [31:0]smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire [3:0]smartconnect_0_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_0_M00_AXI_ARLEN;
  wire [1:0]smartconnect_0_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M00_AXI_ARPROT;
  wire [3:0]smartconnect_0_M00_AXI_ARQOS;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [31:0]smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire [3:0]smartconnect_0_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_0_M00_AXI_AWLEN;
  wire [1:0]smartconnect_0_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M00_AXI_AWPROT;
  wire [3:0]smartconnect_0_M00_AXI_AWQOS;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire [5:0]smartconnect_0_M00_AXI_BID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [63:0]smartconnect_0_M00_AXI_RDATA;
  wire [5:0]smartconnect_0_M00_AXI_RID;
  wire smartconnect_0_M00_AXI_RLAST;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [63:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [7:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;
  wire system_pll_ctrl_0_sys_rst_n;
  wire [0:0]util_vector_logic_1_Res;

  assign AD1_CLK = clk_wiz_0_clk_out2;
  assign AD1_CLK_SEL = ad7768_0_ad_clk_sel;
  assign AD1_DEC[1:0] = ad7768_0_dec;
  assign AD1_FILTER = ad7768_0_filter;
  assign AD1_MODE[3:0] = ad7768_0_mode;
  assign AD1_RESET = ad7768_0_ad7768_rst;
  assign AD1_SPI_PIN = ad7768_0_ad_spi_pin;
  assign AD1_ST[1:0] = ad7768_0_st;
  assign AD1_START = ad7768_0_ad7768_start;
  assign AD1_SYNCIN = ad7768_0_sync_7768_in;
  assign AD2_CLK = clk_wiz_0_clk_out3;
  assign AD2_CLK_SEL = ad7768_1_ad_clk_sel;
  assign AD2_DEC[1:0] = ad7768_1_dec;
  assign AD2_FILTER = ad7768_1_filter;
  assign AD2_MODE[3:0] = ad7768_1_mode;
  assign AD2_RESET = ad7768_1_ad7768_rst;
  assign AD2_SPI_PIN = ad7768_1_ad_spi_pin;
  assign AD2_ST[1:0] = ad7768_1_st;
  assign AD2_START = ad7768_1_ad7768_start;
  assign AD2_SYNCIN = ad7768_1_sync_7768_in;
  assign CLK_32_768M_1 = CLK_32_768M;
  assign PL_INTERRUPT = rx_board_data_0_pl_interrupt;
  assign ch10_current_en = channel_parameters_0_ch10_current_en;
  assign ch10_v_iepe_en = channel_parameters_0_ch10_v_iepe_en;
  assign ch11_current_en = channel_parameters_0_ch11_current_en;
  assign ch11_v_iepe_en = channel_parameters_0_ch11_v_iepe_en;
  assign ch12_current_en = channel_parameters_0_ch12_current_en;
  assign ch12_v_iepe_en = channel_parameters_0_ch12_v_iepe_en;
  assign ch13_current_en = channel_parameters_0_ch13_current_en;
  assign ch13_v_iepe_en = channel_parameters_0_ch13_v_iepe_en;
  assign ch14_current_en = channel_parameters_0_ch14_current_en;
  assign ch14_v_iepe_en = channel_parameters_0_ch14_v_iepe_en;
  assign ch15_current_en = channel_parameters_0_ch15_current_en;
  assign ch15_v_iepe_en = channel_parameters_0_ch15_v_iepe_en;
  assign ch16_current_en = channel_parameters_0_ch16_current_en;
  assign ch16_v_iepe_en = channel_parameters_0_ch16_v_iepe_en;
  assign ch1_current_en = channel_parameters_0_ch1_current_en;
  assign ch1_v_iepe_en = channel_parameters_0_ch1_v_iepe_en;
  assign ch2_current_en = channel_parameters_0_ch2_current_en;
  assign ch2_v_iepe_en = channel_parameters_0_ch2_v_iepe_en;
  assign ch3_current_en = channel_parameters_0_ch3_current_en;
  assign ch3_v_iepe_en = channel_parameters_0_ch3_v_iepe_en;
  assign ch4_current_en = channel_parameters_0_ch4_current_en;
  assign ch4_v_iepe_en = channel_parameters_0_ch4_v_iepe_en;
  assign ch5_current_en = channel_parameters_0_ch5_current_en;
  assign ch5_v_iepe_en = channel_parameters_0_ch5_v_iepe_en;
  assign ch6_current_en = channel_parameters_0_ch6_current_en;
  assign ch6_v_iepe_en = channel_parameters_0_ch6_v_iepe_en;
  assign ch7_current_en = channel_parameters_0_ch7_current_en;
  assign ch7_v_iepe_en = channel_parameters_0_ch7_v_iepe_en;
  assign ch8_current_en = channel_parameters_0_ch8_current_en;
  assign ch8_v_iepe_en = channel_parameters_0_ch8_v_iepe_en;
  assign ch9_current_en = channel_parameters_0_ch9_current_en;
  assign ch9_v_iepe_en = channel_parameters_0_ch9_v_iepe_en;
  assign dclk_0_1 = AD1_DCLK;
  assign dclk_0_2 = AD2_DCLK;
  assign dout_0_1 = AD1_DOUT[7:0];
  assign dout_0_2 = AD2_DOUT[7:0];
  assign drdy_0_1 = AD1_DRDY;
  assign drdy_0_2 = AD2_DRDY;
  YE6237_MSXBO_FDMA_0_0 MSXBO_FDMA_0
       (.m00_axi_aclk(clk_wiz_0_clk_out1),
        .m00_axi_araddr(MSXBO_FDMA_0_M00_AXI_ARADDR),
        .m00_axi_arburst(MSXBO_FDMA_0_M00_AXI_ARBURST),
        .m00_axi_arcache(MSXBO_FDMA_0_M00_AXI_ARCACHE),
        .m00_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axi_arid(MSXBO_FDMA_0_M00_AXI_ARID),
        .m00_axi_arlen(MSXBO_FDMA_0_M00_AXI_ARLEN),
        .m00_axi_arlock(MSXBO_FDMA_0_M00_AXI_ARLOCK),
        .m00_axi_arprot(MSXBO_FDMA_0_M00_AXI_ARPROT),
        .m00_axi_arqos(MSXBO_FDMA_0_M00_AXI_ARQOS),
        .m00_axi_arready(MSXBO_FDMA_0_M00_AXI_ARREADY),
        .m00_axi_arsize(MSXBO_FDMA_0_M00_AXI_ARSIZE),
        .m00_axi_arvalid(MSXBO_FDMA_0_M00_AXI_ARVALID),
        .m00_axi_awaddr(MSXBO_FDMA_0_M00_AXI_AWADDR),
        .m00_axi_awburst(MSXBO_FDMA_0_M00_AXI_AWBURST),
        .m00_axi_awcache(MSXBO_FDMA_0_M00_AXI_AWCACHE),
        .m00_axi_awid(MSXBO_FDMA_0_M00_AXI_AWID),
        .m00_axi_awlen(MSXBO_FDMA_0_M00_AXI_AWLEN),
        .m00_axi_awlock(MSXBO_FDMA_0_M00_AXI_AWLOCK),
        .m00_axi_awprot(MSXBO_FDMA_0_M00_AXI_AWPROT),
        .m00_axi_awqos(MSXBO_FDMA_0_M00_AXI_AWQOS),
        .m00_axi_awready(MSXBO_FDMA_0_M00_AXI_AWREADY),
        .m00_axi_awsize(MSXBO_FDMA_0_M00_AXI_AWSIZE),
        .m00_axi_awvalid(MSXBO_FDMA_0_M00_AXI_AWVALID),
        .m00_axi_bid(MSXBO_FDMA_0_M00_AXI_BID),
        .m00_axi_bready(MSXBO_FDMA_0_M00_AXI_BREADY),
        .m00_axi_bresp(MSXBO_FDMA_0_M00_AXI_BRESP),
        .m00_axi_bvalid(MSXBO_FDMA_0_M00_AXI_BVALID),
        .m00_axi_rdata(MSXBO_FDMA_0_M00_AXI_RDATA),
        .m00_axi_rid(MSXBO_FDMA_0_M00_AXI_RID),
        .m00_axi_rlast(MSXBO_FDMA_0_M00_AXI_RLAST),
        .m00_axi_rready(MSXBO_FDMA_0_M00_AXI_RREADY),
        .m00_axi_rresp(MSXBO_FDMA_0_M00_AXI_RRESP),
        .m00_axi_rvalid(MSXBO_FDMA_0_M00_AXI_RVALID),
        .m00_axi_wdata(MSXBO_FDMA_0_M00_AXI_WDATA),
        .m00_axi_wlast(MSXBO_FDMA_0_M00_AXI_WLAST),
        .m00_axi_wready(MSXBO_FDMA_0_M00_AXI_WREADY),
        .m00_axi_wstrb(MSXBO_FDMA_0_M00_AXI_WSTRB),
        .m00_axi_wvalid(MSXBO_FDMA_0_M00_AXI_WVALID),
        .pkg_rd_addr(rx_board_data_0_pkg_rd_addr),
        .pkg_rd_areq(rx_board_data_0_pkg_rd_areq),
        .pkg_rd_data(MSXBO_FDMA_0_pkg_rd_data),
        .pkg_rd_en(MSXBO_FDMA_0_pkg_rd_en),
        .pkg_rd_last(MSXBO_FDMA_0_pkg_rd_last),
        .pkg_rd_size(rx_board_data_0_pkg_rd_size),
        .pkg_wr_addr(rx_board_data_0_pkg_wr_addr),
        .pkg_wr_areq(rx_board_data_0_pkg_wr_areq),
        .pkg_wr_data(rx_board_data_0_pkg_wr_data),
        .pkg_wr_en(MSXBO_FDMA_0_pkg_wr_en),
        .pkg_wr_last(MSXBO_FDMA_0_pkg_wr_last),
        .pkg_wr_size(rx_board_data_0_pkg_wr_size));
  YE6237_ad7768_0_0 ad7768_0
       (.ad7768_rst(ad7768_0_ad7768_rst),
        .ad7768_start(ad7768_0_ad7768_start),
        .ad_clk_sel(ad7768_0_ad_clk_sel),
        .ad_spi_pin(ad7768_0_ad_spi_pin),
        .adc_data_1(ad7768_0_adc_data_1),
        .adc_data_2(ad7768_0_adc_data_2),
        .adc_data_3(ad7768_0_adc_data_3),
        .adc_data_4(ad7768_0_adc_data_4),
        .adc_data_5(ad7768_0_adc_data_5),
        .adc_data_6(ad7768_0_adc_data_6),
        .adc_data_7(ad7768_0_adc_data_7),
        .adc_data_8(ad7768_0_adc_data_8),
        .adc_to_c_rts(ad7768_0_adc_to_c_rts),
        .c_to_adc_ack(rx_board_data_0_c_to_adc_ack),
        .clk(clk_wiz_0_clk_out1),
        .dclk(dclk_0_1),
        .dec(ad7768_0_dec),
        .dout(dout_0_1),
        .drdy(drdy_0_1),
        .filter(ad7768_0_filter),
        .mode(ad7768_0_mode),
        .ps_mdio(processing_system7_0_GPIO_O),
        .rst_n(system_pll_ctrl_0_sys_rst_n),
        .st(ad7768_0_st),
        .sync_7768_in(ad7768_0_sync_7768_in));
  YE6237_ad7768_0_1 ad7768_1
       (.ad7768_rst(ad7768_1_ad7768_rst),
        .ad7768_start(ad7768_1_ad7768_start),
        .ad_clk_sel(ad7768_1_ad_clk_sel),
        .ad_spi_pin(ad7768_1_ad_spi_pin),
        .adc_data_1(ad7768_1_adc_data_1),
        .adc_data_2(ad7768_1_adc_data_2),
        .adc_data_3(ad7768_1_adc_data_3),
        .adc_data_4(ad7768_1_adc_data_4),
        .adc_data_5(ad7768_1_adc_data_5),
        .adc_data_6(ad7768_1_adc_data_6),
        .adc_data_7(ad7768_1_adc_data_7),
        .adc_data_8(ad7768_1_adc_data_8),
        .adc_to_c_rts(ad7768_1_adc_to_c_rts),
        .c_to_adc_ack(rx_board_data_0_c_to_adc_ack),
        .clk(clk_wiz_0_clk_out1),
        .dclk(dclk_0_2),
        .dec(ad7768_1_dec),
        .dout(dout_0_2),
        .drdy(drdy_0_2),
        .filter(ad7768_1_filter),
        .mode(ad7768_1_mode),
        .ps_mdio(processing_system7_0_GPIO_O),
        .rst_n(system_pll_ctrl_0_sys_rst_n),
        .st(ad7768_1_st),
        .sync_7768_in(ad7768_1_sync_7768_in));
  YE6237_channel_parameters_0_0 channel_parameters_0
       (.ch10_current_en(channel_parameters_0_ch10_current_en),
        .ch10_v_iepe_en(channel_parameters_0_ch10_v_iepe_en),
        .ch11_current_en(channel_parameters_0_ch11_current_en),
        .ch11_v_iepe_en(channel_parameters_0_ch11_v_iepe_en),
        .ch12_current_en(channel_parameters_0_ch12_current_en),
        .ch12_v_iepe_en(channel_parameters_0_ch12_v_iepe_en),
        .ch13_current_en(channel_parameters_0_ch13_current_en),
        .ch13_v_iepe_en(channel_parameters_0_ch13_v_iepe_en),
        .ch14_current_en(channel_parameters_0_ch14_current_en),
        .ch14_v_iepe_en(channel_parameters_0_ch14_v_iepe_en),
        .ch15_current_en(channel_parameters_0_ch15_current_en),
        .ch15_v_iepe_en(channel_parameters_0_ch15_v_iepe_en),
        .ch16_current_en(channel_parameters_0_ch16_current_en),
        .ch16_v_iepe_en(channel_parameters_0_ch16_v_iepe_en),
        .ch1_current_en(channel_parameters_0_ch1_current_en),
        .ch1_v_iepe_en(channel_parameters_0_ch1_v_iepe_en),
        .ch2_current_en(channel_parameters_0_ch2_current_en),
        .ch2_v_iepe_en(channel_parameters_0_ch2_v_iepe_en),
        .ch3_current_en(channel_parameters_0_ch3_current_en),
        .ch3_v_iepe_en(channel_parameters_0_ch3_v_iepe_en),
        .ch4_current_en(channel_parameters_0_ch4_current_en),
        .ch4_v_iepe_en(channel_parameters_0_ch4_v_iepe_en),
        .ch5_current_en(channel_parameters_0_ch5_current_en),
        .ch5_v_iepe_en(channel_parameters_0_ch5_v_iepe_en),
        .ch6_current_en(channel_parameters_0_ch6_current_en),
        .ch6_v_iepe_en(channel_parameters_0_ch6_v_iepe_en),
        .ch7_current_en(channel_parameters_0_ch7_current_en),
        .ch7_v_iepe_en(channel_parameters_0_ch7_v_iepe_en),
        .ch8_current_en(channel_parameters_0_ch8_current_en),
        .ch8_v_iepe_en(channel_parameters_0_ch8_v_iepe_en),
        .ch9_current_en(channel_parameters_0_ch9_current_en),
        .ch9_v_iepe_en(channel_parameters_0_ch9_v_iepe_en),
        .clk(clk_wiz_0_clk_out1),
        .ps_mdio(processing_system7_0_GPIO_O));
  YE6237_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(CLK_32_768M_1),
        .clk_out1(clk_wiz_0_clk_out2),
        .clk_out2(clk_wiz_0_clk_out3),
        .locked(clk_wiz_0_locked),
        .reset(util_vector_logic_1_Res));
  YE6237_ila_0_1 ila_0
       (.clk(clk_wiz_0_clk_out1),
        .probe0(ad7768_0_adc_data_8));
  YE6237_ila_1_0 ila_1
       (.clk(clk_wiz_0_clk_out1),
        .probe0(smartconnect_0_M00_AXI_WREADY),
        .probe1(smartconnect_0_M00_AXI_AWADDR),
        .probe10(smartconnect_0_M00_AXI_RDATA),
        .probe11(smartconnect_0_M00_AXI_AWVALID),
        .probe12(smartconnect_0_M00_AXI_AWREADY),
        .probe13(smartconnect_0_M00_AXI_RRESP),
        .probe14(smartconnect_0_M00_AXI_WDATA),
        .probe15(smartconnect_0_M00_AXI_WSTRB),
        .probe16(smartconnect_0_M00_AXI_RVALID),
        .probe17(smartconnect_0_M00_AXI_ARPROT),
        .probe18(smartconnect_0_M00_AXI_AWPROT),
        .probe19(1'b0),
        .probe2(smartconnect_0_M00_AXI_BRESP),
        .probe20(smartconnect_0_M00_AXI_BID[0]),
        .probe21(smartconnect_0_M00_AXI_AWLEN),
        .probe22(1'b0),
        .probe23(smartconnect_0_M00_AXI_AWSIZE),
        .probe24(smartconnect_0_M00_AXI_AWBURST),
        .probe25(1'b0),
        .probe26(smartconnect_0_M00_AXI_AWLOCK),
        .probe27(smartconnect_0_M00_AXI_ARLEN),
        .probe28(smartconnect_0_M00_AXI_ARSIZE),
        .probe29(smartconnect_0_M00_AXI_ARBURST),
        .probe3(smartconnect_0_M00_AXI_BVALID),
        .probe30(smartconnect_0_M00_AXI_ARLOCK),
        .probe31(smartconnect_0_M00_AXI_ARCACHE),
        .probe32(smartconnect_0_M00_AXI_AWCACHE),
        .probe33({1'b0,1'b0,1'b0,1'b0}),
        .probe34(smartconnect_0_M00_AXI_ARQOS),
        .probe35(1'b0),
        .probe36(1'b0),
        .probe37(smartconnect_0_M00_AXI_AWQOS),
        .probe38(smartconnect_0_M00_AXI_RID[0]),
        .probe39(1'b0),
        .probe4(smartconnect_0_M00_AXI_BREADY),
        .probe40(smartconnect_0_M00_AXI_RLAST),
        .probe41(1'b0),
        .probe42(smartconnect_0_M00_AXI_WLAST),
        .probe43(1'b0),
        .probe44(1'b0),
        .probe5(smartconnect_0_M00_AXI_ARADDR),
        .probe6(smartconnect_0_M00_AXI_RREADY),
        .probe7(smartconnect_0_M00_AXI_WVALID),
        .probe8(smartconnect_0_M00_AXI_ARVALID),
        .probe9(smartconnect_0_M00_AXI_ARREADY));
  YE6237_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
  YE6237_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(clk_wiz_0_clk_out1),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .GPIO_I({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .GPIO_O(processing_system7_0_GPIO_O),
        .MIO(FIXED_IO_mio[53:0]),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .S_AXI_HP0_ACLK(clk_wiz_0_clk_out1),
        .S_AXI_HP0_ARADDR(smartconnect_0_M00_AXI_ARADDR),
        .S_AXI_HP0_ARBURST(smartconnect_0_M00_AXI_ARBURST),
        .S_AXI_HP0_ARCACHE(smartconnect_0_M00_AXI_ARCACHE),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLEN(smartconnect_0_M00_AXI_ARLEN),
        .S_AXI_HP0_ARLOCK(smartconnect_0_M00_AXI_ARLOCK),
        .S_AXI_HP0_ARPROT(smartconnect_0_M00_AXI_ARPROT),
        .S_AXI_HP0_ARQOS(smartconnect_0_M00_AXI_ARQOS),
        .S_AXI_HP0_ARREADY(smartconnect_0_M00_AXI_ARREADY),
        .S_AXI_HP0_ARSIZE(smartconnect_0_M00_AXI_ARSIZE),
        .S_AXI_HP0_ARVALID(smartconnect_0_M00_AXI_ARVALID),
        .S_AXI_HP0_AWADDR(smartconnect_0_M00_AXI_AWADDR),
        .S_AXI_HP0_AWBURST(smartconnect_0_M00_AXI_AWBURST),
        .S_AXI_HP0_AWCACHE(smartconnect_0_M00_AXI_AWCACHE),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWLEN(smartconnect_0_M00_AXI_AWLEN),
        .S_AXI_HP0_AWLOCK(smartconnect_0_M00_AXI_AWLOCK),
        .S_AXI_HP0_AWPROT(smartconnect_0_M00_AXI_AWPROT),
        .S_AXI_HP0_AWQOS(smartconnect_0_M00_AXI_AWQOS),
        .S_AXI_HP0_AWREADY(smartconnect_0_M00_AXI_AWREADY),
        .S_AXI_HP0_AWSIZE(smartconnect_0_M00_AXI_AWSIZE),
        .S_AXI_HP0_AWVALID(smartconnect_0_M00_AXI_AWVALID),
        .S_AXI_HP0_BID(smartconnect_0_M00_AXI_BID),
        .S_AXI_HP0_BREADY(smartconnect_0_M00_AXI_BREADY),
        .S_AXI_HP0_BRESP(smartconnect_0_M00_AXI_BRESP),
        .S_AXI_HP0_BVALID(smartconnect_0_M00_AXI_BVALID),
        .S_AXI_HP0_RDATA(smartconnect_0_M00_AXI_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RID(smartconnect_0_M00_AXI_RID),
        .S_AXI_HP0_RLAST(smartconnect_0_M00_AXI_RLAST),
        .S_AXI_HP0_RREADY(smartconnect_0_M00_AXI_RREADY),
        .S_AXI_HP0_RRESP(smartconnect_0_M00_AXI_RRESP),
        .S_AXI_HP0_RVALID(smartconnect_0_M00_AXI_RVALID),
        .S_AXI_HP0_WDATA(smartconnect_0_M00_AXI_WDATA),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_WLAST(smartconnect_0_M00_AXI_WLAST),
        .S_AXI_HP0_WREADY(smartconnect_0_M00_AXI_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(smartconnect_0_M00_AXI_WSTRB),
        .S_AXI_HP0_WVALID(smartconnect_0_M00_AXI_WVALID));
  YE6237_rx_board_data_0_0 rx_board_data_0
       (.adc1_data_1(ad7768_0_adc_data_1),
        .adc1_data_2(ad7768_0_adc_data_2),
        .adc1_data_3(ad7768_0_adc_data_3),
        .adc1_data_4(ad7768_0_adc_data_4),
        .adc1_data_5(ad7768_0_adc_data_5),
        .adc1_data_6(ad7768_0_adc_data_6),
        .adc1_data_7(ad7768_0_adc_data_7),
        .adc1_data_8(ad7768_0_adc_data_8),
        .adc1_to_c_rts(ad7768_0_adc_to_c_rts),
        .adc2_data_1(ad7768_1_adc_data_1),
        .adc2_data_2(ad7768_1_adc_data_2),
        .adc2_data_3(ad7768_1_adc_data_3),
        .adc2_data_4(ad7768_1_adc_data_4),
        .adc2_data_5(ad7768_1_adc_data_5),
        .adc2_data_6(ad7768_1_adc_data_6),
        .adc2_data_7(ad7768_1_adc_data_7),
        .adc2_data_8(ad7768_1_adc_data_8),
        .adc2_to_c_rts(ad7768_1_adc_to_c_rts),
        .c_to_adc_ack(rx_board_data_0_c_to_adc_ack),
        .clk(clk_wiz_0_clk_out1),
        .pkg_rd_addr(rx_board_data_0_pkg_rd_addr),
        .pkg_rd_areq(rx_board_data_0_pkg_rd_areq),
        .pkg_rd_data(MSXBO_FDMA_0_pkg_rd_data),
        .pkg_rd_en(MSXBO_FDMA_0_pkg_rd_en),
        .pkg_rd_last(MSXBO_FDMA_0_pkg_rd_last),
        .pkg_rd_size(rx_board_data_0_pkg_rd_size),
        .pkg_wr_addr(rx_board_data_0_pkg_wr_addr),
        .pkg_wr_areq(rx_board_data_0_pkg_wr_areq),
        .pkg_wr_data(rx_board_data_0_pkg_wr_data),
        .pkg_wr_en(MSXBO_FDMA_0_pkg_wr_en),
        .pkg_wr_last(MSXBO_FDMA_0_pkg_wr_last),
        .pkg_wr_size(rx_board_data_0_pkg_wr_size),
        .pl_interrupt(rx_board_data_0_pl_interrupt),
        .ps_mdio(processing_system7_0_GPIO_O),
        .rst_n(proc_sys_reset_0_peripheral_aresetn));
  YE6237_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arqos(smartconnect_0_M00_AXI_ARQOS),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awqos(smartconnect_0_M00_AXI_AWQOS),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .S00_AXI_araddr(MSXBO_FDMA_0_M00_AXI_ARADDR),
        .S00_AXI_arburst(MSXBO_FDMA_0_M00_AXI_ARBURST),
        .S00_AXI_arcache(MSXBO_FDMA_0_M00_AXI_ARCACHE),
        .S00_AXI_arid(MSXBO_FDMA_0_M00_AXI_ARID),
        .S00_AXI_arlen(MSXBO_FDMA_0_M00_AXI_ARLEN),
        .S00_AXI_arlock(MSXBO_FDMA_0_M00_AXI_ARLOCK),
        .S00_AXI_arprot(MSXBO_FDMA_0_M00_AXI_ARPROT),
        .S00_AXI_arqos(MSXBO_FDMA_0_M00_AXI_ARQOS),
        .S00_AXI_arready(MSXBO_FDMA_0_M00_AXI_ARREADY),
        .S00_AXI_arsize(MSXBO_FDMA_0_M00_AXI_ARSIZE),
        .S00_AXI_arvalid(MSXBO_FDMA_0_M00_AXI_ARVALID),
        .S00_AXI_awaddr(MSXBO_FDMA_0_M00_AXI_AWADDR),
        .S00_AXI_awburst(MSXBO_FDMA_0_M00_AXI_AWBURST),
        .S00_AXI_awcache(MSXBO_FDMA_0_M00_AXI_AWCACHE),
        .S00_AXI_awid(MSXBO_FDMA_0_M00_AXI_AWID),
        .S00_AXI_awlen(MSXBO_FDMA_0_M00_AXI_AWLEN),
        .S00_AXI_awlock(MSXBO_FDMA_0_M00_AXI_AWLOCK),
        .S00_AXI_awprot(MSXBO_FDMA_0_M00_AXI_AWPROT),
        .S00_AXI_awqos(MSXBO_FDMA_0_M00_AXI_AWQOS),
        .S00_AXI_awready(MSXBO_FDMA_0_M00_AXI_AWREADY),
        .S00_AXI_awsize(MSXBO_FDMA_0_M00_AXI_AWSIZE),
        .S00_AXI_awvalid(MSXBO_FDMA_0_M00_AXI_AWVALID),
        .S00_AXI_bid(MSXBO_FDMA_0_M00_AXI_BID),
        .S00_AXI_bready(MSXBO_FDMA_0_M00_AXI_BREADY),
        .S00_AXI_bresp(MSXBO_FDMA_0_M00_AXI_BRESP),
        .S00_AXI_bvalid(MSXBO_FDMA_0_M00_AXI_BVALID),
        .S00_AXI_rdata(MSXBO_FDMA_0_M00_AXI_RDATA),
        .S00_AXI_rid(MSXBO_FDMA_0_M00_AXI_RID),
        .S00_AXI_rlast(MSXBO_FDMA_0_M00_AXI_RLAST),
        .S00_AXI_rready(MSXBO_FDMA_0_M00_AXI_RREADY),
        .S00_AXI_rresp(MSXBO_FDMA_0_M00_AXI_RRESP),
        .S00_AXI_rvalid(MSXBO_FDMA_0_M00_AXI_RVALID),
        .S00_AXI_wdata(MSXBO_FDMA_0_M00_AXI_WDATA),
        .S00_AXI_wlast(MSXBO_FDMA_0_M00_AXI_WLAST),
        .S00_AXI_wready(MSXBO_FDMA_0_M00_AXI_WREADY),
        .S00_AXI_wstrb(MSXBO_FDMA_0_M00_AXI_WSTRB),
        .S00_AXI_wvalid(MSXBO_FDMA_0_M00_AXI_WVALID),
        .aclk(clk_wiz_0_clk_out1),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
  YE6237_system_pll_ctrl_0_0 system_pll_ctrl_0
       (.clk(clk_wiz_0_clk_out1),
        .locked1(clk_wiz_0_locked),
        .rst_n(proc_sys_reset_0_peripheral_aresetn),
        .sys_rst_n(system_pll_ctrl_0_sys_rst_n));
  YE6237_util_vector_logic_0_1 util_vector_logic_1
       (.Op1(proc_sys_reset_0_peripheral_aresetn),
        .Res(util_vector_logic_1_Res));
endmodule
