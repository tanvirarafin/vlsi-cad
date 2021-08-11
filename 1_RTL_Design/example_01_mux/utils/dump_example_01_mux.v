module dump();
	initial begin
	    $dumpfile ("example_01_mux.vcd");
	    $dumpvars (0, example_01_mux);
	    #1;
	end
endmodule
	
