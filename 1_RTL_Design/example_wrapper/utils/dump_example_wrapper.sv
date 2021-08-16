module dump();
	initial begin
	    $dumpfile ("example_wrapper.vcd");
	    $dumpvars (0, example_wrapper);
	    #1;
	end
endmodule
	
