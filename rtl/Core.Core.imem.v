module BindsTo_0_Core(
  input   clock,
  input   reset,
  output  io_tx,
  input   io_rx
);

initial begin
  $readmemh("src/main/resources/bootrom.hex", Core.imem);
end
                      endmodule

bind Core BindsTo_0_Core BindsTo_0_Core_Inst(.*);