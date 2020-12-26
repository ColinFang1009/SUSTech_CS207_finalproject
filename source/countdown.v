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
(input CK, //1Hz clock
input clk_system//system 500MHz clock
,input rst //reset
,output[4:0]CD//CountDown
,output cd_en_show, //bool for countdown status
output reg buzz //buzzer
);
parameter[4:0]cd=5'd30;//Define a parameter which can be modified when called
reg[4:0]dif=0;//Difference
reg set;
reg [1:0] delay = 2'b11;
reg cd_en;
assign cd_en_show = cd_en;
//cd_alert(clk_system, rst, set,buzz);
      always @ (clk_system)
      begin
//        if(set == 1) begin
//            set <= 0;
//        end
        if(cd_en == 0) begin
            if(delay > 0) begin
            buzz <= 1;end
            delay <= delay - 1;
        end
        else if (cd_en == 1) begin
            delay <= 2'b11;
        end
      end

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