//Modulo para proxima instrucion

module addNextIns #(parameter Nbits=64)
                   (input logic [Nbits-1:0] pc,
                    output logic [Nbits-1:0] nextIns);
                 
assign nextIns = pc + 4;
                   
endmodule
