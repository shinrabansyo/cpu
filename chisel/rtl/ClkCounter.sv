module ClkCounter(
  input         clock,
  input         reset,
  output [63:0] io_clkCount,
  output [63:0] io_msCount
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] counter; // @[ClkCounter.scala 17:24]
  wire [63:0] _counter_T_1 = counter + 64'h1; // @[ClkCounter.scala 18:22]
  reg [63:0] msCount; // @[ClkCounter.scala 24:24]
  reg [31:0] msCounter; // @[ClkCounter.scala 25:26]
  wire [63:0] _msCount_T_1 = msCount + 64'h1; // @[ClkCounter.scala 32:24]
  wire [31:0] _msCounter_T_1 = msCounter + 32'h1; // @[ClkCounter.scala 34:28]
  assign io_clkCount = counter; // @[ClkCounter.scala 20:15]
  assign io_msCount = msCount; // @[ClkCounter.scala 28:14]
  always @(posedge clock) begin
    if (reset) begin // @[ClkCounter.scala 17:24]
      counter <= 64'h0; // @[ClkCounter.scala 17:24]
    end else begin
      counter <= _counter_T_1; // @[ClkCounter.scala 18:11]
    end
    if (reset) begin // @[ClkCounter.scala 24:24]
      msCount <= 64'h0; // @[ClkCounter.scala 24:24]
    end else if (msCounter >= 32'h3a98) begin // @[ClkCounter.scala 30:37]
      msCount <= _msCount_T_1; // @[ClkCounter.scala 32:13]
    end
    if (reset) begin // @[ClkCounter.scala 25:26]
      msCounter <= 32'h0; // @[ClkCounter.scala 25:26]
    end else if (msCounter >= 32'h3a98) begin // @[ClkCounter.scala 30:37]
      msCounter <= 32'h0; // @[ClkCounter.scala 31:15]
    end else begin
      msCounter <= _msCounter_T_1; // @[ClkCounter.scala 34:15]
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
  _RAND_0 = {2{`RANDOM}};
  counter = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  msCount = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  msCounter = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
