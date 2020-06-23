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
	input hclk, 
	output jump, branch, alusrc, memwrite, 
	memtoreg, regwrite, regdst, 
	output [2:0]Alucontrol
    );

wire lclk;
wire [31:0]nextInstAddr, instAddr;
wire [31:0]inst; //instruction

Clk_div #(
	.HALF_DIV(5)
	)
	div(
	.hclk(hckl), 
	.lclk(lclk)
	);

PC_32b pc(
	.clk(lclk), 
	.clr(1'b0), 
	.addr_in(nextInstAddr), 
	.addr_out(instAddr)
	);

PC_adder_32b padder(
	.addr_in(instAddr), 
	.offset(4), 
	.addr_out(nextInstAddr)
	);

instruction_mem instmem(
  .clka(lclk),    // input wire clka
  .ena(1),      // input wire ena
  .wea(0),      // input wire [0 : 0] wea
  .addra(instAddr[9:0]),  // input wire [9 : 0] addra
  .dina(32'b0),    // input wire [31 : 0] dina
  .douta(inst)  // output wire [31 : 0] douta
);




endmodule
