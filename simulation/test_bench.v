`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/25 19:30:17
// Design Name: 
// Module Name: test_bench
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


module test_bench(

    );
	
	reg rst;
	reg clk;
	wire [7:0] ans;
	wire [6:0] seg;
	wire [10:0] led;

	initial
	begin 
		clk = 1'b0;
		rst = 1'b1;
		#20;
		rst = 1'b0;
	end
	always begin
		#10 clk = ~clk;
	end

	always begin
		#40
		$write("memtoreg:%b ", led[0]);
		$write("memwrite:%b ", led[1]);
		$write("pcsrc:%b ", led[2]);
		$write("alusrc:%b ", led[3]);
		$write("regdst:%b ", led[4]);
		$write("regwrite:%b ", led[5]);
		$write("jump:%b ", led[6]);
		$write("branch:%b ", led[7]);
		$write("alucontrol:%b \n", led[10:8]);
	end

	top t(
		.hclk(clk),
		.rst(rst),
		.seg(seg),
	    .ans(ans),
	    .led(led)
		);

	
endmodule
