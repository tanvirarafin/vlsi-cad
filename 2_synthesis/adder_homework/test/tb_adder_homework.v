`timescale 1ns/1ps
module tb_adder_homework;
        //reg reset, clk;
        reg [31:0]a;
        reg [31:0]b;
        reg cin;
        wire [31:0]sum;
        wire carry;

        adder_homework module1(.sum(sum), .carry(carry),
        			.a(a), .b(b), .cin(cin));
        initial begin
               $dumpfile("tb_adder_homework.vcd");
               $dumpvars(0, tb_adder_homework);
               #100 $finish;
        end
        
        initial fork
        	#10 a=32'd123;
        	#10 b=32'd456;
        	#10 cin=1;
        	
        join

endmodule
	
