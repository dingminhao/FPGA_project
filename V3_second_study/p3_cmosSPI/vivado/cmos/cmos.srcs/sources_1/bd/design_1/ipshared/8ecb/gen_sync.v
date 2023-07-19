// -----------------------------------------------------------------------------
// Copyright (c) 2014-2019 All rights reserved
// -----------------------------------------------------------------------------
// Author : Youkaiyuan  v3eduyky@126.com
// wechat : 15921999232
// File   : gen_sync.v
// Create : 2019-06-30 17:22:33
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module gen_sync(
	input	wire 			clk,
	input	wire 			rst,
	input	wire 	[7:0]	bayer,
	output	wire 			vsync,
	output	wire 			hsync,
	output	wire 	[7:0]	pixel
	);
parameter INVSAV =32'hff0000ab;
parameter INVEAV =32'hff0000B6;
parameter VSAV =32'hff000080;
parameter VEAV =32'hff00009d;

parameter	WAIT_INVLINE 	= 5'b0_0001;
parameter	WAIT_VLINE 		= 5'b0_0010;
parameter	VSYNC_TIME		= 5'b0_0100;
parameter	WAIT24_VLINE	= 5'b0_1000;
parameter	ACTIVE_LINE		= 5'b1_0000;

parameter	IGNOR_EAVNUM = 24-1;
parameter	HCNTMAX = 1920-1+48;
parameter	VCNTMAX	= 1080-1;
parameter	VCNTSTART = 47;

reg [4:0]	state;
reg [31:0]	shift_reg;
reg 		invline_flag;
reg 		vline_flag;
reg 		invline_sav,invline_eav,vline_sav,vline_eav;
reg [4:0]	ignored_line_cnt;
reg [12:0]	hcnt,vcnt;
reg 		vsync_flag;
reg 		hsync_flag;

assign  vsync= vsync_flag;
assign 	hsync= hsync_flag;
assign  pixel= shift_reg[7:0];

always @(posedge clk) begin
	shift_reg <= {shift_reg[23:0],bayer};
end

always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		invline_flag <= 1'b0;
	end
	else if (shift_reg == INVSAV) begin
		invline_flag <= 1'b1;
	end
	else if(shift_reg ==INVEAV) begin
		invline_flag <= 1'b0;
	end
end

always@(*) begin
	if(shift_reg == INVSAV) begin
		invline_sav <= 1'b1;
	end
	else begin
		invline_sav <= 1'b0;
	end
end

always@(*) begin
	if(shift_reg == INVEAV) begin
		invline_eav <= 1'b1;
	end
	else begin
		invline_eav <= 1'b0;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		vline_flag <= 1'b0;
	end
	else if (shift_reg == VSAV) begin
		vline_flag <= 1'b1;
	end
	else if(shift_reg ==VEAV) begin
		vline_flag <= 1'b0;
	end
end

always@(*) begin
	if(shift_reg == VSAV) begin
		vline_sav <= 1'b1;
	end
	else begin
		vline_sav <= 1'b0;
	end
end

always@(*) begin
	if(shift_reg == VEAV) begin
		vline_eav <= 1'b1;
	end
	else begin
		vline_eav <= 1'b0;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		state <= WAIT_INVLINE;
	end
	else case(state)
		WAIT_INVLINE : begin
			if(invline_flag == 1'b1) begin
				state <= WAIT_VLINE;
			end
		end
		WAIT_VLINE : begin
			if(vline_flag == 1'b1) begin
				state <= VSYNC_TIME;
			end
		end
		VSYNC_TIME :begin
			if(vline_eav) begin
				state <= WAIT24_VLINE;
			end
		end
		WAIT24_VLINE : begin
			if (ignored_line_cnt == IGNOR_EAVNUM && vline_eav == 1'b1) begin
				state <= ACTIVE_LINE;
			end
		end
		ACTIVE_LINE : begin
			if(hcnt == HCNTMAX && vcnt == VCNTMAX) begin
				state <= WAIT_INVLINE;
			end
		end
		default : begin
			state <= WAIT_INVLINE;
		end
	endcase
end


always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		vsync_flag <= 1'b0;
	end
	else if (state == WAIT_VLINE && vline_flag == 1'b1) begin
		vsync_flag <= 1'b1;
	end
	else if(vline_eav == 1'b1 && state == VSYNC_TIME) begin
		vsync_flag <= 1'b0;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		ignored_line_cnt <='d0;
	end
	else if (state == WAIT24_VLINE && vline_eav == 1'b1) begin
		ignored_line_cnt <= ignored_line_cnt + 1'b1;
	end
	else if (state != WAIT24_VLINE) begin
		ignored_line_cnt <='d0;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		hcnt <= 'd0;
	end
	else if(state != ACTIVE_LINE)begin
		hcnt <='d0;
	end
	else if(state == ACTIVE_LINE && vline_eav == 1'b1)begin
		 hcnt <='d0;
	end
	else if (state == ACTIVE_LINE && vline_flag == 1'b1) begin
		hcnt <= hcnt + 1'b1;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		vcnt <= 'd0;
	end
	else if(state != ACTIVE_LINE) begin
		vcnt <='d0;
	end
	else if (state == ACTIVE_LINE && vline_eav == 1'b1) begin
		vcnt <= vcnt + 1'b1;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst == 1'b1) begin
		hsync_flag <= 1'b0;
	end
	else if (state == ACTIVE_LINE && hcnt == VCNTSTART) begin
		hsync_flag <= 1'b1;
	end
	else if (state == ACTIVE_LINE && hcnt == HCNTMAX) begin
		hsync_flag <= 1'b0;
	end
end
wire [127:0]	probe0;

assign probe0 = {
	rst,
	shift_reg,
	vline_eav,
	vline_sav,
	vline_flag,
	invline_sav,
	invline_eav,
	invline_flag,
	state,
	hcnt,
	vcnt,
	vsync_flag,
	hsync_flag
};

ila_sync ila_0_inst (
	.clk(clk), // input wire clk


	.probe0(probe0) // input wire [127:0] probe0
);

endmodule