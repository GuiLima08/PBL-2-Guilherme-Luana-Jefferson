module Multiplex(
	input I1, I2, S,
	output X
);
	wire w1, w2, nS;
	not not0(nS, S);
	
	and and1(w1, I1, S);
	and and2(w2, I2, nS);
	or or0(X, w1, w2);

endmodule
