module Register_Flush(clk, rst, flush, ld, in, out);

	parameter WORD_LENGTH = 32;
	input clk, flush, rst, ld;
	input[WORD_LENGTH - 1:0] in;
	output reg[WORD_LENGTH - 1:0] out;

	always@(posedge clk, posedge rst)
	begin
		if (rst) out <= 0;
		else if (flush) out <= 0;
		else if (ld) out <= in;
	end

endmodule


// Add R1 R2 R3
// B #10
// ADD R3 R1 R2
