module RCA (
    a,
    b,
    sum
);
    input [3:0] a, b;
    output [3:0] sum;
    wire [4:0] c;
    assign c   = a + b;
    assign sum = c[3:0];
endmodule
