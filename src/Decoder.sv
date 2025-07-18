// Generated by CIRCT firtool-1.62.0
module Decoder(
  input  [11:0] io_i_pc,
  input  [31:0] io_i_instr,
  output [1:0]  io_o_seq,
  output [2:0]  io_o_ctrl_alu_uop,
  output        io_o_ctrl_alu_signed,
  output [2:0]  io_o_ctrl_bru_uop,
  output        io_o_ctrl_bru_pc_rel,
                io_o_ctrl_mem_rw,
  output [1:0]  io_o_ctrl_mem_size,
  output        io_o_ctrl_mem_signed,
                io_o_ctrl_wb_en,
  output [2:0]  io_o_ctrl_wb_addr,
                io_o_rs1,
                io_o_rs2,
  output        io_o_s1_reg,
  output [31:0] io_o_s1_data,
  output        io_o_s2_reg,
  output [31:0] io_o_s2_data,
  output        io_o_s3_reg,
  output [31:0] io_o_s3_data
);

  wire       _GEN = io_i_instr[6:0] == 7'h37;
  wire       _GEN_0 = io_i_instr[6:0] == 7'h17;
  wire       _GEN_1 = io_i_instr[6:0] == 7'h6F;
  wire       _GEN_2 = io_i_instr[6:0] == 7'h67;
  wire       _GEN_3 = io_i_instr[6:0] == 7'h63;
  wire       _GEN_4 = _GEN | _GEN_0;
  wire       _GEN_5 = io_i_instr[14:12] == 3'h0;
  wire       _GEN_6 = io_i_instr[14:12] == 3'h1;
  wire       _GEN_7 = io_i_instr[14:12] == 3'h4;
  wire       _GEN_8 = io_i_instr[14:12] == 3'h5;
  wire       _GEN_9 = io_i_instr[14:12] == 3'h6;
  wire [2:0] _GEN_10 =
    _GEN_7 ? 3'h4 : _GEN_8 ? 3'h5 : _GEN_9 ? 3'h6 : {3{&(io_i_instr[14:12])}};
  wire       _GEN_11 = _GEN_1 | _GEN_2;
  wire       _GEN_12 = io_i_instr[6:0] == 7'h3;
  wire       _GEN_13 = io_i_instr[14:12] == 3'h2;
  wire [1:0] _GEN_14 = {_GEN_13, 1'h0};
  wire       _GEN_15 = _GEN | _GEN_0 | _GEN_1 | _GEN_2 | _GEN_3;
  wire       _GEN_16 = io_i_instr[6:0] == 7'h23;
  wire       io_o_s3_reg_0 =
    ~(_GEN | _GEN_0 | _GEN_1 | _GEN_2 | _GEN_3 | _GEN_12) & _GEN_16;
  wire       _GEN_17 = io_i_instr[6:0] == 7'h13;
  wire       _GEN_18 = io_i_instr[14:12] == 3'h3;
  wire       _GEN_19 = (|(io_i_instr[31:25])) & io_i_instr[31:25] == 7'h20;
  wire       _GEN_20 = _GEN_13 | ~(_GEN_18 | _GEN_7) & _GEN_8 & _GEN_19;
  wire       _GEN_21 = io_i_instr[6:0] == 7'h33;
  wire       _GEN_22 = _GEN_12 | _GEN_16;
  wire       _GEN_23 = _GEN | _GEN_0 | _GEN_11;
  wire       _GEN_24 = _GEN | _GEN_0 | _GEN_1 | _GEN_2 | _GEN_3 | _GEN_22;
  wire       _GEN_25 = _GEN_12 | _GEN_16 | _GEN_17;
  assign io_o_seq =
    _GEN_4
      ? 2'h0
      : _GEN_11
          ? 2'h1
          : _GEN_3
              ? {1'h0,
                 _GEN_5 | _GEN_6 | _GEN_7 | _GEN_8 | _GEN_9 | (&(io_i_instr[14:12]))}
              : {_GEN_22, 1'h0};
  assign io_o_ctrl_alu_uop =
    _GEN_24 | ~_GEN_17 & ~_GEN_21 | _GEN_5
      ? 3'h0
      : _GEN_6 ? 3'h1 : _GEN_13 | _GEN_18 ? 3'h2 : _GEN_10;
  assign io_o_ctrl_alu_signed =
    ~_GEN_24
    & (_GEN_17
         ? ~(_GEN_5 | _GEN_6) & _GEN_20
         : _GEN_21 & (_GEN_5 ? _GEN_19 : ~_GEN_6 & _GEN_20));
  assign io_o_ctrl_bru_uop =
    _GEN_4 ? 3'h0 : _GEN_11 ? 3'h2 : ~_GEN_3 | _GEN_5 ? 3'h0 : _GEN_6 ? 3'h1 : _GEN_10;
  assign io_o_ctrl_bru_pc_rel = ~_GEN_4 & (_GEN_1 | ~_GEN_2 & _GEN_3);
  assign io_o_ctrl_mem_rw = io_o_s3_reg_0;
  assign io_o_ctrl_mem_size =
    _GEN_15
      ? 2'h0
      : _GEN_12
          ? (_GEN_5 | _GEN_7 ? 2'h0 : _GEN_6 | _GEN_8 ? 2'h1 : _GEN_14)
          : ~_GEN_16 | _GEN_5 ? 2'h0 : _GEN_6 ? 2'h1 : _GEN_14;
  assign io_o_ctrl_mem_signed = ~_GEN_15 & _GEN_12 & (_GEN_5 | ~_GEN_7 & _GEN_6);
  assign io_o_ctrl_wb_en = _GEN_23 | ~_GEN_3 & (_GEN_12 | ~_GEN_16 & (_GEN_17 | _GEN_21));
  assign io_o_ctrl_wb_addr = io_i_instr[9:7];
  assign io_o_rs1 = io_i_instr[17:15];
  assign io_o_rs2 = io_i_instr[22:20];
  assign io_o_s1_reg = ~(_GEN | _GEN_0 | _GEN_1) & (_GEN_2 | _GEN_3 | _GEN_25 | _GEN_21);
  assign io_o_s1_data = _GEN | ~_GEN_0 ? 32'h0 : {20'h0, io_i_pc};
  assign io_o_s2_reg = ~_GEN_23 & (_GEN_3 | ~_GEN_25 & _GEN_21);
  assign io_o_s2_data =
    _GEN
      ? {io_i_instr[31:12], 12'h0}
      : _GEN_0
          ? {io_i_instr[31:12], 12'h0}
          : _GEN_1
              ? {io_i_instr[31:12], 12'h0}
              : _GEN_2
                  ? {{20{io_i_instr[31]}}, io_i_instr[31:25], io_i_instr[11:7]}
                  : _GEN_3
                      ? 32'h0
                      : _GEN_12
                          ? {{20{io_i_instr[31]}}, io_i_instr[31:20]}
                          : _GEN_16
                              ? {{20{io_i_instr[31]}},
                                 io_i_instr[31:25],
                                 io_i_instr[11:7]}
                              : _GEN_17
                                  ? {{20{io_i_instr[31]}}, io_i_instr[31:20]}
                                  : 32'h0;
  assign io_o_s3_reg = io_o_s3_reg_0;
  assign io_o_s3_data =
    _GEN_4
      ? 32'h0
      : _GEN_1
          ? {{12{io_i_instr[31]}},
             io_i_instr[19:12],
             io_i_instr[20],
             io_i_instr[30:21],
             1'h0}
          : _GEN_2 | ~_GEN_3
              ? 32'h0
              : {{20{io_i_instr[31]}},
                 io_i_instr[7],
                 io_i_instr[30:25],
                 io_i_instr[11:8],
                 1'h0};
endmodule

