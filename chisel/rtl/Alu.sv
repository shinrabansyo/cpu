module Alu(
  input  [7:0]  io_command,
  input  [31:0] io_a,
  input  [31:0] io_b,
  output        io_zero,
  output [31:0] io_out
);
  wire  _io_out_T = io_command == 8'h1; // @[Alu.scala 20:17]
  wire [31:0] _io_out_T_2 = io_a + io_b; // @[Alu.scala 20:40]
  wire  _io_out_T_3 = io_command == 8'h2; // @[Alu.scala 21:17]
  wire [31:0] _io_out_T_5 = io_a - io_b; // @[Alu.scala 21:40]
  wire  _io_out_T_6 = io_command == 8'h3; // @[Alu.scala 22:17]
  wire [31:0] _io_out_T_7 = io_a & io_b; // @[Alu.scala 22:40]
  wire  _io_out_T_8 = io_command == 8'h4; // @[Alu.scala 23:17]
  wire [31:0] _io_out_T_9 = io_a | io_b; // @[Alu.scala 23:40]
  wire  _io_out_T_10 = io_command == 8'h5; // @[Alu.scala 24:17]
  wire [31:0] _io_out_T_11 = io_a ^ io_b; // @[Alu.scala 24:40]
  wire  _io_out_T_12 = io_command == 8'h6; // @[Alu.scala 25:17]
  wire [31:0] _io_out_T_14 = io_a >> io_b[4:0]; // @[Alu.scala 25:40]
  wire  _io_out_T_15 = io_command == 8'h7; // @[Alu.scala 26:17]
  wire [31:0] _io_out_T_19 = $signed(io_a) >>> io_b[4:0]; // @[Alu.scala 26:62]
  wire  _io_out_T_20 = io_command == 8'h8; // @[Alu.scala 27:17]
  wire [62:0] _GEN_0 = {{31'd0}, io_a}; // @[Alu.scala 27:40]
  wire [62:0] _io_out_T_22 = _GEN_0 << io_b[4:0]; // @[Alu.scala 27:40]
  wire [62:0] _io_out_T_23 = _io_out_T_20 ? _io_out_T_22 : 63'h0; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_24 = _io_out_T_15 ? {{31'd0}, _io_out_T_19} : _io_out_T_23; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_25 = _io_out_T_12 ? {{31'd0}, _io_out_T_14} : _io_out_T_24; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_26 = _io_out_T_10 ? {{31'd0}, _io_out_T_11} : _io_out_T_25; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_27 = _io_out_T_8 ? {{31'd0}, _io_out_T_9} : _io_out_T_26; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_28 = _io_out_T_6 ? {{31'd0}, _io_out_T_7} : _io_out_T_27; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_29 = _io_out_T_3 ? {{31'd0}, _io_out_T_5} : _io_out_T_28; // @[Mux.scala 101:16]
  wire [62:0] _io_out_T_30 = _io_out_T ? {{31'd0}, _io_out_T_2} : _io_out_T_29; // @[Mux.scala 101:16]
  assign io_zero = io_out == 32'h0; // @[Alu.scala 17:22]
  assign io_out = _io_out_T_30[31:0]; // @[Alu.scala 19:10]
endmodule
