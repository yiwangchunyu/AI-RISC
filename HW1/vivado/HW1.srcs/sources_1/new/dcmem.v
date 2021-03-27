`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/22 00:56:10
// Design Name: 
// Module Name: dcmem
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


module dcmem #(
	parameter MEM_ADDR_WIDTH=5,
	parameter MEM_DATA_WIDTH=16,
	parameter MEM_NUMBER=32
    )(
		input 							clk,
		input 							MemWEn,  //memory write enabel
		input 	[MEM_ADDR_WIDTH-1:0]	addr,
		input	[MEM_DATA_WIDTH-1:0]	dataw,
		output	[MEM_DATA_WIDTH-1:0]	datar
		
	);
	reg [MEM_DATA_WIDTH-1:0] RAM[MEM_NUMBER-1:0];
	initial $readmemb("data_mem.txt",RAM);

	always@(posedge clk)begin
		if(MemWEn)begin
			RAM[addr]<=dataw;
		end
	end

    assign datar = RAM[addr];
endmodule


