`timescale 1ns / 1ps

module Gray_to_Bin_Nbit #(parameter N = 4) (G, B);
    input [N-1:0] G;
    output reg [N-1:0] B;
    integer i;
    
    always @(*) begin
        B[N-1] = G[N-1];
        for (i = N-2; i >= 0; i = i - 1) begin
            B[i] = B[i+1] ^ G[i];
        end
    end

endmodule
