`timescale 1ns / 1ps

module priority_encoder_tb;
    parameter N = 2;
    parameter IN_WIDTH = 1<<N;
    
    reg E;
    reg [IN_WIDTH-1:0] I;
    wire [N-1:0] Y;
    reg [N-1:0] Y_expected;
    integer i;
    
//    priority_encoder_4x2 pri_enc(E, I, Y);
    priority_encoder_Nbit #(N) pri_enc(E, I, Y);
        
    function automatic [N-1:0] priority_encode;
        input [IN_WIDTH-1:0] In;
        integer j;
        begin : loop
            priority_encode = 0;
            for(j = IN_WIDTH-1; j >= 0; j = j-1) begin
                if(In[j]) begin
                    priority_encode = j;
                    disable loop;
                end
            end
        end
    endfunction
    
    initial begin
        E = 0; I = 0; i = 0; Y_expected = priority_encode(I);
        #10;
        if(Y !== 0)
            $display("%0t, Output Y = %b is not equal to 0 when enable is 0", Y, $time);
        E = 1; #10;
        for(i = 1; i <= {IN_WIDTH{1'b1}}; i = i+1) begin
            I = i;
            Y_expected = priority_encode(I);
            #10;
            if(Y === Y_expected) 
                $display("in = %b -> out = %b", I, Y);
            else
                $display("Error at input %0b: Expected %b, got %b", I, Y_expected, Y);
        end
        $finish;
    end
endmodule
