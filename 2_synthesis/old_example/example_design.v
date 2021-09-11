module example_design #(parameter data_width = 4
	      )( output reg [data_width-1:0] y,
	      	 input  [data_width-1:0] d0, d1,
		 input  s, reset, clk);

	always@(posedge clk) 
	begin
		if (reset) y <=0;
		else y <= s?d1:d0;
	end

endmodule
