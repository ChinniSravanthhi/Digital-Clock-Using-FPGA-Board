`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module digital_clock(
    input clk,
    input en,
    input rst,
    input hrup,
    input minup,
    output [3:0] s1,
    output [3:0] s2,
    output [3:0] m1,
    output [3:0] m2,
    output [3:0] h1,
    output [3:0] h2
    );

    reg [5:0] hour = 0, min = 0, sec = 0;
    integer clkc = 0;
    localparam onesec = 10_000_000; // Adjust to FPGA clock frequency

    always @ (posedge clk) begin
        if (rst) begin
            {hour, min, sec} <= 0;
            clkc <= 0;
        end else if (minup) begin
            if (min == 6'd59) min <= 0;
            else min <= min + 1;
        end else if (hrup) begin
            if (hour == 23) hour <= 0;
            else hour <= hour + 1;
        end else if (en) begin
            if (clkc >= onesec) begin
                clkc <= 0;
                if (sec == 59) begin
                    sec <= 0;
                    if (min == 59) begin
                        min <= 0;
                        if (hour == 23) hour <= 0;
                        else hour <= hour + 1;
                    end else min <= min + 1;
                end else sec <= sec + 1;
            end else clkc <= clkc + 1;
        end
    end

    // Convert binary to BCD
    binarytoBCD secs(.binary(sec), .thos(), .hund(), .tens(s2), .ones(s1));
    binarytoBCD mins(.binary(min), .thos(), .hund(), .tens(m2), .ones(m1));
    binarytoBCD hours(.binary(hour), .thos(), .hund(), .tens(h2), .ones(h1));

endmodule