# -Wall turns on all warningsdout
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -DSIMULATION -Wall -Wno-sensitivity-entire-vector -Wno-sensitivity-entire-array -g2012 -Y.sv -I ./hdl -I ./tests 
VVP=vvp
VVP_POST=-fst
VIVADO=vivado -mode batch -source
SRCS=hdl/greater_than_2_bit.sv hdl/greater_than_4_bit.sv

# Look up .PHONY rules for Makefiles
.PHONY: clean submission remove_solutions

test_greater_than_2_bit : testbenches/greater_than_2_bit_tb.sv ${SRCS}
	${IVERILOG} $^ -o greater_than_2_bit_tb.bin && ${VVP} greater_than_2_bit_tb.bin ${VVP_POST} && gtkwave greater_than_2_bit.fst -a testbenches/sy

test_greater_than_4_bit : testbenches/greater_than_4_bit_tb.sv ${SRCS}
	${IVERILOG} $^ -o greater_than_4_bit_tb.bin && ${VVP} greater_than_4_bit_tb.bin ${VVP_POST} && gtkwave greater_than_4_bit.fst -a testbenches/sy

# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd *.fst vivado*.log *.jou vivado*.str *.log *.checkpoint *.bit *.html *.xml *.out
	rm -rf .Xil