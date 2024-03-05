module vending_machine (
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


    input clk;
    input reset;
    input [31:0] howManyTicket;
    input [31:0] origin;
    input [31:0] destination;
    input [31:0] money;
    output [31:0] costOfTicket;
    assign costOfTicket = tempprice;
    output [31:0] moneyToPay;
    assign moneyToPay = totalcost;
    output [31:0] totalMoney;
    assign totalMoney = tempmoney;

    reg [31:0] tempmoney;
    reg [31:0] totalcost;
    reg [31:0] state;
    reg [31:0] tempprice;
    reg [31:0] tickamount;
    reg [31:0] Tickets;
    reg [31:0] returnmoney;

    always @(negedge clk) begin
        if (reset) begin
            state <= 3;
            $display("取消");
        end
    end

    always @(posedge clk) begin
        case (state)
            0: begin
                tempmoney = 0;
                totalcost = 0;
                tempprice = 0;
                tickamount = 0;
                Tickets = 0;
                returnmoney = 0;
                tempprice = origin - destination;
                $display("起駛站S%d", origin);
                $display("終駛站S%d", destination);
                if (origin < destination) begin
                    tempprice = -tempprice;
                end
                tempprice = tempprice + 1;
                tempprice = tempprice * 5;
            end
            1: begin
                totalcost = tempprice * howManyTicket;
                $display("買%d張票", howManyTicket);
                $display("需要付%d元", totalcost);
                tickamount = howManyTicket;
            end
            2: begin
                tempmoney = tempmoney + money;
                $display("投%d元,總共投%d元", money, tempmoney);
            end
            3: begin
                if (tempmoney >= totalcost) begin
                    returnmoney = tempmoney - totalcost;
                    Tickets = tickamount;
                    $display("找%d元,車票%d張", returnmoney, Tickets);
                end else begin
                    returnmoney = tempmoney;
                    Tickets = 0;
                    $display("找%d元", returnmoney);
                end
            end
        endcase
    end



    always @(negedge clk) begin
        if (!reset) begin
            case (state)
                0: begin
                    state = 1;
                end
                1: begin
                    state = 2;
                end
                2: begin
                    if (tempmoney >= totalcost) begin
                        state = 3;
                    end else begin
                        $display("還需要%d元", totalcost - tempmoney);
                    end
                end
                3: begin
                    state = 0;
                end
                default: begin
                    state = 0;
                end
            endcase
        end
    end


endmodule
