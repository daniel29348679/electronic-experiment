`timescale 1ns / 1ps
module TM;

    reg [3:0] a, b;
    wire [3:0] sum;
    wire cor;
    integer i, j;

    assign cor = (i + j) % 16 == {sum};
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, rca);
        $monitor("a = %d, b = %d | sum = %d | correct!! = %b", a, b, sum, cor);
        for (i = 0; i < 16; i = i + 1) begin
            a <= i;
            for (j = 0; j < 16; j = j + 1) begin
                b <= j;
                #10;
            end

        end
        $finish;

    end
    RCA rca (
        a,
        b,
        sum
    );
endmodule
