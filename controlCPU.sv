//Modulo de Control del CPU
//Funciones: Interpretacion de instruciones Arith, ld, sd , branch
//Implementado completo para CPI = 1

module controlCPU (
                   input logic [6:0] instruc,
                   output logic [1:0] aluOp,
                   output logic branch,memWrite,regWrite,memToReg,aluSRC,memRead
                  );
                
always_comb
    case(instruc)
        7'b000_0011://load 3
            begin
                memToReg = 1;
                regWrite = 1;
                memRead = 1;
                branch = 0;
                memWrite = 0;
                aluSRC = 1;
                aluOp = 2'b00;
                //IF_flush = 0;               
            end
        7'b010_0011://store 35
            begin
                    memToReg = 0;
                    regWrite = 0;
                    branch = 0;
                    memRead = 0;
                    memWrite = 1;
                    aluSRC = 1;
                    aluOp = 2'b00;
                    //IF_flush = 0;
            end
        7'b011_0011://arith 51
            begin
                    memToReg = 0;
                    regWrite = 1;
                    branch = 0;
                    memWrite = 0;
                    memRead = 0;
                    aluSRC = 0;
                    aluOp = 2'b10;
                    //IF_flush = 0;
            end
        7'b110_0011://branch 99
            begin
                branch = 1;
                memWrite = 0;
                memRead = 0;
                aluSRC = 0;
                regWrite = 0;
                aluOp = 2'b00;
                memToReg = 0;
                //IF_flush = 1;
            end
        default:
            begin
                branch = 0;
                memRead = 0;
                memWrite = 0;
                regWrite = 0;
                aluSRC = 0;
                aluOp = 2'b11;
                memToReg = 0;
                //IF_flush = 0;
            end               
    endcase           
endmodule
