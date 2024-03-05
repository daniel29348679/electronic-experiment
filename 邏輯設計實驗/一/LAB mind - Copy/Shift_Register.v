module DFF(q, d, clk, reset);
    output q;
    input d, clk, reset;
    reg q;
    always@(posedge reset or negedge clk)
    if(reset)
        q=1'b0;
    else
        q=d;
endmodule

module MUX4_1(s0, s1, i0,i1,i2,i3,o);
    input s0, s1, i0, i1, i2, i3;
    output o;
    wire y0, y1, y2, y3;
    assign y0=i0*~s1*~s0;
    assign y1=i1*~s1*s0;
    assign y2=i2*s1*~s0;
    assign y3=i3*s1*s0;
    assign o=y0+y1+y2+y3;
endmodule

module Shift_Register(i, s, o, clk, reset, r);
    input [0:7] i;
    input [0:1] s;
    input clk, reset, r;
    wire [0:7] mux_o;
    output [0:7] o;

    MUX4_1 mux0(s[0],s[1],o[0], r, o[1], i[0], mux_o[0]);
    MUX4_1 mux1(s[0],s[1], o[1], o[0], o[2], i[1], mux_o[1]);
    MUX4_1 mux2(s[0],s[1], o[2], o[1], o[3], i[2], mux_o[2]);
    MUX4_1 mux3(s[0],s[1], o[3], o[2], o[4], i[3], mux_o[3]);
    MUX4_1 mux4(s[0],s[1], o[4], o[3], o[5],i[4],mux_o[4]);
    MUX4_1 mux5(s[0],s[1], o[5], o[4], o[6],i[5],mux_o[5]);
    MUX4_1 mux6(s[0],s[1], o[6], o[5], o[7],i[6],mux_o[6]);
    MUX4_1 mux7(s[0],s[1], o[7], o[6], r,i[7],mux_o[7]);

    DFF dff0(o[0], mux_o[0], clk, reset);
    DFF dff1(o[1], mux_o[1], clk, reset);
    DFF dff2(o[2], mux_o[2], clk, reset);
    DFF dff3(o[3], mux_o[3], clk, reset);
    DFF dff4(o[4], mux_o[4], clk, reset);
    DFF dff5(o[5], mux_o[5], clk, reset);
    DFF dff6(o[6], mux_o[6], clk, reset);
    DFF dff7(o[7], mux_o[7], clk, reset);

endmodule