//Modulo Para Lectura Constante Inmediata de Ins
//Implementado para Arith,Ld,ST,Branch

module immedia_32a64(
    input logic [31:0] instruc,
    output logic [63:0] immediate
    );
    
always_comb
    case(instruc[6:0])
     7'b000_0011://load
                        immediate = 64'(signed'(instruc[31:20])); 
     7'b010_0011://store
                        immediate = 64'(signed'({instruc[31:25],instruc[11:7]}));     
     7'b110_0011://branch
                        immediate = 64'(signed'({instruc[31],instruc[7],instruc[30:25],instruc[11:8]})); 
    default:            
                        immediate = 0;
    endcase    
    
endmodule
