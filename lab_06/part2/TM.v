`timescale 1ns / 1ps
module TM;

    wire in0, in1, in2, in3;
    wire out;
    wire [1:0] sel;
    reg [5:0] count;
    assign {in3, in2, in1, in0} = count[3:0];
    assign sel[1:0] = count[5:4];
    integer i;
    Mux_4to1 mux_4to1 (
        out,
        sel,
        in0,
        in1,
        in2,
        in3
    );
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, mux_4to1);
        $monitor("sel=%d,in=(%b,%b,%b,%b),out=%b", sel, in0, in1, in2, in3, out);
        for (i = 0; i < 64; i = i + 1) begin
            count <= i;
            #10;
        end
        $finish;

    end
endmodule
