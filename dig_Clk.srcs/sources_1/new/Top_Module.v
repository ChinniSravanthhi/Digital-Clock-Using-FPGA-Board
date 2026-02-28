`timescale 1ns / 1ps
module Top_Module(
    input clk,
    input sw,
    input btnC,
    input btnU,
    input btnR,
    output [6:0] seg,
    output [3:0] an,
    output [7:0] led
    );

    wire [3:0] s1, s2, m1, m2, h1, h2;
    reg hrup, minup;

    wire btnCclr, btnUclr, btnRclr;
    reg btnCclr_prev, btnUclr_prev, btnRclr_prev;

    // Debounce push buttons
    debounce dbC(btnC, clk, btnCclr);
    debounce dbU(btnU, clk, btnUclr);
    debounce dbR(btnR, clk, btnRclr);

    // 7-segment display driver
    sevseg_drv seg7(clk, 1'b0, h2, h1, m2, m1, seg, an);

    // Digital clock logic
    digital_clock clock(clk, sw, btnCclr, hrup, minup, s1, s2, m1, m2, h1, h2);

    // Push button edge detection
    always @(posedge clk) begin
        btnCclr_prev <= btnCclr;
        btnUclr_prev <= btnUclr;
        btnRclr_prev <= btnRclr;

        hrup <= (btnUclr_prev == 0 && btnUclr == 1) ? 1'b1 : 1'b0;
        minup <= (btnRclr_prev == 0 && btnRclr == 1) ? 1'b1 : 1'b0;
    end

    assign led[7:0] = {s2, s1}; // Display seconds on LEDs

endmodule