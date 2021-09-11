`timescale 1ns/1ps
module tb_adder;
        reg [3:0]a,b;
        wire [4:0]y;

        adder module1(.y(y), .a(a), .b(b));
        initial begin
               $dumpfile("tb_adder.vcd");
               $dumpvars(0, tb_adder);
	       #0 a=4'b0000;
	       #0 b=4'b0001;
               #100 $finish;
        end
	always #10 a=a+1;
	always #20 b=b*2;

endmodule
	
