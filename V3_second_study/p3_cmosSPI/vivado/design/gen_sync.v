module gen_sync(
	input wire 	clk,
	input wire 	rst,
	input [7:0] bayer
	);

localparam 	WAIT_INLINE		= 5'b00001;
localparam 	WAIT_VLINE		= 5'b00010;
localparam 	VSynC_TIME		= 5'b00100;
localparam 	WAIT24_VLINE	= 5'b01000;
localparam 	ACTIVE_VLINE	= 5'b10000;

localparam 	INVSAV 			= 32'hff0000ab;
localparam 	INVEAV 			= 32'hff0000B6;
localparam 	VSAV   			= 32'hff000080;
localparam 	VEAV   			= 32'hff00009d;

reg [31:0]	shift_reg;
reg 		Invline_flag;
reg 		Invline_sav;
reg 		Invline_eav;
reg 		vline_flag;
reg 		vline_sav;
reg 		vline_eav;
reg [13:0]  pi_cnt;
reg [4:0]	state;
always @(posedge clk) begin
	shift_reg <= {shift_reg[23:0], bayer};
end

always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		Invline_flag <= 0;
	end
	else if (shift_reg == INVSAV) begin
		Invline_flag <= 1'b1;
	end else if(shift_reg == INVEAV) begin
		Invline_flag <= 1'b0;
	end
end

always @(*) begin
	if(shift_reg == INVSAV) begin
		Invline_sav = 1;
	end else begin
		Invline_sav = 0;
	end
end

always @(*) begin
	if(shift_reg == INVEAV) begin
		Invline_eav = 1;
	end else begin
		Invline_eav = 0;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		vline_flag <= 0;
	end
	else if (shift_reg == VSAV) begin
		vline_flag <= 1'b1;
	end else if(shift_reg == VEAV)begin
		vline_flag <= 1'b0;
	end
end

always @(*) begin
	if(shift_reg == VSAV) begin
		vline_sav = 1;
	end else begin
		vline_sav = 0;
	end
end

always @(*) begin
	if(shift_reg == VEAV) begin
		vline_eav = 1;
	end else begin
		vline_eav = 0;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		pi_cnt <= 'd0;
	end
	else if (state == WAIT_INLINE && pi_cnt == 5) begin
		pi_cnt <= 0;
	end
	else if (state == WAIT_INLINE && pi_cnt != 5 && Invline_sav == 1'b1) begin
		pi_cnt <= pi_cnt + 1;
	end
end
always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		state <= WAIT_INLINE;
	end
	else case(state)
		WAIT_INLINE : begin
			if(pi_cnt == 5)	begin
				state == WAIT_VLINE;
			end
		end

		WAIT_VLINE  : begin
			
		end

		VSynC_TIME  : begin
			
		end

		WAIT24_VLINE: begin
			
		end

		ACTIVE_VLINE: begin
			
		end
	endcase
		
end


endmodule