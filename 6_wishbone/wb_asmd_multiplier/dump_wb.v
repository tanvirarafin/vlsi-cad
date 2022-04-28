module dump();
    initial begin
        $dumpfile ("wb_asmd_multiplier.vcd");
        $dumpvars (0, wb_asmd_multiplier);
        #1;
    end
endmodule
