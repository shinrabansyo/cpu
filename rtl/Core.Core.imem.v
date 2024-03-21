module BindsTo_0_Core(
  input        clock,
  input        reset,
  output       io_tx,
  input        io_rx,
  output [5:0] io_led
);

initial begin
  $readmemh("src/main/resources/bootrom.hex", Core.imem);
end
                      endmodule

bind Core BindsTo_0_Core BindsTo_0_Core_Inst(.*);