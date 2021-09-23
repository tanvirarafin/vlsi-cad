`timescale 1ns/1ps
module tb_simple_multiplier;
        parameter word_length = 4;
        wire   [2*word_length-1:0] product;
        reg    [word_length-1:0]   word0, word1;
        reg   reset, clk;

        simple_multiplier module1(.product(product),
                                   .word0(word0),
                                   .word1(word1),
                                   .reset(reset),
                                   .clk(clk));
        initial begin
               $dumpfile("tb_simple_multiplier.vcd");
               $dumpvars(0, tb_simple_multiplier);
               #100 $finish;
        end
        initial begin
                            clk =1'b0;
                            forever #5 clk=~clk;
                        end
        initial fork
                            #10 reset = 1;
                            #20 reset = 0;
                            #30 word0= 4'b1000; word1 =  4'b1111;
        join

endmodule
	
