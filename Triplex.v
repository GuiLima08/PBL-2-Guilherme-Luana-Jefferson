module Triplex(
	input I1, I2, I3, S1, S2,
	output X
);

	wire nS1, nS2, w1, w2, w3;
	
	not not0(nS1, S1);
	not not1(nS2, S2);

	and and0(w1, I1, nS1, S2);
	and and1(w2, I2, S1, nS2);
	and and2(w3, I3, S1, S2);
	or or0(X, w1, w2, w3);
endmodule
