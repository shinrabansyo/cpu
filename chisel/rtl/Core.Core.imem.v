module BindsTo_0_Core(
  input        clock,
  input        reset,
  output       io_tx,
  input        io_rx,
  output       io_sclk,
  output       io_mosi,
  input        io_miso,
  output [7:0] io_gpout
);

initial begin
  $readmemh("src/main/resources/tmp_inst.hex", Core.imem);
end
                      endmodule

bind Core BindsTo_0_Core BindsTo_0_Core_Inst(.*);