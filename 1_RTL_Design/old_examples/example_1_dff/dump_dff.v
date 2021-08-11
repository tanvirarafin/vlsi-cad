module dump();
	    initial begin
	        $dumpfile ("dff.vcd");
	        $dumpvars (0, dff);
	        #1;
	    end
endmodule