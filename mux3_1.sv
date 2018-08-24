module mux3_1(input logic [63:0] d0,d1,d2,
              input logic [1:0] selOp,
              output logic [63:0] y);
 
 always_comb
    begin
         case(selOp)
         2'b00:     y = d0;
         2'b01:     y = d1;
         2'b10:     y = d2;
         default:   y = 0;
         endcase
    end
              
endmodule
