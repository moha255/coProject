// CO-project
module contoller (op_code ,  regDst , branch , memRead , memWrite , aluOp , memToReg , aluSrc , regWrite,j);
	input [5:0] op_code ;
	output [1:0] regDst, memToReg ;
	output branch , memRead , memWrite , aluOp  , aluSrc , regWrite,j;
	reg branch , memRead , memWrite   , aluSrc , regWrite,j ;
	reg [1:0] aluOp, memToReg,  regDst;
	always @ ( op_code) 
		begin
			if (op_code == 6'b000000)
				begin
					regDst = 2'b01 ;
					branch = 0 ;
					memRead = 1'bx ;
					memWrite = 1'bx;
					memToReg = 2'b00 ;
					aluSrc = 0 ;
					regWrite = 1 ;	
					aluOp = 2'b00; 
					j = 0; // wich will tell the alucontroller to look at 
					              //the function to decide which operatipn wll the alu do (add , sub , and , or , ..)
				end
			//load
			else if (op_code == 6'b100011)
				begin
					regDst = 2'b00 ;
					branch = 0 ;
					memRead = 1 ;
					memWrite = 0 ;
					memToReg = 2'b01 ;
					aluSrc = 1 ;
					regWrite = 1 ;	
					aluOp = 2'b01 ;
					j = 0;//add 
				end
				//store
			else if (op_code ==6'b101011)
				begin
					regDst = 2'b00 ;
					branch = 0 ;
					memRead = 0 ;
					memWrite = 1 ;
					memToReg = 2'b01 ;
					aluSrc = 1 ;
					regWrite = 0 ;	
					aluOp = 2'b01 ;
					j = 0;//add
				end	 
				//branch
			else if (op_code == 6'b000100)
				begin
					 regDst = 2'bxx ;
					branch = 1 ;
					memRead = 1'bx ;
					memWrite = 1'bx ;
					memToReg = 2'bxx ;
					aluSrc = 0 ;
					regWrite = 1'bx ;	
					aluOp = 2'b11 ;
					 j = 0;//subtract
				end	 
				//j
				else if (op_code == 6'b000010)
				begin
					regDst = 2'bxx ;
					branch = 0 ;
					memRead = 1'b0 ;
					memWrite = 1'b0 ;
					memToReg = 2'bxx ;
					aluSrc = 2'bxx ;
					regWrite = 1'b0 ;	
					aluOp = 2'bxx ; 
					j = 1;
				end	  
				// jal
				else if (op_code == 6'b000010)
				begin
					regDst = 2'b10 ;
					branch = 0 ;
					memRead = 1'b0 ;
					memWrite = 1'b0 ;
					memToReg = 2'b10 ;
					aluSrc = 2'bxx ;
					regWrite = 1'b0 ;	
					aluOp = 2'bxx ; 
					j = 1;
				end
				
			end
	endmodule
			
			
					
					
					
					
