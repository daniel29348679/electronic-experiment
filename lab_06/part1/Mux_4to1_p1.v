module Mux_4to1 (
    out,
    sel,
    in0,
    in1,
    in2,
    in3
);
    input [1:0] sel;
    input in0, in1, in2, in3;
    output reg out;

    always @(sel or in0 or in1 or in2 or in3) begin
        if (sel == 2'b00) out = in0;
        else if (sel == 2'b01) out = in1;
        else if (sel == 2'b10) out = in2;
        else out = in3;
    end

endmodule
