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
    assign c = a + b;
    assign cout = c[4];
    assign sum = c[3:0];
endmodule
