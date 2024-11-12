module ContVelocidade(
	input clk, rst,
	output Q0, Q1
);
	wire wQ0, n_Q0;
	
	FlipFlop ff0(.j(1), .k(1), .clk(clk), .Q(wQ0), .rst(rst));
	FlipFlop ff1(.j(1), .k(1), .clk(wQ0), .Q(Q0), .rst(rst));
	not not0(n_Q0, wQ0);
	not not1(Q1, n_Q0);
endmodule
