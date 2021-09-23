module example_project#(parameter data_width = 4)(
		output [data_width:0] y,
		input [data_width-1:0] a,b);
	assign y=a+b;
endmodule
	
