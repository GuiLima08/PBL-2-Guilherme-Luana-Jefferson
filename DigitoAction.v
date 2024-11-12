module DigitoAction(
	input A, B, C,
	output a, b, c, d, e, f, g
);
	wire nA, nB, nC, AB, AC, BC, norABC, norAC, norAB, xorAB;
	
	not not0(nA, A);
	not not1(nB, B);
	not not2(nC, C);
	
	//output a
	nor nor0(norABC, A, B, C);
	and and0(AB, A, B);
	and and1(AC, A, C);
	and and2(BC, C, B);
	or or0(a, AB, AC, BC, norABC);
	
	//output b
	or or1(b, A, B, nC);
	
	//output c
	nor nor1(norAC, A, C);
	or or2(c, norAC, B);
	
	//output d
	xor xor0(xorAB, A, B);
	not not3(d, xorAB);
	
	//output e
	and and3(e, A, nB, nC);
	
	//output f
	or or3(f, AB, norABC);
	
	//output g
	and and4(g, nA, B);
endmodule
