verilog: verilog_chisel verilog_veryl
	rm -rf target/
	mkdir -p target/
	cp chisel/rtl/*.sv target/
	cp veryl/target/*.sv target/

verilog_chisel: chisel/src/*
	cd chisel && sbt test

verilog_veryl: veryl/src/*
	cd veryl && veryl build || :

test: verilog
	verilator --trace -threads `nproc` -j `nproc` --binary target/*.sv --top-module top -Wno-UNSIGNED
	obj_dir/Vtop

.PHONY: verilog verilog_chisel verilog_veryl test
