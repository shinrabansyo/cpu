module BindsTo_1_Core(
  input        clock,
  input        reset,
  output       io_tx,
  input        io_rx,
  output       io_sclk,
  output       io_mosi,
  input        io_miso,
  output [7:0] io_gpio
);

initial begin
  $readmemh("src/main/resources/tmp_data.hex", Core.dmem);
end
                      endmodule

bind Core BindsTo_1_Core BindsTo_1_Core_Inst(.*);