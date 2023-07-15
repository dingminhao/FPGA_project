vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/design_1/ipshared/eef0/hdl/axi_full_v1_0_M00_AXI.v" \
"../../../bd/design_1/ipshared/eef0/hdl/axi_full_v1_0_S00_AXI.v" \
"../../../bd/design_1/ipshared/eef0/hdl/axi_full_v1_0.v" \
"../../../bd/design_1/ip/design_1_axi_full_0_0/sim/design_1_axi_full_0_0.v" \
"../../../bd/design_1/ip/design_1_axi_full_1_0/sim/design_1_axi_full_1_0.v" \
"../../../bd/design_1/sim/design_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

