module stimulus;

    reg clk, reset;
    wire [7:0] count;

    ripple_carry_counter c (
        count,
        clk,
        reset
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;


    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, c);

        reset = 1'b1;

        #5 reset = 1'b0;
        #20 reset = 1'b1;
        #5 reset = 1'b0;

        #600 $finish;
    end

    // Monitor the outputs 
    initial $monitor($time, " Output count = %d", count);



endmodule
