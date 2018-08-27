module muxControl(input logic [1:0] aluOp,
                 input logic branch,memWrite,regWrite,memToReg,aluSRC,memRead,selOp,
                 output logic [1:0] yAluOp,   
                 output logic yBranch,yMemWrite,yRegWrite,yMemToReg,yAluSRC,yMemRead);

always_comb
       begin
            case(selOp)
            1'b0: 
                    begin
                         yAluOp = aluOp;
                         yBranch = branch;
                         yMemWrite = memWrite;
                         yRegWrite = regWrite;
                         yMemToReg = memToReg;
                         yAluSRC = aluSRC;
                         yMemRead = memRead; 
                    end
            1'b1:
                    begin
                        yAluOp = 0;
                        yBranch = 0;
                        yMemWrite = 0;
                        yRegWrite = 0;
                        yMemToReg = 0;
                        yAluSRC = 0;
                        yMemRead = 0; 
                    end
            endcase
       end

endmodule
