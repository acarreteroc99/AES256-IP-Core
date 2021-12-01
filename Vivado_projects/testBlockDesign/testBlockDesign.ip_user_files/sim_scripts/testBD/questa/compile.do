vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_10
vlib questa_lib/msim/processing_system7_vip_v1_0_12
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/axi_data_fifo_v2_1_23
vlib questa_lib/msim/axi_register_slice_v2_1_24
vlib questa_lib/msim/axi_protocol_converter_v2_1_24
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_10 questa_lib/msim/axi_vip_v1_1_10
vmap processing_system7_vip_v1_0_12 questa_lib/msim/processing_system7_vip_v1_0_12
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_23 questa_lib/msim/axi_data_fifo_v2_1_23
vmap axi_register_slice_v2_1_24 questa_lib/msim/axi_register_slice_v2_1_24
vmap axi_protocol_converter_v2_1_24 questa_lib/msim/axi_protocol_converter_v2_1_24
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13

vlog -work xilinx_vip -64 -incr -mfcu -sv -L axi_vip_v1_1_10 -L processing_system7_vip_v1_0_12 -L xilinx_vip "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu -sv -L axi_vip_v1_1_10 -L processing_system7_vip_v1_0_12 -L xilinx_vip "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/opt/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../bd/testBD/ipshared/bbf0/hdl/AES256_encrypt_IP_v1_0_S00_AXI.v" \

vlog -work xil_defaultlib -64 -incr -mfcu -sv -L axi_vip_v1_1_10 -L processing_system7_vip_v1_0_12 -L xilinx_vip "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../bd/testBD/ipshared/bbf0/src/AES256_enc_FSM_AXI.sv" \
"../../../bd/testBD/ipshared/bbf0/src/mod_demuxInit.sv" \
"../../../bd/testBD/ipshared/bbf0/src/mod_enc_addRoundKey.sv" \
"../../../bd/testBD/ipshared/bbf0/src/mod_enc_mixColumns.sv" \
"../../../bd/testBD/ipshared/bbf0/src/mod_enc_rom256.sv" \
"../../../bd/testBD/ipshared/bbf0/src/mod_enc_shifter.sv" \
"../../../bd/testBD/ipshared/bbf0/src/mod_mux_2to1.sv" \
"../../../bd/testBD/ipshared/bbf0/src/mod_reg16.sv" \
"../../../bd/testBD/ipshared/bbf0/src/mod_reg16_16to1_HZ.sv" \
"../../../bd/testBD/ipshared/bbf0/src/mod_reg16_4to16_INIT.sv" \
"../../../bd/testBD/ipshared/bbf0/src/mod_romKey.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../bd/testBD/ipshared/bbf0/hdl/AES256_encrypt_IP_v1_0.v" \
"../../../bd/testBD/ip/testBD_AES256_encrypt_IP_0_0/sim/testBD_AES256_encrypt_IP_0_0.v" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_10 -64 -incr -mfcu -sv -L axi_vip_v1_1_10 -L processing_system7_vip_v1_0_12 -L xilinx_vip "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/0980/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_12 -64 -incr -mfcu -sv -L axi_vip_v1_1_10 -L processing_system7_vip_v1_0_12 -L xilinx_vip "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../bd/testBD/ip/testBD_processing_system7_0_0/sim/testBD_processing_system7_0_0.v" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_23 -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/94ec/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_24 -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/8f68/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_24 -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/6e0d/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../bd/testBD/ip/testBD_auto_pc_0/sim/testBD_auto_pc_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/testBD/ip/testBD_rst_ps7_0_50M_0/sim/testBD_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl" "+incdir+../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../bd/testBD/sim/testBD.v" \

vlog -work xil_defaultlib \
"glbl.v"

