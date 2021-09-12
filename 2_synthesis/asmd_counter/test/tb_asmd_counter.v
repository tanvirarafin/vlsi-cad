`timescale 1ns/1ps
module tb_asmd_counter;
        reg reset, clk;
        reg [1:0]up_down;
        wire [3:0] count;

        asmd_counter module1(.count(count),
                            .up_down(up_down),
                            .reset(reset),
                            .clk(clk));
        initial
            begin
               $dumpfile("tb_asmd_counter.vcd");
               $dumpvars(0, tb_asmd_counter);
               #0 reset = 0;

               #600 $finish;
            end
        initial begin
            clk =1'b0;
            forever #5 clk=~clk;
        end
        initial fork
            #10 reset =1;
            #20 reset =0;
            #30 up_down = 1;
            #200 up_down = 0;
            #250 up_down = 2;
            #450 up_down = 3;
        join


endmodule
	
