module ysyx_alu_mul_slow (
    input                            clk,
    input                            rst,
    input                            rs1_signed_valid_i,
    input                            rs2_signed_valid_i,
    input                 [  64-1:0] rs1_data_i,
    input                 [  64-1:0] rs2_data_i,
    input                            mul_valid_i,
    output                           mul_ready_o,
    output [64*2-1:0]                mul_out_o
);

  localparam STATE_LEN = 3;
  localparam MUL_RST = 3'd0;
  localparam MUL_IDLE = 3'd1;
  localparam MUL_BOOTH = 3'd2;
  localparam MUL_WAIT = 3'd3;


  reg [STATE_LEN-1:0] mul_state;
  reg [32:0] mul_count;  // Áßª‰ΩçËÆ°Êï∞Âô?
  reg mul_ready;
  reg [127:0] mul_data128;
  reg [64-1:0] booth_rs1;
  reg [64-1:0] booth_rs2;
  reg booth_rs1_signed_valid;
  reg booth_rs2_signed_valid;


  wire [127:0] Partial_product[33-1:0];
  ysyx_alu_mul_booth_r4 u_alu_mul_booth_r4 (
      .rs1_signed_valid_i(booth_rs1_signed_valid),
      .rs2_signed_valid_i(booth_rs2_signed_valid),
      .rs1_data_i        (booth_rs1),
      .rs2_data_i        (booth_rs2),
      .pp0_o             (Partial_product[0]),
      .pp1_o             (Partial_product[1]),
      .pp2_o             (Partial_product[2]),
      .pp3_o             (Partial_product[3]),
      .pp4_o             (Partial_product[4]),
      .pp5_o             (Partial_product[5]),
      .pp6_o             (Partial_product[6]),
      .pp7_o             (Partial_product[7]),
      .pp8_o             (Partial_product[8]),
      .pp9_o             (Partial_product[9]),
      .pp10_o            (Partial_product[10]),
      .pp11_o            (Partial_product[11]),
      .pp12_o            (Partial_product[12]),
      .pp13_o            (Partial_product[13]),
      .pp14_o            (Partial_product[14]),
      .pp15_o            (Partial_product[15]),
      .pp16_o            (Partial_product[16]),
      .pp17_o            (Partial_product[17]),
      .pp18_o            (Partial_product[18]),
      .pp19_o            (Partial_product[19]),
      .pp20_o            (Partial_product[20]),
      .pp21_o            (Partial_product[21]),
      .pp22_o            (Partial_product[22]),
      .pp23_o            (Partial_product[23]),
      .pp24_o            (Partial_product[24]),
      .pp25_o            (Partial_product[25]),
      .pp26_o            (Partial_product[26]),
      .pp27_o            (Partial_product[27]),
      .pp28_o            (Partial_product[28]),
      .pp29_o            (Partial_product[29]),
      .pp30_o            (Partial_product[30]),
      .pp31_o            (Partial_product[31]),
      .pp32_o            (Partial_product[32])
  );

  //  ÈÉ®ÂàÜÁßØÁ"üÊà? ( ÂÖ?33 ‰∏?),Áº"Â≠ò‰∏?‰∏™Â'®Êú?
  wire [127:0] step1_pp_q[33-1:0];

  genvar step1_Dflap;
  generate
    for (step1_Dflap = 0; step1_Dflap < 33; step1_Dflap = step1_Dflap + 1) begin
      ysyx_041514_regTemplate #(
          .WIDTH    (128),
          .RESET_VAL(0)
      ) u_ysyx_041514_regTemplate (
          .clk (clk),
          .rst (rst),
          .din (Partial_product[step1_Dflap]),
          .dout(step1_pp_q[step1_Dflap]),
          .wen (1'b1)
      );
    end
  endgenerate

  always @(posedge clk) begin
    if (rst) begin
      mul_state <= MUL_RST;
      mul_count <= 'b0;
      mul_ready <= 'b0;
      mul_data128 <= 'b0;
      booth_rs1 <= 'b0;
      booth_rs2 <= 'b0;
      booth_rs1_signed_valid <= 'b0;
      booth_rs2_signed_valid <= 'b0;
    end else begin
      case (mul_state)
        MUL_RST: begin
          mul_state <= MUL_IDLE;
        end
        MUL_IDLE: begin
          mul_count <= 'b0;
          mul_ready <= 'b0;
          if (mul_valid_i) begin
            booth_rs1 <= rs1_data_i;
            booth_rs2 <= rs2_data_i;
            booth_rs1_signed_valid <= rs1_signed_valid_i;
            booth_rs2_signed_valid <= rs2_signed_valid_i;
            mul_state <= MUL_BOOTH;
            mul_data128 <= 'b0;
          end
        end
        MUL_BOOTH: begin
          if (mul_valid_i) begin
            mul_state <= MUL_WAIT;
          end else begin
            mul_state <= MUL_IDLE;
          end
        end
        MUL_WAIT: begin
          if (mul_count == 'd33) begin
            mul_state <= MUL_IDLE;
            mul_ready <= 'b1;
          end else if (mul_valid_i) begin
            mul_data128 <= mul_data128 + step1_pp_q[mul_count[5:0]]; // TODO ÂæàÁ-'ÊÉ'ËÉΩ‰∏çËÉΩËøôÊ ∑Á"?
            mul_count <= mul_count + 'b1;
          end else begin
            mul_state <= MUL_IDLE;
          end
        end
        default: begin
        end
      endcase
    end
  end

  assign mul_ready_o = mul_ready;
  assign mul_out_o   = mul_data128;


endmodule

module ysyx_041514_regTemplate #(
    WIDTH = 1,
    RESET_VAL = 0
) (
    input                  clk,
    input                  rst,
    input      [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout,
    input                  wen
);
  always @(posedge clk) begin
    if (rst) dout <= RESET_VAL;
    else if (wen) dout <= din;
  end
endmodule