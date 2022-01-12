onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib AES256_system_design6_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {AES256_system_design6.udo}

run -all

quit -force
