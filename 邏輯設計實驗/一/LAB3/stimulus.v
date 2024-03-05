module stimulus;

    reg [7:0] count;

    wire A_gt_b, A_eq_b, A_lt_b;
    wire [3:0] A;
    wire [3:0] B;
    assign A = count[7:4];
    assign B = count[3:0];

    Comparator comparator (
        A,
        B,
        A_gt_b,
        A_eq_b,
        A_lt_b
    );


    integer i;
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, comparator);
        $monitor(" a = %d, b = %d, %b%b%b", A, B, A_gt_b, A_eq_b, A_lt_b);
        for (i = 0; i < 256; i = i + 1) begin
            count <= i;
            #10;
        end
        $finish;

    end



endmodule
