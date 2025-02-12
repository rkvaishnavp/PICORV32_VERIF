`ifndef PICO_IF_SV
`define PICO_IF_SV

// Interface for PicoRV32
interface pico_if;
    // Clock and reset signals
    logic clk;
    logic resetn;
    logic trap;

    // Memory interface
    logic        mem_valid;
    logic        mem_instr;
    logic        mem_ready;
    logic [31:0] mem_addr;
    logic [31:0] mem_wdata;
    logic  [3:0] mem_wstrb;
    logic [31:0] mem_rdata;

    // Look-Ahead Memory Interface
    logic        mem_la_read;
    logic        mem_la_write;
    logic [31:0] mem_la_addr;
    logic [31:0] mem_la_wdata;
    logic  [3:0] mem_la_wstrb;

    // Pico Co-Processor Interface (PCPI)
    logic        pcpi_valid;
    logic [31:0] pcpi_insn;
    logic [31:0] pcpi_rs1;
    logic [31:0] pcpi_rs2;
    logic        pcpi_wr;
    logic [31:0] pcpi_rd;
    logic        pcpi_wait;
    logic        pcpi_ready;

    // IRQ Interface
    logic [31:0] irq;
    logic [31:0] eoi;

`ifdef RISCV_FORMAL
    // Formal verification signals (grounded by default)
    logic        rvfi_valid         = 0;
    logic [63:0] rvfi_order         = 0;
    logic [31:0] rvfi_insn          = 0;
    logic        rvfi_trap          = 0;
    logic        rvfi_halt          = 0;
    logic        rvfi_intr          = 0;
    logic  [1:0] rvfi_mode          = 0;
    logic  [1:0] rvfi_ixl           = 0;
    logic  [4:0] rvfi_rs1_addr      = 0;
    logic  [4:0] rvfi_rs2_addr      = 0;
    logic [31:0] rvfi_rs1_rdata     = 0;
    logic [31:0] rvfi_rs2_rdata     = 0;
    logic  [4:0] rvfi_rd_addr       = 0;
    logic [31:0] rvfi_rd_wdata      = 0;
    logic [31:0] rvfi_pc_rdata      = 0;
    logic [31:0] rvfi_pc_wdata      = 0;
    logic [31:0] rvfi_mem_addr      = 0;
    logic  [3:0] rvfi_mem_rmask     = 0;
    logic  [3:0] rvfi_mem_wmask     = 0;
    logic [31:0] rvfi_mem_rdata     = 0;
    logic [31:0] rvfi_mem_wdata     = 0;

    // CSR formal verification signals (grounded by default)
    logic [63:0] rvfi_csr_mcycle_rmask   = 0;
    logic [63:0] rvfi_csr_mcycle_wmask   = 0;
    logic [63:0] rvfi_csr_mcycle_rdata   = 0;
    logic [63:0] rvfi_csr_mcycle_wdata   = 0;

    logic [63:0] rvfi_csr_minstret_rmask = 0;
    logic [63:0] rvfi_csr_minstret_wmask = 0;
    logic [63:0] rvfi_csr_minstret_rdata = 0;
    logic [63:0] rvfi_csr_minstret_wdata = 0;
`endif

    // Trace Interface
    logic        trace_valid;
    logic [35:0] trace_data;

endinterface

`endif // PICO_IF_SV
