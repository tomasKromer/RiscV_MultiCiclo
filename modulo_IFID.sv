//Buffer de IF a ID
//Entran y salen señales de Instruciones & PC

module buffer_IFID(input logic [31:0] nextInstruc,
                   input logic [63:0] nextPC,
                   input logic clk,e_write,
                   output logic [31:0] actInstruc,
                   output logic [63:0] actPc);

always_ff @(posedge clk)
begin
    if(e_write)
        begin    
            actInstruc <= nextInstruc;
            actPc <= nextPC;
        end  
end                
                   
endmodule
