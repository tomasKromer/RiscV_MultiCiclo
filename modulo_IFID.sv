//Buffer de IF a ID
//Entran y salen señales de Instruciones & PC

module buffer_IFID(input logic [31:0] nextInstruc,
                   input logic [63:0] nextPC,
                   input logic clk,IF_flush,e_write,
                   output logic [31:0] actInstruc,
                   output logic [63:0] actPc);

always_ff @(posedge clk)
begin
    if(IF_flush)
        begin 
            actInstruc <= 0;
            actPc <= 0; 
        end
    else if (e_write)
            begin
                 actInstruc <= nextInstruc;
                 actPc <= nextPC;
            end
    else
        begin    
                actInstruc <= actInstruc;
                actPc <= actPc;
            end
   
end                

                   
endmodule
