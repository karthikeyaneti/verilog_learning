`timescale 1ns / 1ps

module demux_1x4_tb;
    reg X;
    reg [1:0] Sel;
    wire [3:0] Y;
    integer i;
    
    demux_1x4 demux_1to4(X, Sel, Y);
    
    task test(); begin
        for(i = 0; i < 4; i = i+1) begin
            Sel = i; #10;
            if (X == 1 && Y !== (1 << Sel)) $display("Mismatch at Sel = %b", Sel);
        end
        Sel = 2'b00;
    end
    endtask
    
    initial begin
    
        X = 0;
        test();
        
        X = 1;
        test();
        
        $finish;
        
    end
    
    initial $monitor("X = %b, Sel = %02b | Y = %04b", X, Sel, Y);
    
endmodule
