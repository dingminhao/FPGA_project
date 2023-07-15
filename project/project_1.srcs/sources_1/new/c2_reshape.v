`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/06 04:24:30
// Design Name: 
// Module Name: c2_reshape
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module c2_reshape(
    input clk,
    input rst_n,
    
    input [15:0] data_in,
    input        data_in_valid,
    
    output [16*16-1:0] data_out,
    output reg        data_out_valid   
    );
reg [11:0] data_in_cnt;
reg [11:0] data_out_cnt;
reg [11:0] data_channel_cnt;
always@(posedge clk,negedge rst_n)begin
    if(~rst_n)
        data_in_cnt <= 0;
    else if(data_in_cnt == 1023 && data_in_valid)
        data_in_cnt <= 0;
    else if(data_in_valid==1)
        data_in_cnt <= data_in_cnt + 1'b1;
end
always@(posedge clk,negedge rst_n)begin
    if(~rst_n)
        data_out_cnt <= 0;
    else if(data_out_cnt == 63 && data_out_valid)
        data_out_cnt <= 0;
    else if(data_out_valid==1)
        data_out_cnt <= data_out_cnt + 1'b1;
end
always@(posedge clk,negedge rst_n)begin
    if(~rst_n)
        data_channel_cnt <= 0;
    else if(data_channel_cnt == 15 && data_in_valid)
        data_channel_cnt <= 0;
    else if(data_in_valid==1)
        data_channel_cnt <= data_channel_cnt + 1'b1;
end    
//===================FIFO ??? ================================
wire [15:0] rd_data[15:0];
wire wr_en;
reg rd_en;
reg delay_rd_en;
initial begin
    rd_en=0;
end
assign wr_en = data_in_valid;
always@(*)begin
    if(data_in_cnt == 1023)
        rd_en = 1;
end
always@(posedge clk )
    delay_rd_en<=rd_en;

genvar k;
generate
    for(k=0;k<16;k=k+1)begin
        c2_fifo UINSTANCE_c2_fifo (
          .clk(clk),      // input wire clk
          .srst(~rst_n),    // input wire srst
          .din(data_in),      // input wire [15 : 0] din
          .wr_en(wr_en && (k==data_channel_cnt)),  // input wire wr_en
          .rd_en(rd_en),  // input wire rd_en
          .dout(rd_data[k]),    // output wire [15 : 0] dout
          .full(),    // output wire full
          .empty()  // output wire empty
        );   
    end
endgenerate 

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        data_out_valid <=0;
    else if( data_out_cnt == 63 )
        data_out_valid <=0;
    else if( rd_en==1'b1 && delay_rd_en=='d0 )
        data_out_valid <=1;
end
generate
    for(k=0;k<16;k=k+1)begin
        assign data_out[(k+1)*16-1:k*16] = rd_data[k];
    end
endgenerate
endmodule
