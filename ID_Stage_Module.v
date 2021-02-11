`include "Defines.v"

module ID_Stage_Module(
	// inputs to main module:
		input clk,
		input rst,
		input flush,
		input freeze,
		input[`ADDRESS_LEN - 1:0] PC_in,
		input [`INSTRUCTION_LEN - 1 : 0] Instruction_in,
		input [3:0] status_reg_in,

	// Register file inputs:
		input [`REGISTER_LEN - 1:0] reg_file_wb_data,
		input [`REG_ADDRESS_LEN - 1:0] reg_file_wb_address,
		input reg_file_wb_en, hazard,

	//NEWWW
		input swap_2_in,

	// outputs from Stage:
		output wire two_src_out, ignore_hazard_out,
		output wire [`REG_ADDRESS_LEN - 1:0] reg_file_second_src_out, reg_file_first_src_out,

	// outputs from Reg:
		output wire [`ADDRESS_LEN - 1:0] PC_out,
		output wire mem_read_en_out, mem_write_en_out,
			wb_enable_out, immediate_out,
			branch_taken_out, status_write_enable_out,

		output wire [`EXECUTE_COMMAND_LEN - 1 : 0] execute_command_out,
		output wire [`REGISTER_LEN - 1:0] reg_file_out1, reg_file_out2,
		output wire [`REG_ADDRESS_LEN - 1:0] dest_reg_out,
		output wire [`SIGNED_IMMEDIATE_LEN - 1:0] signed_immediate_out,
		output wire [`SHIFT_OPERAND_LEN - 1:0] shift_operand_out,
		output wire [3:0] status_reg_out,

		output wire [`REG_ADDRESS_LEN - 1:0] staged_reg_file_second_src_out,
			staged_reg_file_first_src_out,


		//NEW
		output wire swap_2_out,stop_if_out

);

	wire[`REG_ADDRESS_LEN - 1:0] reg_file_src1, reg_file_src2;

	// Outputs of Control Unit
	wire[`EXECUTE_COMMAND_LEN - 1 : 0] execute_command;
	wire mem_read, mem_write,
		wb_enable, immediate,
		branch_taken, status_write_enable,
		cond_state, control_unit_mux_enable;

	// Outputs of Control Unit
	wire[`EXECUTE_COMMAND_LEN - 1 : 0] execute_command_mux;
	wire mem_read_en_mux, mem_write_en_mux,
		wb_enable_mux, immediate_mux,
		branch_taken_mux, status_write_enable_mux;

	// Number of control signals = 6
	wire[`EXECUTE_COMMAND_LEN + 6 - 1 : 0] control_unit_mux_in, control_unit_mux_out;

	wire[`REG_ADDRESS_LEN - 1:0] dest_reg_in;
	wire[`SIGNED_IMMEDIATE_LEN - 1:0] signed_immediate_in;
	wire[`SHIFT_OPERAND_LEN - 1:0] shift_operand_in;


	wire[`REGISTER_LEN - 1:0] reg_file_in1, reg_file_in2;

	//NEW
	wire choose_rn_as_des, stop_if_out_reg, swap_2_out_reg;

	// Control Unit
	ControlUnit control_unit(
		// inputs:
		.mode(Instruction_in[27 : 26]), .opcode(Instruction_in[24 : 21]),
		.s(Instruction_in[20]), .immediate_in(Instruction_in[25]),
		//NEW
		.swap_2_in(swap_2_in),
		// outputs:
		.execute_command(execute_command),
		.mem_read(mem_read), .mem_write(mem_write),
		.wb_enable(wb_enable), .immediate(immediate),
		.branch_taken(branch_taken),
		.status_write_enable(status_write_enable),
		.ignore_hazard(ignore_hazard_out),

		//NEW
		.choose_rn_as_des(choose_rn_as_des),
		.stop_if_out(stop_if_out_reg),
		.swap_2_out(swap_2_out_reg)
	);


	// Register File
	MUX_2_to_1 #(.WORD_LENGTH(`REGISTER_LEN)) reg_file_src2_mux(
			.first(Instruction_in[15:12]), .second(Instruction_in[3:0]),
			.sel_first(mem_write), .sel_second(~mem_write),
			.out(reg_file_src2));

	assign reg_file_src1 = Instruction_in[19:16];


	RegisterFile register_file(
		.clk(clk), .rst(rst),
		.src1(reg_file_src1), .src2(reg_file_src2),
		.dest_wb(reg_file_wb_address),
		.result_wb(reg_file_wb_data),
		.writeBackEn(reg_file_wb_en),
		.reg1(reg_file_in1), .reg2(reg_file_in2)
	);

	// NEWWW
	MUX_2_to_1 #(.WORD_LENGTH(`REGISTER_LEN)) reg_file_swap_rn_mux(
			.first(reg_file_in1), .second(reg_file_in2),
			.sel_first(choose_rn_as_des), .sel_second(~choose_rn_as_des),
			.out(reg_file_in1));


	// Conditional Check
	ConditionalCheck conditional_check(
		.cond(Instruction_in[31:28]),
		.statusRegister(status_reg_in),
		.condState(cond_state)
    );

	// Other Components
	assign control_unit_mux_in = {execute_command, mem_read, mem_write,
			immediate, wb_enable, branch_taken,
			status_write_enable};

	assign control_unit_mux_enable = hazard | (~cond_state);

	 MUX_2_to_1 #(.WORD_LENGTH(`EXECUTE_COMMAND_LEN + 6)) control_unit_mux(
			 .first(control_unit_mux_in), .second(10'b0),
			 .sel_first(~control_unit_mux_enable),
			 .sel_second(control_unit_mux_enable),
			 .out(control_unit_mux_out));

	assign {execute_command_mux, mem_read_en_mux, mem_write_en_mux, immediate_mux, wb_enable_mux,
		branch_taken_mux, status_write_enable_mux} = control_unit_mux_out;

	assign shift_operand_in = Instruction_in[`SHIFT_OPERAND_INDEX - 1:0];

	//NEW WB DES MUX
	MUX_2_to_1 #(.WORD_LENGTH(4)) reg_file_des_mux(
			.first(Instruction_in[15:12]), .second(Instruction_in[19:16]),
			.sel_first(choose_rn_as_des), .sel_second(~choose_rn_as_des),
			.out(dest_reg_in));
	// assign dest_reg_in = Instruction_in[15:12];

	assign signed_immediate_in = Instruction_in[23:0];


	//Outputs to Hazard
	assign reg_file_second_src_out = reg_file_src2;
	assign reg_file_first_src_out = reg_file_src1;
	assign two_src_out = (~Instruction_in[25]) | mem_write_en_mux;


// ID stage Pipe Register

	Register_Flush #(.WORD_LENGTH(`ADDRESS_LEN)) reg_PC_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(PC_in), .out(PC_out));

	Register_Flush #(.WORD_LENGTH(1)) reg_mem_read_en_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(mem_read_en_mux), .out(mem_read_en_out));

	Register_Flush #(.WORD_LENGTH(1)) reg_mem_write_en_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(mem_write_en_mux), .out(mem_write_en_out));

	Register_Flush #(.WORD_LENGTH(1)) reg_wb_enable_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(wb_enable_mux), .out(wb_enable_out));

	Register_Flush #(.WORD_LENGTH(1)) reg_branch_taken_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(branch_taken_mux), .out(branch_taken_out));

	Register_Flush #(.WORD_LENGTH(1)) reg_status_write_enable_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(status_write_enable_mux), .out(status_write_enable_out));

	Register_Flush #(.WORD_LENGTH(`EXECUTE_COMMAND_LEN)) reg_execute_command_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(execute_command_mux), .out(execute_command_out));

	Register_Flush #(.WORD_LENGTH(`REGISTER_LEN)) reg_reg_file_in1(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(reg_file_in1), .out(reg_file_out1));

	Register_Flush #(.WORD_LENGTH(`REGISTER_LEN)) reg_reg_file_in2(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(reg_file_in2), .out(reg_file_out2));

	Register_Flush #(.WORD_LENGTH(`REG_ADDRESS_LEN)) reg_dest_reg_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(dest_reg_in), .out(dest_reg_out));

	Register_Flush #(.WORD_LENGTH(4)) reg_status_reg_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(status_reg_in), .out(status_reg_out));

	Register_Flush #(.WORD_LENGTH(1)) reg_immediate_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(immediate_mux), .out(immediate_out));

	Register_Flush #(.WORD_LENGTH(`SIGNED_IMMEDIATE_LEN)) reg_signed_immediate_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(signed_immediate_in), .out(signed_immediate_out));

	Register_Flush #(.WORD_LENGTH(`SHIFT_OPERAND_LEN)) reg_shift_operand_in(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(shift_operand_in), .out(shift_operand_out));

	Register_Flush #(.WORD_LENGTH(`REG_ADDRESS_LEN)) forwarding_reg_in1(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(reg_file_src1), .out(staged_reg_file_first_src_out));

	Register_Flush #(.WORD_LENGTH(`REG_ADDRESS_LEN)) forwarding_reg_in2(.clk(clk), .rst(rst), .flush(flush),
			.ld(~freeze), .in(reg_file_src2), .out(staged_reg_file_second_src_out));

	//NEW
	Register_Flush #(.WORD_LENGTH(1)) stop_of_swap(.clk(clk), .rst(rst), .flush(flush),
		.ld(~freeze), .in(stop_if_out_reg), .out(stop_if_out) );

	Register_Flush #(.WORD_LENGTH(1)) swap_cycle_2(.clk(clk), .rst(rst), .flush(flush),
		.ld(~freeze), .in(swap_2_out_reg), .out(swap_2_out));

endmodule
