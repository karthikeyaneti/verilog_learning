module countertb;
    reg rst, clk, modsel;
    wire [3:0] q;
    
    updowncounter counter(.rst(rst), .clk(clk), .modsel(modsel), .q(q));
    
    initial begin
        rst = 1;
        clk = 0;
        modsel = 0;
        
        #3 rst = 0;
        #9 modsel = 1;
        #23 modsel = 0;
    end
    
    always #1 clk = ~clk;
    initial #69 $finish;
endmodule