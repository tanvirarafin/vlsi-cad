`timescale 1ns/1ps
module example_01_mux #(
	//list of parameters
	parameter DATA_WIDTH = 4
)(
	//list of ports
	input [DATA_WIDTH-1: 0] d0, d1,
	input clk, s,
	output reg [DATA_WIDTH-1 : 0] y
);
	always @(*)
		case(s)
		    2'b00: y <= d0;
		    2'b01: y <= d1;
		endcase
endmodule
