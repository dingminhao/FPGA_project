module mux_15(
	input [4:0] ina,
	output a,
	output b,
	output c,
	output d,
	output e
	);
	assign {e,d,c,b,a} = ina;
endmodule