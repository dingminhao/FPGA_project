onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib p2_linebuffer_opt

do {wave.do}

view wave
view structure
view signals

do {p2_linebuffer.udo}

run -all

quit -force
