module half_adder_dataflow(a, b, carry, sum);
    input a, b;
    output carry, sum;
    assign carry = a & b;
    assign sum = a ^ b;
endmodule