-makelib ies_lib/xilinx_vip -sv \
  "/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xpm -sv \
  "/opt/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/opt/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/opt/Xilinx/Vivado/2021.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/testBD/ipshared/bbf0/hdl/AES256_encrypt_IP_v1_0_S00_AXI.v" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
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
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/testBD/ipshared/bbf0/hdl/AES256_encrypt_IP_v1_0.v" \
  "../../../bd/testBD/ip/testBD_AES256_encrypt_IP_0_0/sim/testBD_AES256_encrypt_IP_0_0.v" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_10 -sv \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/0980/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_12 -sv \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/f42d/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/testBD/ip/testBD_processing_system7_0_0/sim/testBD_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_23 \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/94ec/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_24 \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/8f68/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_24 \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/6e0d/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/testBD/ip/testBD_auto_pc_0/sim/testBD_auto_pc_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../testBlockDesign.gen/sources_1/bd/testBD/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/testBD/ip/testBD_rst_ps7_0_50M_0/sim/testBD_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/testBD/sim/testBD.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

