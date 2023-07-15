`timescale 1ns / 1ns

module sim_tb();

reg clk,rst_n;
reg txn;
design_1_wrapper design_1_wrapper_u0
(
    .m00_axi_aclk_0         (clk),
    .m00_axi_aresetn_0      (rst_n),
    .m00_axi_init_axi_txn_0 (txn)
);

TOP TOP_U0(
    .i_sysclk     (clk  ),
    .i_sysrst     (~rst_n),
    .o_led        ()
);

initial begin
    rst_n = 0;
    txn = 0;
    #100;
    rst_n = 'd1;
    #1000;
    txn <= 'd1;
end

always begin
    clk <= 'd0;
    #10;
    clk <= 'd1;
    #10;
end

endmodule
