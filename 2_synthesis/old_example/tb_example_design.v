`timescale 1ns/1ps

module tb_example_design;
	reg s, reset, clk;
	reg [3:0] d0,d1;
	wire [3:0] y;

	example_design module1(.y(y),
				.d0(d0),
				.d1(d1),
				.s(s),
				.reset(reset),
				.clk(clk));
	initial begin
	       $dumpfile("tb_example_design.vcd");
       	       $dumpvars(0, tb_example_design);
	       clk = 0;
	       reset = 0;
	       s = 0;
	       d0 = 4'b0010;
	       d1 = 4'b0001;
	       #640 $finish;	       
	end
	always #10 clk=~clk;
	always #40 d0 = d0*2;
	always #80 d1 = d1*3;
	always #160 s = ~s;
	always #320 reset = ~reset;

endmodule
