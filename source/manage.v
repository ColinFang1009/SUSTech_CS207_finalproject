`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/17 11:06:04
// Design Name: 
// Module Name: manage
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


module manage(
    input sw1,sw2,sw3,sw4, //4 products
    input clk,
    input rst_n,
    input[15:0] key_press, //key pressing out
    input[15:0] key_edge, //key pressing edge
    input [3:0]count1, //quantity sold for product1
    input [3:0]count2,
    input [3:0]count3,
    input [3:0]count4,
    output  [3:0]max1,//maximal # of replenishment for product1
    output  [3:0]max2,
    output  [3:0]max3,
    output  [3:0]max4,
    output [3:0] quant1,//current quantity of product1
    output [3:0] quant2,
    output [3:0] quant3,
    output [3:0] quant4);
    reg [3:0]max_spp1;
    reg [3:0]max_spp2;
    reg [3:0]max_spp3;
    reg [3:0]max_spp4;
    reg [3:0] rest1;
    reg [3:0] rest2;
    reg [3:0] rest3;
    reg [3:0] rest4;
    parameter capacity=15;
    
    assign max1 = capacity - rest1 + count1;
    assign quant1 = rest1 - count1;
    assign max2 = capacity - rest2 + count2;
    assign quant2 = rest2 - count2;
    assign max3 = capacity - rest3 + count3;
    assign quant3 = rest3 - count3;
    assign max4 = capacity - rest4 + count4;
    assign quant4 = rest4 - count4;

    
  always @(posedge clk or negedge rst_n)
    begin
    if(!rst_n)
        begin
        rest1<=count1;
        rest2<=count2;
        rest3<=count3;
        rest4<=count4;
        max_spp1<=4'b1111;
        max_spp2<=4'b1111;
        max_spp3<=4'b1111;
        max_spp4<=4'b1111;
        end
        else begin
    casex({sw1,sw2,sw3,sw4})
    
    4'b1xxx:begin
    
      case(key_edge[9:1]) 
      9'b100000000: if(max_spp1>=9) begin
         max_spp1<=max_spp1-9; 
         rest1<=rest1+9;
         end
         else
         begin
         max_spp1<=0; 
         rest1<=capacity;
         end
     9'b010000000: if(max_spp1>=8) begin
         max_spp1<=max_spp1-8; 
         rest1<=rest1+8;
         end
         else
         begin
         max_spp1<=0; 
         rest1<=capacity;
         end
     9'b001000000: if(max_spp1>=7) begin
         max_spp1<=max_spp1-7; 
         rest1<=rest1+7;
         end
         else
         begin
         max_spp1<=0; 
         rest1<=capacity;
         end
     9'b000100000: if(max_spp1>=6) begin
         max_spp1<=max_spp1-6; 
         rest1<=rest1+6;
         end
         else
         begin
         max_spp1<=0; 
         rest1<=capacity;
         end
     9'b000010000: if(max_spp1>=5) begin
         max_spp1<=max_spp1-5; 
         rest1<=rest1+5;
         end
         else
         begin
         max_spp1<=0; 
         rest1<=capacity;
         end
      9'b000001000: if(max_spp1>=4) begin
         max_spp1<=max_spp1-4; 
         rest1<=rest1+4;
         end
         else
         begin
         max_spp1<=0; 
         rest1<=capacity;
         end
      9'b000000100: if(max_spp1>=3) begin
         max_spp1<=max_spp1-3; 
         rest1<=rest1+3;
         end
         else
         begin
         max_spp1<=0; 
         rest1<=capacity;
         end
        9'b000000010: if(max_spp1>=2) begin
         max_spp1<=max_spp1-2; 
         rest1<=rest1+2;
         end
         else
         begin
         max_spp1<=0; 
         rest1<=capacity;
         end
       9'b000000001: if(max_spp1>=1) begin
         max_spp1<=max_spp1-1; 
         rest1<=rest1+1;
         end
         else
         begin
         max_spp1<=0; 
         rest1<=capacity;
         end
         endcase
         end
         
   4'b01xx:begin
             
       case(key_edge[9:1]) 
       9'b100000000: if(max_spp2>=9) begin
          max_spp2<=max_spp2-9; 
          rest2<=rest2+9;
          end
          else
          begin
          max_spp2<=0; 
          rest2<=capacity;
          end
      9'b010000000: if(max_spp2>=8) begin
          max_spp2<=max_spp2-8; 
          rest2<=rest2+8;
          end
          else
          begin
          max_spp2<=0; 
          rest2<=capacity;
          end
      9'b001000000: if(max_spp2>=7) begin
          max_spp2<=max_spp2-7; 
          rest2<=rest2+7;
          end
          else
          begin
          max_spp2<=0; 
          rest2<=capacity;
          end
      9'b000100000: if(max_spp2>=6) begin
          max_spp2<=max_spp2-6; 
          rest2<=rest2+6;
          end
          else
          begin
          max_spp2<=0; 
          rest2<=capacity;
          end
      9'b000010000: if(max_spp2>=5) begin
          max_spp2<=max_spp2-5; 
          rest2<=rest2+5;
          end
          else
          begin
          max_spp2<=0; 
          rest2<=capacity;
          end
       9'b000001000: if(max_spp2>=4) begin
          max_spp2<=max_spp2-4; 
          rest2<=rest2+4;
          end
          else
          begin
          max_spp2<=0; 
          rest2<=capacity;
          end
       9'b000000100: if(max_spp2>=3) begin
          max_spp2<=max_spp2-3; 
          rest2<=rest2+3;
          end
          else
          begin
          max_spp2<=0; 
          rest2<=capacity;
          end
         9'b000000010: if(max_spp2>=2) begin
          max_spp2<=max_spp2-2; 
          rest2<=rest2+2;
          end
          else
          begin
          max_spp2<=0; 
          rest2<=capacity;
          end
        9'b000000001: if(max_spp2>=1) begin
          max_spp2<=max_spp2-1; 
          rest2<=rest2+1;
          end
          else
          begin
          max_spp2<=0; 
          rest2<=capacity;
          end
          endcase
          end
    
    4'b001x:begin
       
         case(key_edge[9:1]) 
         9'b100000000: if(max_spp3>=9) begin
            max_spp3<=max_spp3-9; 
            rest3<=rest3+9;
            end
            else
            begin
            max_spp3<=0; 
            rest3<=capacity;
            end
        9'b010000000: if(max_spp3>=8) begin
            max_spp3<=max_spp3-8; 
            rest3<=rest3+8;
            end
            else
            begin
            max_spp3<=0; 
            rest3<=capacity;
            end
        9'b001000000: if(max_spp3>=7) begin
            max_spp3<=max_spp3-7; 
            rest3<=rest3+7;
            end
            else
            begin
            max_spp3<=0; 
            rest3<=capacity;
            end
        9'b000100000: if(max_spp3>=6) begin
            max_spp3<=max_spp3-6; 
            rest3<=rest3+6;
            end
            else
            begin
            max_spp3<=0; 
            rest3<=capacity;
            end
        9'b000010000: if(max_spp3>=5) begin
            max_spp3<=max_spp3-5; 
            rest3<=rest3+5;
            end
            else
            begin
            max_spp3<=0; 
            rest3<=capacity;
            end
         9'b000001000: if(max_spp3>=4) begin
            max_spp3<=max_spp3-4; 
            rest3<=rest3+4;
            end
            else
            begin
            max_spp3<=0; 
            rest3<=capacity;
            end
         9'b000000100: if(max_spp3>=3) begin
            max_spp3<=max_spp3-3; 
            rest3<=rest3+3;
            end
            else
            begin
            max_spp3<=0; 
            rest3<=capacity;
            end
           9'b000000010: if(max_spp3>=2) begin
            max_spp3<=max_spp3-2; 
            rest3<=rest3+2;
            end
            else
            begin
            max_spp3<=0; 
            rest3<=capacity;
            end
          9'b000000001: if(max_spp3>=1) begin
            max_spp3<=max_spp3-1; 
            rest3<=rest3+1;
            end
            else
            begin
            max_spp3<=0; 
            rest3<=capacity;
            end
            endcase
            end
            
 4'b0001:begin
                                                 
           case(key_edge[9:1]) 
           9'b100000000: if(max_spp4>=9) begin
              max_spp4<=max_spp4-9; 
              rest4<=rest4+9;
              end
              else
              begin
              max_spp4<=0; 
              rest4<=capacity;
              end
          9'b010000000: if(max_spp4>=8) begin
              max_spp4<=max_spp4-8; 
              rest4<=rest4+8;
              end
              else
              begin
              max_spp4<=0; 
              rest4<=capacity;
              end
          9'b001000000: if(max_spp4>=7) begin
              max_spp4<=max_spp4-7; 
              rest4<=rest4+7;
              end
              else
              begin
              max_spp4<=0; 
              rest4<=capacity;
              end
          9'b000100000: if(max_spp4>=6) begin
              max_spp4<=max_spp4-6; 
              rest4<=rest4+6;
              end
              else
              begin
              max_spp4<=0; 
              rest4<=capacity;
              end
          9'b000010000: if(max_spp4>=5) begin
              max_spp4<=max_spp4-5; 
              rest4<=rest4+5;
              end
              else
              begin
              max_spp4<=0; 
              rest4<=capacity;
              end
           9'b000001000: if(max_spp4>=4) begin
              max_spp4<=max_spp4-4; 
              rest4<=rest4+4;
              end
              else
              begin
              max_spp4<=0; 
              rest4<=capacity;
              end
           9'b000000100: if(max_spp4>=3) begin
              max_spp4<=max_spp4-3; 
              rest4<=rest4+3;
              end
              else
              begin
              max_spp4<=0; 
              rest4<=capacity;
              end
             9'b000000010: if(max_spp4>=2) begin
              max_spp4<=max_spp4-2; 
              rest4<=rest4+2;
              end
              else
              begin
              max_spp4<=0; 
              rest4<=capacity;
              end
            9'b000000001: if(max_spp4>=1) begin
              max_spp4<=max_spp4-1; 
              rest4<=rest4+1;
              end
              else
              begin
              max_spp4<=0; 
              rest4<=capacity;
              end
              endcase
              end

    endcase
    end
    end
    
endmodule



