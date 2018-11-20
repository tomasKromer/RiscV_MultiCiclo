//Modulo ALU
//Funciones: ADD,SUB,AND,OR,ZERO
module alu #(parameter Nbits=64)
            (input logic [Nbits-1:0] inA,inB,
             input logic [3:0] selOp,
             output logic zero,
             output logic [Nbits-1:0] result);
            
 logic [Nbits-1:0] compZ;
 
 assign compZ = 0;
            
            
always_comb
        case(selOp)
            4'b0000:       result = inA & inB; //AND
            4'b0001:       result = inA | inB; //OR
            4'b0010:       result = inA + inB; //ADD
            4'b0110:       result = inA - inB; //SUB
            default:       result = inA;       //Operacion equivocada
        endcase             

assign zero = ( result == compZ ) ? 1 : 0;
             
endmodule
