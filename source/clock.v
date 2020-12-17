`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/15 23:36:39
// Design Name: 
// Module Name: clock
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


module clock(rst,clk,clkout);
input rst, clk;
output reg clkout;
reg [31:0] cnt;
parameter period = 200000;//200000
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
