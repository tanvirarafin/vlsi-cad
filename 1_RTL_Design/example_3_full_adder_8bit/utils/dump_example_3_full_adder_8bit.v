module dump();
	initial begin
	    $dumpfile ("example_3_full_adder_8bit.vcd");
	    $dumpvars (0, example_3_full_adder_8bit);
	    #1;
	end
endmodule