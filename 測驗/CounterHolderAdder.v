module CounterHolderAdder (
    clk,
    select,
    a,
    b,
    dout
);
    input clk;
    input [1:0] select;
    input [2:0] a, b;
    wire [2:0] t;
    reg  [2:0] out;
    output [2:0] dout;


    assign t = select == 2'b00 ? a + b : select == 2'b01 ? out + 1 : out;

    always @(posedge clk) begin
        out <= t;
    end

    assign dout = out;

endmodule
