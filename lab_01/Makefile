VERILOG = iverilog
TARGET = test.vcd

$(TARGET) : test.vvp
	vvp test.vvp
	-del -f test.vvp

test.vvp:
	$(VERILOG) -o test.vvp *.v

clean:
	-del -f $(TARGET) test.vvp