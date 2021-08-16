//This is the dataflow definition of a 1-bit full adder
module full_adder_dataflow( output logic sum, 
			    output logic carry_out, 
			    input logic a, 
			    input logic b, 
			    input logic carry_in);
    always@(*)
        begin
            sum <= a ^ b ^ carry_in;
            carry_out <= (a & b)|(b & carry_in)|(carry_out & a);
        end

endmodule
