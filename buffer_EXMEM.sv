//Buffer de EX a MEM
//Señales de entrada y salida Zero,Branch,readMEM,writeMEM,writeReg,MemToReg,AddWrReg,AluResult,PC_B & AddWrMem

module buffer_EXMEM(input logic clk,nextZero,nextBranch,nextMemRead,nextMemWrite,nextRegWrite,nextMemToReg,
                    input logic [4:0] nextAddWrReg,
                    input logic [63:0] nextResult,nextPcB,nextDataWriteMem,
                    output logic [4:0] actAddWrReg,
                    output logic [63:0] actResult,actPcB,
                    output logic actZero,actBranch,actMemRead,actMemWrite,actRegWrite,actMemToReg,
                    output logic [63:0] actDataWriteMem);

always_ff @(posedge clk)
begin
        actAddWrReg <= nextAddWrReg;
        actZero <= nextZero;
        actResult <= nextResult;
        actPcB <= nextPcB;
        actBranch <= nextBranch;
        actMemRead <= nextMemRead;
        actMemWrite <= nextMemWrite;
        actMemToReg <= nextMemToReg;
        actRegWrite <= nextRegWrite;
        actDataWriteMem <= nextDataWriteMem;
end
                    
endmodule
