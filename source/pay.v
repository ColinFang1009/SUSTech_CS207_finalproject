`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/19 17:34:26
// Design Name: 
// Module Name: pay
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


module pay(
sw1,sw2,sw3,sw4,clk,rst_n,bt_press,bt_edge,remain1,remain2,remain3,remain4,back1,back2,back3,back4
    );
    input sw1;
    input sw2;
    input sw3;
    input sw4;
    input clk;
    input rst_n;
    input[4:0] bt_press;
    input[4:0] bt_edge;
    //output  reg[3:0] price1;
    //output  reg[3:0] max_spp2;
    //output  reg[3:0]max_spp3;
    //output  reg[3:0]max_spp4;
    output reg[3:0] remain1;
    output reg[3:0] remain2;
    output reg[3:0] remain3;
    output reg[3:0] remain4;
    output reg[3:0] back1;
    output reg[3:0] back2;
    output reg[3:0] back3;
    output reg[3:0] back4;
    parameter p1 = 12;
    parameter p2 = 14;
    parameter p3 = 2;
    parameter p4 = 3;
    reg[1:0] up_count, down_count, left_count, right_count;
    wire up_press, down_press, left_press, right_press;
    assign up_press = bt_edge[2];
    assign down_press = bt_edge[4];
    assign left_press = bt_edge[1];
    assign right_press = bt_edge[0];
    //{up_press,down_press, left_press, right_press} = 1/2/5/10
  always @(posedge clk or negedge rst_n)
    begin
    if(!rst_n)
        begin
        remain1<=p1;
        remain2<=p2;
        remain3<=p3;
        remain4<=p4;
        back1 <= 0;
        back2 <= 0;
        back3 <= 0;
        back4 <= 0;
        up_count <= 2'b00;
        down_count <= 2'b00;
        left_count <= 2'b00;
        right_count <= 2'b00;
        end
    else begin
    casex({sw1,sw2,sw3,sw4})
    
    4'b1xxx:begin
    
      case({up_press,down_press, left_press, right_press}) 
      4'b1000: if(remain1>=1) begin
         remain1<=remain1-1; 
         end
         else
         begin
         back1 <= back1 + 1 - remain1;
         remain1<=0; 
         end
     4'b0100: if(remain1>=2) begin
         remain1<=remain1-2; 
         end
         else
         begin
         back1<= back1 + 2 - remain1; 
         remain1<=0;
         end
     4'b0010: if(remain1>=5) begin
         remain1<=remain1-5; 
         end
         else
         begin
         back1<= back1 + 5 - remain1; 
         remain1<=0;
         end
     4'b0001: if(remain1>=10) begin
         remain1<=remain1-10; 
         end
         else
         begin
         back1 <= back1 + 10 - remain1;
         remain1<=0;
         end
     endcase
     end
  
   4'b01xx:begin
             
        case({up_press,down_press, left_press, right_press}) 
         4'b1000: if(remain2>=1) begin
            remain2<=remain2-1; 
            end
            else
            begin
            back2 <= back2 + 1 - remain2;
            remain2<=0; 
            end
        4'b0100: if(remain2>=2) begin
            remain2<=remain2-2; 
            end
            else
            begin
            back2<= back2 + 2 - remain2; 
            remain2<=0;
            end
        4'b0010: if(remain2>=5) begin
            remain2<=remain2-5; 
            end
            else
            begin
            back2<= back2 + 5 - remain2; 
            remain2<=0;
            end
        4'b0001: if(remain2>=10) begin
            remain2<=remain2-10; 
            end
            else
            begin
            back2 <= back2 + 10 - remain2;
            remain2<=0;
            end
          endcase
          end
    
    4'b001x:begin
        case({up_press,down_press, left_press, right_press}) 
        4'b1000: if(remain3>=1) begin
        remain3<=remain3-1; 
        end
        else
        begin
        back3 <= back3 + 1 - remain3;
        remain3<=0; 
        end
    4'b0100: if(remain3>=2) begin
        remain3<=remain3-2; 
        end
        else
        begin
        back3<= back3 + 2 - remain3; 
        remain3<=0;
        end
    4'b0010: if(remain3>=5) begin
        remain3<=remain3-5; 
        end
        else
        begin
        back3<= back3 + 5 - remain3; 
        remain3<=0;
        end
    4'b0001: if(remain3>=10) begin
        remain3<=remain3-10; 
        end
        else
        begin
        back3 <= back3 + 10 - remain3;
        remain3<=0;
        end
      endcase       
            end
            
 4'b0001:begin
        case({up_press,down_press, left_press, right_press}) 
        4'b1000: if(remain4>=1) begin
        remain4<=remain4-1; 
        end
        else
        begin
        back4 <= back4 + 1 - remain4;
        remain4<=0; 
        end
        4'b0100: if(remain4>=2) begin
        remain4<=remain4-2; 
        end
        else
        begin
        back4<= back4 + 2 - remain4; 
        remain4<=0;
        end
        4'b0010: if(remain4>=5) begin
        remain4<=remain4-5; 
        end
        else
        begin
        back4<= back4 + 5 - remain4; 
        remain4<=0;
        end
        4'b0001: if(remain4>=10) begin
        remain4<=remain4-10; 
        end
        else
        begin
        back4 <= back4 + 10 - remain4;
        remain4<=0;
        end
        endcase                                               
              end

    endcase
    end
    end
    
endmodule

