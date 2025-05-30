`timescale 1ns / 1ps

module demux_1x4(X, S, Y);
input X;
input [1:0] S;
output [3:0] Y;

assign Y[0] = (~S[1]) & (~S[0]) & X;
assign Y[1] = (~S[1]) & (S[0]) & X;
assign Y[2] = (S[1]) & (~S[0]) & X;
assign Y[3] = (S[1]) & (S[0]) & X;

endmodule
