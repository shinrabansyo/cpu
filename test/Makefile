TESTCASE ?= "spec/add.asm"

all: hexfile

hexfile: 
	sb-assembler $(TESTCASE) tmp_data.hex tmp_inst.hex
	python ./gen_bankfile.py -n 4 tmp_data.hex
	python ./gen_bankfile.py -n 6 tmp_inst.hex

clean:
	rm -f *.hex

.PHONY: clean hexfile
