`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 23:02:15
// Design Name: 
// Module Name: MAC_ALU
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


module MAC_ALU#(
		parameter REG_DATA_WIDTH=16
	)(
		input funct, clk, macEn,
		input [REG_DATA_WIDTH-1:0] rs1,rs2,
		output [REG_DATA_WIDTH-1:0] rd
    );
	wire [REG_DATA_WIDTH-1:0] product;
	wire [REG_DATA_WIDTH-1:0] addend1,addend2;
	reg  [REG_DATA_WIDTH-1:0] psum;
	
	assign product = $signed(rs1)*$signed(rs2);
	assign addend1 = funct?0:product;
	assign addend2 = funct?rs1:psum;
	assign rd	   = addend1+addend2;
	
	always@(posedge clk) begin
		if(macEn)
            psum<=rd;
	end
endmodule
