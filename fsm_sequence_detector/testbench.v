
module tb();
	reg i, rst, clk;
	wire q;
	wire [1:0] pst, nst;

	sequence_detector dut(.i(i), .rst(rst), .clk(clk), .q(q), .pst(pst), .nst(nst));

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	task init;
		begin
			i = 0;
		end
	endtask

	task delay(input integer t);
		begin
			#t;
		end
	endtask

	task reset;
		begin
			rst = 1;
			delay(10);
			rst = 0;
		end
	endtask

	task stimulus(input j);
		begin
			@(negedge clk)
				i = j;
		end
	endtask

	initial $monitor("Reset = %b, state = %b, input = %b, output = %b", rst, pst, i, q);

	always @(pst or i) begin
		if(q == 1) $display("Sequence 1001 detected");
	end

	initial begin
		init;
		reset;
		stimulus(1);
		stimulus(1);
		stimulus(0);
		stimulus(0);
		stimulus(0);
		stimulus(1);
		stimulus(0);
		stimulus(0);
		stimulus(1);
		stimulus(0);
		stimulus(0);
		stimulus(1);
		stimulus(1);
		stimulus(1);
		stimulus(0);
		stimulus(0);
		stimulus(1);
		reset;
		stimulus(1);
		stimulus(1);
		stimulus(0);
		stimulus(0);
		stimulus(0);
		stimulus(1);
		stimulus(0);
		stimulus(0);
		stimulus(1);
		stimulus(1);
		stimulus(0);
		stimulus(0);
		stimulus(1);
		reset;
		$finish;
	end
endmodule
