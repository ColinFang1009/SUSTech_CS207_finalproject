`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/20 17:27:20
// Design Name: 
// Module Name: countdown
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

module countdown
(input CK//Clock
,input rst
,output[4:0]CD//CountDown
,output reg cd_en
);
parameter[4:0]cd=5'd30;//Define a parameter which can be modified when called
reg[4:0]dif=0;//Difference

always@(posedge CK) begin
if(~rst) begin
    dif <= 0;
    cd_en <= 1; end
else begin
if(dif==cd) begin
	dif<=5'd30;
	cd_en <= 0; end
else 
	dif<=dif+1;
end
end
assign CD=cd-dif;

endmodule