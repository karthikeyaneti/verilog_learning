`timescale 1ns / 1ps

module priority_encoder_Nbit #(parameter N = 2) (E, I, Y);
    localparam IN_WIDTH = 1<<N;  
    input E;
    input [IN_WIDTH-1:0] I;
    output reg [N-1:0] Y;
    integer i;
    
    always @(E,I) begin : loop
        Y = 0;
        if(E) begin
            for(i = IN_WIDTH-1; i >= 0; i = i-1) begin
                if(I[i]) begin
                    Y = i;
                    disable loop;
                end
            end
        end
    end
    
endmodule
