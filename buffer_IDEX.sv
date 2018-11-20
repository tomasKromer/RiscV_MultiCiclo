//Modulo Buffer ID a EX
//Entran señales & salen aluSRC,MemToReg,Branch,MemWrite,MemRead,MemToReg,RegWrite,WrReg(Address),Pc,Reg1,Reg2,Imme,AluOp,Fun3,Fun7

module buffer_IDEX(input logic clk,nextAluSRC,nextMemWrite,nextMemRead,nextMemToReg,nextRegWrite,
                   input logic [4:0] nextWrReg,
                   input logic [63:0] nextReg1,nextReg2,nextInme,
                   input logic [1:0] nextAluOp,
                   input logic [2:0] nextFun3,
                   input logic [6:0] nextFun7,
                   input logic [4:0] nextAddReadReg1,nextAddReadReg2,
                   output logic [4:0] actWrReg,
                   output logic actAluSRC,actMemToReg,actMemWrite,actMemRead,actRegWrite,
                   output logic [63:0] actReg1,actReg2,actInme,
                   output logic [1:0] actAluOp,
                   output logic [2:0] actFun3,
                   output logic [6:0] actFun7,
                   output logic [4:0] actAddReadReg1,actAddReadReg2);
                   
always_ff @(posedge clk)
begin
        actReg1 <= nextReg1;
        actReg2 <= nextReg2;
        actInme <= nextInme;
        actWrReg <= nextWrReg;
        actAluSRC <= nextAluSRC;
        actAluOp <= nextAluOp;
        actMemToReg <= nextMemToReg;
        actMemRead <= nextMemRead;
        actMemWrite <= nextMemWrite;
        actRegWrite <= nextRegWrite;
        actFun3 <= nextFun3;
        actFun7 <= nextFun7;
        actAddReadReg1 <= nextAddReadReg1;
        actAddReadReg2 <= nextAddReadReg2;
end

endmodule
