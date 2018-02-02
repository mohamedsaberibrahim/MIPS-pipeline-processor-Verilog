`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:39:08 12/03/2017
// Design Name:   instructionmemory
// Module Name:   C:/Users/Mohamed Saber/Desktop/projects/PipelineProject/instructionmemorytb.v
// Project Name:  PipelineProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instructionmemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module instructionmemorytb;

	// Inputs
	reg CLK;
	reg [11:0] addr;
	reg reset;
	// Outputs
	wire [31:0] instr;

	// Instantiate the Unit Under Test (UUT)
	instructionmemory yala(
		.CLK(CLK), 
		.instruction(instr), 
		.instructionAddress(addr[11:2]),
		.reset(reset)
	);
	always
	begin
	#5 CLK=~CLK;
	end
	initial begin
		// Initialize Inputs
		$monitor("Mem Address=%h instruction=%b",addr,instr);
		reset=1;
		CLK=0;
		#100
		reset=0;
addr=32'd0;
#5 addr=32'd4;
#5 addr=32'd8;
#5 addr=32'd12;
#5 addr=32'd16;
#5 addr=32'd20;
#5 addr=32'd20;
#5 addr=32'd24;
#5 addr=32'd28;
	end
      
endmodule

