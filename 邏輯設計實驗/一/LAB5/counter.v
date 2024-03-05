module counter (
    clk,
    reset,
    control,
    count
);

    input clk;
    input reset;
    input control;
    output reg [7:0] count;


    reg c;
    always @(posedge clk) begin
        c <= control;
    end

    always @(negedge clk) begin
        if (reset) begin
            count <= 0;
        end else if (c) begin
            count <= count + 1;
        end else begin
            count <= count - 1;
        end

    end


endmodule
