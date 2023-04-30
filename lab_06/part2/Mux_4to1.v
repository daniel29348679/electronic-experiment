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

    always @(*) begin
        case (sel)
            2'b00:   out = in0;
            2'b01:   out = in1;
            2'b10:   out = in2;
            2'b11:   out = in3;
            default: out = in0;
        endcase
    end



endmodule
