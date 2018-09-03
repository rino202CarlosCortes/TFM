onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib counter_freq_opt

do {wave.do}

view wave
view structure
view signals

do {counter_freq.udo}

run -all

quit -force
