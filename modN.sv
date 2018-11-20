module modN #(parameter N=5,M=29)
             (input logic clk,rst,
             output logic out);
             
logic [N-1:0] cnt;

always_ff @(posedge clk)
      if (rst)
      begin
            cnt <= 0;
            out <= 0;
      end
      else if(cnt >= M-1)
      begin
             cnt <= 0;
             out <= ~out;
      end
      else
            cnt <= cnt +1;
                    
             
endmodule
