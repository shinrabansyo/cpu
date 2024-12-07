module Core(
  input        clock,
  input        reset,
  output       io_tx,
  input        io_rx,
  output       io_sclk,
  output       io_mosi,
  input        io_miso,
  output [7:0] io_gpout
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_26;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] alu_io_command; // @[Core.scala 23:19]
  wire [31:0] alu_io_a; // @[Core.scala 23:19]
  wire [31:0] alu_io_b; // @[Core.scala 23:19]
  wire  alu_io_zero; // @[Core.scala 23:19]
  wire [31:0] alu_io_out; // @[Core.scala 23:19]
  wire  ioBus_clock; // @[Core.scala 26:21]
  wire  ioBus_reset; // @[Core.scala 26:21]
  wire [31:0] ioBus_io_devId; // @[Core.scala 26:21]
  wire  ioBus_io_din_ready; // @[Core.scala 26:21]
  wire  ioBus_io_din_valid; // @[Core.scala 26:21]
  wire [31:0] ioBus_io_din_bits; // @[Core.scala 26:21]
  wire  ioBus_io_dout_ready; // @[Core.scala 26:21]
  wire  ioBus_io_dout_valid; // @[Core.scala 26:21]
  wire [31:0] ioBus_io_dout_bits; // @[Core.scala 26:21]
  wire  ioBus_io_tx; // @[Core.scala 26:21]
  wire  ioBus_io_rx; // @[Core.scala 26:21]
  wire  ioBus_io_sclk; // @[Core.scala 26:21]
  wire  ioBus_io_mosi; // @[Core.scala 26:21]
  wire  ioBus_io_miso; // @[Core.scala 26:21]
  wire [7:0] ioBus_io_gpout; // @[Core.scala 26:21]
  reg [7:0] imem [0:6143]; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_data; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_1_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_1_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_1_data; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_2_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_2_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_2_data; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_3_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_3_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_3_data; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_4_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_4_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_4_data; // @[Core.scala 36:32]
  wire  imem_instr_MPORT_5_en; // @[Core.scala 36:32]
  wire [12:0] imem_instr_MPORT_5_addr; // @[Core.scala 36:32]
  wire [7:0] imem_instr_MPORT_5_data; // @[Core.scala 36:32]
  reg  imem_instr_MPORT_en_pipe_0;
  reg [12:0] imem_instr_MPORT_addr_pipe_0;
  reg  imem_instr_MPORT_1_en_pipe_0;
  reg [12:0] imem_instr_MPORT_1_addr_pipe_0;
  reg  imem_instr_MPORT_2_en_pipe_0;
  reg [12:0] imem_instr_MPORT_2_addr_pipe_0;
  reg  imem_instr_MPORT_3_en_pipe_0;
  reg [12:0] imem_instr_MPORT_3_addr_pipe_0;
  reg  imem_instr_MPORT_4_en_pipe_0;
  reg [12:0] imem_instr_MPORT_4_addr_pipe_0;
  reg  imem_instr_MPORT_5_en_pipe_0;
  reg [12:0] imem_instr_MPORT_5_addr_pipe_0;
  reg [7:0] dmem [0:4095]; // @[Core.scala 38:32]
  wire  dmem_dmem_read_data_MPORT_en; // @[Core.scala 38:32]
  wire [11:0] dmem_dmem_read_data_MPORT_addr; // @[Core.scala 38:32]
  wire [7:0] dmem_dmem_read_data_MPORT_data; // @[Core.scala 38:32]
  wire  dmem_dmem_read_data_MPORT_1_en; // @[Core.scala 38:32]
  wire [11:0] dmem_dmem_read_data_MPORT_1_addr; // @[Core.scala 38:32]
  wire [7:0] dmem_dmem_read_data_MPORT_1_data; // @[Core.scala 38:32]
  wire  dmem_dmem_read_data_MPORT_2_en; // @[Core.scala 38:32]
  wire [11:0] dmem_dmem_read_data_MPORT_2_addr; // @[Core.scala 38:32]
  wire [7:0] dmem_dmem_read_data_MPORT_2_data; // @[Core.scala 38:32]
  wire  dmem_dmem_read_data_MPORT_3_en; // @[Core.scala 38:32]
  wire [11:0] dmem_dmem_read_data_MPORT_3_addr; // @[Core.scala 38:32]
  wire [7:0] dmem_dmem_read_data_MPORT_3_data; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_2_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_2_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_2_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_2_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_4_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_4_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_4_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_4_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_6_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_6_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_6_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_6_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_8_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_8_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_8_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_8_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_10_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_10_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_10_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_10_en; // @[Core.scala 38:32]
  wire [7:0] dmem_MPORT_12_data; // @[Core.scala 38:32]
  wire [11:0] dmem_MPORT_12_addr; // @[Core.scala 38:32]
  wire  dmem_MPORT_12_mask; // @[Core.scala 38:32]
  wire  dmem_MPORT_12_en; // @[Core.scala 38:32]
  reg  dmem_dmem_read_data_MPORT_en_pipe_0;
  reg [11:0] dmem_dmem_read_data_MPORT_addr_pipe_0;
  reg  dmem_dmem_read_data_MPORT_1_en_pipe_0;
  reg [11:0] dmem_dmem_read_data_MPORT_1_addr_pipe_0;
  reg  dmem_dmem_read_data_MPORT_2_en_pipe_0;
  reg [11:0] dmem_dmem_read_data_MPORT_2_addr_pipe_0;
  reg  dmem_dmem_read_data_MPORT_3_en_pipe_0;
  reg [11:0] dmem_dmem_read_data_MPORT_3_addr_pipe_0;
  reg [31:0] regfile [0:31]; // @[Core.scala 47:27]
  wire  regfile_alu_io_a_MPORT_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_a_MPORT_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_a_MPORT_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_a_MPORT_1_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_a_MPORT_1_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_a_MPORT_1_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_a_MPORT_2_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_a_MPORT_2_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_a_MPORT_2_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_a_MPORT_3_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_a_MPORT_3_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_a_MPORT_3_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_a_MPORT_4_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_a_MPORT_4_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_a_MPORT_4_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_a_MPORT_5_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_a_MPORT_5_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_a_MPORT_5_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_a_MPORT_6_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_a_MPORT_6_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_a_MPORT_6_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_a_MPORT_7_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_a_MPORT_7_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_a_MPORT_7_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_b_MPORT_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_b_MPORT_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_b_MPORT_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_b_MPORT_1_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_b_MPORT_1_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_b_MPORT_1_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_b_MPORT_2_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_b_MPORT_2_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_b_MPORT_2_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_b_MPORT_3_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_b_MPORT_3_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_b_MPORT_3_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_b_MPORT_4_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_b_MPORT_4_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_b_MPORT_4_data; // @[Core.scala 47:27]
  wire  regfile_alu_io_b_MPORT_5_en; // @[Core.scala 47:27]
  wire [4:0] regfile_alu_io_b_MPORT_5_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_alu_io_b_MPORT_5_data; // @[Core.scala 47:27]
  wire  regfile_MPORT_1_en; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_1_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_1_data; // @[Core.scala 47:27]
  wire  regfile_MPORT_3_en; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_3_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_3_data; // @[Core.scala 47:27]
  wire  regfile_MPORT_5_en; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_5_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_5_data; // @[Core.scala 47:27]
  wire  regfile_MPORT_7_en; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_7_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_7_data; // @[Core.scala 47:27]
  wire  regfile_MPORT_9_en; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_9_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_9_data; // @[Core.scala 47:27]
  wire  regfile_MPORT_11_en; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_11_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_11_data; // @[Core.scala 47:27]
  wire  regfile_MPORT_13_en; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_13_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_13_data; // @[Core.scala 47:27]
  wire  regfile_MPORT_15_en; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_15_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_15_data; // @[Core.scala 47:27]
  wire  regfile_MPORT_16_en; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_16_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_16_data; // @[Core.scala 47:27]
  wire  regfile_MPORT_17_en; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_17_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_17_data; // @[Core.scala 47:27]
  wire  regfile_ioBus_io_dout_bits_MPORT_en; // @[Core.scala 47:27]
  wire [4:0] regfile_ioBus_io_dout_bits_MPORT_addr; // @[Core.scala 47:27]
  wire [31:0] regfile_ioBus_io_dout_bits_MPORT_data; // @[Core.scala 47:27]
  wire [31:0] regfile_MPORT_14_data; // @[Core.scala 47:27]
  wire [4:0] regfile_MPORT_14_addr; // @[Core.scala 47:27]
  wire  regfile_MPORT_14_mask; // @[Core.scala 47:27]
  wire  regfile_MPORT_14_en; // @[Core.scala 47:27]
  reg  first_time; // @[Core.scala 42:31]
  reg [31:0] pc; // @[Core.scala 43:31]
  reg [31:0] pc_next_plus_6; // @[Core.scala 44:31]
  reg  load_ready; // @[Core.scala 63:31]
  wire [47:0] _instr_T_24 = {imem_instr_MPORT_5_data,imem_instr_MPORT_4_data,imem_instr_MPORT_3_data,
    imem_instr_MPORT_2_data,imem_instr_MPORT_1_data,imem_instr_MPORT_data}; // @[Cat.scala 33:92]
  wire [47:0] instr = first_time ? 48'h0 : _instr_T_24; // @[Core.scala 67:15]
  wire [4:0] opcode = instr[4:0]; // @[Core.scala 91:22]
  wire  _pc_next_T = opcode == 5'h3; // @[Core.scala 75:13]
  wire [2:0] opcode_sub = instr[7:5]; // @[Core.scala 92:22]
  wire  _pc_next_T_1 = opcode_sub == 3'h0; // @[Core.scala 75:40]
  wire  _pc_next_T_2 = opcode == 5'h3 & opcode_sub == 3'h0; // @[Core.scala 75:26]
  wire  _pc_next_T_3 = alu_io_zero; // @[Core.scala 75:68]
  wire  _pc_next_T_4 = opcode == 5'h3 & opcode_sub == 3'h0 & alu_io_zero; // @[Core.scala 75:53]
  wire [24:0] imm_b = instr[47:23]; // @[Core.scala 100:22]
  wire [6:0] _imm_b_sext_T_2 = imm_b[24] ? 7'h7f : 7'h0; // @[Bitwise.scala 77:12]
  wire [31:0] imm_b_sext = {_imm_b_sext_T_2,imm_b}; // @[Cat.scala 33:92]
  wire [31:0] _pc_next_T_6 = pc + imm_b_sext; // @[Core.scala 75:88]
  wire  _pc_next_T_8 = opcode_sub == 3'h1; // @[Core.scala 76:40]
  wire  _pc_next_T_9 = _pc_next_T & opcode_sub == 3'h1; // @[Core.scala 76:26]
  wire  _pc_next_T_11 = _pc_next_T & opcode_sub == 3'h1 & ~alu_io_zero; // @[Core.scala 76:53]
  wire  _pc_next_T_15 = opcode_sub == 3'h3; // @[Core.scala 77:40]
  wire  _pc_next_T_16 = _pc_next_T & opcode_sub == 3'h3; // @[Core.scala 77:26]
  wire  _pc_next_T_21 = _pc_next_T & opcode_sub == 3'h3 & (alu_io_out[31] | _pc_next_T_3); // @[Core.scala 77:53]
  wire  _pc_next_T_25 = opcode_sub == 3'h2; // @[Core.scala 78:40]
  wire  _pc_next_T_26 = _pc_next_T & opcode_sub == 3'h2; // @[Core.scala 78:26]
  wire  _pc_next_T_29 = _pc_next_T & opcode_sub == 3'h2 & alu_io_out[31]; // @[Core.scala 78:53]
  wire  _pc_next_T_33 = opcode_sub == 3'h4; // @[Core.scala 79:40]
  wire  _pc_next_T_34 = _pc_next_T & opcode_sub == 3'h4; // @[Core.scala 79:26]
  wire  _pc_next_T_35 = opcode == 5'h4; // @[Core.scala 81:13]
  wire  _pc_next_T_37 = opcode == 5'h4 & ~load_ready; // @[Core.scala 81:26]
  wire  _pc_next_T_38 = opcode == 5'h6; // @[Core.scala 83:13]
  wire  _pc_next_T_40 = opcode == 5'h6 & _pc_next_T_1; // @[Core.scala 83:26]
  wire  _pc_next_T_42 = opcode == 5'h6 & _pc_next_T_1 & ~ioBus_io_din_valid; // @[Core.scala 83:53]
  wire  _pc_next_T_45 = _pc_next_T_38 & _pc_next_T_8; // @[Core.scala 84:26]
  wire  _pc_next_T_47 = _pc_next_T_38 & _pc_next_T_8 & ~ioBus_io_dout_ready; // @[Core.scala 84:53]
  wire [31:0] _pc_next_T_48 = _pc_next_T_47 ? pc : pc_next_plus_6; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_49 = _pc_next_T_42 ? pc : _pc_next_T_48; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_50 = _pc_next_T_37 ? pc : _pc_next_T_49; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_51 = _pc_next_T_34 ? alu_io_out : _pc_next_T_50; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_52 = _pc_next_T_29 ? _pc_next_T_6 : _pc_next_T_51; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_53 = _pc_next_T_21 ? _pc_next_T_6 : _pc_next_T_52; // @[Mux.scala 101:16]
  wire [31:0] _pc_next_T_54 = _pc_next_T_11 ? _pc_next_T_6 : _pc_next_T_53; // @[Mux.scala 101:16]
  wire [31:0] pc_next = _pc_next_T_4 ? _pc_next_T_6 : _pc_next_T_54; // @[Mux.scala 101:16]
  wire [32:0] _instr_T = {{1'd0}, pc_next}; // @[Core.scala 67:76]
  wire [31:0] _instr_T_5 = pc_next + 32'h1; // @[Core.scala 67:76]
  wire [31:0] _instr_T_9 = pc_next + 32'h2; // @[Core.scala 67:76]
  wire [31:0] _instr_T_13 = pc_next + 32'h3; // @[Core.scala 67:76]
  wire [31:0] _instr_T_17 = pc_next + 32'h4; // @[Core.scala 67:76]
  wire [31:0] _instr_T_21 = pc_next + 32'h5; // @[Core.scala 67:76]
  wire [31:0] _pc_next_plus_6_T_1 = pc_next + 32'h6; // @[Core.scala 70:29]
  wire [4:0] rd = instr[12:8]; // @[Core.scala 93:22]
  wire [31:0] imm = instr[47:16]; // @[Core.scala 99:22]
  wire  _command_T = opcode == 5'h1; // @[Core.scala 105:13]
  wire  _command_T_2 = opcode == 5'h1 & _pc_next_T_8; // @[Core.scala 105:26]
  wire  _command_T_5 = _command_T & _pc_next_T_25; // @[Core.scala 106:26]
  wire  _command_T_6 = opcode == 5'h2; // @[Core.scala 108:13]
  wire  _command_T_8 = opcode == 5'h2 & _pc_next_T_8; // @[Core.scala 108:26]
  wire  _command_T_11 = _command_T_6 & _pc_next_T_25; // @[Core.scala 109:26]
  wire  _command_T_29 = _pc_next_T_35 & _pc_next_T_1; // @[Core.scala 117:26]
  wire  _command_T_32 = _pc_next_T_35 & _pc_next_T_8; // @[Core.scala 118:26]
  wire  _command_T_35 = _pc_next_T_35 & _pc_next_T_25; // @[Core.scala 119:26]
  wire  _command_T_38 = _pc_next_T_35 & _pc_next_T_15; // @[Core.scala 120:26]
  wire  _command_T_41 = _pc_next_T_35 & _pc_next_T_33; // @[Core.scala 121:26]
  wire  _command_T_42 = opcode == 5'h5; // @[Core.scala 123:13]
  wire  _command_T_44 = opcode == 5'h5 & _pc_next_T_1; // @[Core.scala 123:26]
  wire  _command_T_47 = _command_T_42 & _pc_next_T_8; // @[Core.scala 124:26]
  wire  _command_T_50 = _command_T_42 & _pc_next_T_25; // @[Core.scala 125:26]
  wire  _command_T_57 = opcode == 5'h7; // @[Core.scala 130:13]
  wire  _command_T_59 = opcode == 5'h7 & _pc_next_T_1; // @[Core.scala 130:26]
  wire  _command_T_62 = _command_T_57 & _pc_next_T_8; // @[Core.scala 131:26]
  wire  _command_T_65 = _command_T_57 & _pc_next_T_25; // @[Core.scala 132:26]
  wire  _command_T_68 = _command_T_57 & _pc_next_T_15; // @[Core.scala 133:26]
  wire  _command_T_71 = _command_T_57 & _pc_next_T_33; // @[Core.scala 134:26]
  wire  _command_T_73 = opcode_sub == 3'h5; // @[Core.scala 135:40]
  wire  _command_T_74 = _command_T_57 & opcode_sub == 3'h5; // @[Core.scala 135:26]
  wire  _command_T_75 = opcode == 5'h8; // @[Core.scala 137:13]
  wire  _command_T_77 = opcode == 5'h8 & _pc_next_T_1; // @[Core.scala 137:26]
  wire  _command_T_80 = _command_T_75 & _pc_next_T_8; // @[Core.scala 138:26]
  wire  _command_T_83 = _command_T_75 & _pc_next_T_25; // @[Core.scala 139:26]
  wire  _command_T_86 = _command_T_75 & _pc_next_T_15; // @[Core.scala 140:26]
  wire  _command_T_89 = _command_T_75 & _pc_next_T_33; // @[Core.scala 141:26]
  wire  _command_T_92 = _command_T_75 & _command_T_73; // @[Core.scala 142:26]
  wire [7:0] _command_T_93 = _command_T_92 ? 8'h8 : 8'h0; // @[Mux.scala 101:16]
  wire [7:0] _command_T_94 = _command_T_89 ? 8'h7 : _command_T_93; // @[Mux.scala 101:16]
  wire [7:0] _command_T_95 = _command_T_86 ? 8'h6 : _command_T_94; // @[Mux.scala 101:16]
  wire [7:0] _command_T_96 = _command_T_83 ? 8'h5 : _command_T_95; // @[Mux.scala 101:16]
  wire [7:0] _command_T_97 = _command_T_80 ? 8'h4 : _command_T_96; // @[Mux.scala 101:16]
  wire [7:0] _command_T_98 = _command_T_77 ? 8'h3 : _command_T_97; // @[Mux.scala 101:16]
  wire [7:0] _command_T_99 = _command_T_74 ? 8'h8 : _command_T_98; // @[Mux.scala 101:16]
  wire [7:0] _command_T_100 = _command_T_71 ? 8'h7 : _command_T_99; // @[Mux.scala 101:16]
  wire [7:0] _command_T_101 = _command_T_68 ? 8'h6 : _command_T_100; // @[Mux.scala 101:16]
  wire [7:0] _command_T_102 = _command_T_65 ? 8'h5 : _command_T_101; // @[Mux.scala 101:16]
  wire [7:0] _command_T_103 = _command_T_62 ? 8'h4 : _command_T_102; // @[Mux.scala 101:16]
  wire [7:0] _command_T_104 = _command_T_59 ? 8'h3 : _command_T_103; // @[Mux.scala 101:16]
  wire [7:0] _command_T_105 = _pc_next_T_45 ? 8'h1 : _command_T_104; // @[Mux.scala 101:16]
  wire [7:0] _command_T_106 = _pc_next_T_40 ? 8'h1 : _command_T_105; // @[Mux.scala 101:16]
  wire [7:0] _command_T_107 = _command_T_50 ? 8'h1 : _command_T_106; // @[Mux.scala 101:16]
  wire [7:0] _command_T_108 = _command_T_47 ? 8'h1 : _command_T_107; // @[Mux.scala 101:16]
  wire [7:0] _command_T_109 = _command_T_44 ? 8'h1 : _command_T_108; // @[Mux.scala 101:16]
  wire [7:0] _command_T_110 = _command_T_41 ? 8'h1 : _command_T_109; // @[Mux.scala 101:16]
  wire [7:0] _command_T_111 = _command_T_38 ? 8'h1 : _command_T_110; // @[Mux.scala 101:16]
  wire [7:0] _command_T_112 = _command_T_35 ? 8'h1 : _command_T_111; // @[Mux.scala 101:16]
  wire [7:0] _command_T_113 = _command_T_32 ? 8'h1 : _command_T_112; // @[Mux.scala 101:16]
  wire [7:0] _command_T_114 = _command_T_29 ? 8'h1 : _command_T_113; // @[Mux.scala 101:16]
  wire [7:0] _command_T_115 = _pc_next_T_34 ? 8'h1 : _command_T_114; // @[Mux.scala 101:16]
  wire [7:0] _command_T_116 = _pc_next_T_16 ? 8'h2 : _command_T_115; // @[Mux.scala 101:16]
  wire [7:0] _command_T_117 = _pc_next_T_26 ? 8'h2 : _command_T_116; // @[Mux.scala 101:16]
  wire [7:0] _command_T_118 = _pc_next_T_9 ? 8'h2 : _command_T_117; // @[Mux.scala 101:16]
  wire [7:0] _command_T_119 = _pc_next_T_2 ? 8'h2 : _command_T_118; // @[Mux.scala 101:16]
  wire [7:0] _command_T_120 = _command_T_11 ? 8'h2 : _command_T_119; // @[Mux.scala 101:16]
  wire [7:0] _command_T_121 = _command_T_8 ? 8'h1 : _command_T_120; // @[Mux.scala 101:16]
  wire [7:0] _command_T_122 = _command_T_5 ? 8'h2 : _command_T_121; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_13 = _command_T_75 ? regfile_alu_io_a_MPORT_7_data : regfile_alu_io_a_MPORT_data; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_14 = _pc_next_T_45 ? regfile_alu_io_a_MPORT_6_data : _alu_io_a_T_13; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_15 = _pc_next_T_40 ? regfile_alu_io_a_MPORT_5_data : _alu_io_a_T_14; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_16 = _command_T_42 ? regfile_alu_io_a_MPORT_4_data : _alu_io_a_T_15; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_17 = _pc_next_T_35 ? regfile_alu_io_a_MPORT_3_data : _alu_io_a_T_16; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_a_T_18 = _pc_next_T_34 ? regfile_alu_io_a_MPORT_2_data : _alu_io_a_T_17; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_22 = _command_T_75 ? imm : 32'h0; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_23 = _command_T_57 ? regfile_alu_io_b_MPORT_5_data : _alu_io_b_T_22; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_24 = _pc_next_T_38 ? imm : _alu_io_b_T_23; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_25 = _command_T_42 ? imm : _alu_io_b_T_24; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_26 = _pc_next_T_35 ? imm : _alu_io_b_T_25; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_27 = _pc_next_T_34 ? imm : _alu_io_b_T_26; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_28 = _pc_next_T_16 ? regfile_alu_io_b_MPORT_4_data : _alu_io_b_T_27; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_29 = _pc_next_T_26 ? regfile_alu_io_b_MPORT_3_data : _alu_io_b_T_28; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_30 = _pc_next_T_9 ? regfile_alu_io_b_MPORT_2_data : _alu_io_b_T_29; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_31 = _pc_next_T_2 ? regfile_alu_io_b_MPORT_1_data : _alu_io_b_T_30; // @[Mux.scala 101:16]
  wire [31:0] _alu_io_b_T_32 = _command_T_6 ? imm : _alu_io_b_T_31; // @[Mux.scala 101:16]
  wire [32:0] _T_3 = {{1'd0}, alu_io_out}; // @[Core.scala 175:23]
  wire [31:0] _T_8 = alu_io_out + 32'h1; // @[Core.scala 175:23]
  wire [31:0] _T_12 = alu_io_out + 32'h2; // @[Core.scala 175:23]
  wire [31:0] _T_16 = alu_io_out + 32'h3; // @[Core.scala 175:23]
  wire  _GEN_30 = _command_T_47 ? 1'h0 : _command_T_50; // @[Core.scala 177:66 38:32]
  wire [31:0] dmem_read_data = {dmem_dmem_read_data_MPORT_3_data,dmem_dmem_read_data_MPORT_2_data,
    dmem_dmem_read_data_MPORT_1_data,dmem_dmem_read_data_MPORT_data}; // @[Cat.scala 33:92]
  wire  _T_38 = rd == 5'h0; // @[Core.scala 198:9]
  wire [31:0] _T_43 = pc + 32'h6; // @[Core.scala 200:61]
  wire [15:0] _T_72 = dmem_read_data[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _T_74 = {_T_72,dmem_read_data[15:0]}; // @[Cat.scala 33:92]
  wire [23:0] _T_80 = dmem_read_data[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _T_82 = {_T_80,dmem_read_data[7:0]}; // @[Cat.scala 33:92]
  wire [31:0] _T_86 = 32'hffff & dmem_read_data; // @[Core.scala 209:67]
  wire [31:0] _T_90 = 32'hff & dmem_read_data; // @[Core.scala 210:65]
  wire  _T_95 = _pc_next_T_40 & ioBus_io_din_valid; // @[Core.scala 214:53]
  wire [31:0] _T_104 = _pc_next_T_45 ? regfile_MPORT_17_data : alu_io_out; // @[Mux.scala 101:16]
  wire [31:0] _T_105 = _pc_next_T_42 ? regfile_MPORT_16_data : _T_104; // @[Mux.scala 101:16]
  wire [31:0] _T_106 = _T_95 ? ioBus_io_din_bits : _T_105; // @[Mux.scala 101:16]
  wire [31:0] _T_107 = _command_T_42 ? regfile_MPORT_15_data : _T_106; // @[Mux.scala 101:16]
  wire [31:0] _T_108 = _command_T_35 ? _T_90 : _T_107; // @[Mux.scala 101:16]
  wire [31:0] _T_109 = _command_T_32 ? _T_86 : _T_108; // @[Mux.scala 101:16]
  wire [31:0] _T_110 = _command_T_32 ? _T_82 : _T_109; // @[Mux.scala 101:16]
  wire [31:0] _T_111 = _command_T_32 ? _T_74 : _T_110; // @[Mux.scala 101:16]
  wire [31:0] _T_112 = _command_T_29 ? dmem_read_data : _T_111; // @[Mux.scala 101:16]
  wire [31:0] _T_113 = _pc_next_T_34 ? _T_43 : _T_112; // @[Mux.scala 101:16]
  wire [31:0] _T_114 = _pc_next_T_16 ? _T_43 : _T_113; // @[Mux.scala 101:16]
  wire [31:0] _T_115 = _pc_next_T_26 ? _T_43 : _T_114; // @[Mux.scala 101:16]
  wire [31:0] _T_116 = _pc_next_T_9 ? _T_43 : _T_115; // @[Mux.scala 101:16]
  wire [31:0] _T_117 = _pc_next_T_2 ? _T_43 : _T_116; // @[Mux.scala 101:16]
  Alu alu ( // @[Core.scala 23:19]
    .io_command(alu_io_command),
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_zero(alu_io_zero),
    .io_out(alu_io_out)
  );
  IOBus ioBus ( // @[Core.scala 26:21]
    .clock(ioBus_clock),
    .reset(ioBus_reset),
    .io_devId(ioBus_io_devId),
    .io_din_ready(ioBus_io_din_ready),
    .io_din_valid(ioBus_io_din_valid),
    .io_din_bits(ioBus_io_din_bits),
    .io_dout_ready(ioBus_io_dout_ready),
    .io_dout_valid(ioBus_io_dout_valid),
    .io_dout_bits(ioBus_io_dout_bits),
    .io_tx(ioBus_io_tx),
    .io_rx(ioBus_io_rx),
    .io_sclk(ioBus_io_sclk),
    .io_mosi(ioBus_io_mosi),
    .io_miso(ioBus_io_miso),
    .io_gpout(ioBus_io_gpout)
  );
  assign imem_instr_MPORT_en = imem_instr_MPORT_en_pipe_0;
  assign imem_instr_MPORT_addr = imem_instr_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_data = imem[imem_instr_MPORT_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_data = imem_instr_MPORT_addr >= 13'h1800 ? _RAND_0[7:0] : imem[imem_instr_MPORT_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_1_en = imem_instr_MPORT_1_en_pipe_0;
  assign imem_instr_MPORT_1_addr = imem_instr_MPORT_1_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_1_data = imem[imem_instr_MPORT_1_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_1_data = imem_instr_MPORT_1_addr >= 13'h1800 ? _RAND_1[7:0] : imem[imem_instr_MPORT_1_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_2_en = imem_instr_MPORT_2_en_pipe_0;
  assign imem_instr_MPORT_2_addr = imem_instr_MPORT_2_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_2_data = imem[imem_instr_MPORT_2_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_2_data = imem_instr_MPORT_2_addr >= 13'h1800 ? _RAND_2[7:0] : imem[imem_instr_MPORT_2_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_3_en = imem_instr_MPORT_3_en_pipe_0;
  assign imem_instr_MPORT_3_addr = imem_instr_MPORT_3_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_3_data = imem[imem_instr_MPORT_3_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_3_data = imem_instr_MPORT_3_addr >= 13'h1800 ? _RAND_3[7:0] : imem[imem_instr_MPORT_3_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_4_en = imem_instr_MPORT_4_en_pipe_0;
  assign imem_instr_MPORT_4_addr = imem_instr_MPORT_4_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_4_data = imem[imem_instr_MPORT_4_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_4_data = imem_instr_MPORT_4_addr >= 13'h1800 ? _RAND_4[7:0] : imem[imem_instr_MPORT_4_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_5_en = imem_instr_MPORT_5_en_pipe_0;
  assign imem_instr_MPORT_5_addr = imem_instr_MPORT_5_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign imem_instr_MPORT_5_data = imem[imem_instr_MPORT_5_addr]; // @[Core.scala 36:32]
  `else
  assign imem_instr_MPORT_5_data = imem_instr_MPORT_5_addr >= 13'h1800 ? _RAND_5[7:0] : imem[imem_instr_MPORT_5_addr]; // @[Core.scala 36:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign dmem_dmem_read_data_MPORT_en = dmem_dmem_read_data_MPORT_en_pipe_0;
  assign dmem_dmem_read_data_MPORT_addr = dmem_dmem_read_data_MPORT_addr_pipe_0;
  assign dmem_dmem_read_data_MPORT_data = dmem[dmem_dmem_read_data_MPORT_addr]; // @[Core.scala 38:32]
  assign dmem_dmem_read_data_MPORT_1_en = dmem_dmem_read_data_MPORT_1_en_pipe_0;
  assign dmem_dmem_read_data_MPORT_1_addr = dmem_dmem_read_data_MPORT_1_addr_pipe_0;
  assign dmem_dmem_read_data_MPORT_1_data = dmem[dmem_dmem_read_data_MPORT_1_addr]; // @[Core.scala 38:32]
  assign dmem_dmem_read_data_MPORT_2_en = dmem_dmem_read_data_MPORT_2_en_pipe_0;
  assign dmem_dmem_read_data_MPORT_2_addr = dmem_dmem_read_data_MPORT_2_addr_pipe_0;
  assign dmem_dmem_read_data_MPORT_2_data = dmem[dmem_dmem_read_data_MPORT_2_addr]; // @[Core.scala 38:32]
  assign dmem_dmem_read_data_MPORT_3_en = dmem_dmem_read_data_MPORT_3_en_pipe_0;
  assign dmem_dmem_read_data_MPORT_3_addr = dmem_dmem_read_data_MPORT_3_addr_pipe_0;
  assign dmem_dmem_read_data_MPORT_3_data = dmem[dmem_dmem_read_data_MPORT_3_addr]; // @[Core.scala 38:32]
  assign dmem_MPORT_data = regfile_MPORT_1_data[7:0];
  assign dmem_MPORT_addr = _T_3[11:0];
  assign dmem_MPORT_mask = 1'h1;
  assign dmem_MPORT_en = _command_T_42 & _pc_next_T_1;
  assign dmem_MPORT_2_data = regfile_MPORT_3_data[15:8];
  assign dmem_MPORT_2_addr = _T_8[11:0];
  assign dmem_MPORT_2_mask = 1'h1;
  assign dmem_MPORT_2_en = _command_T_42 & _pc_next_T_1;
  assign dmem_MPORT_4_data = regfile_MPORT_5_data[23:16];
  assign dmem_MPORT_4_addr = _T_12[11:0];
  assign dmem_MPORT_4_mask = 1'h1;
  assign dmem_MPORT_4_en = _command_T_42 & _pc_next_T_1;
  assign dmem_MPORT_6_data = regfile_MPORT_7_data[31:24];
  assign dmem_MPORT_6_addr = _T_16[11:0];
  assign dmem_MPORT_6_mask = 1'h1;
  assign dmem_MPORT_6_en = _command_T_42 & _pc_next_T_1;
  assign dmem_MPORT_8_data = regfile_MPORT_9_data[7:0];
  assign dmem_MPORT_8_addr = _T_3[11:0];
  assign dmem_MPORT_8_mask = 1'h1;
  assign dmem_MPORT_8_en = _command_T_44 ? 1'h0 : _command_T_47;
  assign dmem_MPORT_10_data = regfile_MPORT_11_data[15:8];
  assign dmem_MPORT_10_addr = _T_8[11:0];
  assign dmem_MPORT_10_mask = 1'h1;
  assign dmem_MPORT_10_en = _command_T_44 ? 1'h0 : _command_T_47;
  assign dmem_MPORT_12_data = regfile_MPORT_13_data[7:0];
  assign dmem_MPORT_12_addr = alu_io_out[11:0];
  assign dmem_MPORT_12_mask = 1'h1;
  assign dmem_MPORT_12_en = _command_T_44 ? 1'h0 : _GEN_30;
  assign regfile_alu_io_a_MPORT_en = 1'h1;
  assign regfile_alu_io_a_MPORT_addr = instr[17:13];
  assign regfile_alu_io_a_MPORT_data = regfile[regfile_alu_io_a_MPORT_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_a_MPORT_1_en = 1'h1;
  assign regfile_alu_io_a_MPORT_1_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_1_data = regfile[regfile_alu_io_a_MPORT_1_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_a_MPORT_2_en = 1'h1;
  assign regfile_alu_io_a_MPORT_2_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_2_data = regfile[regfile_alu_io_a_MPORT_2_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_a_MPORT_3_en = 1'h1;
  assign regfile_alu_io_a_MPORT_3_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_3_data = regfile[regfile_alu_io_a_MPORT_3_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_a_MPORT_4_en = 1'h1;
  assign regfile_alu_io_a_MPORT_4_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_4_data = regfile[regfile_alu_io_a_MPORT_4_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_a_MPORT_5_en = 1'h1;
  assign regfile_alu_io_a_MPORT_5_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_5_data = regfile[regfile_alu_io_a_MPORT_5_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_a_MPORT_6_en = 1'h1;
  assign regfile_alu_io_a_MPORT_6_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_6_data = regfile[regfile_alu_io_a_MPORT_6_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_a_MPORT_7_en = 1'h1;
  assign regfile_alu_io_a_MPORT_7_addr = {2'h0,instr[15:13]};
  assign regfile_alu_io_a_MPORT_7_data = regfile[regfile_alu_io_a_MPORT_7_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_b_MPORT_en = 1'h1;
  assign regfile_alu_io_b_MPORT_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_data = regfile[regfile_alu_io_b_MPORT_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_b_MPORT_1_en = 1'h1;
  assign regfile_alu_io_b_MPORT_1_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_1_data = regfile[regfile_alu_io_b_MPORT_1_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_b_MPORT_2_en = 1'h1;
  assign regfile_alu_io_b_MPORT_2_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_2_data = regfile[regfile_alu_io_b_MPORT_2_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_b_MPORT_3_en = 1'h1;
  assign regfile_alu_io_b_MPORT_3_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_3_data = regfile[regfile_alu_io_b_MPORT_3_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_b_MPORT_4_en = 1'h1;
  assign regfile_alu_io_b_MPORT_4_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_4_data = regfile[regfile_alu_io_b_MPORT_4_addr]; // @[Core.scala 47:27]
  assign regfile_alu_io_b_MPORT_5_en = 1'h1;
  assign regfile_alu_io_b_MPORT_5_addr = instr[22:18];
  assign regfile_alu_io_b_MPORT_5_data = regfile[regfile_alu_io_b_MPORT_5_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_1_en = _command_T_42 & _pc_next_T_1;
  assign regfile_MPORT_1_addr = instr[12:8];
  assign regfile_MPORT_1_data = regfile[regfile_MPORT_1_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_3_en = _command_T_42 & _pc_next_T_1;
  assign regfile_MPORT_3_addr = instr[12:8];
  assign regfile_MPORT_3_data = regfile[regfile_MPORT_3_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_5_en = _command_T_42 & _pc_next_T_1;
  assign regfile_MPORT_5_addr = instr[12:8];
  assign regfile_MPORT_5_data = regfile[regfile_MPORT_5_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_7_en = _command_T_42 & _pc_next_T_1;
  assign regfile_MPORT_7_addr = instr[12:8];
  assign regfile_MPORT_7_data = regfile[regfile_MPORT_7_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_9_en = _command_T_44 ? 1'h0 : _command_T_47;
  assign regfile_MPORT_9_addr = instr[12:8];
  assign regfile_MPORT_9_data = regfile[regfile_MPORT_9_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_11_en = _command_T_44 ? 1'h0 : _command_T_47;
  assign regfile_MPORT_11_addr = instr[12:8];
  assign regfile_MPORT_11_data = regfile[regfile_MPORT_11_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_13_en = _command_T_44 ? 1'h0 : _GEN_30;
  assign regfile_MPORT_13_addr = instr[12:8];
  assign regfile_MPORT_13_data = regfile[regfile_MPORT_13_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_15_en = 1'h1;
  assign regfile_MPORT_15_addr = instr[12:8];
  assign regfile_MPORT_15_data = regfile[regfile_MPORT_15_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_16_en = 1'h1;
  assign regfile_MPORT_16_addr = instr[12:8];
  assign regfile_MPORT_16_data = regfile[regfile_MPORT_16_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_17_en = 1'h1;
  assign regfile_MPORT_17_addr = instr[12:8];
  assign regfile_MPORT_17_data = regfile[regfile_MPORT_17_addr]; // @[Core.scala 47:27]
  assign regfile_ioBus_io_dout_bits_MPORT_en = 1'h1;
  assign regfile_ioBus_io_dout_bits_MPORT_addr = instr[12:8];
  assign regfile_ioBus_io_dout_bits_MPORT_data = regfile[regfile_ioBus_io_dout_bits_MPORT_addr]; // @[Core.scala 47:27]
  assign regfile_MPORT_14_data = _T_38 ? 32'h0 : _T_117;
  assign regfile_MPORT_14_addr = instr[12:8];
  assign regfile_MPORT_14_mask = 1'h1;
  assign regfile_MPORT_14_en = 1'h1;
  assign io_tx = ioBus_io_tx; // @[Core.scala 29:9]
  assign io_sclk = ioBus_io_sclk; // @[Core.scala 31:11]
  assign io_mosi = ioBus_io_mosi; // @[Core.scala 32:11]
  assign io_gpout = ioBus_io_gpout; // @[Core.scala 33:12]
  assign alu_io_command = _command_T_2 ? 8'h1 : _command_T_122; // @[Mux.scala 101:16]
  assign alu_io_a = _command_T_6 ? regfile_alu_io_a_MPORT_1_data : _alu_io_a_T_18; // @[Mux.scala 101:16]
  assign alu_io_b = _command_T ? regfile_alu_io_b_MPORT_data : _alu_io_b_T_32; // @[Mux.scala 101:16]
  assign ioBus_clock = clock;
  assign ioBus_reset = reset;
  assign ioBus_io_devId = alu_io_out; // @[Core.scala 221:18]
  assign ioBus_io_din_ready = _pc_next_T_38 & _pc_next_T_1; // @[Core.scala 223:46]
  assign ioBus_io_dout_valid = _pc_next_T_38 & _pc_next_T_8; // @[Core.scala 225:47]
  assign ioBus_io_dout_bits = regfile_ioBus_io_dout_bits_MPORT_data; // @[Core.scala 226:22]
  assign ioBus_io_rx = io_rx; // @[Core.scala 28:15]
  assign ioBus_io_miso = io_miso; // @[Core.scala 30:17]
  always @(posedge clock) begin
    imem_instr_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_addr_pipe_0 <= _instr_T[12:0];
    end
    imem_instr_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_1_addr_pipe_0 <= _instr_T_5[12:0];
    end
    imem_instr_MPORT_2_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_2_addr_pipe_0 <= _instr_T_9[12:0];
    end
    imem_instr_MPORT_3_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_3_addr_pipe_0 <= _instr_T_13[12:0];
    end
    imem_instr_MPORT_4_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_4_addr_pipe_0 <= _instr_T_17[12:0];
    end
    imem_instr_MPORT_5_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      imem_instr_MPORT_5_addr_pipe_0 <= _instr_T_21[12:0];
    end
    if (dmem_MPORT_en & dmem_MPORT_mask) begin
      dmem[dmem_MPORT_addr] <= dmem_MPORT_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_2_en & dmem_MPORT_2_mask) begin
      dmem[dmem_MPORT_2_addr] <= dmem_MPORT_2_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_4_en & dmem_MPORT_4_mask) begin
      dmem[dmem_MPORT_4_addr] <= dmem_MPORT_4_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_6_en & dmem_MPORT_6_mask) begin
      dmem[dmem_MPORT_6_addr] <= dmem_MPORT_6_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_8_en & dmem_MPORT_8_mask) begin
      dmem[dmem_MPORT_8_addr] <= dmem_MPORT_8_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_10_en & dmem_MPORT_10_mask) begin
      dmem[dmem_MPORT_10_addr] <= dmem_MPORT_10_data; // @[Core.scala 38:32]
    end
    if (dmem_MPORT_12_en & dmem_MPORT_12_mask) begin
      dmem[dmem_MPORT_12_addr] <= dmem_MPORT_12_data; // @[Core.scala 38:32]
    end
    dmem_dmem_read_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_read_data_MPORT_addr_pipe_0 <= _T_3[11:0];
    end
    dmem_dmem_read_data_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_read_data_MPORT_1_addr_pipe_0 <= _T_8[11:0];
    end
    dmem_dmem_read_data_MPORT_2_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_read_data_MPORT_2_addr_pipe_0 <= _T_12[11:0];
    end
    dmem_dmem_read_data_MPORT_3_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      dmem_dmem_read_data_MPORT_3_addr_pipe_0 <= _T_16[11:0];
    end
    if (regfile_MPORT_14_en & regfile_MPORT_14_mask) begin
      regfile[regfile_MPORT_14_addr] <= regfile_MPORT_14_data; // @[Core.scala 47:27]
    end
    first_time <= reset; // @[Core.scala 42:{31,31} 68:14]
    if (reset) begin // @[Core.scala 43:31]
      pc <= 32'h0; // @[Core.scala 43:31]
    end else if (_pc_next_T_4) begin // @[Mux.scala 101:16]
      pc <= _pc_next_T_6;
    end else if (_pc_next_T_11) begin // @[Mux.scala 101:16]
      pc <= _pc_next_T_6;
    end else if (_pc_next_T_21) begin // @[Mux.scala 101:16]
      pc <= _pc_next_T_6;
    end else begin
      pc <= _pc_next_T_52;
    end
    if (reset) begin // @[Core.scala 44:31]
      pc_next_plus_6 <= 32'h0; // @[Core.scala 44:31]
    end else begin
      pc_next_plus_6 <= _pc_next_plus_6_T_1; // @[Core.scala 70:18]
    end
    if (reset) begin // @[Core.scala 63:31]
      load_ready <= 1'h0; // @[Core.scala 63:31]
    end else begin
      load_ready <= _pc_next_T_37;
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
  integer initvar;
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_0 = {1{`RANDOM}};
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_4 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_26 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regfile[initvar] = _RAND_26[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  imem_instr_MPORT_en_pipe_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  imem_instr_MPORT_addr_pipe_0 = _RAND_7[12:0];
  _RAND_8 = {1{`RANDOM}};
  imem_instr_MPORT_1_en_pipe_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  imem_instr_MPORT_1_addr_pipe_0 = _RAND_9[12:0];
  _RAND_10 = {1{`RANDOM}};
  imem_instr_MPORT_2_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  imem_instr_MPORT_2_addr_pipe_0 = _RAND_11[12:0];
  _RAND_12 = {1{`RANDOM}};
  imem_instr_MPORT_3_en_pipe_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  imem_instr_MPORT_3_addr_pipe_0 = _RAND_13[12:0];
  _RAND_14 = {1{`RANDOM}};
  imem_instr_MPORT_4_en_pipe_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  imem_instr_MPORT_4_addr_pipe_0 = _RAND_15[12:0];
  _RAND_16 = {1{`RANDOM}};
  imem_instr_MPORT_5_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  imem_instr_MPORT_5_addr_pipe_0 = _RAND_17[12:0];
  _RAND_18 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_en_pipe_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_addr_pipe_0 = _RAND_19[11:0];
  _RAND_20 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_1_en_pipe_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_1_addr_pipe_0 = _RAND_21[11:0];
  _RAND_22 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_2_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_2_addr_pipe_0 = _RAND_23[11:0];
  _RAND_24 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_3_en_pipe_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  dmem_dmem_read_data_MPORT_3_addr_pipe_0 = _RAND_25[11:0];
  _RAND_27 = {1{`RANDOM}};
  first_time = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  pc = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  pc_next_plus_6 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  load_ready = _RAND_30[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemh("src/main/resources/tmp_inst.hex", imem);
  $readmemh("src/main/resources/tmp_data.hex", dmem);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
