`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////


module conv1(
        input           clk,
        input           rst_n,
        
        input   [8-1:0] data_in,
        input                data_in_valid,
        
        output   [6*32-1:0] data_out,
        output      reg          data_out_valid
    );
    genvar k;

wire [31:0] data_out_array[0:5];

genvar p;
    generate
        for (p=0;p<6;p=p+1)begin
            assign data_out_array[p] = data_out[p*32+:32];
        end
    endgenerate

//======================= addr ===============================
reg [4:0]   wr_addr;
reg [4:0]   rd_addr;
wire    [4:0] rd_addr_pre2 = wr_addr +2;
always@(posedge clk,negedge rst_n)begin
    if(~rst_n)begin
        wr_addr<=0;
        rd_addr<=0;
    end
    else if(    data_in_valid == 1'b1    )begin
        //========== A ============
        if(wr_addr =='d27)
            wr_addr <= 5'd0;
        else
            wr_addr <= wr_addr + 1'd1;
        //========== B ============
        if(rd_addr_pre2 > 'd27)
            rd_addr <= rd_addr_pre2 - 5'd28;
        else
            rd_addr <= rd_addr_pre2;
    end
end


//======================= data ===============================
wire    [7:0]   window_in[0:5-1];
wire    [7:0]   window_out[0:5-1];
assign  window_in[0]    = data_in;
generate 
for(k=1;k<5;k=k+1)begin
   assign    window_in[k]=window_out[k-1];
end
endgenerate


//======================= Instance ===============================

generate
for (k=0;k<5;k=k+1)begin
gray_linebuffer gray_linebuffer_U (
  .clka(clk),    // input wire clka
  .wea(data_in_valid),      // input wire [0 : 0] wea
  .addra(wr_addr),  // input wire [4 : 0] addra
  .dina(window_in[k]),    // input wire [7 : 0] dina
  
  .clkb(clk),    // input wire clkb
  .enb(1'b1),      // input wire enb
  .addrb(rd_addr),  // input wire [4 : 0] addrb
  .doutb(window_out[k])  // output wire [7 : 0] doutb
);
end
endgenerate
//======================= window ===============================
reg signed [8:0] window[5-1:0][5-1:0];
integer i,j;
always@(posedge clk ,negedge rst_n)begin
    if(~rst_n)begin
        for(i=0;i<5;i=i+1)begin
            for(j=0;j<5;j=j+1)begin
                window[i][j]<=0;
            end
        end
    end
    else if(data_in_valid==1'b1 )begin
        for(i=0;i<5;i=i+1)begin
            window[i][0] <= window_in[i];
            for(j=1;j<5;j=j+1)begin
                window[i][j]<=window[i][j-1];
            end
        end
    end
end
//======================= x_cnt y_cnt ====================
reg [4:0] x_cnt;
reg [4:0] y_cnt;

always@(posedge clk,negedge rst_n)begin
    if(~rst_n)
        x_cnt<=0;
    else if(x_cnt == 5'd27 && data_in_valid==1'b1)
        x_cnt<=0;
    else if(data_in_valid==1'b1)
        x_cnt<= x_cnt +1'b1;
end

always@(posedge clk,negedge rst_n)begin
    if(~rst_n)
        y_cnt<=0;
    else if(y_cnt == 5'd27 &&x_cnt == 5'd27 && data_in_valid==1'b1)
        y_cnt<=0;
    else if(data_in_valid==1'b1 && x_cnt == 5'd27)
        y_cnt<= y_cnt +1'b1;
end

//======================= weights =======================
wire c1_w_rd_en;
assign  c1_w_rd_en = (data_in_valid && x_cnt>=0 && y_cnt==0)? 1'b1 : 1'b0;

wire    [15:0] rd_c1_w_1_data;
wire    [15:0] rd_c1_w_2_data;
wire    [15:0] rd_c1_w_3_data;
wire    [15:0] rd_c1_w_4_data;
wire    [15:0] rd_c1_w_5_data;
wire    [15:0] rd_c1_w_6_data;
wire    [15:0] rd_c1_b_data;

reg   signed  [15:0]  c1_w_1[4:0][4:0];
reg   signed  [15:0]  c1_w_2[4:0][4:0];
reg   signed  [15:0]  c1_w_3[4:0][4:0];
reg   signed  [15:0]  c1_w_4[4:0][4:0];
reg   signed  [15:0]  c1_w_5[4:0][4:0];
reg   signed  [15:0]  c1_w_6[4:0][4:0];
reg   signed  [15:0]  c1_b[5:0];

c1_b_rom c1_b_U (
  .clka(clk),    // input wire clka
  .ena(c1_w_rd_en),      // input wire ena
  .addra(x_cnt),  // input wire [4 : 0] addra
  .douta(rd_c1_b_data)  // output wire [15 : 0] douta
);

c1_w_1_rom c1_w_1_U (
  .clka(clk),    // input wire clka
  .ena(c1_w_rd_en),      // input wire ena
  .addra(x_cnt),  // input wire [4 : 0] addra
  .douta(rd_c1_w_1_data)  // output wire [15 : 0] douta
);
c1_w_2_rom c1_w_2_U (
  .clka(clk),    // input wire clka
  .ena(c1_w_rd_en),      // input wire ena
  .addra(x_cnt),  // input wire [4 : 0] addra
  .douta(rd_c1_w_2_data)  // output wire [15 : 0] douta
);
c1_w_3_rom c1_w_3_U (
  .clka(clk),    // input wire clka
  .ena(c1_w_rd_en),      // input wire ena
  .addra(x_cnt),  // input wire [4 : 0] addra
  .douta(rd_c1_w_3_data)  // output wire [15 : 0] douta
);
c1_w_4_rom c1_w_4_U (
  .clka(clk),    // input wire clka
  .ena(c1_w_rd_en),      // input wire ena
  .addra(x_cnt),  // input wire [4 : 0] addra
  .douta(rd_c1_w_4_data)  // output wire [15 : 0] douta
);
c1_w_5_rom c1_w_5_U (
  .clka(clk),    // input wire clka
  .ena(c1_w_rd_en),      // input wire ena
  .addra(x_cnt),  // input wire [4 : 0] addra
  .douta(rd_c1_w_5_data)  // output wire [15 : 0] douta
);
c1_w_6_rom c1_w_6_U (
  .clka(clk),    // input wire clka
  .ena(c1_w_rd_en),      // input wire ena
  .addra(x_cnt),  // input wire [4 : 0] addra
  .douta(rd_c1_w_6_data)  // output wire [15 : 0] douta
);

always@(*)begin
    if(y_cnt==0)begin
        c1_w_1[(x_cnt-1)/5][(x_cnt-1)%5] = rd_c1_w_1_data;
        c1_w_2[(x_cnt-1)/5][(x_cnt-1)%5] = rd_c1_w_2_data;
        c1_w_3[(x_cnt-1)/5][(x_cnt-1)%5] = rd_c1_w_3_data;
        c1_w_4[(x_cnt-1)/5][(x_cnt-1)%5] = rd_c1_w_4_data;
        c1_w_5[(x_cnt-1)/5][(x_cnt-1)%5] = rd_c1_w_5_data;
        c1_w_6[(x_cnt-1)/5][(x_cnt-1)%5] = rd_c1_w_6_data;
        c1_b[(x_cnt-1)] = rd_c1_b_data;
    end
end

//======================= mul  =======================
reg signed[31:0]  window_mul_result_1[4:0][4:0];
reg signed[31:0]  window_mul_result_2[4:0][4:0];
reg signed[31:0]  window_mul_result_3[4:0][4:0];
reg signed[31:0]  window_mul_result_4[4:0][4:0];
reg signed[31:0]  window_mul_result_5[4:0][4:0];
reg signed[31:0]  window_mul_result_6[4:0][4:0];

always@(posedge clk,negedge rst_n)begin
    if(~rst_n)begin
        for(i=0;i<5;i=i+1)begin
            for(j=0;j<5;j=j+1)begin
                    window_mul_result_1[i][j] <= 0;
                    window_mul_result_2[i][j] <= 0;
                    window_mul_result_3[i][j] <= 0;
                    window_mul_result_4[i][j] <= 0;
                    window_mul_result_5[i][j] <= 0;
                    window_mul_result_6[i][j] <= 0;
            end
        end
    end
    else begin
         for(i=0;i<5;i=i+1)begin
            for(j=0;j<5;j=j+1)begin
                    window_mul_result_1[i][j] <={ { 24{1'b0} }, window[i][j] } * { {16{c1_w_1[i][j][15]}},  c1_w_1[i][j] };
                    window_mul_result_2[i][j] <={ { 24{1'b0} }, window[i][j] } * { {16{c1_w_2[i][j][15]}},  c1_w_2[i][j] };
                    window_mul_result_3[i][j] <={ { 24{1'b0} }, window[i][j] } * { {16{c1_w_3[i][j][15]}},  c1_w_3[i][j] };
                    window_mul_result_4[i][j] <={ { 24{1'b0} }, window[i][j] } * { {16{c1_w_4[i][j][15]}},  c1_w_4[i][j] };
                    window_mul_result_5[i][j] <={ { 24{1'b0} }, window[i][j] } * { {16{c1_w_5[i][j][15]}},  c1_w_5[i][j] };
                    window_mul_result_6[i][j] <={ { 24{1'b0} }, window[i][j] } * { {16{c1_w_6[i][j][15]}},  c1_w_6[i][j] };
            end
        end    
    end
end
    
wire [31:0] window_sum_1; 
wire [31:0] window_sum_2; 
wire [31:0] window_sum_3; 
wire [31:0] window_sum_4; 
wire [31:0] window_sum_5; 
wire [31:0] window_sum_6; 
//========================== lut ========================================
assign window_sum_1 =c1_b[0] + window_mul_result_1[0][0]+window_mul_result_1[0][1]+window_mul_result_1[0][2]+window_mul_result_1[0][3]+window_mul_result_1[0][4]+
                                              window_mul_result_1[1][0]+window_mul_result_1[1][1]+window_mul_result_1[1][2]+window_mul_result_1[1][3]+window_mul_result_1[1][4]+
                                              window_mul_result_1[2][0]+window_mul_result_1[2][1]+window_mul_result_1[2][2]+window_mul_result_1[2][3]+window_mul_result_1[2][4]+
                                              window_mul_result_1[3][0]+window_mul_result_1[3][1]+window_mul_result_1[3][2]+window_mul_result_1[3][3]+window_mul_result_1[3][4]+
                                              window_mul_result_1[4][0]+window_mul_result_1[4][1]+window_mul_result_1[4][2]+window_mul_result_1[4][3]+window_mul_result_1[4][4];

assign window_sum_2 =c1_b[1] +  window_mul_result_2[0][0]+window_mul_result_2[0][1]+window_mul_result_2[0][2]+window_mul_result_2[0][3]+window_mul_result_2[0][4]+
                                              window_mul_result_2[1][0]+window_mul_result_2[1][1]+window_mul_result_2[1][2]+window_mul_result_2[1][3]+window_mul_result_2[1][4]+
                                              window_mul_result_2[2][0]+window_mul_result_2[2][1]+window_mul_result_2[2][2]+window_mul_result_2[2][3]+window_mul_result_2[2][4]+
                                              window_mul_result_2[3][0]+window_mul_result_2[3][1]+window_mul_result_2[3][2]+window_mul_result_2[3][3]+window_mul_result_2[3][4]+
                                              window_mul_result_2[4][0]+window_mul_result_2[4][1]+window_mul_result_2[4][2]+window_mul_result_2[4][3]+window_mul_result_2[4][4];

assign window_sum_3 =c1_b[2] +   window_mul_result_3[0][0]+window_mul_result_3[0][1]+window_mul_result_3[0][2]+window_mul_result_3[0][3]+window_mul_result_3[0][4]+
                                              window_mul_result_3[1][0]+window_mul_result_3[1][1]+window_mul_result_3[1][2]+window_mul_result_3[1][3]+window_mul_result_3[1][4]+
                                              window_mul_result_3[2][0]+window_mul_result_3[2][1]+window_mul_result_3[2][2]+window_mul_result_3[2][3]+window_mul_result_3[2][4]+
                                              window_mul_result_3[3][0]+window_mul_result_3[3][1]+window_mul_result_3[3][2]+window_mul_result_3[3][3]+window_mul_result_3[3][4]+
                                              window_mul_result_3[4][0]+window_mul_result_3[4][1]+window_mul_result_3[4][2]+window_mul_result_3[4][3]+window_mul_result_3[4][4];

assign window_sum_4 =c1_b[3] +   window_mul_result_4[0][0]+window_mul_result_4[0][1]+window_mul_result_4[0][2]+window_mul_result_4[0][3]+window_mul_result_4[0][4]+
                                              window_mul_result_4[1][0]+window_mul_result_4[1][1]+window_mul_result_4[1][2]+window_mul_result_4[1][3]+window_mul_result_4[1][4]+
                                              window_mul_result_4[2][0]+window_mul_result_4[2][1]+window_mul_result_4[2][2]+window_mul_result_4[2][3]+window_mul_result_4[2][4]+
                                              window_mul_result_4[3][0]+window_mul_result_4[3][1]+window_mul_result_4[3][2]+window_mul_result_4[3][3]+window_mul_result_4[3][4]+
                                              window_mul_result_4[4][0]+window_mul_result_4[4][1]+window_mul_result_4[4][2]+window_mul_result_4[4][3]+window_mul_result_4[4][4];

assign window_sum_5 =c1_b[4] +   window_mul_result_5[0][0]+window_mul_result_5[0][1]+window_mul_result_5[0][2]+window_mul_result_5[0][3]+window_mul_result_5[0][4]+
                                              window_mul_result_5[1][0]+window_mul_result_5[1][1]+window_mul_result_5[1][2]+window_mul_result_5[1][3]+window_mul_result_5[1][4]+
                                              window_mul_result_5[2][0]+window_mul_result_5[2][1]+window_mul_result_5[2][2]+window_mul_result_5[2][3]+window_mul_result_5[2][4]+
                                              window_mul_result_5[3][0]+window_mul_result_5[3][1]+window_mul_result_5[3][2]+window_mul_result_5[3][3]+window_mul_result_5[3][4]+
                                              window_mul_result_5[4][0]+window_mul_result_5[4][1]+window_mul_result_5[4][2]+window_mul_result_5[4][3]+window_mul_result_5[4][4];

assign window_sum_6 =c1_b[5] +   window_mul_result_6[0][0]+window_mul_result_6[0][1]+window_mul_result_6[0][2]+window_mul_result_6[0][3]+window_mul_result_6[0][4]+
                                              window_mul_result_6[1][0]+window_mul_result_6[1][1]+window_mul_result_6[1][2]+window_mul_result_6[1][3]+window_mul_result_6[1][4]+
                                              window_mul_result_6[2][0]+window_mul_result_6[2][1]+window_mul_result_6[2][2]+window_mul_result_6[2][3]+window_mul_result_6[2][4]+
                                              window_mul_result_6[3][0]+window_mul_result_6[3][1]+window_mul_result_6[3][2]+window_mul_result_6[3][3]+window_mul_result_6[3][4]+
                                              window_mul_result_6[4][0]+window_mul_result_6[4][1]+window_mul_result_6[4][2]+window_mul_result_6[4][3]+window_mul_result_6[4][4];


assign data_out = {
(window_sum_6[31]==0)?window_sum_6:0,
(window_sum_5[31]==0)?window_sum_5:0,
(window_sum_4[31]==0)?window_sum_4:0,
(window_sum_3[31]==0)?window_sum_3:0,
(window_sum_2[31]==0)?window_sum_2:0,
(window_sum_1[31]==0)?window_sum_1:0
};

wire data_out_valid_o = (x_cnt>=4&&y_cnt>=4)?1'b1:1'b0;
reg delay_data_out_valid_o;
always@(posedge clk)begin
    delay_data_out_valid_o <=data_out_valid_o;
    data_out_valid <= delay_data_out_valid_o;
end


//========================== add tree ========================================

//reg [31:0]  add0[0:12];   
//reg [31:0]  add1[0:6];   
//reg [31:0]  add2[0:3];   
//reg [31:0]  add3[0:1];   
//wire [16-1:0] window_mul_result_4tree[0:24];
//always@(posedge clk)begin
//    //========= add0 ==========
//    for(  i=0;i<12;i=i+1)begin
//        add0[i] <=  window_mul_result_4tree[i*2] + window_mul_result_4tree[i*2+1]; 
//    end
//    add0[12]<= window_mul_result_4tree[24]+0;
    
//    //=========add1============
//    for(  i=0;i<6;i=i+1)begin
//        add1[i] <=  add0[i*2] + add0[i*2+1]; 
//    end
//    add1[6]<= add0[12]+0;
    
//    //=========add2============
//    for(  i=0;i<3;i=i+1)begin
//        add2[i] <=  add1[i*2] + add1[i*2+1]; 
//    end
//    add2[3]<= add1[6]+0;
//     //=========add3============
//    for(  i=0;i<2;i=i+1)begin
//        add3[i] <=  add2[i*2] + add2[i*2+1]; 
//    end
    
//end
    
//assign window_sum = add3[0]+add3[1];
    
    
    
    
endmodule
