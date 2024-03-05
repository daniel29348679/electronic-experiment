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

    wire [4:0] c;
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            FA fa (
                a[i],
                b[i] ^ sel,
                c[i],
                c[i+1],
                sum[i]
            );
        end
    endgenerate
    assign cout = c[4];
    assign c[0] = sel;
endmodule
