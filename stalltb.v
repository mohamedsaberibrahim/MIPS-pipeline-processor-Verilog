`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:23:20 12/07/2017
// Design Name:   StallControl
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/stalltb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StallControl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
/*
module stalltb;

	// Inputs
	reg EX_MemRead;
	reg [4:0] EX_rt;
	reg [4:0] ID_rs;
	reg [4:0] ID_rt;

	// Outputs
	wire PC_WriteEn;
	wire IFID_WriteEn;
	wire Stall_flush;
	// Instantiate the Unit Under Test (UUT)
	StallControl uut (
		.PC_WriteEn(PC_WriteEn), 
		.IFID_WriteEn(IFID_WriteEn), 
		.Stall_flush(Stall_flush), 
		.EX_MemRead(EX_MemRead), 
		.EX_rt(EX_rt), 
		.ID_rs(ID_rs), 
		.ID_rt(ID_rt), 
	);

	initial begin
		// Initialize Inputs
		EX_MemRead = 0;
		EX_rt = 0;
		ID_rs = 0;
		ID_rt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule
*/
module stalltb;

wire PC_WriteEn;
wire IFID_WriteEn;
wire Stall_flush;
reg	EX_MemRead;
reg [4:0] EX_rt;
reg [4:0] ID_rs;
reg [4:0] ID_rt;
StallControl mystall(
	PC_WriteEn,IFID_WriteEn,Stall_flush,
	EX_MemRead,EX_rt,ID_rs,ID_rt,
	);

initial 
begin 
$monitor($time,,"%b %b %b",PC_WriteEn,IFID_WriteEn,Stall_flush);
EX_MemRead=1'b1;
EX_rt=5'b10010;
ID_rs=5'b10010;
ID_rt=5'b10010;
#10
EX_MemRead=1'b1;
EX_rt=5'b10000;
ID_rs=5'b10010;
ID_rt=5'b10010;
#10
EX_MemRead=1'b1;
EX_rt=5'b10010;
ID_rs=5'b10010;
ID_rt=5'b10000;
end
endmodule 

