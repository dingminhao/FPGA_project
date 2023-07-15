onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib c1_b_rom_opt

do {wave.do}

view wave
view structure
view signals

do {c1_b_rom.udo}

run -all

quit -force
