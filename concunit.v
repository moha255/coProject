module conc(a,b,y);
	input [27:0] a;
	input [3:0] b;
	output [31:0] y;
	reg [31:0] y;
	always @ (a,b)begin
	y <= {b,a};
	end
endmodule
