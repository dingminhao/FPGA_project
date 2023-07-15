`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    input rst_n,
    
    input   [7:0] data_in,
    input   data_in_valid,

    output      done,
     output  [16*16-1:0] data_out,
     output   data_out_valid
    );
    
wire [32*6-1:0] c1_out;    
wire c1_out_valid;
    
wire [32*6-1:0]p1_out;    
wire p1_out_valid;

wire [32*6-1:0]p1_fifo_out;    
wire p1_fifo_out_valid;
        
conv1 U0_conv1(
.clk(clk),
.rst_n(rst_n),

.data_in(data_in),
.data_in_valid(data_in_valid),

.data_out(c1_out),
.data_out_valid(c1_out_valid)

);
    
pool1 U1_pool1(
.clk(clk),
.rst_n(rst_n),

.data_in(c1_out),
.data_in_valid(c1_out_valid),

.data_out(p1_out),
.data_out_valid(p1_out_valid)

);
 wire c2_ready;       
p1_data_fifo U2_p1_data_fifo(
.clk(clk),
.rst_n(rst_n),
.c2_ready(c2_ready),
.data_in(p1_out),
.data_in_valid(p1_out_valid),

.data_out(p1_fifo_out),
.data_out_valid(p1_fifo_out_valid)

);
wire [15:0]c2_data_out;
wire    c2_data_out_valid;
conv2 U3_conv2(
.clk(clk),
.rst_n(rst_n),

.data_in(p1_fifo_out),
.data_in_valid(p1_fifo_out_valid),
.c2_ready(c2_ready),

.data_out(c2_data_out),
.data_out_valid_true(c2_data_out_valid)

);
////===============
wire [16*16-1:0] c2_reshape_out;
wire  c2_reshape_out_valid;
c2_reshape U4_c2_reshape(
.clk(clk),
.rst_n(rst_n),

.data_in(c2_data_out),
.data_in_valid(c2_data_out_valid),

.data_out(c2_reshape_out),
.data_out_valid(c2_reshape_out_valid)

);    

pool2 U6_pool2(
.clk(clk),
.rst_n(rst_n),

.data_in(c2_reshape_out),
.data_in_valid(c2_reshape_out_valid),

.done(done),
.data_out(data_out),
.data_out_valid(data_out_valid)

);  
endmodule