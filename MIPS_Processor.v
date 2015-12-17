	
	
	module MIPS ();
	    wire [31:0] address,pc_out,instr_out,extenderOut,WriteData,
		readdata1,readdata2,Aluinput2,AluOut,OutMemory,ADDER1out,SllOut1,ADDER2out,JumbAdd,ToMuxJump,ToMuxJr; 
		wire branch,clk,memRead,memWrite,aluSrc,regWrite,j,ZeroSignal,OutForJr,InToMux2_2,REGWRITE; 
		wire [4:0] muxRegDes;
		wire [1:0] RegDes,aluOp,memToReg;
		wire [3:0] 	AluControlOut;	
		wire [27:0] Sll28Out; 
		
	
		
   // -- Instantiation of modules components  -- //	
   pc_counter PC_COUNTER(address,pc_out,clk);	 
   intstructionmemory INstr_mem(pc_out,instr_out); 
   andgate AndForJr(regWrite,!OutForJr,REGWRITE) ;
   mux3 MUX3_1(instr_out[20:16],instr_out[15:11],5'b11111,0,muxRegDes,RegDes);  
   contoller  CONTROLLER (instr_out[31:26] , RegDes , branch , memRead , memWrite , aluOp , memToReg , aluSrc , regWrite,j);
   regfile REGFILE(instr_out[25:21],instr_out[20:16],muxRegDes,WriteData,REGWRITE,readdata1,readdata2);	 
   extender EXTENDER(instr_out[15:0],extenderOut); 
   mux MUX2_1(readdata2,extenderOut,aluSrc,Aluinput2);
   alu ALU(AluControlOut,readdata1,Aluinput2,AluOut,ZeroSignal);
   alucontroller AluController(aluOp,instr_out[5:0],AluControlOut,OutForJr);
   data_memory DataMemory(AluOut,readdata2,OutMemory, memRead , memWrite); 	
   mux3 MUX3_2(AluOut,OutMemory,ADDER1out,0,memToReg,WriteData); 
   adder ADDER1(pc_out,32'h00000004,ADDER1out);	
   sll SLL_1(extenderOut,SllOut1);
   adder ADDER2(SllOut1,ADDER1out,ADDER2out); 
   andgate AndGate1(ZeroSignal,	branch,InToMux2_2);
   mux MUX2_2(ADDER1out, ADDER2out,InToMux2_2,ToMuxJump);
   sll28 SLL28(instr_out[25:0],Sll28Out);
   conc CONCUNIT(Sll28Out,ADDER1out[3:0],JumpAdd); //not sure that take the first 4 bit of pc +4
   mux	MUX2_3(	ToMuxJump,JumpAdd,j,ToMuxJr);
   mux MUX2_4 (ToMuxJr,readdata1,OutForJr,address);
   
   
   
   
   
   
   
   
   
   
   																						
	endmodule
