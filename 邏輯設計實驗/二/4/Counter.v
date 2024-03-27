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
        if (!rst) count <= 8'h00;
        else
            case ({
                en, up
            })
                2'b00: count <= count;
                2'b11: begin
                    if (count == 8'hFF) count <= 8'hFF;
                    else count <= count + 1;
                end
                2'b10: begin
                    if (count == 8'h00) count <= 8'h00;
                    else count <= count - 1;
                end
                2'b01: count <= count;
            endcase
    end

    assign dout = count;


endmodule
