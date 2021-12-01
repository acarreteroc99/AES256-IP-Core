vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr -mfcu \
"../../../bd/AES256_encrypter/sim/AES256_encrypter.v" \


vlog -work xil_defaultlib \
"glbl.v"

