`timescale 1ns / 1ps

module decoder_3x8(E, I, Y);
    input [2:0] I;
    input E;
    output [7:0] Y;
    wire w1, w0;
    decoder_2x4 driving_decoder(E, {1'b0,I[2]}, {w1,w0});
    decoder_2x4 higher_bits(w1, I[1:0], Y[7:4]);
    decoder_2x4 lower_lower(w0, I[1:0], Y[3:0]);
endmodule
