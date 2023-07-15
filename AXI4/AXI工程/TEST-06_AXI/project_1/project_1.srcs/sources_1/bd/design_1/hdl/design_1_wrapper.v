//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Tue Jan 10 21:53:45 2023
//Host        : DESKTOP-FPMVU9A running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (m00_axi_aclk_0,
    m00_axi_aresetn_0,
    m00_axi_init_axi_txn_0);
  input m00_axi_aclk_0;
  input m00_axi_aresetn_0;
  input m00_axi_init_axi_txn_0;

  wire m00_axi_aclk_0;
  wire m00_axi_aresetn_0;
  wire m00_axi_init_axi_txn_0;

  design_1 design_1_i
       (.m00_axi_aclk_0(m00_axi_aclk_0),
        .m00_axi_aresetn_0(m00_axi_aresetn_0),
        .m00_axi_init_axi_txn_0(m00_axi_init_axi_txn_0));
endmodule
