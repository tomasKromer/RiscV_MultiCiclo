//Modulo de registros de memoria del CPU
//Funciones: Write_Enable, CLK

module regMem #(parameter Nbits=64)
               (input logic we,clk,
                input logic [4:0] r_reg1,r_reg2,w_reg,
                input logic [Nbits-1:0] w_data,
                output logic [Nbits-1:0] r_data1,r_data2,x6);

logic [Nbits-1:0] ram [32];

initial
begin
    ram[1] = 1;
    ram[2] = 1;
end


always_ff @(posedge clk)
    begin
    if(we)
        begin
            ram[w_reg] <= w_data;          
        end
    x6 <= ram[6]; 
    end

 


assign r_data1 = (r_reg1== 0) ? 0 :  ram [r_reg1];
assign r_data2 = (r_reg2== 0) ? 0 :  ram [r_reg2];
 



endmodule
