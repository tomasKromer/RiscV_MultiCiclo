module forwardingBranch(input logic [4:0] addrReg1,addrReg2,addrWriteMem,addrWriteWB,
                        input logic branch,
                        output logic [1:0] muxReg1,muxReg2);
                        
always_comb
    if(branch)
        if(addrReg1 == addrWriteMem)
            begin
                  muxReg1 = 2'b10;
                  if(addrReg2 == addrWriteMem)
                              muxReg2 = 2'b10;
                  else if(addrReg2 == addrWriteWB)
                              muxReg2 = 2'b01;
                  else
                              muxReg2 = 2'b00;
            end
        else if(addrReg1 == addrWriteWB)
            begin
                   muxReg1 = 2'b01;
                   if(addrReg2 == addrWriteMem)
                          muxReg2 = 2'b10;
                   else if(addrReg2 == addrWriteWB)
                          muxReg2 = 2'b01;
                   else
                          muxReg2 = 2'b00;
            end
        else
            begin
                 muxReg1 = 2'b00;   
                 if(addrReg2 == addrWriteMem)
                    muxReg2 = 2'b10;
                 else if(addrReg2 == addrWriteWB)
                    muxReg2 = 2'b01;
                 else
                    muxReg2 = 2'b00;
            end
    else if(addrWriteWB == addrReg1)
        begin
           muxReg1 = 2'b01;
           if(addrReg2 == addrWriteWB)
                     muxReg2 = 2'b01;
           else
                     muxReg2 = 2'b00; 
        end
    else if(addrWriteWB ==  addrReg2)
            begin
               muxReg2 = 2'b01;
               if(addrReg2 == addrWriteWB)
                         muxReg1 = 2'b01;
               else
                         muxReg1 = 2'b00; 
            end
    else
        begin
            muxReg2 = 2'b00;
            muxReg1 = 2'b00;
        end 
                         
                    
endmodule
