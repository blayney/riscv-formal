// DO NOT EDIT -- auto-generated from generate.py

module rvfi_insn_c_mv (
  input                                rvfi_valid,
  input [                32   - 1 : 0] rvfi_insn,
  input [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_rdata,
  input [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs1_rdata,
  input [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs2_rdata,
  input [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_rdata,

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_rd_wdata,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_pc_wdata,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_addr,
  output [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_rmask,
  output [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_wmask,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_wdata
);

  // CI-type instruction format
  wire [3:0] insn_funct4 = rvfi_insn[15:12];
  wire [4:0] insn_rs1_rd = rvfi_insn[11:7];
  wire [4:0] insn_rs2 = rvfi_insn[6:2];
  wire [1:0] insn_opcode = rvfi_insn[1:0];

  // C_MV instruction
  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs2_rdata;
  assign spec_valid = rvfi_valid && insn_funct4 == 4'b 1000 && insn_rs2 && insn_opcode == 2'b 10;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rd_addr = insn_rs1_rd;
  assign spec_rd_wdata = spec_rd_addr ? result : 0;
  assign spec_pc_wdata = rvfi_pc_rdata + 2;

  // default assignments
  assign spec_rs1_addr = 0;
  assign spec_trap = 0;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
endmodule