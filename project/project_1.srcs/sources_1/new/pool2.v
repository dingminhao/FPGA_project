`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 14:58:50
// Design Name: 
// Module Name: pool2
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


module pool2(
    input clk,
    input rst_n,
    
    input [16*16-1:0] data_in,
    input             data_in_valid,
    
    output reg             done,
    output [16*16-1:0] data_out,
    output             data_out_valid
    
    );
reg [4:0]   x_cnt;    
reg [4:0]   y_cnt;    
always@(posedge clk ,negedge rst_n)begin
    if(~rst_n)
        x_cnt <= 0;
    else if(data_in_valid && x_cnt == 'd7 )
        x_cnt <= 0;
    else if(data_in_valid)
        x_cnt <=x_cnt +1'b1;
end
 always@(posedge clk ,negedge rst_n)begin
    if(~rst_n)
       y_cnt <= 0;
    else if(data_in_valid && x_cnt == 'd7 && y_cnt == 'd7  )
        y_cnt <= 0;
    else if(data_in_valid && x_cnt == 'd7 )
        y_cnt <=y_cnt +1'b1;
end
always@(posedge clk,negedge rst_n)begin
    if(~rst_n)
        done<=0;
    else if(x_cnt==7&&y_cnt==7&&data_in_valid)
        done<=1'b1;
    else 
        done<=0;
end
//==================== delay data_in =============
reg [16*16-1:0] delay_data_in;
always@(posedge clk)
        delay_data_in<=data_in;
//==================== prepare for ram =============
wire    [15:0] wr_data[0:15];
wire    [15:0] rd_data[0:15];
wire                    wr_en;
reg     [4:0]           wr_addr;
reg     [4:0]           rd_addr;
assign wr_en = data_in_valid;
genvar k;
generate 
    for (k=0;k<16;k=k+1)begin
        assign wr_data[k] = ( data_in[(k+1)*16-1:k*16] > delay_data_in[(k+1)*16-1:k*16])?data_in[(k+1)*16-1:k*16]:delay_data_in[(k+1)*16-1:k*16];
    end
endgenerate

wire [4:0]  rd_addr_pre2 = wr_addr +2;
always@(posedge clk,negedge rst_n)begin
    if(~rst_n)begin
        wr_addr <=0;
        rd_addr <= 0;
    end 
    else if(data_in_valid )begin
        if(wr_addr == 'd7)
            wr_addr<=0;
        else 
            wr_addr <= wr_addr +1'b1;
            
        if(rd_addr_pre2 > 'd7)
            rd_addr <= rd_addr_pre2-'d8;
        else
            rd_addr <= rd_addr_pre2;
    end
end
 

generate
    for(k=0;k<16;k=k+1)begin
            p2_linebuffer your_instance_name (
              .clka(clk),    // input wire clka
              .ena(1'b1),      // input wire ena
              .wea(wr_en),      // input wire [0 : 0] wea
              .addra(wr_addr),  // input wire [3 : 0] addra
              .dina(wr_data[k]),    // input wire [15 : 0] dina
              
              .clkb(clk),    // input wire clkb
              .enb(1'b1),      // input wire enb
              .addrb(rd_addr),  // input wire [3 : 0] addrb
              .doutb(rd_data[k])  // output wire [15 : 0] doutb
        );
    end  
endgenerate

wire [15:0] data_out_vis[0:15];
generate 
    for (k=0;k<16;k=k+1)begin
        assign data_out[(k+1)*16-1:k*16] = ( rd_data[k] > wr_data[k] )?rd_data[k] :wr_data[k];
        assign data_out_vis[k] = data_out[(k+1)*16-1:k*16];
    end
endgenerate

assign data_out_valid = ( x_cnt[0:0]==1 &&  y_cnt[0:0]==1)?1'b1:1'b0;
       
endmodule
