`timescale 1ns / 1ps

module decoder_tb;
    parameter N = 3;
    parameter OUT_WIDTH = 1 << N;
    reg [N-1:0] I;
    reg E;
    wire [OUT_WIDTH-1:0] Y;
    integer i;
    
    decoder_Nbit #(N) dec(E, I, Y);
    
    initial begin
        $display("Testing %0dx%0d Decoder", N, OUT_WIDTH);
        
        E = 0; I = 0; i = 0;
        #10;
        if(Y !== 0)
            $display("%0t, Output Y = %b is not equal to 0 when enable is 0", Y, $time);
        E = 1;
        for(i = 0; i < (1 << N); i = i+1) begin
           I = i; #10;
           if (Y !== (1 << I))
                $display("Error at input %0d: Expected %b, got %b", I, 1 << I, Y);
           else 
                $display("in = %b -> out = %b", I, Y);
        end
        $finish;
    end
endmodule
