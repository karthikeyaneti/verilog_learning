`timescale 1ns / 1ps

module D_Flipflop(
    input D,
    input Clk,
    input Rst,
    output reg Q
    );
    
    always @(posedge Clk) begin
        if(Rst) Q <= 4'b0;
        else Q <= D;
    end
endmodule
