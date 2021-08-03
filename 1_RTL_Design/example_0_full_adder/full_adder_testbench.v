`timescale 1ns / 1ns
module full_adder_testbench;
    reg a, b, carry_in;
    wire sum, carry_out;

    initial
        begin
            $dumpfile ("full_adder_testbench.vcd");
            $dumpvars (0, full_adder_testbench);
            #0 a = 0;
            #0 b = 0;
            #0 carry_in = 0;
            #10 a  = 1;
            #20 b  = 1;
            #20 carry_in = 1;
            #20 $stop;
            $finish ;
        end
    full_adder_dataflow adder1(sum, carry_out, a, b, carry_in);
endmodule
