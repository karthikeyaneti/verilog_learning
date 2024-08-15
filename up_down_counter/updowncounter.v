
module updowncounter(rst, clk, modsel, q);
    input rst, clk, modsel;
    output reg [3:0] q;

    always @(posedge clk) begin
        if(rst)
            q <= 0;
        else if(!modsel) begin
            if(q == 4'b1111)
                q <= 4'b0000;
            else
                q <= q+1;
        end
        else begin
            if(q == 4'b0000)
                q <= 4'b1111;
            else
                q <= q-1;
        end
    end 
endmodule