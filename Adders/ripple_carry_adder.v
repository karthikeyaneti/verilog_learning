module ripple_carry_adder(A[3:0], B[3:0], c_in, Sum[3:0], c_out);
    input [3:0] A, B;
    input c_in;
    output [3:0] Sum;
    output c_out;
    
    wire c1, c2, c3;
    full_adder fa1(A[0], B[0], c_in, c1, Sum[0]);
    full_adder fa2(A[1], B[1], c1, c2, Sum[1]);
    full_adder fa3(A[2], B[2], c2, c3, Sum[2]);
    full_adder fa4(A[3], B[3], c3, c_out, Sum[3]);
endmodule