`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:34:02 03/17/2019
// Design Name:   fdivision
// Module Name:   C:/myfpga/project/fdivision/vtf_fdivision.v
// Project Name:  fdivision
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fdivision
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vtf_fdivision;

	// Inputs
	reg rst;
	reg clk_in;
	reg [7:0] n;

	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
	fdivision uut (
		.rst(rst), 
		.clk_in(clk_in), 
		.clk_out(clk_out), 
		.n(n)
	);

	initial
		fork
			rst = 1;
			clk_in = 0;
			n = 6;
			#6 rst = 0;
			#7 rst = 1;
			#500 n = 11;
			#506 rst = 0;
			#507 rst = 1;
			#1000 $stop;
		join
    
	always #5 clk_in = ~clk_in;
	
endmodule

