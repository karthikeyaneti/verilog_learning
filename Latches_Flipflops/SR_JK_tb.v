`timescale 1ns / 1ps

module SR_JK_tb;
    reg SJ, RK, Clk;
    wire Q, Q_bar;
    
//    SR_Flipflop sr_ff(SJ, RK, Clk, Q, Q_bar);
    JK_Flipflop sr_ff(SJ, RK, Clk, Q, Q_bar);
    
    always #5 Clk = ~Clk;
    
    initial begin
        Clk = 1'b0;
        SJ = 1'b0;
        RK = 1'b1;
        #10;
        
        SJ = 1'b0;
        RK = 1'b0;
        #10;
        
        SJ = 1'b1;
        RK = 1'b0;
        #10;
        
        SJ = 1'b1;
        RK = 1'b1;
        #10;
        
        SJ = 1'b1;
        RK = 1'b0;
        #10;
        
        SJ = 1'b0;
        RK = 1'b0;
        #10;
        
        $finish; 
    end
    
endmodule
