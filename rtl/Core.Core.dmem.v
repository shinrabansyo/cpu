module BindsTo_1_Core(
  input        clock,
  input        reset,
  output       io_tx,
  input        io_rx,
  output [5:0] io_led
);

initial begin
  $readmemh("src/main/resources/dmem.hex", Core.dmem);
end
                      endmodule

bind Core BindsTo_1_Core BindsTo_1_Core_Inst(.*);