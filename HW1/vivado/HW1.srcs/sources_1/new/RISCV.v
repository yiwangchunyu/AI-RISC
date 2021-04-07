`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/25 22:26:00
// Design Name: 
// Module Name: RISCV
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


module RISCV(
    input clk,rst
    );
    wire 	[15:0]	inst;
	
	wire	[3:0]	rs1_addr;
	wire	[3:0]	rs2_addr;
	wire	[3:0]	rd_addr;
	wire	[15:0]	dcm_addr;
	wire	[15:0]	dcm_o;
	wire	[15:0]	rs1_data;
	wire	[15:0]	rs2_data;
	wire	[15:0]	rd_data;
	wire	[15:0]	imm_add_sum;
	wire	[15:0]	mac_res;
	wire			rdW;
	wire			dcmW;
	wire	[4:0]	imm5;
	wire	[8:0]	imm9;
	wire			funct;
	wire 			mux1;
	wire	[1:0]	mux2;
	wire 			macEn;
	
    
	icmem icmem_0(
		.clk(clk),
		.rst(rst),
		.inst(inst)
	);
	dcmem dcmem_0(
		.clk(clk),
		.MemWEn(dcmW),
		.addr(dcm_addr),
		.dataw(rs2_data),
		.datar(dcm_o)
	);
	ID id_0(
		.rst(rst),
		.inst(inst),
		.rs1_addr(rs1_addr),
		.rs2_addr(rs2_addr),
		.rd_addr(rd_addr),
		.rdW(rdW),
		.dcmW(dcmW),
		.imm5(imm5),
		.imm9(imm9),
		.funct(funct),
		.mux1(mux1),
		.mux2(mux2),
		.macEn(macEn)
	);
	regfile regfile_0(
		.clk(clk),
		.rst(rst),
		.rs1_addr(rs1_addr),
		.rs2_addr(rs2_addr),
		.rd_addr(rd_addr),
		.RegWEn(rdW),
		.rs1_data(rs1_data),
		.rs2_data(rs2_data),
		.rd_data(rd_data)
	);
	IMM_ADD imm_add_0(
		.imm(imm5),
		.rs1(rs1_data),
		.dst(imm_add_sum)
	);
	MAC_ALU mac_alu_0(
		.clk(clk),
		.funct(funct),
		.macEn(macEn),
		.rs1(rs1_data),
		.rs2(rs2_data),
		.rd(mac_res)
	);
	MUX2 mux1_0(
		.S(mux1),
		.A(imm_add_sum),
		.B(rs1_data),
		.Y(dcm_addr)
	);
	MUX3 mux2_0(
		.S(mux2),
		.A(mac_res),
		.B(imm9),
		.C(dcm_o),
		.Y(rd_data)
	);
endmodule
