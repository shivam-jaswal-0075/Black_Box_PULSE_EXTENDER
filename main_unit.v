`timescale 1ns / 1ps


module main_unit(original_pulse,clk,clk_by_5, extended_pulse);
    input original_pulse;
    input clk;
    input clk_by_5;
    output reg extended_pulse=1'b0;
    
    parameter WIDTH = 7;
    
    reg stop_cnt=1'b0; 
    reg [WIDTH:0] upcounter=8'h00;
    reg [WIDTH:0] downcounter;
    
    reg start_extension=1'b0;
    
    always @(negedge original_pulse) begin
        if(upcounter != 8'h00) begin
            start_extension <= 1'b1;
            downcounter <= upcounter;
        end
        else extended_pulse <=1'b0;
    end
    
    always @(posedge stop_cnt) begin
        extended_pulse <=1'b0;
    end

    
    
    always@(posedge clk) begin
        if(original_pulse) upcounter <= upcounter + 1'b1;
        else upcounter <= upcounter;
    end
    
    always@(posedge clk_by_5) begin
        if(downcounter != 8'h00 && original_pulse == 1'b0 && start_extension == 1'b1) begin
            downcounter <= downcounter - 1'b1;
            if(start_extension) extended_pulse <=1'b1;
            else extended_pulse<=1'b0;
        end
        else if(downcounter == 8'h00 && original_pulse == 1'b0 && start_extension == 1'b1) stop_cnt<=1'b1;
        else downcounter<=downcounter;
    end
    
endmodule
