`timescale 1ns / 1ps

module Bin_to_Gray_tb;
    parameter N = 4;
    reg [N-1:0] bin;
    wire [N-1:0] gray;
    integer i;
    
//    Binary_to_Gray btg(bin, gray);
    Bin_to_Gray_Nbit #(N) btg(bin, gray);
        
    initial begin
        bin = {N{1'b0}};
        for(i = 0; i < {N{1'b1}}; i = i+1) begin
            bin = i; #10;
            $display("Binary %0b -> Gray %0b", bin, gray); 
        end
        $finish;
    end
endmodule
