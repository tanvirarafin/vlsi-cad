module dump();
	initial begin
	    $dumpfile ("example_4_simple_mips.vcd");
	    $dumpvars (0, example_4_simple_mips);
	    #1;
	end
endmodule
	
