`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/25 22:41:27
// Design Name: 
// Module Name: RISCV_tb
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


module RISCV_tb(

    );
	reg clk,rst;

	initial begin
		clk=1'b0;
		forever #10 clk=~clk;
	end
	initial begin
		rst=1'b0;
		#20 rst=1'b1;
		
		#1000   $stop;  

	end
	
	RISCV riscv(
		.clk(clk),
		.rst(rst)
	);
endmodule
