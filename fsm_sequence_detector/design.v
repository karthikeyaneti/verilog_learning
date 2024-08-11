
module sequence_detector(i,rst,clk,q,pst,nst);
input i, rst, clk;
output reg q;
output reg [1:0] pst, nst;

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;
parameter s3 = 2'b11;

always @(posedge clk) begin
	if(rst) begin
		pst <= s0;
	end
	else begin
		pst <= nst;
	end
end

always @(pst,i) begin
	case(pst)
		s0: if(i) begin
				nst <= s1;
				q <= 0;
			end else begin
				nst <= s0;
				q <= 0;
			end
		s1: if(i) begin
				nst <= s1;
				q <= 0;
			end else begin
				nst <= s2;
				q <= 0;
			end
		s2: if(i) begin
				nst <= s1;
				q <= 0;
			end else begin
				nst <= s3;
				q <= 0;
			end
		s3: if(i) begin
				nst <= s1;
				q <= 1;
			end else begin
				nst <= s0;
				q <= 0;
			end
	endcase
end
endmodule
