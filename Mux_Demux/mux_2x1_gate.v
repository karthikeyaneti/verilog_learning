`timescale 1ns / 1ps

module mux_2x1_gate(
    input i0,
    input i1,
    input s,
    output o
    );
    wire sbar, w1, w2;
    not n1(sbar, s);
    and a1(w1, sbar, i0);
    and a2(w2, s, i1);
    or o1(o, w1, w2);
endmodule
