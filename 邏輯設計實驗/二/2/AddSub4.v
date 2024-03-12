module AddSub4 (
    a,
    b,
    sel,
    cout,
    sum
);
    input [3:0] a, b;
    input sel;
    output [3:0] sum;
    output cout;

    assign {cout, sum} = sel ? {1'b0, a} + {1'b0, b ^ 4'b1111} + 1 : {1'b0, a} + {1'b0, b};
endmodule
