module stimulus;
    reg clk;
    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end
    wire [7:0] count;


    alu alu (
        clk,
        5,
        7,
        1,
        i,
        result
    );


    integer i;
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, alu);
        #5 i = 0;
        #10 i = 7;
        #10 i = 4;
        #10 i = 5;
        #10 i = 3;
        #10 i = 2;
        #10 i = 1;
        #10 i = 6;
        #10;
        $finish;

    end



endmodule
