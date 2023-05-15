module Counter (
    clk,
    rst,
    select,
    a,
    b,
    dout
);
    input clk, rst, select;
    input [3:0] a, b;
    output reg [3:0] dout;

    always @(posedge clk) begin
        if (rst == 1) begin
            dout <= 4'b0000;
        end else if (select == 1) begin
            dout <= dout + 1;
        end else begin
            dout <= a & b;
        end
    end

endmodule
