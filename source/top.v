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


module top(rst,clk,S1,S2,S3,S4,DIG, Y);
    input rst;
    input clk;
    input S1,S2,S3,S4;
    output [7:0] DIG;
    output [7:0] Y;
    wire clkout;
    wire clkout2;
    reg [3:0] quant;
    reg [3:0] quant2;
    reg [3:0] quant3;
    reg [3:0] quant4;
    reg en1,en2,en3,en4;
    always@ (S1,S2,S3,S4)
        casex({S1, S2, S3, S4})
            4'b0001:{en1,en2,en3,en4} = 4'b0001;
            4'b001x:{en1,en2,en3,en4} = 4'b0010;
            4'b01xx:{en1,en2,en3,en4} = 4'b0100;
            4'b1xxx:{en1,en2,en3,en4} = 4'b1000;
            default:{en1,en2,en3,en4} = 4'b0000;
        endcase
    clock ut1(rst,clk,clkout);
    clock_two ut2(rst,clk,clkout2);
    
    seven_seg show1(rst,clkout,clkout2,quant,quant2,quant3, quant4, en1,en2,en3,en4,DIG,Y);
    //seven_seg_two show2(rst,clkout,clkout2,quant2,en2,DIG,Y);
    
    always @(posedge clkout2) begin
        quant <= quant + 1;
        quant2 <= quant - 2;
        quant3 <= quant2 + 1;
        quant4 <= quant;
        end
endmodule
