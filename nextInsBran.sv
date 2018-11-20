module nextInsBran #(parameter Nbits = 64)
                    (input logic [Nbits-1:0] pc,jump,
                     output logic [Nbits-1:0] nextIns);

assign nextIns = pc + (jump << 1);

endmodule
