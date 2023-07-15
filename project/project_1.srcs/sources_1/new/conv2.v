`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module conv2(
        input           clk,
        input           rst_n,
        
        input   [32*6-1:0] data_in,
        input                data_in_valid,
        
        output   [15:0] data_out,
        output      reg         c2_ready,
        output      reg          data_out_valid_true
    );
    

 genvar m,n, k;
 //================== ADDR =======================
 reg [3:0] wr_addr;
 reg [3:0] rd_addr;
 wire [3:0] rd_addr_pre2 = wr_addr + 2;
 always@(posedge clk or negedge rst_n)begin
    if(~rst_n)begin
        wr_addr <= 0;
        rd_addr <= 0;
    end
    else if(  data_in_valid == 1'b1 )begin
        if(wr_addr == 'd11)
            wr_addr <= 0;
        else
            wr_addr <=  wr_addr + 1'd1;
        
        if(rd_addr_pre2 > 'd11)
            rd_addr <= rd_addr_pre2 - 4'd12;
        else
            rd_addr <=rd_addr_pre2; 

    end
 
 end  
 //================== DATA ========================   
   wire [32*6-1:0] window_in[0:4];
   wire [32*6-1:0] window_out[0:4];
    
    assign window_in[0] = data_in;
    
    generate 
        for(k=1;k<5;k=k+1)begin
            assign window_in[k] = window_out[k-1];
        end
    endgenerate
 reg delay_c2_ready;
 always@(posedge clk ) delay_c2_ready<=c2_ready;
 generate   
  for(k=0;k<5;k=k+1)begin
 conv2_linebuffer conv2_linebuffer_U (
  .clka(clk),    // input wire clka
  .ena(1'b1),      // input wire ena
  .wea(data_in_valid),      // input wire [0 : 0] wea
  .addra(wr_addr),  // input wire [3 : 0] addra
  .dina(window_in[k]),    // input wire [191 : 0] dina
  
  .clkb(clk),    // input wire clkb
  .enb(delay_c2_ready),      // input wire enb
  .addrb(rd_addr),  // input wire [3 : 0] addrb
  .doutb(window_out[k])  // output wire [191 : 0] doutb
);   
end
endgenerate    
    
 //===================== data window(6 channel) ============   
    reg [191:0] window[4:0][4:0];
    wire [31:0] window_vis_0[4:0][4:0];
    wire [31:0] window_vis_1[4:0][4:0];
    wire [31:0] window_vis_2[4:0][4:0];
    wire [31:0] window_vis_3[4:0][4:0];
    wire [31:0] window_vis_4[4:0][4:0];
    wire [31:0] window_vis_5[4:0][4:0];
    
    
    generate
        for(m=0;m<5;m=m+1)begin
            for(n=0;n<5;n=n+1)begin
                    assign window_vis_0[m][n] = window[m][n][(0+1)*32-1:0*32];
                    assign window_vis_1[m][n] = window[m][n][(1+1)*32-1:1*32];
                    assign window_vis_2[m][n] = window[m][n][(2+1)*32-1:2*32];
                    assign window_vis_3[m][n] = window[m][n][(3+1)*32-1:3*32];
                    assign window_vis_4[m][n] = window[m][n][(4+1)*32-1:4*32];
                    assign window_vis_5[m][n] = window[m][n][(5+1)*32-1:5*32];
            end
        end
    endgenerate
    
    
    
    integer i,j;
    
    always@(posedge clk,negedge rst_n)begin
        if(~rst_n)begin
            for(i=0;i<5;i=i+1)begin
                 for(j=0;j<5;j=j+1)begin
                    window[i][j] <= 0;
                end
            end
        end
        else if(data_in_valid) begin
             for(i=0;i<5;i=i+1)begin
                window[i][0] <= window_in[i];
                 for(j=1;j<5;j=j+1)begin
                    window[i][j] <= window[i][j-1];
                end
            end
        end
    end
reg [4:0] out_channel_cnt;   
 //============================X_CNT =================================
reg [4:0]   x_cnt;    
reg [4:0]   y_cnt;    
always@(posedge clk ,negedge rst_n)begin
    if(~rst_n)
        x_cnt <= 0;
    else if(y_cnt == 12 && x_cnt == 'd1 )
        x_cnt <= 0;
    else if(y_cnt == 12 && x_cnt == 'd0 && out_channel_cnt==15)
        x_cnt <=x_cnt + 1'b1;
    else if(data_in_valid && x_cnt == 'd11 )
        x_cnt <= 0;
    else if(data_in_valid)
        x_cnt <=x_cnt +1'b1;
end
 always@(posedge clk ,negedge rst_n)begin
    if(~rst_n)
       y_cnt <= 0;
    else if( x_cnt == 'd1 && y_cnt == 'd12  )
        y_cnt <= 0;
    else if(data_in_valid && x_cnt == 'd11 )
        y_cnt <=y_cnt +1'b1;
end
 //======================== OUT_CHANNEL_CNT============================

 always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        out_channel_cnt<=0;
    else if(x_cnt>0 && x_cnt<3 && y_cnt >4 && y_cnt!=12)
        out_channel_cnt<=0;   
    else if(out_channel_cnt==15)
        out_channel_cnt<=0; 
    else if(x_cnt>=4 && y_cnt>=4 )
        out_channel_cnt<=out_channel_cnt+1;
    else if(x_cnt == 'd0 && y_cnt>4 )
        out_channel_cnt<=out_channel_cnt+1;
 end
 //========================= C2_READY =================================

 always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        c2_ready <= 1'b1;
    else if(out_channel_cnt==15)
        c2_ready <= 1'b0;    
    else if(out_channel_cnt==14)
        c2_ready <= 1'b1;
    else if(x_cnt==3&&y_cnt==4)//???????ready???
        c2_ready <= 1'b0;
    else if(x_cnt ==3 && y_cnt>4)
        c2_ready <= 1'b0;
    else if(x_cnt>0 && x_cnt < 3 && y_cnt>4 )//???????ready???
        c2_ready <= 1'b1;
 end
//=========== ?????????6???????????????§µ?16?????????????§Ö?=====
//????16??6??5??5===>??? ???§Ş????????????????
//??????? c2_w => 16????6????(5)
// |-----5???§Ù????????????????8bit??????6??????§µ?-----|-------|------|
// |--0--|--1--|--2--...|--15--|  ?????240bit
//==================== param ====================
wire [239:0]  c2_w_row0_rd_data;
wire [239:0]  c2_w_row1_rd_data;
wire [239:0]  c2_w_row2_rd_data;
wire [239:0]  c2_w_row3_rd_data;
wire [239:0]  c2_w_row4_rd_data;
wire [7:0]    c2_w_row0_data[0:29];
wire [7:0]    c2_w_row1_data[0:29];
wire [7:0]    c2_w_row2_data[0:29];
wire [7:0]    c2_w_row3_data[0:29];
wire [7:0]    c2_w_row4_data[0:29];
c2_w_row0 Uc2_w_row0 (
  .clka(clk),    // input wire clka
  .addra(out_channel_cnt),  // input wire [3 : 0] addra
  .douta(c2_w_row0_rd_data)  // output wire [239 : 0] douta
);
c2_w_row1 Uc2_w_row1 (
  .clka(clk),    // input wire clka
  .addra(out_channel_cnt),  // input wire [3 : 0] addra
  .douta(c2_w_row1_rd_data)  // output wire [239 : 0] douta
);
c2_w_row2 Uc2_w_row2 (
  .clka(clk),    // input wire clka
  .addra(out_channel_cnt),  // input wire [3 : 0] addra
  .douta(c2_w_row2_rd_data)  // output wire [239 : 0] douta
);
c2_w_row3 Uc2_w_row3 (
  .clka(clk),    // input wire clka
  .addra(out_channel_cnt),  // input wire [3 : 0] addra
  .douta(c2_w_row3_rd_data)  // output wire [239 : 0] douta
);
c2_w_row4 Uc2_w_row4 (
  .clka(clk),    // input wire clka
  .addra(out_channel_cnt),  // input wire [3 : 0] addra
  .douta(c2_w_row4_rd_data)  // output wire [239 : 0] douta
);
generate
    for(k=0;k<30;k=k+1)begin
        assign c2_w_row0_data[29-k] = c2_w_row0_rd_data[k*8+:8];
        assign c2_w_row1_data[29-k] = c2_w_row1_rd_data[k*8+:8];
        assign c2_w_row2_data[29-k] = c2_w_row2_rd_data[k*8+:8];
        assign c2_w_row3_data[29-k] = c2_w_row3_rd_data[k*8+:8];
        assign c2_w_row4_data[29-k] = c2_w_row4_rd_data[k*8+:8];
    end
endgenerate
//=============================== MUL================================
reg signed [31:0] in_channel_0_mul_result[0:4][0:4];    
reg signed [31:0] in_channel_1_mul_result[0:4][0:4];    
reg signed [31:0] in_channel_2_mul_result[0:4][0:4];    
reg signed [31:0] in_channel_3_mul_result[0:4][0:4];    
reg signed [31:0] in_channel_4_mul_result[0:4][0:4];    
reg signed [31:0] in_channel_5_mul_result[0:4][0:4];    
wire [34:0] in_channel_0_sum_result;    
wire [34:0] in_channel_1_sum_result;    
wire [34:0] in_channel_2_sum_result;    
wire [34:0] in_channel_3_sum_result;    
wire [34:0] in_channel_4_sum_result;    
wire [34:0] in_channel_5_sum_result;   
wire signed [34:0] in_channel_sum_result;   
//============c1_w *4096 | c2_w * 256 ===
wire [15:0] in_channel_sum_result_s;
always@(posedge clk)begin
    for(j=0;j<5;j=j+1)begin
        in_channel_0_mul_result[0][j]<= $signed( window[4][4-j][32*(0+1)-1:32*0] *{{24{c2_w_row0_data[j+0*5][7]}}, c2_w_row0_data[j+0*5]});
        in_channel_0_mul_result[1][j]<= $signed( window[3][4-j][32*(0+1)-1:32*0] *{{24{c2_w_row1_data[j+0*5][7]}}, c2_w_row1_data[j+0*5]});
        in_channel_0_mul_result[2][j]<= $signed( window[2][4-j][32*(0+1)-1:32*0] *{{24{c2_w_row2_data[j+0*5][7]}}, c2_w_row2_data[j+0*5]});
        in_channel_0_mul_result[3][j]<= $signed( window[1][4-j][32*(0+1)-1:32*0] *{{24{c2_w_row3_data[j+0*5][7]}}, c2_w_row3_data[j+0*5]});
        in_channel_0_mul_result[4][j]<= $signed( window[0][4-j][32*(0+1)-1:32*0] *{{24{c2_w_row4_data[j+0*5][7]}}, c2_w_row4_data[j+0*5]});
    
        in_channel_1_mul_result[0][j]<= $signed( window[4][4-j][32*(1+1)-1:32*1] *{{24{c2_w_row0_data[j+1*5][7]}}, c2_w_row0_data[j+1*5]});
        in_channel_1_mul_result[1][j]<= $signed( window[3][4-j][32*(1+1)-1:32*1] *{{24{c2_w_row1_data[j+1*5][7]}}, c2_w_row1_data[j+1*5]});
        in_channel_1_mul_result[2][j]<= $signed( window[2][4-j][32*(1+1)-1:32*1] *{{24{c2_w_row2_data[j+1*5][7]}}, c2_w_row2_data[j+1*5]});
        in_channel_1_mul_result[3][j]<= $signed( window[1][4-j][32*(1+1)-1:32*1] *{{24{c2_w_row3_data[j+1*5][7]}}, c2_w_row3_data[j+1*5]});
        in_channel_1_mul_result[4][j]<= $signed( window[0][4-j][32*(1+1)-1:32*1] *{{24{c2_w_row4_data[j+1*5][7]}}, c2_w_row4_data[j+1*5]});
    
        in_channel_2_mul_result[0][j]<= $signed( window[4][4-j][32*(2+1)-1:32*2] *{{24{c2_w_row0_data[j+2*5][7]}}, c2_w_row0_data[j+2*5]});
        in_channel_2_mul_result[1][j]<= $signed( window[3][4-j][32*(2+1)-1:32*2] *{{24{c2_w_row1_data[j+2*5][7]}}, c2_w_row1_data[j+2*5]});
        in_channel_2_mul_result[2][j]<= $signed( window[2][4-j][32*(2+1)-1:32*2] *{{24{c2_w_row2_data[j+2*5][7]}}, c2_w_row2_data[j+2*5]});
        in_channel_2_mul_result[3][j]<= $signed( window[1][4-j][32*(2+1)-1:32*2] *{{24{c2_w_row3_data[j+2*5][7]}}, c2_w_row3_data[j+2*5]});
        in_channel_2_mul_result[4][j]<= $signed( window[0][4-j][32*(2+1)-1:32*2] *{{24{c2_w_row4_data[j+2*5][7]}}, c2_w_row4_data[j+2*5]});
  
        in_channel_3_mul_result[0][j]<= $signed( window[4][4-j][32*(3+1)-1:32*3] *{{24{c2_w_row0_data[j+3*5][7]}}, c2_w_row0_data[j+3*5]});
        in_channel_3_mul_result[1][j]<= $signed( window[3][4-j][32*(3+1)-1:32*3] *{{24{c2_w_row1_data[j+3*5][7]}}, c2_w_row1_data[j+3*5]});
        in_channel_3_mul_result[2][j]<= $signed( window[2][4-j][32*(3+1)-1:32*3] *{{24{c2_w_row2_data[j+3*5][7]}}, c2_w_row2_data[j+3*5]});
        in_channel_3_mul_result[3][j]<= $signed( window[1][4-j][32*(3+1)-1:32*3] *{{24{c2_w_row3_data[j+3*5][7]}}, c2_w_row3_data[j+3*5]});
        in_channel_3_mul_result[4][j]<= $signed( window[0][4-j][32*(3+1)-1:32*3] *{{24{c2_w_row4_data[j+3*5][7]}}, c2_w_row4_data[j+3*5]});
  
        in_channel_4_mul_result[0][j]<= $signed( window[4][4-j][32*(4+1)-1:32*4] *{{24{c2_w_row0_data[j+4*5][7]}}, c2_w_row0_data[j+4*5]});
        in_channel_4_mul_result[1][j]<= $signed( window[3][4-j][32*(4+1)-1:32*4] *{{24{c2_w_row1_data[j+4*5][7]}}, c2_w_row1_data[j+4*5]});
        in_channel_4_mul_result[2][j]<= $signed( window[2][4-j][32*(4+1)-1:32*4] *{{24{c2_w_row2_data[j+4*5][7]}}, c2_w_row2_data[j+4*5]});
        in_channel_4_mul_result[3][j]<= $signed( window[1][4-j][32*(4+1)-1:32*4] *{{24{c2_w_row3_data[j+4*5][7]}}, c2_w_row3_data[j+4*5]});
        in_channel_4_mul_result[4][j]<= $signed( window[0][4-j][32*(4+1)-1:32*4] *{{24{c2_w_row4_data[j+4*5][7]}}, c2_w_row4_data[j+4*5]});
  
        in_channel_5_mul_result[0][j]<= $signed( window[4][4-j][32*(5+1)-1:32*5] *{{24{c2_w_row0_data[j+5*5][7]}}, c2_w_row0_data[j+5*5]});
        in_channel_5_mul_result[1][j]<= $signed( window[3][4-j][32*(5+1)-1:32*5] *{{24{c2_w_row1_data[j+5*5][7]}}, c2_w_row1_data[j+5*5]});
        in_channel_5_mul_result[2][j]<= $signed( window[2][4-j][32*(5+1)-1:32*5] *{{24{c2_w_row2_data[j+5*5][7]}}, c2_w_row2_data[j+5*5]});
        in_channel_5_mul_result[3][j]<= $signed( window[1][4-j][32*(5+1)-1:32*5] *{{24{c2_w_row3_data[j+5*5][7]}}, c2_w_row3_data[j+5*5]});
        in_channel_5_mul_result[4][j]<= $signed( window[0][4-j][32*(5+1)-1:32*5] *{{24{c2_w_row4_data[j+5*5][7]}}, c2_w_row4_data[j+5*5]}); 
    end
end    
assign in_channel_0_sum_result = in_channel_0_mul_result[0][0]+in_channel_0_mul_result[0][1]+in_channel_0_mul_result[0][2]+in_channel_0_mul_result[0][3]+in_channel_0_mul_result[0][4]+
                                 in_channel_0_mul_result[1][0]+in_channel_0_mul_result[1][1]+in_channel_0_mul_result[1][2]+in_channel_0_mul_result[1][3]+in_channel_0_mul_result[1][4]+
                                 in_channel_0_mul_result[2][0]+in_channel_0_mul_result[2][1]+in_channel_0_mul_result[2][2]+in_channel_0_mul_result[2][3]+in_channel_0_mul_result[2][4]+
                                 in_channel_0_mul_result[3][0]+in_channel_0_mul_result[3][1]+in_channel_0_mul_result[3][2]+in_channel_0_mul_result[3][3]+in_channel_0_mul_result[3][4]+
                                 in_channel_0_mul_result[4][0]+in_channel_0_mul_result[4][1]+in_channel_0_mul_result[4][2]+in_channel_0_mul_result[4][3]+in_channel_0_mul_result[4][4];
                                 
assign in_channel_1_sum_result = in_channel_1_mul_result[0][0]+in_channel_1_mul_result[0][1]+in_channel_1_mul_result[0][2]+in_channel_1_mul_result[0][3]+in_channel_1_mul_result[0][4]+
                                 in_channel_1_mul_result[1][0]+in_channel_1_mul_result[1][1]+in_channel_1_mul_result[1][2]+in_channel_1_mul_result[1][3]+in_channel_1_mul_result[1][4]+
                                 in_channel_1_mul_result[2][0]+in_channel_1_mul_result[2][1]+in_channel_1_mul_result[2][2]+in_channel_1_mul_result[2][3]+in_channel_1_mul_result[2][4]+
                                 in_channel_1_mul_result[3][0]+in_channel_1_mul_result[3][1]+in_channel_1_mul_result[3][2]+in_channel_1_mul_result[3][3]+in_channel_1_mul_result[3][4]+
                                 in_channel_1_mul_result[4][0]+in_channel_1_mul_result[4][1]+in_channel_1_mul_result[4][2]+in_channel_1_mul_result[4][3]+in_channel_1_mul_result[4][4];     

assign in_channel_2_sum_result = in_channel_2_mul_result[0][0]+in_channel_2_mul_result[0][1]+in_channel_2_mul_result[0][2]+in_channel_2_mul_result[0][3]+in_channel_2_mul_result[0][4]+
                                 in_channel_2_mul_result[1][0]+in_channel_2_mul_result[1][1]+in_channel_2_mul_result[1][2]+in_channel_2_mul_result[1][3]+in_channel_2_mul_result[1][4]+
                                 in_channel_2_mul_result[2][0]+in_channel_2_mul_result[2][1]+in_channel_2_mul_result[2][2]+in_channel_2_mul_result[2][3]+in_channel_2_mul_result[2][4]+
                                 in_channel_2_mul_result[3][0]+in_channel_2_mul_result[3][1]+in_channel_2_mul_result[3][2]+in_channel_2_mul_result[3][3]+in_channel_2_mul_result[3][4]+
                                 in_channel_2_mul_result[4][0]+in_channel_2_mul_result[4][1]+in_channel_2_mul_result[4][2]+in_channel_2_mul_result[4][3]+in_channel_2_mul_result[4][4];     

assign in_channel_3_sum_result = in_channel_3_mul_result[0][0]+in_channel_3_mul_result[0][1]+in_channel_3_mul_result[0][2]+in_channel_3_mul_result[0][3]+in_channel_3_mul_result[0][4]+
                                 in_channel_3_mul_result[1][0]+in_channel_3_mul_result[1][1]+in_channel_3_mul_result[1][2]+in_channel_3_mul_result[1][3]+in_channel_3_mul_result[1][4]+
                                 in_channel_3_mul_result[2][0]+in_channel_3_mul_result[2][1]+in_channel_3_mul_result[2][2]+in_channel_3_mul_result[2][3]+in_channel_3_mul_result[2][4]+
                                 in_channel_3_mul_result[3][0]+in_channel_3_mul_result[3][1]+in_channel_3_mul_result[3][2]+in_channel_3_mul_result[3][3]+in_channel_3_mul_result[3][4]+
                                 in_channel_3_mul_result[4][0]+in_channel_3_mul_result[4][1]+in_channel_3_mul_result[4][2]+in_channel_3_mul_result[4][3]+in_channel_3_mul_result[4][4];                                                                                                  

assign in_channel_4_sum_result = in_channel_4_mul_result[0][0]+in_channel_4_mul_result[0][1]+in_channel_4_mul_result[0][2]+in_channel_4_mul_result[0][3]+in_channel_4_mul_result[0][4]+
                                 in_channel_4_mul_result[1][0]+in_channel_4_mul_result[1][1]+in_channel_4_mul_result[1][2]+in_channel_4_mul_result[1][3]+in_channel_4_mul_result[1][4]+
                                 in_channel_4_mul_result[2][0]+in_channel_4_mul_result[2][1]+in_channel_4_mul_result[2][2]+in_channel_4_mul_result[2][3]+in_channel_4_mul_result[2][4]+
                                 in_channel_4_mul_result[3][0]+in_channel_4_mul_result[3][1]+in_channel_4_mul_result[3][2]+in_channel_4_mul_result[3][3]+in_channel_4_mul_result[3][4]+
                                 in_channel_4_mul_result[4][0]+in_channel_4_mul_result[4][1]+in_channel_4_mul_result[4][2]+in_channel_4_mul_result[4][3]+in_channel_4_mul_result[4][4];         

assign in_channel_5_sum_result = in_channel_5_mul_result[0][0]+in_channel_5_mul_result[0][1]+in_channel_5_mul_result[0][2]+in_channel_5_mul_result[0][3]+in_channel_5_mul_result[0][4]+
                                 in_channel_5_mul_result[1][0]+in_channel_5_mul_result[1][1]+in_channel_5_mul_result[1][2]+in_channel_5_mul_result[1][3]+in_channel_5_mul_result[1][4]+
                                 in_channel_5_mul_result[2][0]+in_channel_5_mul_result[2][1]+in_channel_5_mul_result[2][2]+in_channel_5_mul_result[2][3]+in_channel_5_mul_result[2][4]+
                                 in_channel_5_mul_result[3][0]+in_channel_5_mul_result[3][1]+in_channel_5_mul_result[3][2]+in_channel_5_mul_result[3][3]+in_channel_5_mul_result[3][4]+
                                 in_channel_5_mul_result[4][0]+in_channel_5_mul_result[4][1]+in_channel_5_mul_result[4][2]+in_channel_5_mul_result[4][3]+in_channel_5_mul_result[4][4];     

assign in_channel_sum_result = in_channel_0_sum_result+
                                         in_channel_1_sum_result+
                                         in_channel_2_sum_result+
                                         in_channel_3_sum_result+
                                         in_channel_4_sum_result+
                                         in_channel_5_sum_result;
assign in_channel_sum_result_s = in_channel_sum_result>>>20;    
reg [4:0] delay_x_cnt;
always@(posedge clk)
    delay_x_cnt<=x_cnt;
    
reg data_out_valid;
always@(*)begin
    if(delay_x_cnt ==0 &&y_cnt ==0  )
        data_out_valid =0;
    if(x_cnt==5 && y_cnt ==4 && out_channel_cnt == 2)
        data_out_valid =1;
    else if(y_cnt > 4 && x_cnt==1 && out_channel_cnt == 0  &&  y_cnt!=12)
        data_out_valid =0;
    else if(y_cnt > 4 && x_cnt==5 && out_channel_cnt == 2)
        data_out_valid =1;
end

assign data_out = (in_channel_sum_result_s[15]==1)?0:in_channel_sum_result_s;
always@(posedge clk)begin
    data_out_valid_true <= data_out_valid;
end
                                 
endmodule                                                                                               
