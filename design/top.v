`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/24 00:28:10
// Design Name: 
// Module Name: top
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


module top(
	input hclk, rst,
	output [6:0]seg, 
	output [7:0]ans, 
	output [10:0]led
    );

wire lclk;
wire [31:0]nextInstAddr, instAddr;
wire [31:0]instr; //instruction

wire jump, branch, alusrc, memwrite, 
memtoreg, regwrite, regdst;
wire [2:0]Alucontrol;

Clk_div	#(
	.HALF_DIV(1)
	)
	div(
	.hclk(hclk), 
	.lclk(lclk)
	);

PC_32b pc(
	.clk(lclk), 
	.clr(rst), 
	.addr_in(nextInstAddr), 
	.addr_out(instAddr)
	);

PC_adder_32b padder(
	.addr_in(instAddr), 
	.offset(4), 
	.addr_out(nextInstAddr)
	);

blk_mem_gen_0 instmem(
  .clka(lclk),    // input wire clka
  .ena(1),      // input wire ena
  .wea(0),      // input wire [0 : 0] wea
  .addra(instAddr),  // input wire [9 : 0] addra
  .dina(32'b0),    // input wire [31 : 0] dina
  .douta(instr)  // output wire [31 : 0] douta
);

controller contr(
	.instr(instr), 
	.jump(jump), 
	.branch(branch), 
	.alusrc(alusrc), 
	.memwrite(memwrite), 
	.memtoreg(memtoreg), 
	.regwrite(regwrite), 
	.regdst(regdst), 
	.Alucontrol(Alucontrol)
	);

display disp(
	.clk(hclk), 
	.reset(rst), 
	.s(instr), 
	.seg(seg), 
	.ans(ans)
	);

assign led = {Alucontrol, branch, jump, regwrite, regdst, 
				alusrc, 1'b0, memwrite, memtoreg};




endmodule
