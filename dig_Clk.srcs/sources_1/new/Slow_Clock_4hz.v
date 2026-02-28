`timescale 1ns / 1ps
module Slow_Clock_4Hz(
    input clk_in,
    output reg clk_out
    );
    parameter DIV = 12_500_000; // Adjust for your FPGA clock
    reg [23:0] counter = 0;
    always @ (posedge clk_in) begin
        if (counter >= DIV-1) begin
            counter <= 0;
            clk_out <= ~clk_out;
        end else counter <= counter + 1;
    end
endmodule