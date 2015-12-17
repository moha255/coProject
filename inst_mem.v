module intstructionmemory(pc,instruction);
	input [31:0] pc;
	output [31:0] instruction;	
	reg [31:0] instruction;
    reg [31:0] myInstMem [0:40];
	
	
		initial begin 
          $readmemh("Instruction_Memory.list",myInstMem); 	 
        end 
		
	
	
	always @(pc) begin 
		instruction <=myInstMem[pc];
	end
	
	
endmodule
