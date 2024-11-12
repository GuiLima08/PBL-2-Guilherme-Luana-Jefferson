module DigitoVelocidade(
	input A, B,
	output a,b,c,d,e,f,g
);
	wire nA, nB, A_nB, A_B;
	
	not not0(nA, A);
	not not1(nB, B);
	
	//output a, d, e
	nand nand0(A_nB, A, nB);
	not not2(a, A_nB);
	not not3(d, A_nB);
	not not4(e, A_nB);
	
	//output b
	not not5(b, 1);
	
	//output c, f
	nand nand1(A_B, A, B);
	not not6(c, A_B);
	not not7(f, A_B);
	
	//output g
	and and0(g, nA, nB);
endmodule
