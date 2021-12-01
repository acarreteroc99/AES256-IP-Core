vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/AES256_encrypter/sim/AES256_encrypter.v" \


vlog -work xil_defaultlib \
"glbl.v"

