`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/22 10:31:52
// Design Name: 
// Module Name: icmem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module icmem #(
	parameter PC_WIDTH=16,
	parameter ISA_WIDTH=16,
	parameter MEM_NUMBER=100
    )(
		input 							clk,
		input 							rst,
		output	[ISA_WIDTH-1:0]	        inst
		
	);
	reg[PC_WIDTH-1:0] pc;
	reg [PC_WIDTH-1:0] RAM[MEM_NUMBER-1:0];
	
	initial $readmemb("inst_mem.txt",RAM);
	
	always@(posedge clk or negedge rst)
	   if (!rst)
	       pc<=0;
	   else
	       pc<=pc+1;
	       
	assign inst = RAM[pc];
endmodule
