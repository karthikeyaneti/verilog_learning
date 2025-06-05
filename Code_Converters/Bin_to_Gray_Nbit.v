`timescale 1ns / 1ps

module Bin_to_Gray_Nbit #(parameter N = 4) (B, G);
    input [N-1:0] B;
    output [N-1:0] G;
    genvar i;
    
    assign G[N-1] = B[N-1];
    
    generate
        for(i = N-2; i >= 0; i = i-1) begin
            assign G[i] = B[i+1] ^ B[i];
        end
    endgenerate
endmodule
