`timescale 1ns / 1ps

module comparator_4bit(A, B, g, e, l);
input [3:0] A, B;
output g, e, l;

wire [3:0] G, E, L;
comparator_1bit c3(A[3], B[3], G[3], E[3], L[3]);
comparator_1bit c2(A[2], B[2], G[2], E[2], L[2]);
comparator_1bit c1(A[1], B[1], G[1], E[1], L[1]);
comparator_1bit c0(A[0], B[0], G[0], E[0], L[0]);

assign g = (G[3]) || (E[3] & G[2]) || (E[3] & E[2] & G[1]) || (E[3] & E[2] & E[1] & G[0]);
assign e = (E[3] & E[2] & E[1] & E[0]); 
assign l = (L[3]) || (E[3] & L[2]) || (E[3] & E[2] & L[1]) || (E[3] & E[2] & E[1] & L[0]);
endmodule
