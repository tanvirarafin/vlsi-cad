//This is the behavioural definition of a 1-bit fulladder
module full_adder_behavioural(sum, carry_out, a, b, carry_in);
    input a, b, carry_in;
    output sum, carry_out;

    always@(a, b, carry_in) begin
        sum = a^b^carry_in;
        carry_out = (a&b)|(a&carry_in)|(b&carry_out)
    end
endmodule
