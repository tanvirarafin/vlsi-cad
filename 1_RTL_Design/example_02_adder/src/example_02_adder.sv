`timescale 1ns/1ps
module example_02_adder #(
    parameter WIDTH = 32)(
        input logic [WIDTH-1:0] a, b,
        output logic [2*WIDTH-1:0] y);
            assign y = a*b;
endmodule
	
