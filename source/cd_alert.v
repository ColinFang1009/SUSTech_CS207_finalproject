`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/23 12:34:51
// Design Name: 
// Module Name: cd_alert
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

module cd_alert(
    input clk,//clock 
    input rst, //reset
    input set,//delay for buzzer
    output buzzer //buzzer
);

parameter hz = 12'd440;
parameter length = 12'd400;

wire ms_clk, ms_edge;
clock_buzz #(100_000) clk_buzz(clk, rst, ms_clk);
edge_generate edge_gen_buzz(clk, ms_clk, ms_edge);

reg[11:0] cnt;
reg[11:0] play_hz;
reg playing;

buzzer_play buzz_ins(clk, play_hz, buzzer);

always @(posedge clk) begin
    if(rst) begin
        cnt <= 0;
        play_hz <= 0;
        playing <= 0;
    end
    else if(set) begin
        cnt <= 0;
        play_hz <= hz;
        playing <= 1;
    end
    else if(playing && ms_edge) begin
        if(cnt == length) begin
            cnt <= 0;
            play_hz <= 0;
            playing <= 0;
        end else begin
            cnt <= cnt + 1;
        end
    end
end

endmodule
