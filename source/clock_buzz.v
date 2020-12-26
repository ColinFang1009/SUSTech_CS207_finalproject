`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/23 12:35:50
// Design Name: 
// Module Name: clock_buzz
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

module clock_buzz(rst,clk,clkout);
input rst, clk;
output reg clkout;
reg [19:0] cnt;
parameter period = 1000;
always @(posedge clk or negedge rst)
    begin
        if(!rst) begin
            cnt <= 0;
            clkout <= 0;
        end
        else begin
            if (cnt == (period >> 1) - 1)
            begin
                clkout <= ~clkout;
                cnt <=0;
            end
            else
                cnt <= cnt + 1;
       end
       end
endmodule

