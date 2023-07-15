onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib conv2_linebuffer_opt

do {wave.do}

view wave
view structure
view signals

do {conv2_linebuffer.udo}

run -all

quit -force
