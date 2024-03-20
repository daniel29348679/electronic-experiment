`timescale 1ns / 1ps
module Counter (
    input wire clk,
    input wire rst,
    input wire en,
    input wire up,
    output wire [7:0] dout
);

    reg [7:0] count;

    always @(posedge clk) begin
        if (rst == 0) count <= 8'h00;
        else if (en)
            if (up) begin
                if (count != 8'hff) count <= count + 1;
            end else if (count != 8'h00) count <= count - 1;
    end

    assign dout = count;


endmodule
