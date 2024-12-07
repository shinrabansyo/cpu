verilog: verilog_chisel verilog_veryl
	rm -rf target/
	mkdir -p target/
	cp chisel/rtl/*.sv target/
	cp veryl/target/core.sv target/

verilog_chisel:
	cd chisel && sbt test

verilog_veryl:
	cd veryl && veryl build

.PHONY: verilog verilog_chisel verilog_veryl
