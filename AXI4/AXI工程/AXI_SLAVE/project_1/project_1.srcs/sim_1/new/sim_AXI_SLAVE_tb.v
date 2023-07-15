`timescale 1ns / 1ns

module sim_AXI_SLAVE_tb();

reg r_clk,r_rst;

initial 
begin
    r_rst = 1;
    #100;
    @(posedge r_clk)#0 r_rst = 0;
end

always
begin
    r_clk = 0;
    #10;
    r_clk = 1;
    #10;
end

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


wire [C_M_AXI_ID_WIDTH-1 : 0]        M_AXI_AWID      ;
wire [C_M_AXI_ADDR_WIDTH-1 : 0]      M_AXI_AWADDR    ;
wire [7 : 0]                         M_AXI_AWLEN     ;
wire [2 : 0]                         M_AXI_AWSIZE    ;
wire [1 : 0]                         M_AXI_AWBURST   ;
wire                                 M_AXI_AWLOCK    ;
wire [3 : 0]                         M_AXI_AWCACHE   ;
wire [2 : 0]                         M_AXI_AWPROT    ;
wire [3 : 0]                         M_AXI_AWQOS     ;
wire [C_M_AXI_AWUSER_WIDTH-1 : 0]    M_AXI_AWUSER    ;
wire                                 M_AXI_AWVALID   ;
wire                                 M_AXI_AWREADY   ;
wire [C_M_AXI_DATA_WIDTH-1 : 0]      M_AXI_WDATA     ;
wire [C_M_AXI_DATA_WIDTH/8-1 : 0]    M_AXI_WSTRB     ;
wire                                 M_AXI_WLAST     ;
wire [C_M_AXI_WUSER_WIDTH-1 : 0]     M_AXI_WUSER     ;
wire                                 M_AXI_WVALID    ;
wire                                 M_AXI_WREADY    ;
wire [C_M_AXI_ID_WIDTH-1 : 0]        M_AXI_BID       ;
wire [1 : 0]                         M_AXI_BRESP     ;
wire [C_M_AXI_BUSER_WIDTH-1 : 0]     M_AXI_BUSER     ;
wire                                 M_AXI_BVALID    ;
wire                                 M_AXI_BREADY    ;
wire [C_M_AXI_ID_WIDTH-1 : 0]        M_AXI_ARID      ;
wire [C_M_AXI_ADDR_WIDTH-1 : 0]      M_AXI_ARADDR    ;
wire [7 : 0]                         M_AXI_ARLEN     ;
wire [2 : 0]                         M_AXI_ARSIZE    ;
wire [1 : 0]                         M_AXI_ARBURST   ;
wire                                 M_AXI_ARLOCK    ;
wire [3 : 0]                         M_AXI_ARCACHE   ;
wire [2 : 0]                         M_AXI_ARPROT    ;
wire [3 : 0]                         M_AXI_ARQOS     ;
wire [C_M_AXI_ARUSER_WIDTH-1 : 0]    M_AXI_ARUSER    ;
wire                                 M_AXI_ARVALID   ;
wire                                 M_AXI_ARREADY   ;
wire [C_M_AXI_ID_WIDTH-1 : 0]        M_AXI_RID       ;
wire [C_M_AXI_DATA_WIDTH-1 : 0]      M_AXI_RDATA     ;
wire [1 : 0]                         M_AXI_RRESP     ;
wire                                 M_AXI_RLAST     ;
wire [C_M_AXI_RUSER_WIDTH-1 : 0]     M_AXI_RUSER     ;
wire                                 M_AXI_RVALID    ;
wire                                 M_AXI_RREADY    ;


AXI_FULL_M_module#(
    	.C_M_TARGET_SLAVE_BASE_ADDR (C_M_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_BURST_LEN	        (C_M_AXI_BURST_LEN	       ),
		.C_M_AXI_ID_WIDTH	        (C_M_AXI_ID_WIDTH	       ),
		.C_M_AXI_ADDR_WIDTH	        (C_M_AXI_ADDR_WIDTH	       ),
		.C_M_AXI_DATA_WIDTH	        (C_M_AXI_DATA_WIDTH	       ),
		.C_M_AXI_AWUSER_WIDTH	    (C_M_AXI_AWUSER_WIDTH	   ),
		.C_M_AXI_ARUSER_WIDTH	    (C_M_AXI_ARUSER_WIDTH	   ),
		.C_M_AXI_WUSER_WIDTH	    (C_M_AXI_WUSER_WIDTH	   ),
		.C_M_AXI_RUSER_WIDTH	    (C_M_AXI_RUSER_WIDTH	   ),
		.C_M_AXI_BUSER_WIDTH	    (C_M_AXI_BUSER_WIDTH	   ) 
)
AXI_FULL_M_module_u0
(
        .M_AXI_ACLK     (r_clk ) ,
		.M_AXI_ARESETN  (~r_rst) ,

		.M_AXI_AWID      (M_AXI_AWID   ),
		.M_AXI_AWADDR    (M_AXI_AWADDR ),
		.M_AXI_AWLEN     (M_AXI_AWLEN  ),
		.M_AXI_AWSIZE    (M_AXI_AWSIZE ),
		.M_AXI_AWBURST   (M_AXI_AWBURST),
		.M_AXI_AWLOCK    (M_AXI_AWLOCK ),
		.M_AXI_AWCACHE   (M_AXI_AWCACHE),
		.M_AXI_AWPROT    (M_AXI_AWPROT ),
		.M_AXI_AWQOS     (M_AXI_AWQOS  ),
		.M_AXI_AWUSER    (M_AXI_AWUSER ),
		.M_AXI_AWVALID   (M_AXI_AWVALID),
		.M_AXI_AWREADY   (M_AXI_AWREADY),
		.M_AXI_WDATA     (M_AXI_WDATA  ),
		.M_AXI_WSTRB     (M_AXI_WSTRB  ),
		.M_AXI_WLAST     (M_AXI_WLAST  ),
		.M_AXI_WUSER     (M_AXI_WUSER  ),
		.M_AXI_WVALID    (M_AXI_WVALID ),
		.M_AXI_WREADY    (M_AXI_WREADY ),
		.M_AXI_BID       (M_AXI_BID    ),
		.M_AXI_BRESP     (M_AXI_BRESP  ),
		.M_AXI_BUSER     (M_AXI_BUSER  ),
		.M_AXI_BVALID    (M_AXI_BVALID ),
		.M_AXI_BREADY    (M_AXI_BREADY ),
		.M_AXI_ARID      (M_AXI_ARID   ),
		.M_AXI_ARADDR    (M_AXI_ARADDR ),
		.M_AXI_ARLEN     (M_AXI_ARLEN  ),
		.M_AXI_ARSIZE    (M_AXI_ARSIZE ),
		.M_AXI_ARBURST   (M_AXI_ARBURST),
		.M_AXI_ARLOCK    (M_AXI_ARLOCK ),
		.M_AXI_ARCACHE   (M_AXI_ARCACHE),
		.M_AXI_ARPROT    (M_AXI_ARPROT ),
		.M_AXI_ARQOS     (M_AXI_ARQOS  ),
		.M_AXI_ARUSER    (M_AXI_ARUSER ),
		.M_AXI_ARVALID   (M_AXI_ARVALID),
		.M_AXI_ARREADY   (M_AXI_ARREADY),
		.M_AXI_RID       (M_AXI_RID    ),
		.M_AXI_RDATA     (M_AXI_RDATA  ),
		.M_AXI_RRESP     (M_AXI_RRESP  ),
		.M_AXI_RLAST     (M_AXI_RLAST  ),
		.M_AXI_RUSER     (M_AXI_RUSER  ),
		.M_AXI_RVALID    (M_AXI_RVALID ),
		.M_AXI_RREADY    (M_AXI_RREADY )
);


axi_slave_module#
(
	.C_S_AXI_ID_WIDTH	    (C_M_AXI_ID_WIDTH	    ),
	.C_S_AXI_DATA_WIDTH	    (C_M_AXI_ADDR_WIDTH	    ),
	.C_S_AXI_ADDR_WIDTH	    (C_M_AXI_DATA_WIDTH	    ),
	.C_S_AXI_AWUSER_WIDTH	(C_M_AXI_AWUSER_WIDTH	),
	.C_S_AXI_ARUSER_WIDTH	(C_M_AXI_ARUSER_WIDTH	),
	.C_S_AXI_WUSER_WIDTH	(C_M_AXI_WUSER_WIDTH	),
	.C_S_AXI_RUSER_WIDTH	(C_M_AXI_RUSER_WIDTH	),
	.C_S_AXI_BUSER_WIDTH	(C_M_AXI_BUSER_WIDTH	)
)
axi_slave_module_u0
(
	.S_AXI_ACLK             (r_clk          ),
	.S_AXI_ARESETN          (~r_rst         ),
	.S_AXI_AWID             (M_AXI_AWID     ),
	.S_AXI_AWADDR           (M_AXI_AWADDR   ),
	.S_AXI_AWLEN            (M_AXI_AWLEN    ),
	.S_AXI_AWSIZE           (M_AXI_AWSIZE   ),
	.S_AXI_AWBURST          (M_AXI_AWBURST  ),
	.S_AXI_AWLOCK           (M_AXI_AWLOCK   ),
	.S_AXI_AWCACHE          (M_AXI_AWCACHE  ),
	.S_AXI_AWPROT           (M_AXI_AWPROT   ),
	.S_AXI_AWQOS            (M_AXI_AWQOS    ),
	.S_AXI_AWUSER           (M_AXI_AWUSER   ),
	.S_AXI_AWVALID          (M_AXI_AWVALID  ),
	.S_AXI_AWREADY          (M_AXI_AWREADY  ),
	.S_AXI_WDATA            (M_AXI_WDATA    ),
	.S_AXI_WSTRB            (M_AXI_WSTRB    ),
	.S_AXI_WLAST            (M_AXI_WLAST    ),
	.S_AXI_WUSER            (M_AXI_WUSER    ),
	.S_AXI_WVALID           (M_AXI_WVALID   ),
	.S_AXI_WREADY           (M_AXI_WREADY   ),
	.S_AXI_BID              (M_AXI_BID      ),
	.S_AXI_BRESP            (M_AXI_BRESP    ),
	.S_AXI_BUSER            (M_AXI_BUSER    ),
	.S_AXI_BVALID           (M_AXI_BVALID   ),
	.S_AXI_BREADY           (M_AXI_BREADY   ),
	.S_AXI_ARID             (M_AXI_ARID     ),
	.S_AXI_ARADDR           (M_AXI_ARADDR   ),
	.S_AXI_ARLEN            (M_AXI_ARLEN    ),
	.S_AXI_ARSIZE           (M_AXI_ARSIZE   ),
	.S_AXI_ARBURST          (M_AXI_ARBURST  ),
	.S_AXI_ARLOCK           (M_AXI_ARLOCK   ),
	.S_AXI_ARCACHE          (M_AXI_ARCACHE  ),
	.S_AXI_ARPROT           (M_AXI_ARPROT   ),
	.S_AXI_ARQOS            (M_AXI_ARQOS    ),
	.S_AXI_ARUSER           (M_AXI_ARUSER   ),
	.S_AXI_ARVALID          (M_AXI_ARVALID  ),
	.S_AXI_ARREADY          (M_AXI_ARREADY  ),
	.S_AXI_RID              (M_AXI_RID      ),
	.S_AXI_RDATA            (M_AXI_RDATA    ),
	.S_AXI_RRESP            (M_AXI_RRESP    ),
	.S_AXI_RLAST            (M_AXI_RLAST    ),
	.S_AXI_RUSER            (M_AXI_RUSER    ),
	.S_AXI_RVALID           (M_AXI_RVALID   ),
	.S_AXI_RREADY           (M_AXI_RREADY   )
);
endmodule
