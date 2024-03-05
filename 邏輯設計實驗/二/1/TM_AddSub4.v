`timescale 1ns / 1ps
module TM_AddSub4;

    reg [3:0] a, b;
    reg sel;
    wire cout;
    wire [3:0] sum;
    wire cor;
    integer i, j;

    assign cor = (i + j) == {cout, sum};
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, AddSub4);
        //$monitor("a = %d, b = %d | cout = %b sum = %d | correct!! = %b", a, b, cout, sum, cor);
        #10 a = 5;
        b   = 1;
        sel = 0;
        #10 a = 5;
        b   = 1;
        sel = 1;
        #10 a = 0;
        b   = 0;
        sel = 0;
        #10 a = 0;
        b   = 0;
        sel = 1;
        #10 a = 2;
        b   = 2;
        sel = 0;
        #10 a = 2;
        b   = 2;
        sel = 1;
        #10 a = 1;
        b   = 5;
        sel = 0;
        #10 a = 1;
        b   = 5;
        sel = 1;
        #10 $finish;
    end

    AddSub4 AddSub4 (
        a,
        b,
        sel,
        cout,
        sum
    );
endmodule
