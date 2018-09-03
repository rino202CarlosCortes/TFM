onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib bigcounter_opt

do {wave.do}

view wave
view structure
view signals

do {bigcounter.udo}

run -all

quit -force
