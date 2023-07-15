vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 "+incdir+../../../../project_1.srcs/sources_1/ip/axi_full_0/drivers/axi_full_v1_0/src" \
"../../../../project_1.srcs/sources_1/ip/axi_full_0/hdl/axi_full_v1_0_M00_AXI.v" \
"../../../../project_1.srcs/sources_1/ip/axi_full_0/hdl/axi_full_v1_0_S00_AXI.v" \
"../../../../project_1.srcs/sources_1/ip/axi_full_0/hdl/axi_full_v1_0.v" \
"../../../../project_1.srcs/sources_1/ip/axi_full_0/sim/axi_full_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

