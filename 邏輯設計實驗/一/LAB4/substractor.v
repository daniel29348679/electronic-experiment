module substractor (
    x,
    y,
    z,
    b,
    d
);

    output b, d;
    input x, y, z;

    assign d = (!x) & (!y) & z | (!x) & y & (!z) | x & (!y) & (!z) | x & y & z;
    assign b = (!x) & y | (!x) & z | y & z;

endmodule

module substractor_4 (
    x,
    y,
    z,
    b,
    d
);

    input [3:0] x, y;
    input z;
    output [3:0] b, d;
    wire [3:0] bo;
    assign b = bo;

    substractor sub_0 (
        x[0],
        y[0],
        z,
        bo[0],
        d[0]
    );
    substractor sub_1 (
        x[1],
        y[1],
        bo[0],
        bo[1],
        d[1]
    );
    substractor sub_2 (
        x[2],
        y[2],
        bo[1],
        bo[2],
        d[2]
    );
    substractor sub_3 (
        x[3],
        y[3],
        bo[2],
        bo[3],
        d[3]
    );


endmodule
