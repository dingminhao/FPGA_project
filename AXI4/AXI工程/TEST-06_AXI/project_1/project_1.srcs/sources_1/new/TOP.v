module TOP(
    input  i_sysclk     ,
    input  i_sysrst     ,
    output o_led        

);

wire                                  M_AXI_ACLK     ; 
wire                                  M_AXI_ARESETN ;

assign M_AXI_ACLK    = i_sysclk ;
assign M_AXI_ARESETN = ~i_sysrst ;

wire [C_M_AXI_ID_WIDTH-1 : 0]        M_AXI_AWID     ;
wire [C_M_AXI_ADDR_WIDTH-1 : 0]      M_AXI_AWADDR   ;
wire [7 : 0]                         M_AXI_AWLEN    ;
wire [2 : 0]                         M_AXI_AWSIZE   ;
wire [1 : 0]                         M_AXI_AWBURST  ;
wire                                 M_AXI_AWLOCK   ;
wire [3 : 0]                         M_AXI_AWCACHE  ;
wire [2 : 0]                         M_AXI_AWPROT   ;
wire [3 : 0]                         M_AXI_AWQOS    ;
wire [C_M_AXI_AWUSER_WIDTH-1 : 0]    M_AXI_AWUSER   ;
wire                                 M_AXI_AWVALID  ;
wire                                  M_AXI_AWREADY ;
wire [C_M_AXI_DATA_WIDTH-1 : 0]      M_AXI_WDATA    ;
wire [C_M_AXI_DATA_WIDTH/8-1 : 0]    M_AXI_WSTRB    ;
wire                                 M_AXI_WLAST    ;
wire [C_M_AXI_WUSER_WIDTH-1 : 0]     M_AXI_WUSER    ;
wire                                 M_AXI_WVALID   ;
wire                                  M_AXI_WREADY  ;
wire [C_M_AXI_ID_WIDTH-1 : 0]         M_AXI_BID     ;
wire [1 : 0]                          M_AXI_BRESP   ;
wire [C_M_AXI_BUSER_WIDTH-1 : 0]      M_AXI_BUSER   ;
wire                                  M_AXI_BVALID  ;
wire                                 M_AXI_BREADY   ;
wire [C_M_AXI_ID_WIDTH-1 : 0]        M_AXI_ARID     ;
wire [C_M_AXI_ADDR_WIDTH-1 : 0]      M_AXI_ARADDR   ;
wire [7 : 0]                         M_AXI_ARLEN    ;
wire [2 : 0]                         M_AXI_ARSIZE   ;
wire [1 : 0]                         M_AXI_ARBURST  ;
wire                                 M_AXI_ARLOCK   ;
wire [3 : 0]                         M_AXI_ARCACHE  ;
wire [2 : 0]                         M_AXI_ARPROT   ;
wire [3 : 0]                         M_AXI_ARQOS    ;
wire [C_M_AXI_ARUSER_WIDTH-1 : 0]    M_AXI_ARUSER   ;
wire                                 M_AXI_ARVALID  ;
wire                                  M_AXI_ARREADY ;
wire [C_M_AXI_ID_WIDTH-1 : 0]         M_AXI_RID     ;
wire [C_M_AXI_DATA_WIDTH-1 : 0]       M_AXI_RDATA   ;
wire [1 : 0]                          M_AXI_RRESP   ;
wire                                  M_AXI_RLAST   ;
wire [C_M_AXI_RUSER_WIDTH-1 : 0]      M_AXI_RUSER   ;
wire                                  M_AXI_RVALID  ;
wire                                 M_AXI_RREADY   ;   
  

parameter  C_M_TARGET_SLAVE_BASE_ADDR	= 32'h40000000;
parameter integer C_M_AXI_BURST_LEN	    = 16;
parameter integer C_M_AXI_ID_WIDTH	    = 1;
parameter integer C_M_AXI_ADDR_WIDTH	= 32;
parameter integer C_M_AXI_DATA_WIDTH	= 32;
parameter integer C_M_AXI_AWUSER_WIDTH	= 0;
parameter integer C_M_AXI_ARUSER_WIDTH	= 0;
parameter integer C_M_AXI_WUSER_WIDTH	= 0;
parameter integer C_M_AXI_RUSER_WIDTH	= 0;
parameter integer C_M_AXI_BUSER_WIDTH	= 0;

AXI_FULL_M_module#(
    .C_M_TARGET_SLAVE_BASE_ADDR	(32'h40000000),
		.C_M_AXI_BURST_LEN	        (1),
		.C_M_AXI_ID_WIDTH	          (1),
		.C_M_AXI_ADDR_WIDTH	        (32),
		.C_M_AXI_DATA_WIDTH	        (32),
		.C_M_AXI_AWUSER_WIDTH	      (0),
		.C_M_AXI_ARUSER_WIDTH	      (0),
		.C_M_AXI_WUSER_WIDTH	      (0),
		.C_M_AXI_RUSER_WIDTH	      (0),
		.C_M_AXI_BUSER_WIDTH	      (0)
)
AXI_FULL_M_module_U0
(
    .M_AXI_ACLK    ( M_AXI_ACLK   )  ,
		.M_AXI_ARESETN ( M_AXI_ARESETN)  ,

		.M_AXI_AWID    (M_AXI_AWID    )  ,
		.M_AXI_AWADDR  (M_AXI_AWADDR  )  ,
		.M_AXI_AWLEN   (M_AXI_AWLEN   )  ,
		.M_AXI_AWSIZE  (M_AXI_AWSIZE  )  ,
		.M_AXI_AWBURST (M_AXI_AWBURST )  ,
		.M_AXI_AWLOCK  (M_AXI_AWLOCK  )  ,
		.M_AXI_AWCACHE (M_AXI_AWCACHE )  ,
		.M_AXI_AWPROT  (M_AXI_AWPROT  )  ,
		.M_AXI_AWQOS   (M_AXI_AWQOS   )  ,
		.M_AXI_AWUSER  (M_AXI_AWUSER  )  ,
		.M_AXI_AWVALID (M_AXI_AWVALID )  ,
		.M_AXI_AWREADY ( M_AXI_AWREADY)  ,

		.M_AXI_WDATA   (M_AXI_WDATA   )  ,
		.M_AXI_WSTRB   (M_AXI_WSTRB   )  ,
		.M_AXI_WLAST   (M_AXI_WLAST   )  ,
		.M_AXI_WUSER   (M_AXI_WUSER   )  ,
		.M_AXI_WVALID  (M_AXI_WVALID  )  ,
		.M_AXI_WREADY  ( M_AXI_WREADY )  ,

		.M_AXI_BID     ( M_AXI_BID    ) ,
		.M_AXI_BRESP   ( M_AXI_BRESP  ) ,
		.M_AXI_BUSER   ( M_AXI_BUSER  ) ,
		.M_AXI_BVALID  ( M_AXI_BVALID ) ,
		.M_AXI_BREADY  (M_AXI_BREADY  ) ,

		.M_AXI_ARID    (M_AXI_ARID    )  ,
		.M_AXI_ARADDR  (M_AXI_ARADDR  )  ,
		.M_AXI_ARLEN   (M_AXI_ARLEN   )  ,
		.M_AXI_ARSIZE  (M_AXI_ARSIZE  )  ,
		.M_AXI_ARBURST (M_AXI_ARBURST )  ,
		.M_AXI_ARLOCK  (M_AXI_ARLOCK  )  ,
		.M_AXI_ARCACHE (M_AXI_ARCACHE )  ,
		.M_AXI_ARPROT  (M_AXI_ARPROT  )  ,
		.M_AXI_ARQOS   (M_AXI_ARQOS   )  ,
		.M_AXI_ARUSER  (M_AXI_ARUSER  )  ,
		.M_AXI_ARVALID (M_AXI_ARVALID )  ,
		.M_AXI_ARREADY ( M_AXI_ARREADY)  ,

		.M_AXI_RID     ( M_AXI_RID    )  ,
		.M_AXI_RDATA   ( M_AXI_RDATA  )  ,
		.M_AXI_RRESP   ( M_AXI_RRESP  )  ,
		.M_AXI_RLAST   ( M_AXI_RLAST  )  ,
		.M_AXI_RUSER   ( M_AXI_RUSER  )  ,
		.M_AXI_RVALID  ( M_AXI_RVALID )  ,
		.M_AXI_RREADY  (M_AXI_RREADY  )
);

axi_full_0 axi_full_0_U0 (
  .m00_axi_awid   (),                  // output wire [0 : 0] m00_axi_awid
  .m00_axi_awaddr (),              // output wire [31 : 0] m00_axi_awaddr
  .m00_axi_awlen  (),                // output wire [7 : 0] m00_axi_awlen
  .m00_axi_awsize (),              // output wire [2 : 0] m00_axi_awsize
  .m00_axi_awburst(),            // output wire [1 : 0] m00_axi_awburst
  .m00_axi_awlock (),              // output wire m00_axi_awlock
  .m00_axi_awcache(),            // output wire [3 : 0] m00_axi_awcache
  .m00_axi_awprot (),              // output wire [2 : 0] m00_axi_awprot
  .m00_axi_awqos  (),                // output wire [3 : 0] m00_axi_awqos
  .m00_axi_awuser (),              // output wire [0 : 0] m00_axi_awuser
  .m00_axi_awvalid(),            // output wire m00_axi_awvalid
  .m00_axi_awready(),            // input wire m00_axi_awready
  .m00_axi_wdata(),                // output wire [31 : 0] m00_axi_wdata
  .m00_axi_wstrb(),                // output wire [3 : 0] m00_axi_wstrb
  .m00_axi_wlast(),                // output wire m00_axi_wlast
  .m00_axi_wuser(),                // output wire [0 : 0] m00_axi_wuser
  .m00_axi_wvalid(),              // output wire m00_axi_wvalid
  .m00_axi_wready(),              // input wire m00_axi_wready
  .m00_axi_bid(),                    // input wire [0 : 0] m00_axi_bid
  .m00_axi_bresp(),                // input wire [1 : 0] m00_axi_bresp
  .m00_axi_buser(),                // input wire [0 : 0] m00_axi_buser
  .m00_axi_bvalid(),              // input wire m00_axi_bvalid
  .m00_axi_bready(),              // output wire m00_axi_bready
  .m00_axi_arid(),                  // output wire [0 : 0] m00_axi_arid
  .m00_axi_araddr(),              // output wire [31 : 0] m00_axi_araddr
  .m00_axi_arlen(),                // output wire [7 : 0] m00_axi_arlen
  .m00_axi_arsize(),              // output wire [2 : 0] m00_axi_arsize
  .m00_axi_arburst(),            // output wire [1 : 0] m00_axi_arburst
  .m00_axi_arlock(),              // output wire m00_axi_arlock
  .m00_axi_arcache(),            // output wire [3 : 0] m00_axi_arcache
  .m00_axi_arprot(),              // output wire [2 : 0] m00_axi_arprot
  .m00_axi_arqos(),                // output wire [3 : 0] m00_axi_arqos
  .m00_axi_aruser(),              // output wire [0 : 0] m00_axi_aruser
  .m00_axi_arvalid(),            // output wire m00_axi_arvalid
  .m00_axi_arready(),            // input wire m00_axi_arready
  .m00_axi_rid(),                    // input wire [0 : 0] m00_axi_rid
  .m00_axi_rdata(),                // input wire [31 : 0] m00_axi_rdata
  .m00_axi_rresp(),                // input wire [1 : 0] m00_axi_rresp
  .m00_axi_rlast(),                // input wire m00_axi_rlast
  .m00_axi_ruser(),                // input wire [0 : 0] m00_axi_ruser
  .m00_axi_rvalid(),              // input wire m00_axi_rvalid
  .m00_axi_rready(),              // output wire m00_axi_rready
  .m00_axi_aclk(),                  // input wire m00_axi_aclk
  .m00_axi_aresetn(),            // input wire m00_axi_aresetn
  .m00_axi_init_axi_txn(),  // input wire m00_axi_init_axi_txn
  .m00_axi_txn_done(),          // output wire m00_axi_txn_done
  .m00_axi_error(),                // output wire m00_axi_error

  .s00_axi_aclk     (M_AXI_ACLK   ),                  // input wire s00_axi_aclk
  .s00_axi_aresetn  (M_AXI_ARESETN),            // input wire s00_axi_aresetn

  .s00_axi_awid     (M_AXI_AWID     ),                  // input wire [0 : 0] s00_axi_awid
  .s00_axi_awaddr   (M_AXI_AWADDR   ),              // input wire [5 : 0] s00_axi_awaddr
  .s00_axi_awlen    (M_AXI_AWLEN    ),                // input wire [7 : 0] s00_axi_awlen
  .s00_axi_awsize   (M_AXI_AWSIZE   ),              // input wire [2 : 0] s00_axi_awsize
  .s00_axi_awburst  (M_AXI_AWBURST  ),            // input wire [1 : 0] s00_axi_awburst
  .s00_axi_awlock   (M_AXI_AWLOCK   ),              // input wire s00_axi_awlock
  .s00_axi_awcache  (M_AXI_AWCACHE  ),            // input wire [3 : 0] s00_axi_awcache
  .s00_axi_awprot   (M_AXI_AWPROT   ),              // input wire [2 : 0] s00_axi_awprot
  .s00_axi_awqos    (M_AXI_AWQOS    ),                // input wire [3 : 0] s00_axi_awqos
  .s00_axi_awuser   (M_AXI_AWUSER   ),              // input wire [0 : 0] s00_axi_awuser
  .s00_axi_awvalid  (M_AXI_AWVALID  ),            // input wire s00_axi_awvalid
  .s00_axi_awready  ( M_AXI_AWREADY ),            // output wire s00_axi_awready
  .s00_axi_wdata    ( M_AXI_WDATA  ),                // input wire [31 : 0] s00_axi_wdata
  .s00_axi_wstrb    ( M_AXI_WSTRB  ),                // input wire [3 : 0] s00_axi_wstrb
  .s00_axi_wlast    ( M_AXI_WLAST  ),                // input wire s00_axi_wlast
  .s00_axi_wuser    ( M_AXI_WUSER  ),                // input wire [0 : 0] s00_axi_wuser
  .s00_axi_wvalid   ( M_AXI_WVALID ),              // input wire s00_axi_wvalid
  .s00_axi_wready   (  M_AXI_WREADY),              // output wire s00_axi_wready
  .s00_axi_bid      ( M_AXI_BID    ),                    // output wire [0 : 0] s00_axi_bid
  .s00_axi_bresp    ( M_AXI_BRESP  ),                // output wire [1 : 0] s00_axi_bresp
  .s00_axi_buser    ( M_AXI_BUSER  ),                // output wire [0 : 0] s00_axi_buser
  .s00_axi_bvalid   ( M_AXI_BVALID ),              // output wire s00_axi_bvalid
  .s00_axi_bready   (M_AXI_BREADY  ),              // input wire s00_axi_bready
  .s00_axi_arid     ( M_AXI_ARID     ),                  // input wire [0 : 0] s00_axi_arid
  .s00_axi_araddr   ( M_AXI_ARADDR   ),              // input wire [5 : 0] s00_axi_araddr
  .s00_axi_arlen    ( M_AXI_ARLEN    ),                // input wire [7 : 0] s00_axi_arlen
  .s00_axi_arsize   ( M_AXI_ARSIZE   ),              // input wire [2 : 0] s00_axi_arsize
  .s00_axi_arburst  ( M_AXI_ARBURST  ),            // input wire [1 : 0] s00_axi_arburst
  .s00_axi_arlock   ( M_AXI_ARLOCK   ),              // input wire s00_axi_arlock
  .s00_axi_arcache  ( M_AXI_ARCACHE  ),            // input wire [3 : 0] s00_axi_arcache
  .s00_axi_arprot   ( M_AXI_ARPROT   ),              // input wire [2 : 0] s00_axi_arprot
  .s00_axi_arqos    ( M_AXI_ARQOS    ),                // input wire [3 : 0] s00_axi_arqos
  .s00_axi_aruser   ( M_AXI_ARUSER   ),              // input wire [0 : 0] s00_axi_aruser
  .s00_axi_arvalid  ( M_AXI_ARVALID  ),            // input wire s00_axi_arvalid
  .s00_axi_arready  (  M_AXI_ARREADY ),            // output wire s00_axi_arready
  .s00_axi_rid      (  M_AXI_RID    ),                    // output wire [0 : 0] s00_axi_rid
  .s00_axi_rdata    (  M_AXI_RDATA  ),                // output wire [31 : 0] s00_axi_rdata
  .s00_axi_rresp    (  M_AXI_RRESP  ),                // output wire [1 : 0] s00_axi_rresp
  .s00_axi_rlast    (  M_AXI_RLAST  ),                // output wire s00_axi_rlast
  .s00_axi_ruser    (  M_AXI_RUSER  ),                // output wire [0 : 0] s00_axi_ruser
  .s00_axi_rvalid   (  M_AXI_RVALID ),              // output wire s00_axi_rvalid
  .s00_axi_rready   ( M_AXI_RREADY)              // input wire s00_axi_rready
);













































endmodule
