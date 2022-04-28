module dump();
    initial begin
        $dumpfile ("wb_adder.vcd");
        $dumpvars (0, wb_adder);
        #1;
    end
endmodule
