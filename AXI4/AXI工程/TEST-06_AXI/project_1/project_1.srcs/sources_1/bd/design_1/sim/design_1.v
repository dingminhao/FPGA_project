//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Tue Jan 10 21:53:45 2023
//Host        : DESKTOP-FPMVU9A running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (m00_axi_aclk_0,
    m00_axi_aresetn_0,
    m00_axi_init_axi_txn_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.M00_AXI_ACLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.M00_AXI_ACLK_0, ASSOCIATED_RESET m00_axi_aresetn_0, CLK_DOMAIN design_1_m00_axi_aclk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input m00_axi_aclk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.M00_AXI_ARESETN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.M00_AXI_ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input m00_axi_aresetn_0;
  input m00_axi_init_axi_txn_0;

  wire [31:0]axi_full_0_M00_AXI_ARADDR;
  wire [1:0]axi_full_0_M00_AXI_ARBURST;
  wire [3:0]axi_full_0_M00_AXI_ARCACHE;
  wire [0:0]axi_full_0_M00_AXI_ARID;
  wire [7:0]axi_full_0_M00_AXI_ARLEN;
  wire axi_full_0_M00_AXI_ARLOCK;
  wire [2:0]axi_full_0_M00_AXI_ARPROT;
  wire [3:0]axi_full_0_M00_AXI_ARQOS;
  wire axi_full_0_M00_AXI_ARREADY;
  wire [2:0]axi_full_0_M00_AXI_ARSIZE;
  wire [0:0]axi_full_0_M00_AXI_ARUSER;
  wire axi_full_0_M00_AXI_ARVALID;
  wire [31:0]axi_full_0_M00_AXI_AWADDR;
  wire [1:0]axi_full_0_M00_AXI_AWBURST;
  wire [3:0]axi_full_0_M00_AXI_AWCACHE;
  wire [0:0]axi_full_0_M00_AXI_AWID;
  wire [7:0]axi_full_0_M00_AXI_AWLEN;
  wire axi_full_0_M00_AXI_AWLOCK;
  wire [2:0]axi_full_0_M00_AXI_AWPROT;
  wire [3:0]axi_full_0_M00_AXI_AWQOS;
  wire axi_full_0_M00_AXI_AWREADY;
  wire [2:0]axi_full_0_M00_AXI_AWSIZE;
  wire [0:0]axi_full_0_M00_AXI_AWUSER;
  wire axi_full_0_M00_AXI_AWVALID;
  wire [0:0]axi_full_0_M00_AXI_BID;
  wire axi_full_0_M00_AXI_BREADY;
  wire [1:0]axi_full_0_M00_AXI_BRESP;
  wire [0:0]axi_full_0_M00_AXI_BUSER;
  wire axi_full_0_M00_AXI_BVALID;
  wire [31:0]axi_full_0_M00_AXI_RDATA;
  wire [0:0]axi_full_0_M00_AXI_RID;
  wire axi_full_0_M00_AXI_RLAST;
  wire axi_full_0_M00_AXI_RREADY;
  wire [1:0]axi_full_0_M00_AXI_RRESP;
  wire [0:0]axi_full_0_M00_AXI_RUSER;
  wire axi_full_0_M00_AXI_RVALID;
  wire [31:0]axi_full_0_M00_AXI_WDATA;
  wire axi_full_0_M00_AXI_WLAST;
  wire axi_full_0_M00_AXI_WREADY;
  wire [3:0]axi_full_0_M00_AXI_WSTRB;
  wire [0:0]axi_full_0_M00_AXI_WUSER;
  wire axi_full_0_M00_AXI_WVALID;
  wire [31:0]axi_full_1_M00_AXI_ARADDR;
  wire [1:0]axi_full_1_M00_AXI_ARBURST;
  wire [3:0]axi_full_1_M00_AXI_ARCACHE;
  wire [0:0]axi_full_1_M00_AXI_ARID;
  wire [7:0]axi_full_1_M00_AXI_ARLEN;
  wire axi_full_1_M00_AXI_ARLOCK;
  wire [2:0]axi_full_1_M00_AXI_ARPROT;
  wire [3:0]axi_full_1_M00_AXI_ARQOS;
  wire axi_full_1_M00_AXI_ARREADY;
  wire [2:0]axi_full_1_M00_AXI_ARSIZE;
  wire [0:0]axi_full_1_M00_AXI_ARUSER;
  wire axi_full_1_M00_AXI_ARVALID;
  wire [31:0]axi_full_1_M00_AXI_AWADDR;
  wire [1:0]axi_full_1_M00_AXI_AWBURST;
  wire [3:0]axi_full_1_M00_AXI_AWCACHE;
  wire [0:0]axi_full_1_M00_AXI_AWID;
  wire [7:0]axi_full_1_M00_AXI_AWLEN;
  wire axi_full_1_M00_AXI_AWLOCK;
  wire [2:0]axi_full_1_M00_AXI_AWPROT;
  wire [3:0]axi_full_1_M00_AXI_AWQOS;
  wire axi_full_1_M00_AXI_AWREADY;
  wire [2:0]axi_full_1_M00_AXI_AWSIZE;
  wire [0:0]axi_full_1_M00_AXI_AWUSER;
  wire axi_full_1_M00_AXI_AWVALID;
  wire [0:0]axi_full_1_M00_AXI_BID;
  wire axi_full_1_M00_AXI_BREADY;
  wire [1:0]axi_full_1_M00_AXI_BRESP;
  wire [0:0]axi_full_1_M00_AXI_BUSER;
  wire axi_full_1_M00_AXI_BVALID;
  wire [31:0]axi_full_1_M00_AXI_RDATA;
  wire [0:0]axi_full_1_M00_AXI_RID;
  wire axi_full_1_M00_AXI_RLAST;
  wire axi_full_1_M00_AXI_RREADY;
  wire [1:0]axi_full_1_M00_AXI_RRESP;
  wire [0:0]axi_full_1_M00_AXI_RUSER;
  wire axi_full_1_M00_AXI_RVALID;
  wire [31:0]axi_full_1_M00_AXI_WDATA;
  wire axi_full_1_M00_AXI_WLAST;
  wire axi_full_1_M00_AXI_WREADY;
  wire [3:0]axi_full_1_M00_AXI_WSTRB;
  wire [0:0]axi_full_1_M00_AXI_WUSER;
  wire axi_full_1_M00_AXI_WVALID;
  wire m00_axi_aclk_0_1;
  wire m00_axi_aresetn_0_1;
  wire m00_axi_init_axi_txn_0_1;

  assign m00_axi_aclk_0_1 = m00_axi_aclk_0;
  assign m00_axi_aresetn_0_1 = m00_axi_aresetn_0;
  assign m00_axi_init_axi_txn_0_1 = m00_axi_init_axi_txn_0;
  design_1_axi_full_0_0 axi_full_0
       (.m00_axi_aclk(m00_axi_aclk_0_1),
        .m00_axi_araddr(axi_full_0_M00_AXI_ARADDR),
        .m00_axi_arburst(axi_full_0_M00_AXI_ARBURST),
        .m00_axi_arcache(axi_full_0_M00_AXI_ARCACHE),
        .m00_axi_aresetn(m00_axi_aresetn_0_1),
        .m00_axi_arid(axi_full_0_M00_AXI_ARID),
        .m00_axi_arlen(axi_full_0_M00_AXI_ARLEN),
        .m00_axi_arlock(axi_full_0_M00_AXI_ARLOCK),
        .m00_axi_arprot(axi_full_0_M00_AXI_ARPROT),
        .m00_axi_arqos(axi_full_0_M00_AXI_ARQOS),
        .m00_axi_arready(axi_full_0_M00_AXI_ARREADY),
        .m00_axi_arsize(axi_full_0_M00_AXI_ARSIZE),
        .m00_axi_aruser(axi_full_0_M00_AXI_ARUSER),
        .m00_axi_arvalid(axi_full_0_M00_AXI_ARVALID),
        .m00_axi_awaddr(axi_full_0_M00_AXI_AWADDR),
        .m00_axi_awburst(axi_full_0_M00_AXI_AWBURST),
        .m00_axi_awcache(axi_full_0_M00_AXI_AWCACHE),
        .m00_axi_awid(axi_full_0_M00_AXI_AWID),
        .m00_axi_awlen(axi_full_0_M00_AXI_AWLEN),
        .m00_axi_awlock(axi_full_0_M00_AXI_AWLOCK),
        .m00_axi_awprot(axi_full_0_M00_AXI_AWPROT),
        .m00_axi_awqos(axi_full_0_M00_AXI_AWQOS),
        .m00_axi_awready(axi_full_0_M00_AXI_AWREADY),
        .m00_axi_awsize(axi_full_0_M00_AXI_AWSIZE),
        .m00_axi_awuser(axi_full_0_M00_AXI_AWUSER),
        .m00_axi_awvalid(axi_full_0_M00_AXI_AWVALID),
        .m00_axi_bid(axi_full_0_M00_AXI_BID),
        .m00_axi_bready(axi_full_0_M00_AXI_BREADY),
        .m00_axi_bresp(axi_full_0_M00_AXI_BRESP),
        .m00_axi_buser(axi_full_0_M00_AXI_BUSER),
        .m00_axi_bvalid(axi_full_0_M00_AXI_BVALID),
        .m00_axi_init_axi_txn(m00_axi_init_axi_txn_0_1),
        .m00_axi_rdata(axi_full_0_M00_AXI_RDATA),
        .m00_axi_rid(axi_full_0_M00_AXI_RID),
        .m00_axi_rlast(axi_full_0_M00_AXI_RLAST),
        .m00_axi_rready(axi_full_0_M00_AXI_RREADY),
        .m00_axi_rresp(axi_full_0_M00_AXI_RRESP),
        .m00_axi_ruser(axi_full_0_M00_AXI_RUSER),
        .m00_axi_rvalid(axi_full_0_M00_AXI_RVALID),
        .m00_axi_wdata(axi_full_0_M00_AXI_WDATA),
        .m00_axi_wlast(axi_full_0_M00_AXI_WLAST),
        .m00_axi_wready(axi_full_0_M00_AXI_WREADY),
        .m00_axi_wstrb(axi_full_0_M00_AXI_WSTRB),
        .m00_axi_wuser(axi_full_0_M00_AXI_WUSER),
        .m00_axi_wvalid(axi_full_0_M00_AXI_WVALID),
        .s00_axi_aclk(m00_axi_aclk_0_1),
        .s00_axi_araddr(axi_full_1_M00_AXI_ARADDR[5:0]),
        .s00_axi_arburst(axi_full_1_M00_AXI_ARBURST),
        .s00_axi_arcache(axi_full_1_M00_AXI_ARCACHE),
        .s00_axi_aresetn(m00_axi_aresetn_0_1),
        .s00_axi_arid(axi_full_1_M00_AXI_ARID),
        .s00_axi_arlen(axi_full_1_M00_AXI_ARLEN),
        .s00_axi_arlock(axi_full_1_M00_AXI_ARLOCK),
        .s00_axi_arprot(axi_full_1_M00_AXI_ARPROT),
        .s00_axi_arqos(axi_full_1_M00_AXI_ARQOS),
        .s00_axi_arready(axi_full_1_M00_AXI_ARREADY),
        .s00_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s00_axi_arsize(axi_full_1_M00_AXI_ARSIZE),
        .s00_axi_aruser(axi_full_1_M00_AXI_ARUSER),
        .s00_axi_arvalid(axi_full_1_M00_AXI_ARVALID),
        .s00_axi_awaddr(axi_full_1_M00_AXI_AWADDR[5:0]),
        .s00_axi_awburst(axi_full_1_M00_AXI_AWBURST),
        .s00_axi_awcache(axi_full_1_M00_AXI_AWCACHE),
        .s00_axi_awid(axi_full_1_M00_AXI_AWID),
        .s00_axi_awlen(axi_full_1_M00_AXI_AWLEN),
        .s00_axi_awlock(axi_full_1_M00_AXI_AWLOCK),
        .s00_axi_awprot(axi_full_1_M00_AXI_AWPROT),
        .s00_axi_awqos(axi_full_1_M00_AXI_AWQOS),
        .s00_axi_awready(axi_full_1_M00_AXI_AWREADY),
        .s00_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s00_axi_awsize(axi_full_1_M00_AXI_AWSIZE),
        .s00_axi_awuser(axi_full_1_M00_AXI_AWUSER),
        .s00_axi_awvalid(axi_full_1_M00_AXI_AWVALID),
        .s00_axi_bid(axi_full_1_M00_AXI_BID),
        .s00_axi_bready(axi_full_1_M00_AXI_BREADY),
        .s00_axi_bresp(axi_full_1_M00_AXI_BRESP),
        .s00_axi_buser(axi_full_1_M00_AXI_BUSER),
        .s00_axi_bvalid(axi_full_1_M00_AXI_BVALID),
        .s00_axi_rdata(axi_full_1_M00_AXI_RDATA),
        .s00_axi_rid(axi_full_1_M00_AXI_RID),
        .s00_axi_rlast(axi_full_1_M00_AXI_RLAST),
        .s00_axi_rready(axi_full_1_M00_AXI_RREADY),
        .s00_axi_rresp(axi_full_1_M00_AXI_RRESP),
        .s00_axi_ruser(axi_full_1_M00_AXI_RUSER),
        .s00_axi_rvalid(axi_full_1_M00_AXI_RVALID),
        .s00_axi_wdata(axi_full_1_M00_AXI_WDATA),
        .s00_axi_wlast(axi_full_1_M00_AXI_WLAST),
        .s00_axi_wready(axi_full_1_M00_AXI_WREADY),
        .s00_axi_wstrb(axi_full_1_M00_AXI_WSTRB),
        .s00_axi_wuser(axi_full_1_M00_AXI_WUSER),
        .s00_axi_wvalid(axi_full_1_M00_AXI_WVALID));
  design_1_axi_full_1_0 axi_full_1
       (.m00_axi_aclk(m00_axi_aclk_0_1),
        .m00_axi_araddr(axi_full_1_M00_AXI_ARADDR),
        .m00_axi_arburst(axi_full_1_M00_AXI_ARBURST),
        .m00_axi_arcache(axi_full_1_M00_AXI_ARCACHE),
        .m00_axi_aresetn(m00_axi_aresetn_0_1),
        .m00_axi_arid(axi_full_1_M00_AXI_ARID),
        .m00_axi_arlen(axi_full_1_M00_AXI_ARLEN),
        .m00_axi_arlock(axi_full_1_M00_AXI_ARLOCK),
        .m00_axi_arprot(axi_full_1_M00_AXI_ARPROT),
        .m00_axi_arqos(axi_full_1_M00_AXI_ARQOS),
        .m00_axi_arready(axi_full_1_M00_AXI_ARREADY),
        .m00_axi_arsize(axi_full_1_M00_AXI_ARSIZE),
        .m00_axi_aruser(axi_full_1_M00_AXI_ARUSER),
        .m00_axi_arvalid(axi_full_1_M00_AXI_ARVALID),
        .m00_axi_awaddr(axi_full_1_M00_AXI_AWADDR),
        .m00_axi_awburst(axi_full_1_M00_AXI_AWBURST),
        .m00_axi_awcache(axi_full_1_M00_AXI_AWCACHE),
        .m00_axi_awid(axi_full_1_M00_AXI_AWID),
        .m00_axi_awlen(axi_full_1_M00_AXI_AWLEN),
        .m00_axi_awlock(axi_full_1_M00_AXI_AWLOCK),
        .m00_axi_awprot(axi_full_1_M00_AXI_AWPROT),
        .m00_axi_awqos(axi_full_1_M00_AXI_AWQOS),
        .m00_axi_awready(axi_full_1_M00_AXI_AWREADY),
        .m00_axi_awsize(axi_full_1_M00_AXI_AWSIZE),
        .m00_axi_awuser(axi_full_1_M00_AXI_AWUSER),
        .m00_axi_awvalid(axi_full_1_M00_AXI_AWVALID),
        .m00_axi_bid(axi_full_1_M00_AXI_BID),
        .m00_axi_bready(axi_full_1_M00_AXI_BREADY),
        .m00_axi_bresp(axi_full_1_M00_AXI_BRESP),
        .m00_axi_buser(axi_full_1_M00_AXI_BUSER),
        .m00_axi_bvalid(axi_full_1_M00_AXI_BVALID),
        .m00_axi_init_axi_txn(m00_axi_init_axi_txn_0_1),
        .m00_axi_rdata(axi_full_1_M00_AXI_RDATA),
        .m00_axi_rid(axi_full_1_M00_AXI_RID),
        .m00_axi_rlast(axi_full_1_M00_AXI_RLAST),
        .m00_axi_rready(axi_full_1_M00_AXI_RREADY),
        .m00_axi_rresp(axi_full_1_M00_AXI_RRESP),
        .m00_axi_ruser(axi_full_1_M00_AXI_RUSER),
        .m00_axi_rvalid(axi_full_1_M00_AXI_RVALID),
        .m00_axi_wdata(axi_full_1_M00_AXI_WDATA),
        .m00_axi_wlast(axi_full_1_M00_AXI_WLAST),
        .m00_axi_wready(axi_full_1_M00_AXI_WREADY),
        .m00_axi_wstrb(axi_full_1_M00_AXI_WSTRB),
        .m00_axi_wuser(axi_full_1_M00_AXI_WUSER),
        .m00_axi_wvalid(axi_full_1_M00_AXI_WVALID),
        .s00_axi_aclk(m00_axi_aclk_0_1),
        .s00_axi_araddr(axi_full_0_M00_AXI_ARADDR[5:0]),
        .s00_axi_arburst(axi_full_0_M00_AXI_ARBURST),
        .s00_axi_arcache(axi_full_0_M00_AXI_ARCACHE),
        .s00_axi_aresetn(m00_axi_aresetn_0_1),
        .s00_axi_arid(axi_full_0_M00_AXI_ARID),
        .s00_axi_arlen(axi_full_0_M00_AXI_ARLEN),
        .s00_axi_arlock(axi_full_0_M00_AXI_ARLOCK),
        .s00_axi_arprot(axi_full_0_M00_AXI_ARPROT),
        .s00_axi_arqos(axi_full_0_M00_AXI_ARQOS),
        .s00_axi_arready(axi_full_0_M00_AXI_ARREADY),
        .s00_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s00_axi_arsize(axi_full_0_M00_AXI_ARSIZE),
        .s00_axi_aruser(axi_full_0_M00_AXI_ARUSER),
        .s00_axi_arvalid(axi_full_0_M00_AXI_ARVALID),
        .s00_axi_awaddr(axi_full_0_M00_AXI_AWADDR[5:0]),
        .s00_axi_awburst(axi_full_0_M00_AXI_AWBURST),
        .s00_axi_awcache(axi_full_0_M00_AXI_AWCACHE),
        .s00_axi_awid(axi_full_0_M00_AXI_AWID),
        .s00_axi_awlen(axi_full_0_M00_AXI_AWLEN),
        .s00_axi_awlock(axi_full_0_M00_AXI_AWLOCK),
        .s00_axi_awprot(axi_full_0_M00_AXI_AWPROT),
        .s00_axi_awqos(axi_full_0_M00_AXI_AWQOS),
        .s00_axi_awready(axi_full_0_M00_AXI_AWREADY),
        .s00_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s00_axi_awsize(axi_full_0_M00_AXI_AWSIZE),
        .s00_axi_awuser(axi_full_0_M00_AXI_AWUSER),
        .s00_axi_awvalid(axi_full_0_M00_AXI_AWVALID),
        .s00_axi_bid(axi_full_0_M00_AXI_BID),
        .s00_axi_bready(axi_full_0_M00_AXI_BREADY),
        .s00_axi_bresp(axi_full_0_M00_AXI_BRESP),
        .s00_axi_buser(axi_full_0_M00_AXI_BUSER),
        .s00_axi_bvalid(axi_full_0_M00_AXI_BVALID),
        .s00_axi_rdata(axi_full_0_M00_AXI_RDATA),
        .s00_axi_rid(axi_full_0_M00_AXI_RID),
        .s00_axi_rlast(axi_full_0_M00_AXI_RLAST),
        .s00_axi_rready(axi_full_0_M00_AXI_RREADY),
        .s00_axi_rresp(axi_full_0_M00_AXI_RRESP),
        .s00_axi_ruser(axi_full_0_M00_AXI_RUSER),
        .s00_axi_rvalid(axi_full_0_M00_AXI_RVALID),
        .s00_axi_wdata(axi_full_0_M00_AXI_WDATA),
        .s00_axi_wlast(axi_full_0_M00_AXI_WLAST),
        .s00_axi_wready(axi_full_0_M00_AXI_WREADY),
        .s00_axi_wstrb(axi_full_0_M00_AXI_WSTRB),
        .s00_axi_wuser(axi_full_0_M00_AXI_WUSER),
        .s00_axi_wvalid(axi_full_0_M00_AXI_WVALID));
endmodule
