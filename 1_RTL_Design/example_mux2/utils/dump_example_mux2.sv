module dump();
	initial begin
	    $dumpfile ("example_mux2.vcd");
	    $dumpvars (0, example_mux2);
	    #1;
	end
endmodule
	
