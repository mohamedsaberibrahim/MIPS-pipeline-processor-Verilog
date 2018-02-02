`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:05:33 12/05/2017
// Design Name:   Pipeline
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/Pipelinetb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Pipelinetb;

	// Inputs
	reg reset;
	reg clk;

	// Outputs
	wire [31:0] instruction;
	wire [31:0] ID_Instruction;
	wire [31:0] EX_Instruction;
	wire [31:0]PC_out;
	wire [31:0]PCbranch;
	wire IFID_WriteEn;
	wire branchselect;
	wire [4:0] rs;
	wire [4:0] rt;
		 wire [31:0]ReadData1;
	 wire [31:0]ReadData2;
	 wire [31:0] Read1;
	 wire [31:0]Read2;
	 wire ID_zero;
	  wire [1:0]ID_ForwardA;
	wire [1:0]ID_ForwardB;
	wire Stall_flush;
	wire [31:0]Ext_imm;
	wire RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero;
	wire [4:0]EX_rs;
wire [4:0]EX_rt;
	wire[31:0]Bus_A_ALU;
	wire[31:0]Bus_B_ALU;
	wire EX_RegDst;
	wire [1:0]ForwardA;
	wire[1:0]ForwardB;
	wire [4:0]EX_WriteRegister;
	wire EX_ALUSrc;
	wire EX_MemtoReg;
	wire EX_RegWrite;
	wire EX_MemRead;
	wire EX_MemWrite;
	wire EX_Branch;
	wire EX_Jump;
	wire [1:0]EX_ALUOp;	
	wire[3:0]ALUControl;
	wire [31:0]EX_ALUResult;
	 wire[31:0]WB_WriteData;
	wire[4:0] WB_WriteRegister;
	wire WB_RegWrite;
	wire[31:0] MEM_ALUResult ;
	 wire[31:0]  WriteDataOfMem;
	 	wire [31:0]Memory_Write_forwarded;
	 wire[31:0]  MEM_ReadDataOfMem;
	 wire MEM_MemWrite;
	 wire MEM_MemRead;
	 wire Memoryforwarding;
	 wire WB_MemtoReg;
	 wire [31:0]EX_ReadData1;
	 wire [31:0]EX_ReadData2;
	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.reset(reset), 
		.clk(clk), 
		.PC_out(PC_out),
		.IFID_WriteEn(IFID_WriteEn),
		.PCbranch(PCbranch),
		.branchselect(branchselect),
		.instruction(instruction), 
		.ID_Instruction(ID_Instruction),
	 .Read1(Read1),
.Read2(Read2),.ID_zero(ID_zero),
.ID_ForwardA(ID_ForwardA),
.ID_ForwardB(ID_ForwardB),	
		.ReadData1(ReadData1),.ReadData2(ReadData2),.Ext_imm(Ext_imm),.Stall_flush(Stall_flush),
			.EX_Instruction(EX_Instruction),
		 .EX_RegDst(EX_RegDst),
 .EX_ALUSrc(EX_ALUSrc),
 .EX_MemtoReg(EX_MemtoReg),
 .EX_RegWrite(EX_RegWrite),
 .EX_MemRead(EX_MemRead),
 .EX_MemWrite(EX_MemWrite),
 .EX_Branch(EX_Branch),.ForwardA(ForwardA),.ForwardB(ForwardB),.EX_rs(EX_rs),.EX_rt(EX_rt),.Bus_A_ALU(Bus_A_ALU),.Bus_B_ALU(Bus_B_ALU),.EX_ALUOp(EX_ALUOp),.ALUControl(ALUControl),.EX_WriteRegister(EX_WriteRegister),.EX_ALUResult(EX_ALUResult),
 .MEM_ALUResult(MEM_ALUResult) ,
.WriteDataOfMem(WriteDataOfMem),	.Memory_Write_forwarded(Memory_Write_forwarded),
	 .MEM_ReadDataOfMem(MEM_ReadDataOfMem),
	 .MEM_MemWrite(MEM_MemWrite),
	 .MEM_MemRead(MEM_MemRead),
	 .Memoryforwarding(Memoryforwarding),
	.WB_WriteData(WB_WriteData),
	.WB_WriteRegister(WB_WriteRegister),
	.WB_RegWrite(WB_RegWrite),
	.WB_MemtoReg(WB_MemtoReg)
	);
	always
	begin
	#5 clk = ~clk;
	end
	initial
	begin
		$monitor($time,,"\nIF stage: PC=%d IFID_WriteEn=%b PCbranch=%d branchselect=%b instruction= %b\nID stage: ID_instruction=%b reg1=%d reg2=%d Read1=%d Read2=%d ID_zero=%b ID_ForwardA=%b ID_ForwardB=%b Ext_imm=%d Stall_flush=%b\nEX stage: EX_instruction=%b EX_RegDst=%b EX_ALUSrc=%b EX_MemtoReg=%b EX_RegWrite=%b EX_MemRead=%b EX_MemWrite=%b EX_Branch=%b EX_Jump=%b Addr1=%d Addr2=%d BusA=%d BusB=%d ForwardA=%b ForwardB=%b AluOP=%b controlalu=%d rd=%d result=%d\nMEM stage: MEM_ALUResult=%d WriteDataOfMem=%d Memory_Write_forwarded=%d MEM_ReadDataOfMem=%d MEM_MemWrite=%b MEM_MemRead=%b Memoryforwarding=%b\nWB stage: WB_WriteData=%d WB_WriteRegister=%d WB_RegWrite=%b WB_MemtoReg=%b\n ------------------------------------------------------------------------------------------------------------------------------------------------------------\n",
		PC_out,IFID_WriteEn,PCbranch,branchselect,instruction,ID_Instruction,ReadData1,ReadData2,Read1,Read2,ID_zero,ID_ForwardA,ID_ForwardB,	Ext_imm,Stall_flush,
		EX_Instruction, EX_RegDst, EX_ALUSrc, EX_MemtoReg,EX_RegWrite, EX_MemRead, EX_MemWrite, EX_Branch, EX_Jump,EX_rs,EX_rt,Bus_A_ALU,Bus_B_ALU,ForwardA,ForwardB,EX_ALUOp,ALUControl,EX_WriteRegister,EX_ALUResult,
		MEM_ALUResult ,WriteDataOfMem,Memory_Write_forwarded,MEM_ReadDataOfMem, MEM_MemWrite,MEM_MemRead,Memoryforwarding,
		WB_WriteData, WB_WriteRegister,WB_RegWrite,WB_MemtoReg);
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100
		reset=0;
		// Add stimulus here

	end
      
endmodule

