`timescale 1ns / 1ps

module Gray_to_Bin_tb;
    parameter N = 4;
    reg [N-1:0] gray;
    wire [N-1:0] bin;
    integer i;
    
//    Gray_to_Binary gtb(gray, bin);
    Gray_to_Bin_Nbit #(N) gtb(gray, bin);
        
    initial begin
        gray = {N{1'b0}};
        for(i = 0; i < {N{1'b1}}; i = i+1) begin
            gray = i; #10;
            $display("Gray %0b -> Binary %0b", gray, bin);
        end
        $finish;
    end
endmodule
