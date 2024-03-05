module stimulus;

    reg clk, reset;
    wire [7:0] count;

    Shift shift (
        count,
        clk,
        reset
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;


    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, shift);
        // design your test case here
        reset = 1'b1;
        #10 reset = 1'b0;
        #100 reset = 1'b1;
        #10 reset = 1'b0;
        #100 $finish;

    end

    // Monitor the outputs 
    initial $monitor($time, " Output count = %b", count);


endmodule
