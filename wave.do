onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Arm /TB/CLOCK_50
add wave -noupdate -expand -group Arm /TB/rst
add wave -noupdate -expand -group Arm /TB/en_forwarding
add wave -noupdate -expand -group IF /TB/ARM/IF_Stage_Module/clk
add wave -noupdate -expand -group IF /TB/ARM/IF_Stage_Module/rst
add wave -noupdate -expand -group IF /TB/ARM/IF_Stage_Module/freeze_in
add wave -noupdate -expand -group IF /TB/ARM/IF_Stage_Module/Branch_taken_in
add wave -noupdate -expand -group IF /TB/ARM/IF_Stage_Module/flush_in
add wave -noupdate -expand -group IF -radix unsigned /TB/ARM/IF_Stage_Module/BranchAddr_in
add wave -noupdate -expand -group IF -radix unsigned /TB/ARM/IF_Stage_Module/PC_out
add wave -noupdate -expand -group IF -radix binary -childformat {{{/TB/ARM/IF_Stage_Module/Instruction_out[31]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[30]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[29]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[28]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[27]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[26]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[25]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[24]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[23]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[22]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[21]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[20]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[19]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[18]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[17]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[16]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[15]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[14]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[13]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[12]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[11]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[10]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[9]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[8]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[7]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[6]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[5]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[4]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[3]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[2]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[1]} -radix binary} {{/TB/ARM/IF_Stage_Module/Instruction_out[0]} -radix binary}} -subitemconfig {{/TB/ARM/IF_Stage_Module/Instruction_out[31]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[30]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[29]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[28]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[27]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[26]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[25]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[24]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[23]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[22]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[21]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[20]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[19]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[18]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[17]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[16]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[15]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[14]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[13]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[12]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[11]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[10]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[9]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[8]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[7]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[6]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[5]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[4]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[3]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[2]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[1]} {-height 15 -radix binary} {/TB/ARM/IF_Stage_Module/Instruction_out[0]} {-height 15 -radix binary}} /TB/ARM/IF_Stage_Module/Instruction_out
add wave -noupdate -expand -group IF -radix unsigned /TB/ARM/IF_Stage_Module/PC_middle
add wave -noupdate -expand -group IF -radix binary /TB/ARM/IF_Stage_Module/Instruction_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/ID_Stage/reg_file_out1
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/ID_Stage/reg_file_out2
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/clk
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/rst
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/flush
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/freeze
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/PC_in
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/Instruction_in
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/status_reg_in
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/reg_file_wb_data
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/reg_file_wb_address
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/reg_file_wb_en
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/hazard
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/two_src_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/ignore_hazard_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/reg_file_second_src_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/reg_file_first_src_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/PC_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/mem_read_en_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/mem_write_en_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/wb_enable_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/immediate_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/branch_taken_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/status_write_enable_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/execute_command_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/reg_file_out1
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/reg_file_out2
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/dest_reg_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/signed_immediate_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/shift_operand_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/status_reg_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/staged_reg_file_second_src_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/staged_reg_file_first_src_out
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/PC_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/mem_read_en_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/mem_write_en_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/wb_enable_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/immediate_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/branch_taken_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/status_write_enable_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/execute_command_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/reg_file_middle1
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/reg_file_middle2
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/dest_reg_middle
add wave -noupdate -expand -group ID -radix binary /TB/ARM/ID_Stage_Module/signed_immediate_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/shift_operand_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/src1_addr_middle
add wave -noupdate -expand -group ID /TB/ARM/ID_Stage_Module/src2_addr_middle
add wave -noupdate -expand -group ID -radix decimal -childformat {{{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[0]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[1]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[2]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[3]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[4]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[5]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[6]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[7]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[8]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[9]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[10]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[11]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[12]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[13]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[14]} -radix decimal} {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[15]} -radix decimal}} -subitemconfig {{/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[0]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[1]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[2]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[3]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[4]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[5]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[6]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[7]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[8]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[9]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[10]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[11]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[12]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[13]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[14]} {-height 15 -radix decimal} {/TB/ARM/ID_Stage_Module/ID_Stage/register_file/data[15]} {-height 15 -radix decimal}} /TB/ARM/ID_Stage_Module/ID_Stage/register_file/data
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/clk
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/rst
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/freeze
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/PC_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/wb_en_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/mem_r_en_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/mem_w_en_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/status_w_en_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/branch_taken_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/immd
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/exe_cmd
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/val_Rn
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/val_Rm_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/dest_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/signed_immd_24
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/shift_operand
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/status_reg_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/alu_mux_sel_src1
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/alu_mux_sel_src2
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/MEM_wb_value
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/WB_wb_value
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/wb_en_out
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/mem_r_en_out
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/mem_w_en_out
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/alu_res_out
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/val_Rm_out
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/dest_out
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/wb_en_hazard_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/dest_hazard_in
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/status_w_en_out
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/branch_taken_out
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/statusRegister_out
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/branch_address_out
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/wb_en_middle
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/mem_r_en_middle
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/mem_w_en_middle
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/branch_taken_middle
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/alu_res_middle
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/val_Rm_middle
add wave -noupdate -expand -group EX /TB/ARM/EX_Stage_Module/dest_middle
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/clk
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/rst
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/freeze
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/wb_en_in
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/mem_r_en_in
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/mem_w_en_in
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/alu_res_in
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/val_Rm
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/dest_in
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/wb_en_out
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/mem_r_en_out
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/alu_res_out
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/mem_res_out
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/dest_out
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/wb_en_hazard_in
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/ready
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/dest_hazard_in
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/wb_en_middle
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/mem_r_en_middle
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/alu_res_middle
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/mem_res_middle
add wave -noupdate -expand -group MEM /TB/ARM/MEM_Stage_Module/dest_middle
add wave -noupdate -expand -group MEM -expand /TB/ARM/MEM_Stage_Module/memory_stage/memory/data
add wave -noupdate -expand -group WB /TB/ARM/WB_Stage/clk
add wave -noupdate -expand -group WB /TB/ARM/WB_Stage/rst
add wave -noupdate -expand -group WB /TB/ARM/WB_Stage/mem_read_enable
add wave -noupdate -expand -group WB /TB/ARM/WB_Stage/wb_enable_in
add wave -noupdate -expand -group WB /TB/ARM/WB_Stage/alu_result
add wave -noupdate -expand -group WB /TB/ARM/WB_Stage/data_memory
add wave -noupdate -expand -group WB /TB/ARM/WB_Stage/wb_dest_in
add wave -noupdate -expand -group WB /TB/ARM/WB_Stage/wb_enable_out
add wave -noupdate -expand -group WB /TB/ARM/WB_Stage/wb_dest_out
add wave -noupdate -expand -group WB /TB/ARM/WB_Stage/wb_value
add wave -noupdate -expand -group Status_Reg /TB/ARM/Status_Register/clk
add wave -noupdate -expand -group Status_Reg /TB/ARM/Status_Register/rst
add wave -noupdate -expand -group Status_Reg /TB/ARM/Status_Register/ld
add wave -noupdate -expand -group Status_Reg /TB/ARM/Status_Register/data_in
add wave -noupdate -expand -group Status_Reg /TB/ARM/Status_Register/data_out
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/with_forwarding
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/have_two_src
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/ignore_hazard
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/ignore_from_forwarding
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/EXE_mem_read_en
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/src1_address
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/src2_address
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/exe_wb_dest
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/mem_wb_dest
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/exe_wb_en
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/mem_wb_en
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/hazard_detected
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/internal_hazard_with_forwarding
add wave -noupdate -expand -group Hazard /TB/ARM/hazard_detection_unit/internal_hazard_without_forwarding
add wave -noupdate /TB/ARM/forwarding/en_forwarding
add wave -noupdate /TB/ARM/forwarding/WB_wb_en
add wave -noupdate /TB/ARM/forwarding/MEM_wb_en
add wave -noupdate /TB/ARM/forwarding/MEM_dst
add wave -noupdate /TB/ARM/forwarding/WB_dst
add wave -noupdate /TB/ARM/forwarding/ID_src1
add wave -noupdate /TB/ARM/forwarding/ID_src2
add wave -noupdate /TB/ARM/forwarding/sel_src1
add wave -noupdate /TB/ARM/forwarding/sel_src2
add wave -noupdate /TB/ARM/forwarding/ignore_hazard
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {97 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 353
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {687 ns}
