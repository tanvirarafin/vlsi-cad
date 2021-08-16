`timescale 1ns / 1ps
module full_adder_testbench();
    logic a, b, carry_in;
    logic sum, carry_out;
    full_adder_dataflow adder1(sum, carry_out, a, b, carry_in);
    initial
        begin
            $dumpfile ("full_adder_testbench.vcd");
            $dumpvars (0, full_adder_testbench);
            #0 a = 0;
            #0 b = 0;
            #0 carry_in = 0;
            #10 a  = 1;
            #15 carry_in = 1;
            #20 b  = 1;
            #25 carry_in = 1;
            #30 $stop;
            $finish ;
        end
endmodule
