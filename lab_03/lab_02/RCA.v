module RCA (
    a,
    b,
    cout,
    sum
);
    input [3:0] a, b;
    output [3:0] sum;
    output cout;

    wire [4:0] c;
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            FA fa (
                a[i],
                b[i],
                c[i],
                c[i+1],
                sum[i]
            );
        end
    endgenerate
    assign cout = c[4];
    assign c[0] = 0;
endmodule
