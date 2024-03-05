module stimulus;

    reg [8:0] count;

    wire [3:0] x;
    wire [3:0] y;
    wire z;
    wire [3:0] b, d;
    assign z = count[8];
    assign x = count[7:4];
    assign y = count[3:0];

    substractor_4 substractor (
        x,
        y,
        z,
        b,
        d
    );


    integer i;
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, substractor);
        for (i = 0; i < 512; i = i + 1) begin
            count <= i;
            #10;
        end
        $finish;

    end



endmodule
