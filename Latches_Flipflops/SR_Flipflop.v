`timescale 1ns / 1ps

module SR_Flipflop(
    input S,
    input R,
    input Clk,
    output reg Q,
    output reg Q_bar
    );
    always @(posedge Clk) begin
        case({S,R})
            2'b00: {Q,Q_bar} <= {Q,Q_bar};
            2'b01: {Q,Q_bar} <= 2'b01;
            2'b10: {Q,Q_bar} <= 2'b10;
            2'b11: {Q,Q_bar} <= 2'bxx;
        endcase
    end
endmodule
