`timescale 1ns/1ps
`default_nettype none

module fibonacci_tb;

    parameter CLK_PERIOD_NS = 10;
    parameter DEBOUNCE_DELAY_NS = 5;
    logic clk_i, reset_i;
    logic start_i;
    logic [7:0] iterations_bcd_i;
    wire [6:0] seven_segment_o;
    wire [15:0] fibonacci_num_BCD_reg;
    wire [3:0] an_o;
    wire dp_o;  

    fibonacci #(
        .DEBOUNCE_DELAY_NS(DEBOUNCE_DELAY_NS)
        ) UUT(
        .*
    );

    always #(CLK_PERIOD_NS/2) clk_i = ~clk_i;

    initial begin
        $dumpfile("fibonacci.fst");
        $dumpvars(0, UUT);
        clk_i = 0;
        reset_i = 1;
        start_i = 0;
        iterations_bcd_i = 8'b00001000;
        repeat(2) @(negedge clk_i);
        reset_i = 0;
        start_i = 1;
        repeat(2) @(negedge clk_i);
        start_i = 0;
        repeat(2) @(negedge clk_i);
        start_i = 1;
        repeat(7) @(negedge clk_i);
        start_i = 0;
        repeat(200) @(negedge clk_i);
        iterations_bcd_i = 8'b00000010;
        repeat(2) @(negedge clk_i);
        start_i = 1;
        repeat(7) @(negedge clk_i);
        start_i = 0;
        repeat(200) @(negedge clk_i);

        $finish;
    end

endmodule
