`timescale 1ns / 1ps

module T_Flipflop(
    input T,
    input Clk,
    input Rst,
    output reg Q
    );
    
    always @(posedge Clk) begin
        if(Rst) Q <= 1'b0;
        else if (T) Q <= ~Q;
//        else Q <= Q;
    end
endmodule
