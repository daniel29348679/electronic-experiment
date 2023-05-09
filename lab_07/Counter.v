module Counter (
    clk,
    rst,
    dout
);
    input clk, rst;
    output reg [3:0] dout;

    always @(posedge clk) begin
        dout <= (dout + 1) & {4{!rst}};
    end

endmodule
