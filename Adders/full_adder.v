module full_adder(a, b, c_in, carry, sum);
    input a, b, c_in;
    output carry, sum;
    
    wire w1, w2, w3;
    half_adder_dataflow ha1(.a(a), .b(b), .carry(w2), .sum(w1));    // module instantiation by port names
    half_adder_gate_level ha2(w1, c_in, w3, sum);       // module instantiation by ordered list of ports
    or(carry, w2, w3); 
endmodule