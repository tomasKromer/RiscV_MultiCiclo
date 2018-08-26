//Unidad de decteccion de data hazards
//Implementado completo para operaciones aritmeticas seguidas que pidan mismos registros,para un load y la siguente instruccion un nop seguido de arith

module forwardingUnit(input logic [4:0] addwriteReg_MEM,addwriteReg_WB,readReg1,readReg2,
                      input logic wEnableReg_MEM,wEnableReg_WB,
                      output logic [1:0] fowardA,fowardB);

always_comb
begin
    if(addwriteReg_MEM == readReg1 && readReg1 != 0 && wEnableReg_MEM)
            begin
                fowardA = 2'b10;
                if(addwriteReg_MEM == readReg2 && readReg2 != 0 && wEnableReg_MEM)
                       fowardB = 2'b10;
                else if(addwriteReg_WB == readReg2 && readReg2 != 0 && wEnableReg_WB)
                     fowardB = 2'b01; 
                else
                     fowardB = 2'b00;              
            end    
     else if(addwriteReg_MEM == readReg2 && readReg2 != 0 && wEnableReg_MEM)
            begin
                fowardB = 2'b10;
                if(addwriteReg_WB == readReg1 && readReg1 != 0 && wEnableReg_WB)
                    fowardA = 2'b01;
                else
                    fowardA = 2'b00;
            end
        else
            if(addwriteReg_WB == readReg1 && readReg1 != 0 && wEnableReg_WB)
                    begin
                        fowardA = 2'b01;
                        if(addwriteReg_WB == readReg2 && readReg2 != 0 && wEnableReg_WB)
                                  fowardB = 2'b01;
                        else
                                  fowardB = 2'b00;        
                    end
             else
                    begin
                        fowardA = 2'b00;
                        if(addwriteReg_WB == readReg2 && readReg2 != 0 && wEnableReg_WB)
                             fowardB = 2'b01;
                        else
                             fowardB = 2'b00; 
                    end      
end


                      
endmodule
