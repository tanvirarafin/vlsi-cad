module simple_multiplier #(parameter word_length = 4)(
       output   reg [2*word_length-1:0] product,
       input    [word_length-1:0]   word0, word1,
       input    reset, clk
);

    always@(posedge clk, posedge reset)
        if (reset ==1'b1) product<= 0;
        else product <= word0*word1;
endmodule
	
