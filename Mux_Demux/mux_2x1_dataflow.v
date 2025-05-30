`timescale 1ns / 1ps

module mux_2x1_dataflow(
    input i0,
    input i1,
    input s,
    output o
    );
    assign o = (~s&i0)|(s&i1);
endmodule
