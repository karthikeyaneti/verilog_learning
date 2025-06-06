`timescale 1ns / 1ps

module JK_Flipflop(
    input J,
    input K,
    input Clk,
    output reg Q,
    output reg Q_bar
    );
    always @(posedge Clk) begin
        case({J,K})
            2'b00: {Q,Q_bar} <= {Q,Q_bar};
            2'b01: {Q,Q_bar} <= 2'b01;
            2'b10: {Q,Q_bar} <= 2'b10;
            2'b11: {Q,Q_bar} <= {~Q,~Q_bar};
        endcase
    end
endmodule
