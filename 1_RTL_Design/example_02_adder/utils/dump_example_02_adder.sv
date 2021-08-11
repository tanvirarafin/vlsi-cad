module dump();
	initial begin
	    $dumpfile ("example_02_adder.vcd");
	    $dumpvars (0, example_02_adder);
	    #1;
	end
endmodule
	
