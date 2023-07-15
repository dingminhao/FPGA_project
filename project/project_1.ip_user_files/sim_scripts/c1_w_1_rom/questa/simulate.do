onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib c1_w_1_rom_opt

do {wave.do}

view wave
view structure
view signals

do {c1_w_1_rom.udo}

run -all

quit -force
