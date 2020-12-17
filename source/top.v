`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/15 23:49:26
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


module top(rst,clk,DIG, Y);
    input rst;
    input clk;
    output [7:0] DIG;
    output [7:0] Y;
    wire clkout;
    wire clkout2;
    reg [3:0] quant;
    clock ut1(rst,clk,clkout);
    clock_two ut2(rst,clk,clkout2);
    seven_seg show1(rst,clkout,clkout2,quant,DIG,Y);
    //seven_seg_two show2(rst,clkout,en3,DIG,Y);

endmodule
