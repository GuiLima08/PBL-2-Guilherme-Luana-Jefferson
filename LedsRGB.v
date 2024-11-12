module LedsRGB(
	input A, B, C,
	output red, green, blue
);
	wire nA, nB, nC, w1, w2, w3, w4, w5, w6;
	
	not not0(nA, A);
	not not1(nB, B);
	not not2(nC, C);
	nor nor0(w1, A, B);
	and and0(w2, A, nB, C);
	or or0(red, w1, w2);
	
	and and1(w3, nA, B);
	and and2(w4, nA, nB, C);
	or or1(green, w3, w4);
	
	and and3(w5, A, nB);
	and and4(w6, nA, B, C);
	or or2(blue, w5, w6);	
endmodule
