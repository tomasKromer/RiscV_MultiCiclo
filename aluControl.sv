//Modulo control de Operaciones de la ALU
//Funciones implementadas: ADD,SUB,AND,OR


module aluControl(
                  input logic [2:0] fun3,
                  input logic [6:0] fun7,
                  input logic [1:0] aluOp,
                  output logic [3:0] opControl);

 always_comb
       case(aluOp)
            2'b00:
                  opControl = 4'b0010;  //add para ld y sd  
            2'b01:
                  opControl = 4'b0110;  //sub para branch     
            2'b10:
                  begin
                       case(fun3)
                        3'b000:  
                                begin
                                    case(fun7)
                                        7'b000_0000: opControl = 4'b0010;//add para arith
                                        7'b010_0000: opControl = 4'b0110;//sub para arith
                                        default:     opControl = 4'b1111;//desconocido
                                    endcase
                                end
                        3'b110:  opControl = 4'b0010;   //OR para arith
                        3'b111:  opControl = 4'b0000;   //ADD para arith
                        default: opControl = 4'b1111;   //Desconocido
                       endcase       
                  end
            default:
                  begin
                           opControl = 4'b1111;        //Desconocido           
                  end
       endcase
                  
endmodule
