`timescale 1ns / 1ps

module maindecoder(
	input [5:0]op, 
	output reg jump, branch, alusrc, memwrite, 
	memtoreg, regwrite, regdst, 
	output reg [1:0]Aluop
);
	always@(*)begin
		case(op)
		6'b000000: begin
			jump = 0;
			branch = 0;
			alusrc = 0;
			memwrite = 0;
			memtoreg =0;
			regwrite = 1;
			regdst = 1;
			Aluop = 2'b10;

		end

		6'b100011: begin
			jump = 0;
			branch = 0;
			alusrc = 1;
			memwrite = 0;
			memtoreg =1;
			regwrite = 1;
			regdst = 0;
			Aluop = 2'b00;
			
		end

		6'b101011: begin
			jump = 0;
			branch = 0;
			alusrc = 1;
			memwrite = 1;
			memtoreg =0;
			regwrite = 0;
			regdst = 1;
			Aluop = 2'b00;
		end

		6'b000100: begin
			jump = 0;
			branch = 1;
			alusrc = 0;
			memwrite = 0;
			memtoreg =0;
			regwrite = 0;
			regdst = 1;
			Aluop = 2'b01;
		end

		6'b001000: begin
			jump = 0;
			branch = 0;
			alusrc = 1;
			memwrite = 0;
			memtoreg = 0;
			regwrite = 1;
			regdst = 0;
			Aluop = 2'b00;
		end

		6'b000010: begin
			jump = 1;
			branch = 0;
			alusrc = 0;
			memwrite = 0;
			memtoreg =0;
			regwrite = 0;
			regdst = 1;
			Aluop = 2'b00;
		end

		default: begin
			jump = 0;
			branch = 0;
			alusrc = 0;
			memwrite = 0;
			memtoreg =0;
			regwrite = 0;
			regdst = 0;
			Aluop = 2'b00;
		end
		endcase
	end
	
	

endmodule