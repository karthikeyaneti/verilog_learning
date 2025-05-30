`timescale 1ns / 1ps

module mux_4x1(
    input [3:0] I,
    input [1:0] S,
    output o
    );
    wire w1, w2;
    mux_2x1_gate m1(I[0], I[1], S[0], w1);
    mux_2x1_gate m2(I[2], I[3], S[0], w2);
    mux_2x1_dataflow m3(w1, w2, S[1], o);
endmodule