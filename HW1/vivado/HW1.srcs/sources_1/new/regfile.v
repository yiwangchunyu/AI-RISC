`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/24 22:43:25
// Design Name: 
// Module Name: regfile
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


module regfile#(
		parameter REG_ADDR_WIDTH=4,
		parameter RED_DATA_WIDTH=16,
		parameter REG_NUMBER=16
	)(
		input [REG_ADDR_WIDTH-1:0] rs1_addr,
		input [REG_ADDR_WIDTH-1:0] rs2_addr,
		input [REG_ADDR_WIDTH-1:0] rd_addr,
		input [RED_DATA_WIDTH-1:0] rd_data,
		input RegWEn,
		input clk,rst,
		output [RED_DATA_WIDTH-1:0] rs1_data,
		output [RED_DATA_WIDTH-1:0] rs2_data
    );
	reg [RED_DATA_WIDTH-1:0] rf[REG_NUMBER-1:0];
	
	assign rs1_data = rs1_addr==0?0:rf[rs1_addr];
	assign rs2_data = rs2_addr==0?0:rf[rs2_addr];
    integer i;
	always@(posedge clk or negedge rst)begin
		if(!rst) begin
			for(i=0;i<REG_NUMBER;i=i+1)begin
				rf[i]<=0;
			end
		end
		else if(RegWEn&&rd_addr!=0)
			rf[rd_addr]<=rd_data;
	end
endmodule
