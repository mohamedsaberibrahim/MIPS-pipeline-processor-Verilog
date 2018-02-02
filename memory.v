	`timescale 1ns / 1ps
	//////////////////////////////////////////////////////////////////////////////////
	// Company: 
	// Engineer: 
	// 
	// Create Date:    13:56:17 12/03/2017 
	// Design Name: 
	// Module Name:    memory 
	// Project Name: 
	// Target Devices: 
	// Tool versions: 
	// Description: 
	//
	// Dependencies: 
	//
	// Revision: 
	// Revision 0.01 - File Created
	// Additional Comments: 
	//
	//////////////////////////////////////////////////////////////////////////////////
	module data_memory (
	input [31:0] addr,          // Memory Address
	input [31:0] write_data,    // Memory Address Contents
	input memwrite, memread,
	input clk,                  // All synchronous elements, including memories, should have a clock signal
	output reg [31:0] read_data =0  // Output of Memory Address Contents
	);
	
	reg [31:0] MEMO[0:1024];  

	integer i;
	integer file;
	always @ (posedge clk)
	begin
		if ((memwrite))
			begin
				MEMO[addr] <= write_data;
				file = $fopen("E:/mymemory.txt");
				$fmonitor(file,"@%h \n%b",addr,write_data);
			end
	end
	always @(addr or memread or MEMO[addr])
		begin
			read_data<='b0;
			if (memread)
				begin
					$readmemb("E:\mymemory.txt",MEMO);
					read_data <= MEMO[addr];
				end
		end
	endmodule
	