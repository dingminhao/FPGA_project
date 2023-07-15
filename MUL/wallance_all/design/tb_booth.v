`timescale 1ns/1ns
module tb_booth();
reg 			clk					;
reg 			rst 				;
reg 			rs1_signed_valid	;
reg 			rs2_signed_valid	;
reg signed [64-1:0] 	rs1_data_i			;
reg [64-1:0] 	rs2_data_i			;
reg 			mul_valid 			;
wire [127:0] 	mul_out 			;
wire ready;
initial begin
	clk				 = 'd0;
	rst 			 = 'd1;
	rs2_data_i		 = 'd0;
	rs1_signed_valid = 'd0;
	rs2_signed_valid = 'd0;
	rs1_data_i		 = 'd0;
	rs2_data_i		 = 'd0;
	mul_valid		 = 'd0;
	#500;
	rst = 'b0;
	// first();
end

always #50 clk = ~clk;
reg ready_delay;
always @(posedge clk)begin
    ready_delay <= ready;
end
always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		rs1_signed_valid = 1;
		rs2_signed_valid = 0;
		rs1_data_i = $random%100;
		rs2_data_i = $random%100;
		mul_valid  = 1'b1;
	end
	else if(ready == 1'b1) begin
	   mul_valid  = 1'b0;
	end
	else if (ready_delay == 1'b1) begin
		rs1_signed_valid = 1;
		rs2_signed_valid = 0;
		rs1_data_i = {$random, $random};
		rs2_data_i = {$random, $random};
		mul_valid  = 1'b1;
	end
end

wire signed [64-1:0] rs1_data_ref;
wire signed [64-1:0] rs2_data_ref;
wire signed [128-1:0] res_out;
assign rs1_data_ref = rs1_data_i;
assign rs2_data_ref = rs2_data_i;
assign res_out = rs1_data_ref * rs2_data_ref;

//wire [64-1:0] rs1_data_ref2;
//wire [64-1:0] rs2_data_ref2;
//wire [128-1:0] res_out_1;;
//assign rs1_data_ref2 = rs1_data_i;
//assign rs2_data_ref2 = rs2_data_i;
//assign res_out_1 = rs1_data_ref2 * rs2_data_ref2; // rs1  ´ø·ûºÅ rs2 ²»´ø·ûºÅ
wire signed [64-1:0] rs1_data_ref2;
wire [64-1:0] rs2_data_ref2;
wire signed [128-1:0] res_out_1;;
assign rs1_data_ref2 = rs1_data_i;
assign rs2_data_ref2 = rs2_data_i;
assign res_out_1 = {{64{rs1_data_ref2[63]}}, rs1_data_ref2} * { {64{1'b0}}, rs2_data_ref2 };

wire OK;
assign OK = (res_out_1 == mul_out);


always @(posedge clk) begin
	if (ready == 1'b1 && OK == 1'b1) begin
		$display("num1:%h num2:%h multi_out:%h ref_mul_out:%h, OK:%b", rs1_data_i, rs2_data_i, mul_out, res_out_1, OK);
	end else if(ready == 1'b1)begin
		$error("GG");
		$display("num1:%h num2:%h multi_out:%h ref_mul_out:%h, OK:%b", rs1_data_i, rs2_data_i, mul_out, res_out_1, OK);
	end
end

ysyx_alu_mul_wallace_csa inst_ysyx_alu_mul_wallace_csa
	(
		.clk                (clk),
		.rst                (rst),
		.rs1_signed_valid_i (rs1_signed_valid),
		.rs2_signed_valid_i (rs2_signed_valid),
		.rs1_data_i         (rs1_data_i),
		.rs2_data_i         (rs2_data_i),
		.mul_valid_i        (mul_valid),
		.mul_ready_o        (ready),
		.mul_out_o          (mul_out)
	);

endmodule