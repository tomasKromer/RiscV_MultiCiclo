//Unidad de decteccion de data hazards
//Implementado completo para operaciones aritmeticas seguidas que pidan mismos registros,para un load y la siguente instruccion un nop seguido de arith

module forwardingUnit(input logic [4:0] writeReg_MEM,writeReg_WB,readReg1,readReg2,
                      input logic readDataMEM_WB,
                      output logic [1:0] fowardA,fowardB);

always_comb
begin
    if(writeReg_MEM == readReg1 && readReg1 != 0)
            begin
                fowardA = 2'b10;
                if(writeReg_MEM == readReg2 && readReg2 != 0)
                       fowardB = 2'b10;
                else if(writeReg_WB == readReg2 && readReg2 != 0)
                     fowardB = 2'b01; 
                else
                     fowardB = 2'b00;              
            end    
     else if(writeReg_MEM == readReg2 && readReg2 != 0)
            begin
                fowardB = 2'b10;
                if(writeReg_WB == readReg1 && readReg1 != 0)
                    fowardA = 2'b01;
                else
                    fowardA = 2'b00;
            end
        else
            if(writeReg_WB == readReg1 && readReg1 != 0)
                    begin
                        fowardA = 2'b01;
                        if(writeReg_WB == readReg2 && readReg2 != 0)
                                  fowardB = 2'b01;
                        else
                                  fowardB = 2'b00;        
                    end
             else
                    begin
                        fowardA = 2'b00;
                        if(writeReg_WB == readReg2 && readReg2 != 0)
                             fowardB = 2'b01;
                        else
                             fowardB = 2'b00; 
                    end      
    
end


                      
endmodule
