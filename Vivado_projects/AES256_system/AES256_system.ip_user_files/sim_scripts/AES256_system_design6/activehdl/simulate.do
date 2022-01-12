onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+AES256_system_design6 -L xilinx_vip -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_10 -L processing_system7_vip_v1_0_12 -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.AES256_system_design6 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {AES256_system_design6.udo}

run -all

endsim

quit -force
