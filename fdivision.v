`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:14 03/17/2019 
// Design Name: 
// Module Name:    fdivision 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//占空比为50%的任意分频器
//////////////////////////////////////////////////////////////////////////////////
module fdivision(rst,clk_in,clk_out,n
    );
	input rst,clk_in;
	input [7:0] n;
	output clk_out;
	reg [7:0] count,count1,count2;
	reg even_out;
	reg odd_out1,odd_out2;
	
	assign odd_out = odd_out1 | odd_out2;
	assign clk_out = (n[0] == 0)? even_out:odd_out;
	
	/*偶数分频器*/
			always @ (posedge clk_in or negedge rst)
				if(!rst)
					begin
						even_out <= 0;
						count <= 0;
					end
				else 
					if(count == ((n/2)-1))
						begin
							even_out <= ~even_out;
							count <= 0;
						end
					else
					count <= count + 1;
		
	
	/*奇数分频器*/
			always @ (posedge clk_in or negedge rst)
				begin
					if(!rst)
						begin
							odd_out1 <= 0;
							count1 <= 0;
						end
					else 
						begin
							if(count1 == ((n-1)/2))
								begin
									odd_out1 <= ~odd_out1;
									count1 <= count1 + 1;
								end
							else
								if(count1 == n)
									begin
										odd_out1 <= ~odd_out1;
										count1 <= 0;
									end
								else
									count1 <= count1 + 1;
						end			
				end
			always @ (negedge clk_in or negedge rst)
				begin
					if(!rst)
						begin
							odd_out2 <= 0;
							count2 <= 0;
						end
					else
						begin
							if(count2 == ((n-1)/2))
								begin
									odd_out2 <= ~odd_out2;
									count2 <= count2 + 1;
								end
							else
								if(count2 == n)
									begin
										odd_out2 <= ~odd_out2;
										count2 <= 0;
									end
								else
									count2 <= count2 + 1;
						end
				end
		

endmodule
