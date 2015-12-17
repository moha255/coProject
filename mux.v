module mux(a,b,sel,y);
	input a,b,sel;
	output y;
	reg y;
	always @ (a or b or sel)
		begin
			if (sel == 1'b0)
				 y=a;
			else
				 y=b;
			end
endmodule