`timescale 1ns/1ns
module example_3_full_adder_8bit(clk, reset, a, b, cin, s, cout);
	
    parameter WIDTH = 8;
	input [WIDTH-1 : 0] a;
    input [WIDTH-1 : 0] b;
    input cin;
	input clk, reset;
	output reg cout;
	output reg [WIDTH-1 : 0] s;

	wire [WIDTH : 0] temp;
	assign temp = a + b + cin;
	
	always @(posedge clk or posedge reset)
	    begin
		    if(reset) begin
			    s <= 8'b0;
			    cout <= 0;
			    end
		    else begin
			    s <= temp[WIDTH-1:0];
	            cout <= temp[WIDTH];
	            end
	    end
endmodule
	
