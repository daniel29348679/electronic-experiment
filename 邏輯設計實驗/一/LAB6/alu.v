module alu (
    clk,
    a,
    b,
    c,
    sel,
    result
);

    input clk;
    input [3:0] a;
    input [3:0] b;
    input [3:0] c;
    input [2:0] sel;
    output [4:0] result;
    reg [4:0] r;

    always @(posedge clk) begin
        case (sel)
            3'b000: r <= (a > b && a > c) ? a : (b > a && b > c) ? b : c;
            3'b001: r <= a + b;
            3'b010: r <= a - b;
            3'b011: r <= a / b;
            3'b100: r <= a % b;
            3'b101: r <= a << 1;
            3'b110: r <= a >> 1;
            3'b111: r <= a > b;
        endcase
    end

    assign result = r;

endmodule
