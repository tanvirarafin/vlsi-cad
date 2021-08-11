module dump();
	initial begin
	    $dumpfile ("mux4.vcd");
	    $dumpvars (0, mux4);
	    #1;
	end
endmodule
	
