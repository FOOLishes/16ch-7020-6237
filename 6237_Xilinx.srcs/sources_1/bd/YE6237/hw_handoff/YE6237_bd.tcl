
################################################################
# This is a generated script based on design: YE6237
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source YE6237_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# ad7768, ad7768, channel_parameters, rx_board_data, system_pll_ctrl

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-2
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name YE6237

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports
  set AD1_CLK [ create_bd_port -dir O -type clk AD1_CLK ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {13107200} \
 ] $AD1_CLK
  set AD1_CLK_SEL [ create_bd_port -dir O AD1_CLK_SEL ]
  set AD1_DCLK [ create_bd_port -dir I AD1_DCLK ]
  set AD1_DEC [ create_bd_port -dir O -from 1 -to 0 AD1_DEC ]
  set AD1_DOUT [ create_bd_port -dir I -from 7 -to 0 AD1_DOUT ]
  set AD1_DRDY [ create_bd_port -dir I AD1_DRDY ]
  set AD1_FILTER [ create_bd_port -dir O AD1_FILTER ]
  set AD1_MODE [ create_bd_port -dir O -from 3 -to 0 AD1_MODE ]
  set AD1_RESET [ create_bd_port -dir O -type rst AD1_RESET ]
  set AD1_SPI_PIN [ create_bd_port -dir O AD1_SPI_PIN ]
  set AD1_ST [ create_bd_port -dir O -from 1 -to 0 AD1_ST ]
  set AD1_START [ create_bd_port -dir O AD1_START ]
  set AD1_SYNCIN [ create_bd_port -dir O AD1_SYNCIN ]
  set AD2_CLK [ create_bd_port -dir O -type clk AD2_CLK ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {13107200} \
 ] $AD2_CLK
  set AD2_CLK_SEL [ create_bd_port -dir O AD2_CLK_SEL ]
  set AD2_DCLK [ create_bd_port -dir I AD2_DCLK ]
  set AD2_DEC [ create_bd_port -dir O -from 1 -to 0 AD2_DEC ]
  set AD2_DOUT [ create_bd_port -dir I -from 7 -to 0 AD2_DOUT ]
  set AD2_DRDY [ create_bd_port -dir I AD2_DRDY ]
  set AD2_FILTER [ create_bd_port -dir O AD2_FILTER ]
  set AD2_MODE [ create_bd_port -dir O -from 3 -to 0 AD2_MODE ]
  set AD2_RESET [ create_bd_port -dir O -type rst AD2_RESET ]
  set AD2_SPI_PIN [ create_bd_port -dir O AD2_SPI_PIN ]
  set AD2_ST [ create_bd_port -dir O -from 1 -to 0 AD2_ST ]
  set AD2_START [ create_bd_port -dir O AD2_START ]
  set AD2_SYNCIN [ create_bd_port -dir O AD2_SYNCIN ]
  set CLK_32_768M [ create_bd_port -dir I -type clk CLK_32_768M ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {32768000} \
 ] $CLK_32_768M
  set PL_INTERRUPT [ create_bd_port -dir O -type intr PL_INTERRUPT ]
  set ch10_current_en [ create_bd_port -dir O ch10_current_en ]
  set ch10_v_iepe_en [ create_bd_port -dir O ch10_v_iepe_en ]
  set ch11_current_en [ create_bd_port -dir O ch11_current_en ]
  set ch11_v_iepe_en [ create_bd_port -dir O ch11_v_iepe_en ]
  set ch12_current_en [ create_bd_port -dir O ch12_current_en ]
  set ch12_v_iepe_en [ create_bd_port -dir O ch12_v_iepe_en ]
  set ch13_current_en [ create_bd_port -dir O ch13_current_en ]
  set ch13_v_iepe_en [ create_bd_port -dir O ch13_v_iepe_en ]
  set ch14_current_en [ create_bd_port -dir O ch14_current_en ]
  set ch14_v_iepe_en [ create_bd_port -dir O ch14_v_iepe_en ]
  set ch15_current_en [ create_bd_port -dir O ch15_current_en ]
  set ch15_v_iepe_en [ create_bd_port -dir O ch15_v_iepe_en ]
  set ch16_current_en [ create_bd_port -dir O ch16_current_en ]
  set ch16_v_iepe_en [ create_bd_port -dir O ch16_v_iepe_en ]
  set ch1_current_en [ create_bd_port -dir O ch1_current_en ]
  set ch1_v_iepe_en [ create_bd_port -dir O ch1_v_iepe_en ]
  set ch2_current_en [ create_bd_port -dir O ch2_current_en ]
  set ch2_v_iepe_en [ create_bd_port -dir O ch2_v_iepe_en ]
  set ch3_current_en [ create_bd_port -dir O ch3_current_en ]
  set ch3_v_iepe_en [ create_bd_port -dir O ch3_v_iepe_en ]
  set ch4_current_en [ create_bd_port -dir O ch4_current_en ]
  set ch4_v_iepe_en [ create_bd_port -dir O ch4_v_iepe_en ]
  set ch5_current_en [ create_bd_port -dir O ch5_current_en ]
  set ch5_v_iepe_en [ create_bd_port -dir O ch5_v_iepe_en ]
  set ch6_current_en [ create_bd_port -dir O ch6_current_en ]
  set ch6_v_iepe_en [ create_bd_port -dir O ch6_v_iepe_en ]
  set ch7_current_en [ create_bd_port -dir O ch7_current_en ]
  set ch7_v_iepe_en [ create_bd_port -dir O ch7_v_iepe_en ]
  set ch8_current_en [ create_bd_port -dir O ch8_current_en ]
  set ch8_v_iepe_en [ create_bd_port -dir O ch8_v_iepe_en ]
  set ch9_current_en [ create_bd_port -dir O ch9_current_en ]
  set ch9_v_iepe_en [ create_bd_port -dir O ch9_v_iepe_en ]

  # Create instance: MSXBO_FDMA_0, and set properties
  set MSXBO_FDMA_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:MSXBO_FDMA:1.0 MSXBO_FDMA_0 ]
  set_property -dict [ list \
   CONFIG.C_M00_AXI_BURST_LEN {256} \
 ] $MSXBO_FDMA_0

  # Create instance: ad7768_0, and set properties
  set block_name ad7768
  set block_cell_name ad7768_0
  if { [catch {set ad7768_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ad7768_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ad7768_1, and set properties
  set block_name ad7768
  set block_cell_name ad7768_1
  if { [catch {set ad7768_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ad7768_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: channel_parameters_0, and set properties
  set block_name channel_parameters
  set block_cell_name channel_parameters_0
  if { [catch {set channel_parameters_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $channel_parameters_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {305.17} \
   CONFIG.CLKOUT1_DRIVES {BUFG} \
   CONFIG.CLKOUT1_JITTER {155.398} \
   CONFIG.CLKOUT1_PHASE_ERROR {151.393} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {13.1072} \
   CONFIG.CLKOUT1_USED {true} \
   CONFIG.CLKOUT2_DRIVES {BUFG} \
   CONFIG.CLKOUT2_JITTER {155.398} \
   CONFIG.CLKOUT2_PHASE_ERROR {151.393} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {13.1072} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_DRIVES {BUFG} \
   CONFIG.CLKOUT4_DRIVES {BUFG} \
   CONFIG.CLKOUT5_DRIVES {BUFG} \
   CONFIG.CLKOUT6_DRIVES {BUFG} \
   CONFIG.CLKOUT7_DRIVES {BUFG} \
   CONFIG.JITTER_SEL {Min_O_Jitter} \
   CONFIG.MMCM_BANDWIDTH {HIGH} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {50} \
   CONFIG.MMCM_CLKIN1_PERIOD {30.517} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {125} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {125} \
   CONFIG.MMCM_COMPENSATION {ZHOLD} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {2} \
   CONFIG.PRIMITIVE {PLL} \
   CONFIG.PRIM_IN_FREQ {32.768} \
   CONFIG.PRIM_SOURCE {Global_buffer} \
 ] $clk_wiz_0

  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [ list \
   CONFIG.C_DATA_DEPTH {8192} \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {1} \
   CONFIG.C_PROBE0_WIDTH {32} \
 ] $ila_0

  # Create instance: ila_1, and set properties
  set ila_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_1 ]
  set_property -dict [ list \
   CONFIG.C_DATA_DEPTH {8192} \
 ] $ila_1

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
   CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {666.666687} \
   CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
   CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
   CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {125.000000} \
   CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ARMPLL_CTRL_FBDIV {40} \
   CONFIG.PCW_CAN1_GRP_CLK_ENABLE {0} \
   CONFIG.PCW_CAN1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_VALID {0} \
   CONFIG.PCW_CLK0_FREQ {100000000} \
   CONFIG.PCW_CLK1_FREQ {10000000} \
   CONFIG.PCW_CLK2_FREQ {10000000} \
   CONFIG.PCW_CLK3_FREQ {10000000} \
   CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1333.333} \
   CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
   CONFIG.PCW_DDRPLL_CTRL_FBDIV {32} \
   CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1066.667} \
   CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DDR_RAM_HIGHADDR {0x3FFFFFFF} \
   CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
   CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
   CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
   CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} \
   CONFIG.PCW_ENET0_RESET_ENABLE {1} \
   CONFIG.PCW_ENET0_RESET_IO {MIO 0} \
   CONFIG.PCW_ENET1_ENET1_IO {<Select>} \
   CONFIG.PCW_ENET1_GRP_MDIO_ENABLE {0} \
   CONFIG.PCW_ENET1_PERIPHERAL_CLKSRC {External} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_ENET1_PERIPHERAL_FREQMHZ {1000 Mbps} \
   CONFIG.PCW_ENET1_RESET_ENABLE {0} \
   CONFIG.PCW_ENET_RESET_ENABLE {1} \
   CONFIG.PCW_ENET_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_EN_CAN1 {0} \
   CONFIG.PCW_EN_EMIO_CAN1 {0} \
   CONFIG.PCW_EN_EMIO_ENET0 {0} \
   CONFIG.PCW_EN_EMIO_ENET1 {0} \
   CONFIG.PCW_EN_EMIO_GPIO {1} \
   CONFIG.PCW_EN_EMIO_SPI1 {0} \
   CONFIG.PCW_EN_EMIO_UART0 {0} \
   CONFIG.PCW_EN_ENET0 {1} \
   CONFIG.PCW_EN_ENET1 {0} \
   CONFIG.PCW_EN_GPIO {1} \
   CONFIG.PCW_EN_QSPI {1} \
   CONFIG.PCW_EN_SPI1 {0} \
   CONFIG.PCW_EN_UART0 {1} \
   CONFIG.PCW_EN_UART1 {1} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {2} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK1_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK2_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
   CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1} \
   CONFIG.PCW_GPIO_EMIO_GPIO_IO {21} \
   CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {21} \
   CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
   CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
   CONFIG.PCW_I2C0_RESET_ENABLE {0} \
   CONFIG.PCW_I2C1_RESET_ENABLE {0} \
   CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {25} \
   CONFIG.PCW_I2C_RESET_ENABLE {1} \
   CONFIG.PCW_IOPLL_CTRL_FBDIV {30} \
   CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
   CONFIG.PCW_MIO_0_DIRECTION {out} \
   CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_0_PULLUP {enabled} \
   CONFIG.PCW_MIO_0_SLEW {slow} \
   CONFIG.PCW_MIO_10_DIRECTION {inout} \
   CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_10_PULLUP {enabled} \
   CONFIG.PCW_MIO_10_SLEW {slow} \
   CONFIG.PCW_MIO_11_DIRECTION {inout} \
   CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_11_PULLUP {enabled} \
   CONFIG.PCW_MIO_11_SLEW {slow} \
   CONFIG.PCW_MIO_12_DIRECTION {inout} \
   CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_12_PULLUP {enabled} \
   CONFIG.PCW_MIO_12_SLEW {slow} \
   CONFIG.PCW_MIO_13_DIRECTION {inout} \
   CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_13_PULLUP {enabled} \
   CONFIG.PCW_MIO_13_SLEW {slow} \
   CONFIG.PCW_MIO_14_DIRECTION {in} \
   CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_14_PULLUP {enabled} \
   CONFIG.PCW_MIO_14_SLEW {fast} \
   CONFIG.PCW_MIO_15_DIRECTION {out} \
   CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_15_PULLUP {enabled} \
   CONFIG.PCW_MIO_15_SLEW {fast} \
   CONFIG.PCW_MIO_16_DIRECTION {out} \
   CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_16_PULLUP {enabled} \
   CONFIG.PCW_MIO_16_SLEW {fast} \
   CONFIG.PCW_MIO_17_DIRECTION {out} \
   CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_17_PULLUP {enabled} \
   CONFIG.PCW_MIO_17_SLEW {fast} \
   CONFIG.PCW_MIO_18_DIRECTION {out} \
   CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_18_PULLUP {enabled} \
   CONFIG.PCW_MIO_18_SLEW {fast} \
   CONFIG.PCW_MIO_19_DIRECTION {out} \
   CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_19_PULLUP {enabled} \
   CONFIG.PCW_MIO_19_SLEW {fast} \
   CONFIG.PCW_MIO_1_DIRECTION {out} \
   CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_1_PULLUP {enabled} \
   CONFIG.PCW_MIO_1_SLEW {slow} \
   CONFIG.PCW_MIO_20_DIRECTION {out} \
   CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_20_PULLUP {enabled} \
   CONFIG.PCW_MIO_20_SLEW {fast} \
   CONFIG.PCW_MIO_21_DIRECTION {out} \
   CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_21_PULLUP {enabled} \
   CONFIG.PCW_MIO_21_SLEW {fast} \
   CONFIG.PCW_MIO_22_DIRECTION {in} \
   CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_22_PULLUP {enabled} \
   CONFIG.PCW_MIO_22_SLEW {fast} \
   CONFIG.PCW_MIO_23_DIRECTION {in} \
   CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_23_PULLUP {enabled} \
   CONFIG.PCW_MIO_23_SLEW {fast} \
   CONFIG.PCW_MIO_24_DIRECTION {in} \
   CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_24_PULLUP {enabled} \
   CONFIG.PCW_MIO_24_SLEW {fast} \
   CONFIG.PCW_MIO_25_DIRECTION {in} \
   CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_25_PULLUP {enabled} \
   CONFIG.PCW_MIO_25_SLEW {fast} \
   CONFIG.PCW_MIO_26_DIRECTION {in} \
   CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_26_PULLUP {enabled} \
   CONFIG.PCW_MIO_26_SLEW {fast} \
   CONFIG.PCW_MIO_27_DIRECTION {in} \
   CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_27_PULLUP {enabled} \
   CONFIG.PCW_MIO_27_SLEW {fast} \
   CONFIG.PCW_MIO_28_DIRECTION {inout} \
   CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_28_PULLUP {enabled} \
   CONFIG.PCW_MIO_28_SLEW {slow} \
   CONFIG.PCW_MIO_29_DIRECTION {inout} \
   CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_29_PULLUP {enabled} \
   CONFIG.PCW_MIO_29_SLEW {slow} \
   CONFIG.PCW_MIO_2_DIRECTION {inout} \
   CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_2_PULLUP {disabled} \
   CONFIG.PCW_MIO_2_SLEW {slow} \
   CONFIG.PCW_MIO_30_DIRECTION {inout} \
   CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_30_PULLUP {enabled} \
   CONFIG.PCW_MIO_30_SLEW {slow} \
   CONFIG.PCW_MIO_31_DIRECTION {inout} \
   CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_31_PULLUP {enabled} \
   CONFIG.PCW_MIO_31_SLEW {slow} \
   CONFIG.PCW_MIO_32_DIRECTION {inout} \
   CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_32_PULLUP {enabled} \
   CONFIG.PCW_MIO_32_SLEW {slow} \
   CONFIG.PCW_MIO_33_DIRECTION {inout} \
   CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_33_PULLUP {enabled} \
   CONFIG.PCW_MIO_33_SLEW {slow} \
   CONFIG.PCW_MIO_34_DIRECTION {inout} \
   CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_34_PULLUP {enabled} \
   CONFIG.PCW_MIO_34_SLEW {slow} \
   CONFIG.PCW_MIO_35_DIRECTION {inout} \
   CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_35_PULLUP {enabled} \
   CONFIG.PCW_MIO_35_SLEW {slow} \
   CONFIG.PCW_MIO_36_DIRECTION {inout} \
   CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_36_PULLUP {enabled} \
   CONFIG.PCW_MIO_36_SLEW {slow} \
   CONFIG.PCW_MIO_37_DIRECTION {inout} \
   CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_37_PULLUP {enabled} \
   CONFIG.PCW_MIO_37_SLEW {slow} \
   CONFIG.PCW_MIO_38_DIRECTION {inout} \
   CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_38_PULLUP {enabled} \
   CONFIG.PCW_MIO_38_SLEW {slow} \
   CONFIG.PCW_MIO_39_DIRECTION {inout} \
   CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_39_PULLUP {enabled} \
   CONFIG.PCW_MIO_39_SLEW {slow} \
   CONFIG.PCW_MIO_3_DIRECTION {inout} \
   CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_3_PULLUP {disabled} \
   CONFIG.PCW_MIO_3_SLEW {slow} \
   CONFIG.PCW_MIO_40_DIRECTION {inout} \
   CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_40_PULLUP {enabled} \
   CONFIG.PCW_MIO_40_SLEW {slow} \
   CONFIG.PCW_MIO_41_DIRECTION {inout} \
   CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_41_PULLUP {enabled} \
   CONFIG.PCW_MIO_41_SLEW {slow} \
   CONFIG.PCW_MIO_42_DIRECTION {inout} \
   CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_42_PULLUP {enabled} \
   CONFIG.PCW_MIO_42_SLEW {slow} \
   CONFIG.PCW_MIO_43_DIRECTION {inout} \
   CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_43_PULLUP {enabled} \
   CONFIG.PCW_MIO_43_SLEW {slow} \
   CONFIG.PCW_MIO_44_DIRECTION {inout} \
   CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_44_PULLUP {enabled} \
   CONFIG.PCW_MIO_44_SLEW {slow} \
   CONFIG.PCW_MIO_45_DIRECTION {inout} \
   CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_45_PULLUP {enabled} \
   CONFIG.PCW_MIO_45_SLEW {slow} \
   CONFIG.PCW_MIO_46_DIRECTION {inout} \
   CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_46_PULLUP {enabled} \
   CONFIG.PCW_MIO_46_SLEW {slow} \
   CONFIG.PCW_MIO_47_DIRECTION {inout} \
   CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_47_PULLUP {enabled} \
   CONFIG.PCW_MIO_47_SLEW {slow} \
   CONFIG.PCW_MIO_48_DIRECTION {inout} \
   CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_48_PULLUP {enabled} \
   CONFIG.PCW_MIO_48_SLEW {slow} \
   CONFIG.PCW_MIO_49_DIRECTION {inout} \
   CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_49_PULLUP {enabled} \
   CONFIG.PCW_MIO_49_SLEW {slow} \
   CONFIG.PCW_MIO_4_DIRECTION {inout} \
   CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_4_PULLUP {disabled} \
   CONFIG.PCW_MIO_4_SLEW {slow} \
   CONFIG.PCW_MIO_50_DIRECTION {inout} \
   CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_50_PULLUP {enabled} \
   CONFIG.PCW_MIO_50_SLEW {slow} \
   CONFIG.PCW_MIO_51_DIRECTION {inout} \
   CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_51_PULLUP {enabled} \
   CONFIG.PCW_MIO_51_SLEW {slow} \
   CONFIG.PCW_MIO_52_DIRECTION {out} \
   CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_52_PULLUP {enabled} \
   CONFIG.PCW_MIO_52_SLEW {fast} \
   CONFIG.PCW_MIO_53_DIRECTION {inout} \
   CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_53_PULLUP {enabled} \
   CONFIG.PCW_MIO_53_SLEW {fast} \
   CONFIG.PCW_MIO_5_DIRECTION {inout} \
   CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_5_PULLUP {disabled} \
   CONFIG.PCW_MIO_5_SLEW {slow} \
   CONFIG.PCW_MIO_6_DIRECTION {out} \
   CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_6_PULLUP {disabled} \
   CONFIG.PCW_MIO_6_SLEW {slow} \
   CONFIG.PCW_MIO_7_DIRECTION {out} \
   CONFIG.PCW_MIO_7_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_7_PULLUP {disabled} \
   CONFIG.PCW_MIO_7_SLEW {slow} \
   CONFIG.PCW_MIO_8_DIRECTION {out} \
   CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_8_PULLUP {disabled} \
   CONFIG.PCW_MIO_8_SLEW {slow} \
   CONFIG.PCW_MIO_9_DIRECTION {in} \
   CONFIG.PCW_MIO_9_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_9_PULLUP {enabled} \
   CONFIG.PCW_MIO_9_SLEW {slow} \
   CONFIG.PCW_MIO_TREE_PERIPHERALS {ENET Reset#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#GPIO#UART 1#UART 1#GPIO#GPIO#GPIO#GPIO#UART 0#UART 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#Enet 0#Enet 0} \
   CONFIG.PCW_MIO_TREE_SIGNALS {reset#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]/HOLD_B#qspi0_sclk#gpio[7]#tx#rx#gpio[10]#gpio[11]#gpio[12]#gpio[13]#rx#tx#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#gpio[28]#gpio[29]#gpio[30]#gpio[31]#gpio[32]#gpio[33]#gpio[34]#gpio[35]#gpio[36]#gpio[37]#gpio[38]#gpio[39]#gpio[40]#gpio[41]#gpio[42]#gpio[43]#gpio[44]#gpio[45]#gpio[46]#gpio[47]#gpio[48]#gpio[49]#gpio[50]#gpio[51]#mdc#mdio} \
   CONFIG.PCW_NAND_GRP_D8_ENABLE {0} \
   CONFIG.PCW_NAND_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_A25_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_INT_ENABLE {0} \
   CONFIG.PCW_NOR_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
   CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {0} \
   CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
   CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
   CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SINGLE_QSPI_DATA_MODE {x4} \
   CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SPI1_GRP_SS0_ENABLE {0} \
   CONFIG.PCW_SPI1_GRP_SS0_IO {<Select>} \
   CONFIG.PCW_SPI1_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_SPI1_GRP_SS2_ENABLE {0} \
   CONFIG.PCW_SPI1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SPI1_SPI1_IO {<Select>} \
   CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SPI_PERIPHERAL_FREQMHZ {166.666666} \
   CONFIG.PCW_SPI_PERIPHERAL_VALID {0} \
   CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {64} \
   CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_UART0_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_UART0_UART0_IO {MIO 14 .. 15} \
   CONFIG.PCW_UART1_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_UART1_UART1_IO {MIO 8 .. 9} \
   CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {10} \
   CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
   CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {533.333374} \
   CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
   CONFIG.PCW_UIPARAM_DDR_CL {7} \
   CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
   CONFIG.PCW_UIPARAM_DDR_CWL {6} \
   CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
   CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
   CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J256M16 RE-125} \
   CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {15} \
   CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
   CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {35.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RC {48.91} \
   CONFIG.PCW_UIPARAM_DDR_T_RCD {7} \
   CONFIG.PCW_UIPARAM_DDR_T_RP {7} \
   CONFIG.PCW_USB0_RESET_ENABLE {0} \
   CONFIG.PCW_USB1_RESET_ENABLE {0} \
   CONFIG.PCW_USB_RESET_ENABLE {1} \
   CONFIG.PCW_USE_M_AXI_GP0 {0} \
   CONFIG.PCW_USE_S_AXI_GP0 {0} \
   CONFIG.PCW_USE_S_AXI_HP0 {1} \
 ] $processing_system7_0

  # Create instance: rx_board_data_0, and set properties
  set block_name rx_board_data
  set block_cell_name rx_board_data_0
  if { [catch {set rx_board_data_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $rx_board_data_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_CLKS {1} \
   CONFIG.NUM_SI {1} \
 ] $smartconnect_0

  # Create instance: system_pll_ctrl_0, and set properties
  set block_name system_pll_ctrl
  set block_cell_name system_pll_ctrl_0
  if { [catch {set system_pll_ctrl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $system_pll_ctrl_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_1

  # Create interface connections
  connect_bd_intf_net -intf_net MSXBO_FDMA_0_M00_AXI [get_bd_intf_pins MSXBO_FDMA_0/M00_AXI] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins processing_system7_0/S_AXI_HP0] [get_bd_intf_pins smartconnect_0/M00_AXI]
connect_bd_intf_net -intf_net [get_bd_intf_nets smartconnect_0_M00_AXI] [get_bd_intf_pins ila_1/SLOT_0_AXI] [get_bd_intf_pins smartconnect_0/M00_AXI]

  # Create port connections
  connect_bd_net -net CLK_32_768M_1 [get_bd_ports CLK_32_768M] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net MSXBO_FDMA_0_pkg_rd_data [get_bd_pins MSXBO_FDMA_0/pkg_rd_data] [get_bd_pins rx_board_data_0/pkg_rd_data]
  connect_bd_net -net MSXBO_FDMA_0_pkg_rd_en [get_bd_pins MSXBO_FDMA_0/pkg_rd_en] [get_bd_pins rx_board_data_0/pkg_rd_en]
  connect_bd_net -net MSXBO_FDMA_0_pkg_rd_last [get_bd_pins MSXBO_FDMA_0/pkg_rd_last] [get_bd_pins rx_board_data_0/pkg_rd_last]
  connect_bd_net -net MSXBO_FDMA_0_pkg_wr_en [get_bd_pins MSXBO_FDMA_0/pkg_wr_en] [get_bd_pins rx_board_data_0/pkg_wr_en]
  connect_bd_net -net MSXBO_FDMA_0_pkg_wr_last [get_bd_pins MSXBO_FDMA_0/pkg_wr_last] [get_bd_pins rx_board_data_0/pkg_wr_last]
  connect_bd_net -net ad7768_0_ad7768_rst [get_bd_ports AD1_RESET] [get_bd_pins ad7768_0/ad7768_rst]
  connect_bd_net -net ad7768_0_ad7768_start [get_bd_ports AD1_START] [get_bd_pins ad7768_0/ad7768_start]
  connect_bd_net -net ad7768_0_ad_clk_sel [get_bd_ports AD1_CLK_SEL] [get_bd_pins ad7768_0/ad_clk_sel]
  connect_bd_net -net ad7768_0_ad_spi_pin [get_bd_ports AD1_SPI_PIN] [get_bd_pins ad7768_0/ad_spi_pin]
  connect_bd_net -net ad7768_0_adc_data_1 [get_bd_pins ad7768_0/adc_data_1] [get_bd_pins rx_board_data_0/adc1_data_1]
  connect_bd_net -net ad7768_0_adc_data_2 [get_bd_pins ad7768_0/adc_data_2] [get_bd_pins rx_board_data_0/adc1_data_2]
  connect_bd_net -net ad7768_0_adc_data_3 [get_bd_pins ad7768_0/adc_data_3] [get_bd_pins rx_board_data_0/adc1_data_3]
  connect_bd_net -net ad7768_0_adc_data_4 [get_bd_pins ad7768_0/adc_data_4] [get_bd_pins rx_board_data_0/adc1_data_4]
  connect_bd_net -net ad7768_0_adc_data_5 [get_bd_pins ad7768_0/adc_data_5] [get_bd_pins rx_board_data_0/adc1_data_5]
  connect_bd_net -net ad7768_0_adc_data_6 [get_bd_pins ad7768_0/adc_data_6] [get_bd_pins rx_board_data_0/adc1_data_6]
  connect_bd_net -net ad7768_0_adc_data_7 [get_bd_pins ad7768_0/adc_data_7] [get_bd_pins rx_board_data_0/adc1_data_7]
  connect_bd_net -net ad7768_0_adc_data_8 [get_bd_pins ad7768_0/adc_data_8] [get_bd_pins ila_0/probe0] [get_bd_pins rx_board_data_0/adc1_data_8]
  connect_bd_net -net ad7768_0_adc_to_c_rts [get_bd_pins ad7768_0/adc_to_c_rts] [get_bd_pins rx_board_data_0/adc1_to_c_rts]
  connect_bd_net -net ad7768_0_dec [get_bd_ports AD1_DEC] [get_bd_pins ad7768_0/dec]
  connect_bd_net -net ad7768_0_filter [get_bd_ports AD1_FILTER] [get_bd_pins ad7768_0/filter]
  connect_bd_net -net ad7768_0_mode [get_bd_ports AD1_MODE] [get_bd_pins ad7768_0/mode]
  connect_bd_net -net ad7768_0_st [get_bd_ports AD1_ST] [get_bd_pins ad7768_0/st]
  connect_bd_net -net ad7768_0_sync_7768_in [get_bd_ports AD1_SYNCIN] [get_bd_pins ad7768_0/sync_7768_in]
  connect_bd_net -net ad7768_1_ad7768_rst [get_bd_ports AD2_RESET] [get_bd_pins ad7768_1/ad7768_rst]
  connect_bd_net -net ad7768_1_ad7768_start [get_bd_ports AD2_START] [get_bd_pins ad7768_1/ad7768_start]
  connect_bd_net -net ad7768_1_ad_clk_sel [get_bd_ports AD2_CLK_SEL] [get_bd_pins ad7768_1/ad_clk_sel]
  connect_bd_net -net ad7768_1_ad_spi_pin [get_bd_ports AD2_SPI_PIN] [get_bd_pins ad7768_1/ad_spi_pin]
  connect_bd_net -net ad7768_1_adc_data_1 [get_bd_pins ad7768_1/adc_data_1] [get_bd_pins rx_board_data_0/adc2_data_1]
  connect_bd_net -net ad7768_1_adc_data_2 [get_bd_pins ad7768_1/adc_data_2] [get_bd_pins rx_board_data_0/adc2_data_2]
  connect_bd_net -net ad7768_1_adc_data_3 [get_bd_pins ad7768_1/adc_data_3] [get_bd_pins rx_board_data_0/adc2_data_3]
  connect_bd_net -net ad7768_1_adc_data_4 [get_bd_pins ad7768_1/adc_data_4] [get_bd_pins rx_board_data_0/adc2_data_4]
  connect_bd_net -net ad7768_1_adc_data_5 [get_bd_pins ad7768_1/adc_data_5] [get_bd_pins rx_board_data_0/adc2_data_5]
  connect_bd_net -net ad7768_1_adc_data_6 [get_bd_pins ad7768_1/adc_data_6] [get_bd_pins rx_board_data_0/adc2_data_6]
  connect_bd_net -net ad7768_1_adc_data_7 [get_bd_pins ad7768_1/adc_data_7] [get_bd_pins rx_board_data_0/adc2_data_7]
  connect_bd_net -net ad7768_1_adc_data_8 [get_bd_pins ad7768_1/adc_data_8] [get_bd_pins rx_board_data_0/adc2_data_8]
  connect_bd_net -net ad7768_1_adc_to_c_rts [get_bd_pins ad7768_1/adc_to_c_rts] [get_bd_pins rx_board_data_0/adc2_to_c_rts]
  connect_bd_net -net ad7768_1_dec [get_bd_ports AD2_DEC] [get_bd_pins ad7768_1/dec]
  connect_bd_net -net ad7768_1_filter [get_bd_ports AD2_FILTER] [get_bd_pins ad7768_1/filter]
  connect_bd_net -net ad7768_1_mode [get_bd_ports AD2_MODE] [get_bd_pins ad7768_1/mode]
  connect_bd_net -net ad7768_1_st [get_bd_ports AD2_ST] [get_bd_pins ad7768_1/st]
  connect_bd_net -net ad7768_1_sync_7768_in [get_bd_ports AD2_SYNCIN] [get_bd_pins ad7768_1/sync_7768_in]
  connect_bd_net -net channel_parameters_0_ch10_current_en [get_bd_ports ch10_current_en] [get_bd_pins channel_parameters_0/ch10_current_en]
  connect_bd_net -net channel_parameters_0_ch10_v_iepe_en [get_bd_ports ch10_v_iepe_en] [get_bd_pins channel_parameters_0/ch10_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch11_current_en [get_bd_ports ch11_current_en] [get_bd_pins channel_parameters_0/ch11_current_en]
  connect_bd_net -net channel_parameters_0_ch11_v_iepe_en [get_bd_ports ch11_v_iepe_en] [get_bd_pins channel_parameters_0/ch11_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch12_current_en [get_bd_ports ch12_current_en] [get_bd_pins channel_parameters_0/ch12_current_en]
  connect_bd_net -net channel_parameters_0_ch12_v_iepe_en [get_bd_ports ch12_v_iepe_en] [get_bd_pins channel_parameters_0/ch12_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch13_current_en [get_bd_ports ch13_current_en] [get_bd_pins channel_parameters_0/ch13_current_en]
  connect_bd_net -net channel_parameters_0_ch13_v_iepe_en [get_bd_ports ch13_v_iepe_en] [get_bd_pins channel_parameters_0/ch13_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch14_current_en [get_bd_ports ch14_current_en] [get_bd_pins channel_parameters_0/ch14_current_en]
  connect_bd_net -net channel_parameters_0_ch14_v_iepe_en [get_bd_ports ch14_v_iepe_en] [get_bd_pins channel_parameters_0/ch14_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch15_current_en [get_bd_ports ch15_current_en] [get_bd_pins channel_parameters_0/ch15_current_en]
  connect_bd_net -net channel_parameters_0_ch15_v_iepe_en [get_bd_ports ch15_v_iepe_en] [get_bd_pins channel_parameters_0/ch15_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch16_current_en [get_bd_ports ch16_current_en] [get_bd_pins channel_parameters_0/ch16_current_en]
  connect_bd_net -net channel_parameters_0_ch16_v_iepe_en [get_bd_ports ch16_v_iepe_en] [get_bd_pins channel_parameters_0/ch16_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch1_current_en [get_bd_ports ch1_current_en] [get_bd_pins channel_parameters_0/ch1_current_en]
  connect_bd_net -net channel_parameters_0_ch1_v_iepe_en [get_bd_ports ch1_v_iepe_en] [get_bd_pins channel_parameters_0/ch1_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch2_current_en [get_bd_ports ch2_current_en] [get_bd_pins channel_parameters_0/ch2_current_en]
  connect_bd_net -net channel_parameters_0_ch2_v_iepe_en [get_bd_ports ch2_v_iepe_en] [get_bd_pins channel_parameters_0/ch2_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch3_current_en [get_bd_ports ch3_current_en] [get_bd_pins channel_parameters_0/ch3_current_en]
  connect_bd_net -net channel_parameters_0_ch3_v_iepe_en [get_bd_ports ch3_v_iepe_en] [get_bd_pins channel_parameters_0/ch3_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch4_current_en [get_bd_ports ch4_current_en] [get_bd_pins channel_parameters_0/ch4_current_en]
  connect_bd_net -net channel_parameters_0_ch4_v_iepe_en [get_bd_ports ch4_v_iepe_en] [get_bd_pins channel_parameters_0/ch4_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch5_current_en [get_bd_ports ch5_current_en] [get_bd_pins channel_parameters_0/ch5_current_en]
  connect_bd_net -net channel_parameters_0_ch5_v_iepe_en [get_bd_ports ch5_v_iepe_en] [get_bd_pins channel_parameters_0/ch5_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch6_current_en [get_bd_ports ch6_current_en] [get_bd_pins channel_parameters_0/ch6_current_en]
  connect_bd_net -net channel_parameters_0_ch6_v_iepe_en [get_bd_ports ch6_v_iepe_en] [get_bd_pins channel_parameters_0/ch6_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch7_current_en [get_bd_ports ch7_current_en] [get_bd_pins channel_parameters_0/ch7_current_en]
  connect_bd_net -net channel_parameters_0_ch7_v_iepe_en [get_bd_ports ch7_v_iepe_en] [get_bd_pins channel_parameters_0/ch7_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch8_current_en [get_bd_ports ch8_current_en] [get_bd_pins channel_parameters_0/ch8_current_en]
  connect_bd_net -net channel_parameters_0_ch8_v_iepe_en [get_bd_ports ch8_v_iepe_en] [get_bd_pins channel_parameters_0/ch8_v_iepe_en]
  connect_bd_net -net channel_parameters_0_ch9_current_en [get_bd_ports ch9_current_en] [get_bd_pins channel_parameters_0/ch9_current_en]
  connect_bd_net -net channel_parameters_0_ch9_v_iepe_en [get_bd_ports ch9_v_iepe_en] [get_bd_pins channel_parameters_0/ch9_v_iepe_en]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins MSXBO_FDMA_0/m00_axi_aclk] [get_bd_pins ad7768_0/clk] [get_bd_pins ad7768_1/clk] [get_bd_pins channel_parameters_0/clk] [get_bd_pins ila_0/clk] [get_bd_pins ila_1/clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins rx_board_data_0/clk] [get_bd_pins smartconnect_0/aclk] [get_bd_pins system_pll_ctrl_0/clk]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_ports AD1_CLK] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out3 [get_bd_ports AD2_CLK] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins system_pll_ctrl_0/locked1]
  connect_bd_net -net dclk_0_1 [get_bd_ports AD1_DCLK] [get_bd_pins ad7768_0/dclk]
  connect_bd_net -net dclk_0_2 [get_bd_ports AD2_DCLK] [get_bd_pins ad7768_1/dclk]
  connect_bd_net -net dout_0_1 [get_bd_ports AD1_DOUT] [get_bd_pins ad7768_0/dout]
  connect_bd_net -net dout_0_2 [get_bd_ports AD2_DOUT] [get_bd_pins ad7768_1/dout]
  connect_bd_net -net drdy_0_1 [get_bd_ports AD1_DRDY] [get_bd_pins ad7768_0/drdy]
  connect_bd_net -net drdy_0_2 [get_bd_ports AD2_DRDY] [get_bd_pins ad7768_1/drdy]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins MSXBO_FDMA_0/m00_axi_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins rx_board_data_0/rst_n] [get_bd_pins smartconnect_0/aresetn] [get_bd_pins system_pll_ctrl_0/rst_n] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
  connect_bd_net -net processing_system7_0_GPIO_O [get_bd_pins ad7768_0/ps_mdio] [get_bd_pins ad7768_1/ps_mdio] [get_bd_pins channel_parameters_0/ps_mdio] [get_bd_pins processing_system7_0/GPIO_O] [get_bd_pins rx_board_data_0/ps_mdio]
  connect_bd_net -net rx_board_data_0_c_to_adc_ack [get_bd_pins ad7768_0/c_to_adc_ack] [get_bd_pins ad7768_1/c_to_adc_ack] [get_bd_pins rx_board_data_0/c_to_adc_ack]
  connect_bd_net -net rx_board_data_0_pkg_rd_addr [get_bd_pins MSXBO_FDMA_0/pkg_rd_addr] [get_bd_pins rx_board_data_0/pkg_rd_addr]
  connect_bd_net -net rx_board_data_0_pkg_rd_areq [get_bd_pins MSXBO_FDMA_0/pkg_rd_areq] [get_bd_pins rx_board_data_0/pkg_rd_areq]
  connect_bd_net -net rx_board_data_0_pkg_rd_size [get_bd_pins MSXBO_FDMA_0/pkg_rd_size] [get_bd_pins rx_board_data_0/pkg_rd_size]
  connect_bd_net -net rx_board_data_0_pkg_wr_addr [get_bd_pins MSXBO_FDMA_0/pkg_wr_addr] [get_bd_pins rx_board_data_0/pkg_wr_addr]
  connect_bd_net -net rx_board_data_0_pkg_wr_areq [get_bd_pins MSXBO_FDMA_0/pkg_wr_areq] [get_bd_pins rx_board_data_0/pkg_wr_areq]
  connect_bd_net -net rx_board_data_0_pkg_wr_data [get_bd_pins MSXBO_FDMA_0/pkg_wr_data] [get_bd_pins rx_board_data_0/pkg_wr_data]
  connect_bd_net -net rx_board_data_0_pkg_wr_size [get_bd_pins MSXBO_FDMA_0/pkg_wr_size] [get_bd_pins rx_board_data_0/pkg_wr_size]
  connect_bd_net -net rx_board_data_0_pl_interrupt [get_bd_ports PL_INTERRUPT] [get_bd_pins rx_board_data_0/pl_interrupt]
  connect_bd_net -net system_pll_ctrl_0_sys_rst_n [get_bd_pins ad7768_0/rst_n] [get_bd_pins ad7768_1/rst_n] [get_bd_pins system_pll_ctrl_0/sys_rst_n]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins clk_wiz_0/reset] [get_bd_pins util_vector_logic_1/Res]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces MSXBO_FDMA_0/M00_AXI] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


