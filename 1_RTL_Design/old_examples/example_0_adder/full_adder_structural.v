//This is the structural definition of a 1-bit full adder
module full_adder_structural(sum, carry_out, a, b, carry_in);
    input a, b, carry_in;
    output sum, carry_out;
    wire w1, w2, w3;

    xor  xor1(sum, a, b. carry_in);
    and  and1(w1, a, b);
    and  and2(w2, b, carry_in);
    and  and3(w3, a, carry_in);
    or   or1(carry_out, w1, w2, w3);

endmodule
