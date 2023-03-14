`timescale 1ns/1ps
module TM;

reg a, b, cin;
wire cout, sum;

initial
	begin
		$dumpfile("test.vcd");
		$dumpvars(0, fa);
		$monitor("a = %b, b = %b cin = %b | cout = %b sum = %b ", a, b, cin, cout, sum);
		#10 a=1'b0; b=1'b0; cin=1'b0;
		#10 a=1'b0; b=1'b1; cin=1'b0;
		#10 a=1'b1; b=1'b0; cin=1'b0;
		#10 a=1'b1; b=1'b1; cin=1'b0;
		#10 a=1'b0; b=1'b0; cin=1'b1;
		#10 a=1'b0; b=1'b1; cin=1'b1;
		#10 a=1'b1; b=1'b0; cin=1'b1;
		#10 a=1'b1; b=1'b1; cin=1'b1;
		#10 $finish;
	end
	FA fa( a, b, cin, cout, sum );
endmodule