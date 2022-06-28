vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_7
vlib modelsim_lib/msim/processing_system7_vip_v1_0_9
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_21
vlib modelsim_lib/msim/fifo_generator_v13_2_5
vlib modelsim_lib/msim/axi_data_fifo_v2_1_20
vlib modelsim_lib/msim/axi_crossbar_v2_1_22
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_21

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_7 modelsim_lib/msim/axi_vip_v1_1_7
vmap processing_system7_vip_v1_0_9 modelsim_lib/msim/processing_system7_vip_v1_0_9
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_21 modelsim_lib/msim/axi_register_slice_v2_1_21
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_20 modelsim_lib/msim/axi_data_fifo_v2_1_20
vmap axi_crossbar_v2_1_22 modelsim_lib/msim/axi_crossbar_v2_1_22
vmap axi_protocol_converter_v2_1_21 modelsim_lib/msim/axi_protocol_converter_v2_1_21

vlog -work xilinx_vip  -incr -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"D:/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"D:/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_7  -incr -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_9  -incr -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/prueba_bd/ip/prueba_bd_processing_system7_0_0/sim/prueba_bd_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/prueba_bd/ip/prueba_bd_rst_ps7_0_50M_0/sim/prueba_bd_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/prueba_bd/ip/prueba_bd_ila_0_0/sim/prueba_bd_ila_0_0.v" \
"../../../bd/prueba_bd/ip/prueba_bd_ila_1_0/sim/prueba_bd_ila_1_0.v" \

vlog -work generic_baseblocks_v2_1_0  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_21  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5  -93 \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_20  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_22  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b68e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/prueba_bd/ip/prueba_bd_xbar_0/sim/prueba_bd_xbar_0.v" \
"../../../bd/prueba_bd/ipshared/4d66/hdl/AES256_v2_v1_0_S00_AXI.v" \

vlog -work xil_defaultlib  -incr -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/verilogCode/design/mod_fifo_1to8.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/AES256_dec_FSM_AXI.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/AES256_device_FSM_AXI.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/AES256_enc_FSM_AXI.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/AES256_keygen_FSM_AXI.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/fifo_128_32.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_dec_addRoundKey.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_dec_mixColumns.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_dec_rom256.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_dec_shifter.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_enc_addRoundKey.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_enc_mixColumns.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_enc_rom256.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_enc_shifter.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_fifo_1to4.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_kg_rotWord.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_kg_subWord.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_mux_2to1.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_reg16.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_reg16_16to1.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_reg16_1to16.sv" \
"../../../bd/prueba_bd/ipshared/4d66/src/mod_romKey.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/prueba_bd/ipshared/4d66/hdl/AES256_v2_v1_0.v" \
"../../../bd/prueba_bd/ip/prueba_bd_AES256_v2_0_1/sim/prueba_bd_AES256_v2_0_1.v" \

vlog -work axi_protocol_converter_v2_1_21  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/1b7e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/122e/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b205/hdl/verilog" "+incdir+../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/c968/hdl/verilog" "+incdir+D:/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/prueba_bd/ip/prueba_bd_auto_pc_0/sim/prueba_bd_auto_pc_0.v" \
"../../../bd/prueba_bd/sim/prueba_bd.v" \

vlog -work xil_defaultlib \
"glbl.v"

