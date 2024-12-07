verilog: verilog_chisel verilog_veryl
	rm -rf target/
	mkdir -p target/
	cp chisel/rtl/*.sv target/
	cp veryl/target/core.sv target/

verilog_chisel:
	cd chisel && sbt test

verilog_veryl:
	cd veryl && veryl build

test: verilog
	verilator -threads `nproc` -j `nproc` --binary target/*.sv
	obj_dir/VAlu

.PHONY: verilog verilog_chisel verilog_veryl test
