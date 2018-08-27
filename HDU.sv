module HDU(input logic readMem_EX,
           input logic [4:0] addWriteReg,
           input logic [31:0] instruc, 
           output logic selecBurMux,pcWrite,
           //output logic [31:0] pcWrite,
           output logic IF_ID_Write);
           
always_comb
begin
        if(readMem_EX)
            if(instruc[6:0] == 51 && (addWriteReg==instruc[19:15] || addWriteReg==instruc[24:20]))
                begin
                    selecBurMux = 1;
                    IF_ID_Write = 0;
                    pcWrite = 0;
                end
            else if(instruc[6:0] == 35 && (addWriteReg==instruc[19:15] || addWriteReg==instruc[24:20]))
                begin
                    selecBurMux = 1;
                    IF_ID_Write = 0;
                    pcWrite = 0;
                end
            else
                begin
                    selecBurMux = 0;
                    IF_ID_Write = 1;
                    pcWrite = 1;
                end
        else
            selecBurMux = 0;
            IF_ID_Write = 1;
            pcWrite = 1;
end
          
endmodule
