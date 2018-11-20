//Modulo Multiplexor 2x1
//

module mux2 #(parameter Nbits=64)
             (input logic [Nbits-1:0] d0,d1,
              input logic sel,
              output logic [Nbits-1:0] y);
 
 assign y = sel ? d1 : d0;
 
endmodule
