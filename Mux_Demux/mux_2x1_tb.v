`timescale 1ns / 1ps

module mux_2x1_tb;
    reg i0, i1, s;
    wire o;
    integer i;

    mux_2x1_gate mux_gate(i0, i1, s, o);
//    mux_2x1_dataflow mux_dataflow(i0, i1, s, o);

    initial begin
        $monitor("i0 = %b, i1 = %b, s = %b | o = %b", i0, i1, s, o);
        i = 0;
        for (i = 0; i < 8; i = i + 1) begin
            {i1, i0, s} = i; #10;
            if (o !== (s ? i1 : i0))
                $display("Mismatch at i = %d | i0=%b, i1=%b, s=%b, o=%b", i, i0, i1, s, o);
        end
        $finish();
    end
endmodule
