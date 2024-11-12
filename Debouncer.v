module Debouncer(
	input clk, button,
	output S
);
	wire w2,w3,n_button, n_w2;
	
	not not0(n_button, button);
	FlipFlop flipflop0(.j(button), .k(n_button), .clk(clk), .Q(w2));
	not not1(n_w2, w2);
	FlipFlop flipflop1(.j(w2), .k(n_w2), .clk(clk), .Qn(w3));
	
	and and0(S, w3, w2);
endmodule
