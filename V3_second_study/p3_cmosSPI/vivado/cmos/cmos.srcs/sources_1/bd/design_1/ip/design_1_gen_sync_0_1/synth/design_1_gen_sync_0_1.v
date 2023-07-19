// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:gen_sync:1.0
// IP Revision: 2

(* X_CORE_INFO = "gen_sync,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "design_1_gen_sync_0_1,gen_sync,{}" *)
(* CORE_GENERATION_INFO = "design_1_gen_sync_0_1,gen_sync,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=gen_sync,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,INVSAV=0xFF0000AB,INVEAV=0xFF0000B6,VSAV=0xFF000080,VEAV=0xFF00009D,WAIT_INVLINE=00001,WAIT_VLINE=00010,VSYNC_TIME=00100,WAIT24_VLINE=01000,ACTIVE_LINE=10000,IGNOR_EAVNUM=23,HCNTMAX=1967,VCNTMAX=1079,VCNTSTART=47}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_gen_sync_0_1 (
  clk,
  rst,
  bayer,
  vsync,
  hsync,
  pixel
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 74250000, PHASE 45.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
input wire [7 : 0] bayer;
output wire vsync;
output wire hsync;
output wire [7 : 0] pixel;

  gen_sync #(
    .INVSAV('HFF0000AB),
    .INVEAV('HFF0000B6),
    .VSAV('HFF000080),
    .VEAV('HFF00009D),
    .WAIT_INVLINE('B00001),
    .WAIT_VLINE('B00010),
    .VSYNC_TIME('B00100),
    .WAIT24_VLINE('B01000),
    .ACTIVE_LINE('B10000),
    .IGNOR_EAVNUM(23),
    .HCNTMAX(1967),
    .VCNTMAX(1079),
    .VCNTSTART(47)
  ) inst (
    .clk(clk),
    .rst(rst),
    .bayer(bayer),
    .vsync(vsync),
    .hsync(hsync),
    .pixel(pixel)
  );
endmodule
