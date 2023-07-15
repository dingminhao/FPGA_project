onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+c1_w_1_rom -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_2 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.c1_w_1_rom xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {c1_w_1_rom.udo}

run -all

endsim

quit -force
