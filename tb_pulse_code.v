`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2024 16:52:12
// Design Name: 
// Module Name: tb_pulse_code
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


module tb_pulse_code;
    reg original_pulse,clk,clk_by_5;
    wire extended_pulse;
    
    main_unit DUT(original_pulse,clk,clk_by_5,extended_pulse);
    
    always #5 clk =~clk;
    always #25 clk_by_5 =~clk_by_5;
    
    initial begin
        clk<=1;
        clk_by_5<=1;
        original_pulse<=0;
        #10;
        original_pulse <=1;
        #20;
        original_pulse<=0;
        #1000 $finish;
    end
endmodule

