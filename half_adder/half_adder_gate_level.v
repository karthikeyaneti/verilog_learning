module half_adder_gate_level(a, b, carry, sum);
    input a, b;
    output carry, sum;
    and(carry, a, b);
    xor(sum, a, b);
endmodule