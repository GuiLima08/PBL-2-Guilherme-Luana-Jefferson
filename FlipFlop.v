module FlipFlop(
	input j, k, clk, rst,
	output reg Q,
	output Qn
);   

  always@(posedge clk or posedge rst) begin
    if(rst) Q <= 0;
    else begin
      case({j,k})
        2'b00: Q <= Q;
        2'b01: Q <= 1'b0;
        2'b10: Q <= 1'b1;
        2'b11: Q <= ~Q;
      endcase
    end
  end
assign Qn = ~Q;
endmodule