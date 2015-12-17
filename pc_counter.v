module pc_counter(addressin,addressout,clk);
input [31:0] addressin;
output [31:0] addressout;
reg [31:0]  addressout;	 
input clk;
always @(posedge clk)
	begin
		addressout <= addressin;
	end	
	
endmodule
