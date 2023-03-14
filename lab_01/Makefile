VERILOG = iverilog
TARGET = test.vcd

$(TARGET) : test.vvp
	vvp test.vvp

test.vvp:
	$(VERILOG) -o test.vvp *.v

clean:
	rm $(TARGET)