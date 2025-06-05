`timescale 1ns / 1ps

module decoder_Nbit #(parameter N = 3) (En, I, Y);
    input En;
    input [N-1:0] I;
    output [1<<N:0] Y;
    
    assign Y = (En) ? (1<<I) : {((1<<N)){1'b0}};
endmodule
