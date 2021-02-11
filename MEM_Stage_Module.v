`include "Defines.v"

module MEM_Stage_Module(
    //inputs to main moduel:
	input clk, rst, freeze,
	input wb_en_in, mem_r_en_in, mem_w_en_in,
	input [`REGISTER_LEN - 1:0] alu_res_in, val_Rm,
	input [`REG_ADDRESS_LEN - 1:0] dest_in,

  	// outputs from Reg:
	output wb_en_out, mem_r_en_out,
	output [`REGISTER_LEN - 1:0] alu_res_out, mem_res_out,
	output [`REG_ADDRESS_LEN - 1:0] dest_out,

  	//outputs from stage:
  output wb_en_hazard_in,
  output ready,
  output [`REG_ADDRESS_LEN - 1:0] dest_hazard_in
);

  wire [`REGISTER_LEN - 1:0] mem_res_in;
	//Hazard output
  assign wb_en_hazard_in = wb_en_in;
  assign dest_hazard_in = dest_in;



		Memory memory(.clk(clk), .rst(rst), .address(alu_res_in),
				.WriteData(val_Rm), .MemRead(mem_r_en_in), .MemWrite(mem_w_en_in),
				.ReadData(mem_res_in),
				.ready(ready)
		);


		Register #(.WORD_LENGTH(1)) reg_wb_en(.clk(clk), .rst(rst),
				.ld(1'b1), .in(wb_en_in), .out(wb_en_out)
		);

		Register #(.WORD_LENGTH(1)) reg_mem_r_en(.clk(clk), .rst(rst),
				.ld(1'b1), .in(mem_r_en_in), .out(mem_r_en_out)
		);

		Register #(.WORD_LENGTH(`REGISTER_LEN)) reg_alu_res(.clk(clk), .rst(rst),
				.ld(1'b1), .in(alu_res_in), .out(alu_res_out)
		);

		Register #(.WORD_LENGTH(`REGISTER_LEN)) reg_val_Rm(.clk(clk), .rst(rst),
				.ld(1'b1), .in(mem_res_in), .out(mem_res_out)
		);

		Register #(.WORD_LENGTH(`REG_ADDRESS_LEN)) reg_dest(.clk(clk), .rst(rst),
				.ld(1'b1), .in(dest_in), .out(dest_out)
		);


endmodule
