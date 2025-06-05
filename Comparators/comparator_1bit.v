`timescale 1ns / 1ps

module comparator_1bit(a,b,g,e,l);
    input a,b;
    output g,e,l;
    
    assign g = a & (~b);
    assign e = a ~^ b;
    assign l = (~a) & b;
endmodule
