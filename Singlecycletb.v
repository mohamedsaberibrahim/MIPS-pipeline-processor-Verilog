`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:02:06 12/04/2017
// Design Name:   SingleCycle
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/Singlecycletb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SingleCycle
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Singlecycletb;

	// Inputs
	reg clk;
	reg reset;
	
	// Outputs
	wire [31:0] result;
	wire [31:0] instruction;
	wire [31:0] PC_out;
	wire [31:0]PCbranch;
	wire branchsel;
	wire RegDst;
	wire  RegWrite;
	wire MemtoReg;
	wire MemRead;
	wire MemWrite;
	wire	Branch;
	wire ALUSrc;
	wire[4:0]rs;
	wire [4:0]rt;
	wire [4:0]rd;
 wire[1:0] ALUOp;
  wire [3:0]ALUcontrol;
wire [31:0]register1;
wire [31:0]aluin;
wire [31:0] writeData;
	// Instantiate the Unit Under Test (UUT)
	SingleCycle uut (
		.clk(clk), 
		.reset(reset), 
		.result(result),
		.instruction(instruction),
		.PC_out(PC_out),
		.PCbranch(PCbranch),
		.branchsel(branchsel),
		.RegDst(RegDst),
		.ALUSrc(ALUSrc),
	  .RegWrite(RegWrite),
	 .MemtoReg(MemtoReg),
	 .MemRead(MemRead),
	.MemWrite(MemWrite),
	.Branch(Branch),
 .ALUOp(ALUOp),
  .ALUcontrol(ALUcontrol),
  .rs(rs),.rt(rt),.rd(rd),
.register1(register1),
.aluin(aluin),
.writeData(writeData));
	always
	begin
	#5 clk = ~clk;
	end
	initial begin
		$monitor($time,,"PC=%d PCbranch=%d branchsel=%b instruction=%h result=%h regdst=%b ALUSrc=%b regwrite=%b memtoreg=%b memread=%b memwrite=%b branch=%b ALUOP=%b ALUop=%d rs=%d rt=%d rd=%d reg1=%h reg2=%h writeData=%h",PC_out,PCbranch,branchsel,instruction,result,RegDst,ALUSrc,RegWrite,MemtoReg,MemRead,MemWrite,Branch,ALUOp,ALUcontrol,rs,rt,rd,register1,aluin,writeData);
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100
		reset =0;
        
		// Add stimulus here

	end
endmodule

