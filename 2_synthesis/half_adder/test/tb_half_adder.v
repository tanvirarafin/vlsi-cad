`timescale 1ns/1ps
module tb_half_adder;
        reg reset, clk;
        reg a,b;
        wire sum, carry;

        half_adder module1(.sum(sum), .carry(carry), .a(a), .b(b));
        initial begin
               $dumpfile("tb_half_adder.vcd");
               $dumpvars(0, tb_half_adder);
               #100 $finish;
        end
        
        initial begin
        	clk = 1'b0;
        	forever #5 clk=~clk;
        end
        
        initial fork
        	#10 a=1;
        	#10 b=1;
        	#20 b=0;
        	#30 a=0;
        	#40 b=1;
        	#50 b=0;
        join

endmodule
	
