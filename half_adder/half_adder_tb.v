`define DATAFLOW  // Uncomment this line and comment the below one to test dataflow half adder module
//`define GATELEVEL // Uncomment this line and comment the above one to test gate level half adder module

module half_adder_tb;
    reg a, b;
    wire carry, sum;
    
    `ifdef DATAFLOW
    half_adder_dataflow ha1 (a,b,carry,sum);
    `elsif GATELEVEL
    half_adder_gate_level ha1 (a,b,carry,sum);
    `else
    initial $fatal("No design type defined. Please define DATAFLOW or GATELEVEL.");
    `endif
    
    initial begin
    $display("A B | carry sum");
    $monitor("%b %b | %b %B", a, b, carry, sum);
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    $finish;
    end
    
endmodule