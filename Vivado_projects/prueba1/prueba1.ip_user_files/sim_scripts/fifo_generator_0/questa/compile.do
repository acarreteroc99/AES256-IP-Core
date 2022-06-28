vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/xil_defaultlib

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xilinx_vip  -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"D:/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"D:/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work fifo_generator_v13_2_5  "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5  -93 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/ip/fifo_generator_0/sim/fifo_generator_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

