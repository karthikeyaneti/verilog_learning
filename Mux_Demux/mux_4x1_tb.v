`timescale 1ns / 1ps

module mux_4x1_tb;
    reg [3:0] In;
    reg [1:0] S;
    wire o;
    integer i;
    
    mux_4x1 mux_4to1(In,S,o);
    
    task test;
        for(i = 0; i < 4; i = i+1) begin 
            S = i; #10;
            if (o !== In[S]) $display("Mismatch at Sel = %b", S);
        end
    endtask
    
    initial begin
        In = 4'b0101;
        test();
        
        In = 4'b1010;
        test();
        
        In = 4'b1101;
        test();
        
        In = 4'b0110;
        test();
        
        $finish;
    end
    
    initial $monitor("In = %04b, Sel = %02b | Out = %b", In, S, o);
endmodule
