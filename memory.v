
module data_memory(addr, data_in, data_out, rd, wr);
  
  parameter word_WIDTH = 32;
  parameter mem_size = 2^9;  // I have made it to the power of something to be reasonable
  
  // ports 	
  input rd,wr;
  input  [word_WIDTH-1:0] addr;
  input  [word_WIDTH-1:0] data_in;  
  output [word_WIDTH-1:0] data_out;
				
  // memory 		
  reg [word_WIDTH-1:0] my_memory [0:mem_size-1];

   
  // what should memory do
  
  assign data_out = my_memory[addr];	
  
  always @(addr or wr or rd) begin
    if (wr & !rd) begin
      my_memory[addr] <= data_in;
    end  
  end

  initial begin
    $readmemh("Data_Memory.list", my_memory);
  end

endmodule


