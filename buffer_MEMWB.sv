//Buffer de MEM a WB
//entrada y salida de señales control MemtoReg,RegWrite
//entrada y salida de señales del datapath AddressRegW,AluResult,ReadDataMem 

module buffer_MEMWB(input logic clk,nextMemtoReg,nextRegWrite,
                    input logic [4:0] nextAddRegWrite,
                    input logic [63:0] nextResultAlu,nextDataMem,
                    output logic [4:0] actAddRegWrite,
                    output logic [63:0] actResultAlu,actDataMem,
                    output logic actMemtoReg,actRegWrite
    );

always_ff @(posedge clk)
begin
        actRegWrite <= nextRegWrite;
        actResultAlu <= nextResultAlu;
        actDataMem <= nextDataMem;
        actMemtoReg <= nextMemtoReg;
        actAddRegWrite <= nextAddRegWrite;
end

endmodule
