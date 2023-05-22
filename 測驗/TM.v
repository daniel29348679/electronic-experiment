`timescale 1ns / 1ps
module TM;

    reg clk;

    initial begin
        clk = 0;
        #1 clk = ~clk;
        forever #5 clk = ~clk;
    end

    reg  [1:0] sel;
    wire [2:0] count;
    reg [2:0] a, b;

    CounterHolderAdder counterHolderAdder (
        .clk(clk),
        .select(sel),
        .a(a),
        .b(b),
        .dout(count)
    );

    integer i;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, counterHolderAdder);
        $monitor("count = %d, select = %d, a = %d, b = %d ", count, sel, a, b);


        #10;
        a   <= 0;
        b   <= 0;
        sel <= 2'b00;
        #10;
        sel <= 2'b01;
        #10;
        #10;
        #10;
        #10;
        sel <= 2'b10;
        #10;
        #10;
        #10;
        #10;
        sel <= 2'b00;
        a   <= 2;
        b   <= 3;
        #10;
        a <= 1;
        b <= 2;
        #10;
        a <= 3;
        b <= 3;
        #10;
        $finish;
        $stop;

    end
endmodule
