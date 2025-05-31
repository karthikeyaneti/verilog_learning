`timescale 1ns / 1ps

module priority_encoder_4x2(E, I, Y);
    input [3:0] I;
    input E;
    output [1:0] Y;
    
    assign Y = (!E || (~|I)) ? 2'b00 : 
                (I[3]) ? 2'b11 :
                (I[2]) ? 2'b10 :
                (I[1]) ? 2'b01 : 2'b00;
endmodule