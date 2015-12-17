module alu(signal,a,b,out,ZeroSignal);
	input [31:0] a,b;
	input [3:0] signal;
	output [31:0]out;
	output ZeroSignal;	
	reg ZeroSignal;
	reg[31:0] out;
		always @ (signal)
			begin
				ZeroSignal=1'b0;
				case(signal)
						4'b0000:out=a+b;
						4'b0001:
						begin
							 out=a-b;
							if (out==0)  ZeroSignal=1'b1;
						end
						4'b0010: out=a&&b;
						4'b0011: out=a||b;
						4'b0100: out=a<<b;
						4'b0101: out=a>>b;
						4'b0110: out=~(a||b);
						4'b0111:
						begin
							if(a<b) out=1;
							else  out=0;
						end
				endcase
			end
endmodule
		
				
