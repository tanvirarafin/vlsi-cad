`timescale 1ns/1ps
module tb_alu_homework;
        reg reset, clk;
        reg [15:0]a;
        reg [15:0]b;
        reg [1:0] opcode;
        wire [15:0]y;

        alu_homework module1(.reset(reset), .a(a), .b(b), .y(y),
        			.opcode(opcode), .clk(clk));
        initial begin
               $dumpfile("tb_alu_homework.vcd");
               $dumpvars(0, tb_alu_homework);
               #100 $finish;
        end
	initial fork
		#10 opcode=2'b10;
		#10 a=16'hABCD;
		#10 b=16'h1;
		
		#20 opcode=2'b01;
		#20 a=16'hABCD;
		#20 b=16'hABCD;
		
			
		#30 opcode=2'b00;
		#30 a=16'hABCD;
		#30 b=16'hABCD;
	join
endmodule
	
