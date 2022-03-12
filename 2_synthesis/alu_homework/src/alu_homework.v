module alu_homework(output reg [15:0]y,
		     input [15:0]a,
		     input [15:0]b,
		     input [1:0]opcode,
		     input clk, reset);
		     
		     
 	always @(opcode) begin
 		case(opcode)
 			0: y = a+b;
 			1: y = a-b;
 			2: y = a&&b;
 			3: y = a||b;
 		endcase
 	end
endmodule
	
