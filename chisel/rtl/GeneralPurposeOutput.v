module GeneralPurposeOutput(
  input        clock,
  input        reset,
  input        io_din_valid,
  input  [7:0] io_din_bits,
  output [7:0] io_dout,
  output [7:0] io_pinOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] pinOutReg; // @[Gpio.scala 15:26]
  assign io_dout = pinOutReg; // @[Gpio.scala 19:11]
  assign io_pinOut = pinOutReg; // @[Gpio.scala 17:13]
  always @(posedge clock) begin
    if (reset) begin // @[Gpio.scala 15:26]
      pinOutReg <= 8'h0; // @[Gpio.scala 15:26]
    end else if (io_din_valid) begin // @[Gpio.scala 21:23]
      pinOutReg <= io_din_bits; // @[Gpio.scala 22:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pinOutReg = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
