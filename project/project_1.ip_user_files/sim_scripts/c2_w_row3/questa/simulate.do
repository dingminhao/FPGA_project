onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib c2_w_row3_opt

do {wave.do}

view wave
view structure
view signals

do {c2_w_row3.udo}

run -all

quit -force
