`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/23 22:39:44
// Design Name: 
// Module Name: controller
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


module controller(
	input [31:0]instr, 
	output jump, branch, alusrc, memwrite,
	memtoreg, regwrite, regdst, 
	output [2:0]Alucontrol
    );
	
	wire [1:0]Aluop;

	ALU_control actro(
		.func(instr[5:0]), 
		.Aluop(Aluop), 
		.Alucontrol(Alucontrol)
		);

	maindecoder mdcer(
		.op(instr[31:26]), 
		.jump(jump), 
		.branch(branch), 
		.alusrc(alusrc), 
		.memwrite(memwrite), 
		.memtoreg(memtoreg), 
		.regwrite(regwrite), 
		.regdst(regdst), 
		.Aluop(Aluop)
		);

endmodule
