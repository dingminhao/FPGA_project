vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/ipshared/eef0/hdl/axi_full_v1_0_M00_AXI.v" \
"../../../bd/design_1/ipshared/eef0/hdl/axi_full_v1_0_S00_AXI.v" \
"../../../bd/design_1/ipshared/eef0/hdl/axi_full_v1_0.v" \
"../../../bd/design_1/ip/design_1_axi_full_0_0/sim/design_1_axi_full_0_0.v" \
"../../../bd/design_1/ip/design_1_axi_full_1_0/sim/design_1_axi_full_1_0.v" \
"../../../bd/design_1/sim/design_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

