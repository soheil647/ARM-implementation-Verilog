`include "Defines.v"

module Memory(clk, rst, address, WriteData, MemRead, MemWrite, ReadData, ready);
	input[`INSTRUCTION_LEN - 1:0] WriteData;
	input[`ADDRESS_LEN - 1:0] address;
	input clk, rst, MemRead, MemWrite;
	output wire[`INSTRUCTION_LEN - 1:0] ReadData;
	output ready;

	reg[`DATA_MEMORY_LEN - 1:0] data[0:`DATA_MEMORY_SIZE - 1];

	wire [`ADDRESS_LEN - 1:0] address4k = {address[`ADDRESS_LEN - 1:2], 2'b0} - `ADDRESS_LEN'd1024; //address4k
	wire [`ADDRESS_LEN - 1:0] address4k_p1 = {address4k[`ADDRESS_LEN - 1:2], 2'b01}; // address4k + 1
	wire [`ADDRESS_LEN - 1:0] address4k_p2 = {address4k[`ADDRESS_LEN - 1:2], 2'b10}; // address4k + 2
	wire [`ADDRESS_LEN - 1:0] address4k_p3 = {address4k[`ADDRESS_LEN - 1:2], 2'b11}; // address4k + 3

	assign ready = 1'b1;
	assign ReadData = (MemRead == `ENABLE) ?
			{data[address4k], data[address4k_p1], data[address4k_p2], data[address4k_p3]}
			: `INSTRUCTION_LEN'b0;

	integer counter = 0;
	always @(posedge clk, posedge rst) begin
		if (rst) begin
			for(counter=0; counter < `DATA_MEMORY_SIZE; counter=counter+1)
				data[counter] <= 0;
		end
		else if (MemWrite) begin
			data[address4k_p3] = WriteData[`INSTRUCTION_MEM_LEN - 1:0];
			// write to data[address + 1]
			data[address4k_p2] = WriteData[`INSTRUCTION_MEM_LEN + `INSTRUCTION_MEM_LEN - 1 : `INSTRUCTION_MEM_LEN];

			// write to data[address + 2]
			data[address4k_p1] = WriteData[`INSTRUCTION_MEM_LEN + `INSTRUCTION_MEM_LEN + `INSTRUCTION_MEM_LEN - 1 : `INSTRUCTION_MEM_LEN + `INSTRUCTION_MEM_LEN];

			// write to data[address + 3]
			data[address4k] = WriteData[`INSTRUCTION_MEM_LEN + `INSTRUCTION_MEM_LEN + `INSTRUCTION_MEM_LEN + `INSTRUCTION_MEM_LEN - 1 : `INSTRUCTION_MEM_LEN + `INSTRUCTION_MEM_LEN + `INSTRUCTION_MEM_LEN];
		end
	end

endmodule
