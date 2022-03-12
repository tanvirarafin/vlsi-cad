module half_adder(output sum, 
		 output carry,
		 input a,
		 input b);

	xor(sum,a,b);
	and(carry, a,b);
endmodule
	
