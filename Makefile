verilog: verilog_chisel verilog_veryl
	rm -rf target/
	mkdir -p target/
	cp chisel/rtl/*.sv target/
	cp veryl/target/*.sv target/

verilog_chisel:
	cd chisel && sbt test

verilog_veryl:
	cd veryl && veryl build

test: verilog
	verilator --trace -threads `nproc` -j `nproc` --binary target/*.sv --top-module top
	obj_dir/Vtop

.PHONY: verilog verilog_chisel verilog_veryl test
