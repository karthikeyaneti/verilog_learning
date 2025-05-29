`timescale 1ns/1ps

module rpa_tb;
    reg [3:0] A, B;
    reg c_in;
    wire [3:0] Sum;
    wire c_out;
    integer i, j;
    
    ripple_carry_adder rpa_4b(A, B, c_in, Sum, c_out);
    
    initial begin
        A = 4'b0000;
        B = 4'b0000;
        c_in = 0;
        repeat(2) begin
            for(i = 0; i < 16; i = i+1) begin
                A = i;
                for(j = 0; j < 16; j = j+1) begin
                    B = j;
                    #10;
                    $display("A = %04b, B = %04b, C_in = %b | C_out = %b, Sum = %04b", A, B, c_in, c_out, Sum);
                end
            end
            c_in = !c_in;
        end
        $finish();
    end
    
endmodule