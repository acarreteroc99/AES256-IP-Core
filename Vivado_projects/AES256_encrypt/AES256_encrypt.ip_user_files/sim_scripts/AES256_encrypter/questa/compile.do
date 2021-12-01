vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr -mfcu \
"../../../bd/AES256_encrypter/sim/AES256_encrypter.v" \


vlog -work xil_defaultlib \
"glbl.v"

