# verilog: verilog_chisel verilog_veryl
verilog: verilog_veryl
	rm -rf target/
	mkdir -p target/
	cp chisel/rtl/*.sv target/
	cp veryl/target/*.sv target/

verilog_chisel: chisel/src/*
	cd chisel && sbt test

# Warning が出た場合でもコマンド実行を継続するための「||」
verilog_veryl: veryl/src/*
	cd veryl && veryl build || :

test: verilog
	verilator --trace -threads `nproc` -j `nproc` --binary target/*.sv --top-module top -Wno-UNSIGNED
	obj_dir/Vtop

.PHONY: verilog verilog_chisel verilog_veryl test
