`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/21 19:32:15
// Design Name: 
// Module Name: translate_cd
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


module translate_cd(
    input [4:0] CD, //countdown
    output reg [7:0] CD_show1, //seg1 for first digit
    output reg [7:0] CD_show2 //seg2 for second digit
    );
 always @ (CD) begin
       case(CD)
        5'b00000:begin CD_show1 = 8'b00111111; CD_show2 = 8'b00111111; end //00
        5'b00001:begin CD_show1 = 8'b00111111; CD_show2 = 8'b00000110; end//01
        5'b00010:begin CD_show1 = 8'b00111111; CD_show2 = 8'b01011011; end//02
        5'b00011:begin CD_show1 = 8'b00111111; CD_show2 = 8'b01001111; end//03
        5'b00100:begin CD_show1 = 8'b00111111; CD_show2 = 8'b01100110; end//04
        5'b00101:begin CD_show1 = 8'b00111111; CD_show2 = 8'b01101101; end//05
        5'b00110:begin CD_show1 = 8'b00111111; CD_show2 = 8'b01111101; end//06
        5'b00111:begin CD_show1 = 8'b00111111; CD_show2 = 8'b00100111; end//07
        5'b01000:begin CD_show1 = 8'b00111111; CD_show2 = 8'b01111111; end//08
        5'b01001:begin CD_show1 = 8'b00111111; CD_show2 = 8'b01100111; end//09
        5'b01010:begin CD_show1 = 8'b00000110; CD_show2 = 8'b00111111; end//10
        5'b01011:begin CD_show1 = 8'b00000110; CD_show2 = 8'b00000110; end//11
        5'b01100:begin CD_show1 = 8'b00000110; CD_show2 = 8'b01011011; end//12
        5'b01101:begin CD_show1 = 8'b00000110; CD_show2 = 8'b01001111; end//13
        5'b01110:begin CD_show1 = 8'b00000110; CD_show2 = 8'b01100110; end//14
        5'b01111:begin CD_show1 = 8'b00000110; CD_show2 = 8'b01101101; end//15
        5'b10000:begin CD_show1 = 8'b00000110;CD_show2 = 8'b01111101; end//16
        5'b10001:begin CD_show1 = 8'b00000110;CD_show2 = 8'b00100111; end//17
        5'b10010:begin CD_show1 = 8'b00000110;CD_show2 = 8'b01111111; end//18
        5'b10011:begin CD_show1 = 8'b00000110; CD_show2 = 8'b01100111; end//19
        5'b10100:begin CD_show1 = 8'b01011011; CD_show2 = 8'b00111111; end //20
        5'b10101:begin CD_show1 = 8'b01011011; CD_show2 = 8'b00000110; end//21
        5'b10110:begin CD_show1 = 8'b01011011;CD_show2 = 8'b01011011; end//22
        5'b10111:begin CD_show1 = 8'b01011011;CD_show2 = 8'b01001111; end//23
        5'b11000:begin CD_show1 = 8'b01011011;CD_show2 = 8'b01100110; end//24
        5'b11001:begin CD_show1 = 8'b01011011;CD_show2 = 8'b01101101; end//25
        5'b11010:begin CD_show1 = 8'b01011011;CD_show2 = 8'b01111101; end//26
        5'b11011:begin CD_show1 = 8'b01011011;CD_show2 = 8'b00100111; end//27
        5'b11100:begin CD_show1 = 8'b01011011;CD_show2 = 8'b01111111; end//28
        5'b11101:begin CD_show1 = 8'b01011011;CD_show2 = 8'b01100111; end//29
        5'b11110:begin CD_show1 = 8'b01001111; CD_show2 = 8'b00111111; end //30
        5'b11111: begin CD_show1 = 8'b01001111; CD_show2 = 8'b00000110; end //31
        default:begin CD_show1 = 8'b00111111; CD_show2 = 8'b00111111; end //00
        endcase
        end
endmodule
