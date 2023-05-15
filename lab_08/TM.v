`timescale 1ns / 1ps
module TM;

    reg clk;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    reg reset, sel;
    wire [3:0] count;
    reg [3:0] a, b;

    Counter counter (
        .clk(clk),
        .rst(reset),
        .select(sel),
        .a(a),
        .b(b),
        .dout(count)
    );

    integer i;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, counter);
        $monitor("reset = %b, count = %d, select = %b, a = %d, b = %d ", reset, count, sel, a, b);
        for (i = 0; i < 200; i = i + 1) begin
            reset <= (i % 11 == 0);
            sel <= (i % 13 != 0);
            a <= (i % 5) + 1;
            b <= (i % 15);
            #10;
        end
        $finish;

    end
endmodule
