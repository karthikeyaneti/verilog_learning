`timescale 1ns / 1ps

module Comparator_4bit_tb;
    reg [3:0] A, B;
    wire g, e, l;

    comparator_4bit cmp(A, B, g, e, l);

    integer i;
    
    initial begin
        $display("  A    B  |  g e l | Result");
        $display("---------------------------");

        for (i = 0; i < 20; i = i + 1) begin
            A = $urandom % 16;
            B = $urandom % 16;
            #5;

            $display("%4b %4b |  %b %b %b | %s", A, B, g, e, l, 
                (g && A > B) || (e && A == B) || (l && A < B) ? "PASS" : "FAIL");
        end

        $finish;
    end
endmodule
