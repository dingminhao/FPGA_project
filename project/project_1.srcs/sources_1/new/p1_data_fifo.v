`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/03 10:44:28
// Design Name: 
// Module Name: p1_data_fifo
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


module p1_data_fifo(
      input clk,
      input rst_n,
      input c2_ready,
      
      input [6*32-1:0]  data_in,
      input             data_in_valid,
      output [6*32-1:0] data_out,
      output reg           data_out_valid
    );
//==================== ????array ===================
genvar i;
wire [31:0] data_out_array[5:0];
generate
    for(i=0;i<6;i=i+1)begin
        assign data_out_array[i] = data_out[i*32+:32];
    end
endgenerate


//=======================================================
wire rd_en;   
reg [9:0] cnt;
reg [9:0] valid_data_out_cnt;
assign rd_en = (cnt >= 143) ? 1'b1 : 1'b0;
always@(posedge clk,negedge rst_n)begin
    if(~rst_n)
        cnt<=0;
    else if(data_in_valid)
        cnt<=cnt+1'b1;
end
always@(posedge clk,negedge rst_n)begin
    if(~rst_n)
        valid_data_out_cnt<=0;
    else if(data_out_valid==1)
        valid_data_out_cnt<=valid_data_out_cnt+1'b1;
end    
wire data_out_valid_pre;
assign data_out_valid_pre = ((rd_en)&&(valid_data_out_cnt>=0 &&valid_data_out_cnt<144)&&c2_ready)?1'b1:1'b0;

always@(posedge clk)
    data_out_valid <= data_out_valid_pre;
    
//=============== ????FIFO ======================
fifo_generator_0 U_p1_fifo ( //depth:256
  .clk(clk),                  // input wire clk
  .srst(~rst_n),                // input wire srst
  .din(data_in),                  // input wire [191 : 0] din
  .wr_en(data_in_valid),              // input wire wr_en
  .rd_en(rd_en&c2_ready),              // input wire rd_en
  .dout(data_out),                // output wire [191 : 0] dout
  .full(),                // output wire full
  .almost_full(),  // output wire almost_full
  .empty()              // output wire empty
);   
endmodule