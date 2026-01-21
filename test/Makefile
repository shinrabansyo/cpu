TESTCASE ?= "spec/add.asm"

all: hexfile

hexfile: 
	sb-assembler $(TESTCASE) tmp_data.hex tmp_inst.hex 4

clean:
	rm -f *.hex

.PHONY: clean hexfile
