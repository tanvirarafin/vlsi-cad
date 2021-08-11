module dump();
	    initial begin
	        $dumpfile ("counter.vcd");
	        $dumpvars (0, counter);
	        #1;
	    end
endmodule