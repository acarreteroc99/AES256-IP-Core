onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib prueba_bd_opt

do {wave.do}

view wave
view structure
view signals

do {prueba_bd.udo}

run -all

quit -force
