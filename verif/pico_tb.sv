`timescale 1ns / 1ps
`include "uvm_macros.svh"

import uvm_pkg::*;

module pico_tb;

  virtual pico_if intf;

  picorv32 #(
      .ENABLE_COUNTERS     (1),
      .ENABLE_COUNTERS64   (1),
      .ENABLE_REGS_16_31   (1),
      .ENABLE_REGS_DUALPORT(1),
      .LATCHED_MEM_RDATA   (0),
      .TWO_STAGE_SHIFT     (1),
      .BARREL_SHIFTER      (0),
      .TWO_CYCLE_COMPARE   (0),
      .TWO_CYCLE_ALU       (0),
      .COMPRESSED_ISA      (0),
      .CATCH_MISALIGN      (1),
      .CATCH_ILLINSN       (1),
      .ENABLE_PCPI         (0),
      .ENABLE_MUL          (0),
      .ENABLE_FAST_MUL     (0),
      .ENABLE_DIV          (0),
      .ENABLE_IRQ          (0),
      .ENABLE_IRQ_QREGS    (1),
      .ENABLE_IRQ_TIMER    (1),
      .ENABLE_TRACE        (0),
      .REGS_INIT_ZERO      (0),
      .MASKED_IRQ          (32'h0000_0000),
      .LATCHED_IRQ         (32'hffff_ffff),
      .PROGADDR_RESET      (32'h0000_0000),
      .PROGADDR_IRQ        (32'h0000_0010),
      .STACKADDR           (32'hffff_ffff)
  ) picorv32_core (
      .clk   (intf.clk),
      .resetn(intf.resetn),
      .trap  (intf.trap),

      .mem_valid(intf.mem_valid),
      .mem_instr(intf.mem_instr),
      .mem_ready(intf.mem_ready),
      .mem_addr (intf.mem_addr),
      .mem_wdata(intf.mem_wdata),
      .mem_wstrb(intf.mem_wstrb),
      .mem_rdata(intf.mem_rdata),

      .mem_la_read (intf.mem_la_read),
      .mem_la_write(intf.mem_la_write),
      .mem_la_addr (intf.mem_la_addr),
      .mem_la_wdata(intf.mem_la_wdata),
      .mem_la_wstrb(intf.mem_la_wstrb),

      .pcpi_valid(intf.pcpi_valid),
      .pcpi_insn (intf.pcpi_insn),
      .pcpi_rs1  (intf.pcpi_rs1),
      .pcpi_rs2  (intf.pcpi_rs2),
      .pcpi_wr   (intf.pcpi_wr),
      .pcpi_rd   (intf.pcpi_rd),
      .pcpi_wait (intf.pcpi_wait),
      .pcpi_ready(intf.pcpi_ready),

      .irq(intf.irq),
      .eoi(intf.eoi)
  );

  initial begin
    intf.clk = 0;
    intf.resetn = 0;
    #10 intf.resetn = 1;
  end

  always #5 intf.clk = ~intf.clk;  // Generate clock signal

endmodule
