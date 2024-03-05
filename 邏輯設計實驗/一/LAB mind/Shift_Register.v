module Shift_Register (
    i,
    s,
    o,
    clk,
    reset,
    r
);

    input [7:0] i;
    input [1:0] s;
    output [7:0] o;
    input clk, reset, r;

    wire [7:0] muxout;

    DFF dff0 (
        o[0],
        muxout[0],
        clk,
        reset
    );
    DFF dff1 (
        o[1],
        muxout[1],
        clk,
        reset
    );
    DFF dff2 (
        o[2],
        muxout[2],
        clk,
        reset
    );
    DFF dff3 (
        o[3],
        muxout[3],
        clk,
        reset
    );
    DFF dff4 (
        o[4],
        muxout[4],
        clk,
        reset
    );
    DFF dff5 (
        o[5],
        muxout[5],
        clk,
        reset
    );
    DFF dff6 (
        o[6],
        muxout[6],
        clk,
        reset
    );
    DFF dff7 (
        o[7],
        muxout[7],
        clk,
        reset
    );

    mux4_1 mux0 (
        muxout[0],
        o[0],
        r,
        o[1],
        i[0],
        s[1:0]
    );
    mux4_1 mux1 (
        muxout[1],
        o[1],
        o[0],
        o[2],
        i[1],
        s[1:0]
    );
    mux4_1 mux2 (
        muxout[2],
        o[2],
        o[1],
        o[3],
        i[2],
        s[1:0]
    );
    mux4_1 mux3 (
        muxout[3],
        o[3],
        o[2],
        o[4],
        i[3],
        s[1:0]
    );
    mux4_1 mux4 (
        muxout[4],
        o[4],
        o[3],
        o[5],
        i[4],
        s[1:0]
    );
    mux4_1 mux5 (
        muxout[5],
        o[5],
        o[4],
        o[6],
        i[5],
        s[1:0]
    );
    mux4_1 mux6 (
        muxout[6],
        o[6],
        o[5],
        o[7],
        i[6],
        s[1:0]
    );
    mux4_1 mux7 (
        muxout[7],
        o[7],
        o[6],
        r,
        i[7],
        s[1:0]
    );




endmodule

module mux4_1 (
    out,
    in0,
    in1,
    in2,
    in3,
    sel
);

    output out;
    input in0, in1, in2, in3;
    input [1:0] sel;

    assign out = (in0 & ~sel[1] & ~sel[0]) | (in1 & ~sel[1] & sel[0]) | (in2 & sel[1] & ~sel[0]) | (in3 & sel[1] & sel[0]);
endmodule


module DFF (
    q,
    d,
    clk,
    reset
);

    output q;
    input d, clk, reset;
    reg q;

    always @(posedge reset or negedge clk)
        if (reset) q = 1'b0;
        else q = d;

endmodule
