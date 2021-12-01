onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+AES256_encrypter -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.AES256_encrypter xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {AES256_encrypter.udo}

run -all

endsim

quit -force
