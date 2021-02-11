`include "Defines.v"

module IF_Stage_Module (
	input clk, rst,
  input freeze_in, Branch_taken_in, flush_in,
	input[`ADDRESS_LEN - 1:0] BranchAddr_in,

	//NEWWW
	input swap_2_in,
	input	stop_if_in,

  //outputs from reg:
  output wire [`INSTRUCTION_LEN - 1:0] PC_out, Instruction_out,

	//NEW
	output wire swap_2_out
);

	wire[`ADDRESS_LEN - 1 : 0] pc_in, pc_out, PC_middle;

	// PC+4 Or Branch Address
	MUX_2_to_1 #(.WORD_LENGTH(`ADDRESS_LEN)) PC_Mux(
			.first(PC_middle), .second(BranchAddr_in),
			.sel_first(~Branch_taken_in), .sel_second(Branch_taken_in),
			.out(pc_in)
	);

	Register #(.WORD_LENGTH(`ADDRESS_LEN)) PC_Module(
			.clk(clk), .rst(rst), .ld(~freeze_in),
			.in(pc_in), .out(pc_out)
	);

	// assign pc_out = PC_middle + 4;
	Incrementer #(.WORD_LENGTH(`ADDRESS_LEN)) PC_Incrementer(
			.in(pc_out), .out(PC_middle)
	);

	// #### Instruction Memory ####
	reg[`INSTRUCTION_LEN - 1:0] instruction_write_data;
	wire[`INSTRUCTION_LEN - 1:0] ReadData;

	InstructionMemory Instruction_Mem(.clk(clk), .rst(rst), .address(pc_out),
			.WriteData(instruction_write_data), .MemRead(1'b1),
			.MemWrite(1'b0), .ReadData(ReadData)
	);

	assign freeze_or_swap = freeze_in | stop_if_in;
	Register_Flush #(.WORD_LENGTH(`ADDRESS_LEN)) reg_PC_in(.clk(clk), .rst(rst), .flush(flush_in),
			.ld(~freeze_or_swap), .in(PC_middle), .out(PC_out));

	Register_Flush #(.WORD_LENGTH(`ADDRESS_LEN)) reg_Instruction(.clk(clk), .rst(rst), .flush(flush_in),
			.ld(~freeze_or_swap), .in(ReadData), .out(Instruction_out));

	Register_Flush #(.WORD_LENGTH(1)) reg_swap_command(.clk(clk), .rst(rst), .flush(flush_in),
			.ld(~freeze_in), .in(swap_2_in), .out(swap_2_out));

endmodule
