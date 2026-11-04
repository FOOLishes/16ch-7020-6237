# 十六路数据采集仪（Zynq-7020 + AD7768）

基于 Xilinx Zynq-7020（`xc7z020clg400-2`）的 16 通道同步数据采集逻辑工程，Vivado 2018.3。

## 结构

```
6237_Xilinx.xpr                 顶层工程
6237_Xilinx.srcs/
  sources_1/new/               用户 RTL
    ad7768.v                   AD7768 ADC 串行接口
    rx_board_data.v            板级数据接收/串并转换
    channel_parameters.v       MDIO 配置，16 通道 IEPE / 电流源使能
    axi4_write_v1_0_M_AXI.v    自定义 AXI4 主口写时序
    system_pll_ctrl.v          时钟/PLL 控制
    data_debug.v               调试观测
  sources_1/bd/YE6237/         Block Design（PS7 + SmartConnect + FDMA + ILA）
  sources_1/ip/                ILA / FIFO 等 IP 配置
  constrs_1/constrs_6237.xdc   引脚与时序约束
  sim_1/                       仿真
ip_repo/axi4_write_1.0/        自定义 AXI4 写 IP（打包）
user_src/MSXBO_FDMA_1.0/       FDMA IP（打包）
```

数据通路：AD7768（16 通道，SPI 配置 + 位流/帧同步）→ `rx_board_data` → FIFO → AXI4 写主口 → SmartConnect → PS DDR；通道增益/电流源/IEPE 使能经 MDIO（`ps_mdio`）配置。

## 打开与构建

1. Vivado 2018.3 打开 `6237_Xilinx.xpr`。
2. IP 仓库路径已在工程中设置为本地 `ip_repo` 和 `user_src`。
3. 首次打开会自动重建 `*.cache`、`*.runs` 等目录；直接 Generate Bitstream 即可。

## 说明

- 仓库只包含设计源（RTL / BD / 约束 / IP 打包），不含综合实现产物与比特流。
- 板卡引脚定义见 `constrs_6237.xdc`。
