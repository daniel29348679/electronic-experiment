module stimulus;
    reg clk;
    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end
    wire [7:0] count;


    counter counter (
        clk,
        i % 20 == 0,
        i % 5 != 0,
        count
    );


    integer i;
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, counter);
        for (i = 0; i < 512; i = i + 1) begin
            //count <= i;
            #10;
        end
        $finish;

    end



endmodule
