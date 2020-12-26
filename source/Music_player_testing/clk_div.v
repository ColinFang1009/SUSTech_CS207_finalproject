`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/21 23:53:07
// Design Name: 
// Module Name: clk_div
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

module clk_div(
    input clk,
    input rst,
    output reg clock
);

parameter period = 1000;
reg[19:0] cnt;

always @(posedge clk) begin
    if(rst) begin
        cnt <= 0;
        clock <= 0;
    end else begin
        if(cnt == ((period >> 1) - 1)) begin
            clock <= ~clock;
            cnt <= 0;
        end else begin
            cnt <= cnt + 1;
        end
    end
end

endmodule
