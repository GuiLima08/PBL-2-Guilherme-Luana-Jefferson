module ContAction(
	input clk, rst,
	output Q2, Q1, Q0
);
	wire w1,w2,w3,wQ1,wQ0,w_rst,nQ1,nQ0;
	and and0(w3, wQ1, wQ0);
	or or0(w_rst, rst, w3);
	FlipFlop ff0(.j(1), .k(1), .clk(clk), .Q(Q2), .Qn(w1), .rst(w_rst));
	FlipFlop ff1(.j(1), .k(1), .clk(w1), .Q(wQ1), .Qn(w2), .rst(w_rst));
	FlipFlop ff2(.j(1), .k(1), .clk(w2), .Q(wQ0), .rst(w_rst));
	not not1(nQ0, wQ0);
	not not2(nQ1, wQ1);
	not not3(Q0, nQ0);
	not not4(Q1, nQ1);
	
endmodule
