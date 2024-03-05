module stimulus;
    reg clk;
    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end


    vending_machine vending_machine (
        clk,
        reset,
        howManyTicket,
        origin,
        destination,
        money,
        costOfTicket,
        moneyToPay,
        totalMoney
    );
    reg reset;
    reg [31:0] howManyTicket, origin, destination, money;
    wire [31:0] costOfTicket, moneyToPay, totalMoney;
    integer i;
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(2, vending_machine);
        reset = 1;
        #10 reset = 0;
        //loop begin
        origin = 5;
        destination = 3;
        #10 howManyTicket = 4;
        #10 money = 5;
        #10 money = 10;
        #10 money = 50;
        #10 money = 0;
        #10;
        //loop end
        //loop begin
        origin = 3;
        destination = 4;
        #10 howManyTicket = 2;
        #10 money = 10;
        #10 money = 0;
        reset = 1;
        #10;
        //loop end        
        /*
        for (i = 0; i < 10; i = i + 1) begin
            //loop begin
            origin = i + 1;
            destination = i + 4;
            #10 howManyTicket = 5 + i;
            #10 money = 10;
            #10 money = 1000 + i;
            #10 money = 0;
            #10;
            //loop end
        end
        */
        $finish;


    end



endmodule
