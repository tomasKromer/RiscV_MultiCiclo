module TOP(input logic clk,sw,
           output logic led);

logic clk_1;    

CPU instancia1(clk_1,sw,led);
clk_wiz_0 inst1 (clk_1,sw,clk);   
   
endmodule
