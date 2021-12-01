onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib AES256_encrypter_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {AES256_encrypter.udo}

run -all

quit -force
