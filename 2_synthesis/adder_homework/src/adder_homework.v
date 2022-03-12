module adder_homework ( output [31:0] sum, 
			output carry, 
			input [31:0] a,
			input [31:0] b,
			input  cin);
			
		wire [32:0]result;
		assign result = a+b+cin;
		assign sum = result[31:0];
		assign carry = result[32];
endmodule
	
