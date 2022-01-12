vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_10
vlib activehdl/processing_system7_vip_v1_0_12
vlib activehdl/xil_defaultlib

vmap xilinx_vip activehdl/xilinx_vip
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_10 activehdl/axi_vip_v1_1_10
vmap processing_system7_vip_v1_0_12 activehdl/processing_system7_vip_v1_0_12
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xilinx_vip  -sv2k12 "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/ec67/hdl" "+incdir+../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_10  -sv2k12 "+incdir+../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/ec67/hdl" "+incdir+../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/0980/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_12  -sv2k12 "+incdir+../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/ec67/hdl" "+incdir+../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/f42d/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/ec67/hdl" "+incdir+../../../../AES256_system.gen/sources_1/bd/AES256_system_design6/ipshared/f42d/hdl" "+incdir+/opt/Xilinx/Vivado/2021.1/data/xilinx_vip/include" \
"../../../bd/AES256_system_design6/ip/AES256_system_design6_processing_system7_0_0/sim/AES256_system_design6_processing_system7_0_0.v" \
"../../../bd/AES256_system_design6/sim/AES256_system_design6.v" \

vlog -work xil_defaultlib \
"glbl.v"

