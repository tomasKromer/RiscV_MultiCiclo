module HDU(input logic readMem_EX,clk,rst,writeReg,
           input logic [4:0] addWriteReg,
           input logic [31:0] instruc, 
           output logic selecBurMux,pcWrite,IF_ID_Write
           //output logic [31:0] pcWrite,
           );
//logic c;

           
always_comb
           begin
                   if(readMem_EX)
                       if(instruc[6:0] == 51 && ((addWriteReg==instruc[19:15]) || (addWriteReg==instruc[24:20])))
                           begin
                               selecBurMux = 1;
                               IF_ID_Write = 0;
                               pcWrite = 0;
                               //c=1;
                           end
                       else if(instruc[6:0] == 35 && ((addWriteReg==instruc[19:15]) || (addWriteReg==instruc[24:20])))
                           begin
                               selecBurMux = 1;
                               IF_ID_Write = 0;
                               pcWrite = 0;
                               //c=1; 
                           end
                       else if(instruc[6:0] == 3 && addWriteReg==instruc[19:15] )
                          begin
                              selecBurMux = 1;
                              IF_ID_Write = 0;
                              pcWrite = 0;
                              //c=1;
                          end
                       else
                       begin
                           selecBurMux = 0;
                           IF_ID_Write = 1;
                           pcWrite = 1;
                           //c=1;
                       end
                   else if(instruc[6:0] == 99 && writeReg)// && c)
                    begin
                        if((addWriteReg==instruc[19:15]) || (addWriteReg==instruc[24:20]))
                           begin
                               selecBurMux = 1;
                               IF_ID_Write = 0;
                               pcWrite = 0;
                               //c=0;
                           end
                       else
                       begin
                           selecBurMux = 0;
                           IF_ID_Write = 1;
                           pcWrite = 1;
                           //c=1;
                       end
                    end
                   /*else if(instruc[6:0] == 99 && writeReg //&& c==0)
                   begin
                      selecBurMux = 1;
                      IF_ID_Write = 0;
                      pcWrite = 0;
                      //c=1; 
                   end */
                   else
                    begin
                       selecBurMux = 0;
                       IF_ID_Write = 1;
                       pcWrite = 1;
                       //c=1;
                    end
           end           
                   

/*typedef enum logic  {s0,s1} state_t;
state_t reg_state,next_state;

always_ff @(negedge clk)
    if(rst)
        reg_state <= s0;
    else
        reg_state <= next_state;

always_comb
begin
        case(reg_state)
        s0:
            begin
                    selecBurMux = 0;
                    IF_ID_Write = 1;
                    pcWrite = 1;
            end
        s1:
            begin
                    selecBurMux = 1;
                    IF_ID_Write = 0;
                    pcWrite = 0;
            end
        default:
            begin
                    selecBurMux = 0;
                    IF_ID_Write = 1;
                    pcWrite = 1;
            end
        endcase
end


always_comb
begin
        if(reg_state == s1)
                next_state = s0;
        else if(readMem_EX)
            if(instruc[6:0] == 51 && ((addWriteReg==instruc[19:15]) || (addWriteReg==instruc[24:20])))
                begin
                    next_state = s1;
                end
            else if(instruc[6:0] == 35 && ((addWriteReg==instruc[19:15]) || (addWriteReg==instruc[24:20])))
                begin
                    next_state = s1;
                end
            else
                next_state = s0;
        else
            next_state = s0;
end
          */
endmodule
