-makelib ies_lib/xilinx_vip -sv \
  "D:/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xpm -sv \
  "D:/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_7 -sv \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_9 -sv \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/6b56/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/prueba_bd/ip/prueba_bd_processing_system7_0_0/sim/prueba_bd_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/prueba_bd/ip/prueba_bd_rst_ps7_0_50M_0/sim/prueba_bd_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/prueba_bd/ip/prueba_bd_ila_0_0/sim/prueba_bd_ila_0_0.v" \
  "../../../bd/prueba_bd/ip/prueba_bd_ila_1_0/sim/prueba_bd_ila_1_0.v" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_21 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_20 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_crossbar_v2_1_22 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/b68e/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/prueba_bd/ip/prueba_bd_xbar_0/sim/prueba_bd_xbar_0.v" \
  "../../../bd/prueba_bd/ipshared/4d66/hdl/AES256_v2_v1_0_S00_AXI.v" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
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
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/prueba_bd/ipshared/4d66/hdl/AES256_v2_v1_0.v" \
  "../../../bd/prueba_bd/ip/prueba_bd_AES256_v2_0_1/sim/prueba_bd_AES256_v2_0_1.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_21 \
  "../../../../prueba1.srcs/sources_1/bd/prueba_bd/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/prueba_bd/ip/prueba_bd_auto_pc_0/sim/prueba_bd_auto_pc_0.v" \
  "../../../bd/prueba_bd/sim/prueba_bd.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

