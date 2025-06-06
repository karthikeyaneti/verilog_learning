`timescale 1ns / 1ps

module D_T_tb;
    reg DT, Clk, Rst;
    wire Q;
    
    D_Flipflop d_ff(DT, Clk, Rst, Q);
//    T_Flipflop t_ff(DT, Clk, Rst, Q);
    
    always #5 Clk = ~Clk;
    
    initial begin
        Clk = 1'b0;
        Rst = 1'b1;
        DT = 1'b0;
        #10;
        
        DT = 1'b1;
        #10;
        
        Rst = 1'b0;
        DT = 1'b0;
        #10;
        
        DT = 1'b1;
        #10;
        
        DT = 1'b0;
        #10;
        
        DT = 1'b1;
        #10;
        
        $finish;
    end
endmodule
