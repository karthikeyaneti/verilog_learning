`timescale 1ns / 1ps

module decoder_2x4(E, I, Y);
    input [1:0] I;
    input E;
    output [3:0] Y;
    
    assign Y[0] = E & (~I[1]) & (~I[0]);
    assign Y[1] = E & (~I[1]) & (I[0]);
    assign Y[2] = E & (I[1]) & (~I[0]);
    assign Y[3] = E & (I[1]) & (I[0]);
endmodule