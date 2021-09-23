`timescale 1ns/1ps
module tb_asmd_multiplier;
        parameter word_length = 4;
        wire  [2*word_length-1:0] product;
        wire                      ready;
        reg   [word_length-1:0]   word0, word1;
        reg                       start, clk, reset;

        asmd_multiplier module1(.product(product), .ready(ready), .word0(word0), .word1(word1),
                                .start(start), .clk(clk), .reset(reset));

        initial begin
               $dumpfile("tb_asmd_multiplier.vcd");
               $dumpvars(0, tb_asmd_multiplier);
               #500 $finish;
        end
        initial begin
                    clk =1'b0;
                    forever #5 clk=~clk;
                end
                initial fork
                    #10 reset = 1;
                    #20 reset = 0;
                    #30 word0= 4'b1000; word1 =  4'b1111; start =1;
        join

endmodule
	
