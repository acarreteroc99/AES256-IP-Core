vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/AES256_encrypter/sim/AES256_encrypter.v" \


vlog -work xil_defaultlib \
"glbl.v"

