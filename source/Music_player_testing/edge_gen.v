`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/22 00:04:48
// Design Name: 
// Module Name: edge_gen
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

module edge_gen(
    input clk,
    input in,
    output out_edge
);

reg [1:0] record = 2'b00;

always @(posedge clk)
    record <= {record[0], in};

assign out_edge = record[0] & ~record[1];

endmodule
