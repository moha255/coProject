module alucontroller(alusignal,functionsignal,out,outforjr);
	input [1:0]  alusignal;
	input [4:0] functionsignal ;
	output [3:0]  out;
	output outforjr;
	reg outforjr;
	reg [3:0] out;
	always @(alusignal or functionsignal)
		begin
			if (alusignal == 2'b00)
				begin
					case(functionsignal) 
						32 : out = 4'b0000;	  //add	
						34 : out = 4'b0001; //sub
						36 : out = 4'b0010;	  //and
						37 : out = 4'b0011; //or 
						0 : out = 4'b0100;//sll
						2 :out = 4'b0101;//srl 
						42 :out = 4'b0111;//slt
						39 : out = 4'b1000;//nor
						8 : outforjr = 1'b1;//jr
					endcase
				end
			else if (alusignal == 2'b01)
				begin
					out = 4'b0000; //add in lw & sw
				end
			else if (alusignal == 2'b11)
				begin
					out = 4'b0001; //add in branch 
				end	  
		end
endmodule
			
				
					
						
						
						
	
	
