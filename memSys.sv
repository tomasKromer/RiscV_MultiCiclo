
//Modulo de memoria del procesador terminado (por ahora)
//Funciones: Write_Enable, Read_Enable, clk

module memSys #(parameter Nbits=64)
               (input logic w_en,clk,r_en,
                input logic [Nbits-1:0] address,w_data,
                output logic [Nbits-1:0] r_data);

logic [Nbits-1:0] ram [255:0];

initial 
begin
    $readmemh("memSys.mem",ram,0,255);
end

always_ff @(posedge clk)
        if(w_en)
            ram[address[7:0]] <= w_data;
        

assign r_data = r_en ? ram [address[7:0]] : 0;


endmodule