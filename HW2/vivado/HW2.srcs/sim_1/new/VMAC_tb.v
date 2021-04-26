`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/23 21:58:25
// Design Name: 
// Module Name: VMAC_tb
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


module VMAC_tb(

    );
    reg clk,rst,en;
    reg [31:0] vrs1,vrs2;
    reg [3:0]  funct;
    
    wire [31:0] vrd;

	initial begin
		clk=1'b0;
		forever #10 clk=~clk;
	end
	initial begin
		rst=1'b1;
		#10 rst=1'b0;
		#10 rst=1'b1;
		#15
		en=1'b1;
		vrs1 = 32'b00000011000000010000000100000001;
		vrs2 = 0;
		funct=4'b1000;
		#20
		vrs1 = 32'b00000010000000100000001000000010;
		vrs2 = 32'b00000001000000100000001100000100;
		funct=4'b0000;
		#20
		vrs1 = 32'b00000011000000110000001100000011;
		vrs2 = 32'b00000001000000100000001100000100;
		funct=4'b0001;
		#20
		vrs1 = 32'b00000111000011110001111100111111;
		vrs2 = 32'b00000001000000100000001100000100;
		funct=4'b0010;
		#20
		vrs1 = 32'b00001000000010000000100000001000;
		vrs2 = 32'b00000001000000100000001100000100;
		funct=4'b0111;
		#20
		en=0;
		#1000   $stop;  

	end
	
	VMAC vmac_1(
		.clk(clk),
		.rst(rst),
		.en(en),
		.vrs1(vrs1),
		.vrs2(vrs2),
		.funct(funct),
		.vrd(vrd)
	);
endmodule
