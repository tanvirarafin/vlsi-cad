//This is the dataflow definition of a 1-bit full adder
module full_adder_dataflow(sum, carry_out, a, b, carry_in);
    input a, b, carry_in;
    output sum, carry_out;
    assign sum = a ^ b ^ carry_in;
    assign carry_out = (a & b)|(b & carry_in)|(carry_out & a);
endmodule
