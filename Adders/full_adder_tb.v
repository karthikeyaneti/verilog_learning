module full_adder_tb();
    reg a, b, c_in;
    wire carry, sum;
    integer i;
    
    full_adder fa(a, b, c_in, carry, sum);
    
    initial begin
        $display("a\tb\tc_in\t|\tcarry\tsum");
        $monitor("%b\t%b\t %b  \t|\t  %b  \t %b", a, b, c_in, carry, sum);
        for(i = 0; i < 8; i = i+1) begin
            {a,b,c_in} = i; #10;
        end
        $finish();
    end
endmodule