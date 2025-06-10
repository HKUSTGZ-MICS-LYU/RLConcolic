module conquest_tb();

// Generated top module signals
reg         [0:0]  clk;
reg         [0:0]  rst;
reg         [0:0]  sig_ibuserr = 1'b0;
reg         [0:0]  sig_dbuserr = 1'b0;
reg         [0:0]  sig_illegal = 1'b0;
reg         [0:0]  sig_align = 1'b0;
reg         [0:0]  sig_range = 1'b0;
reg         [0:0]  sig_dtlbmiss = 1'b0;
reg         [0:0]  sig_dmmufault = 1'b0;
reg         [0:0]  sig_int = 1'b0;
reg         [0:0]  sig_syscall = 1'b0;
reg         [0:0]  sig_trap = 1'b0;
reg         [0:0]  sig_itlbmiss = 1'b0;
reg         [0:0]  sig_immufault = 1'b0;
reg         [0:0]  sig_tick = 1'b0;
reg         [0:0]  branch_taken = 1'b0;
reg         [0:0]  genpc_freeze = 1'b0;
reg         [0:0]  id_freeze = 1'b0;
reg         [0:0]  ex_freeze = 1'b0;
reg         [0:0]  wb_freeze = 1'b0;
reg         [0:0]  if_stall = 1'b0;
reg         [31:0] if_pc = 32'b0;
wire        [31:0] id_pc;
wire        [29:0] lr_sav;
wire        [0:0]  flushpipe;
wire        [0:0]  extend_flush;
wire        [3:0]  except_type;
wire        [0:0]  except_start;
wire        [0:0]  except_started;
wire        [12:0] except_stop;
reg         [0:0]  ex_void = 1'b0;
wire        [31:0] spr_dat_ppc;
wire        [31:0] spr_dat_npc;
reg         [31:0] datain = 32'b0;
reg         [13:0] du_dsr = 14'b0;
reg         [0:0]  epcr_we = 1'b0;
reg         [0:0]  eear_we = 1'b0;
reg         [0:0]  esr_we = 1'b0;
reg         [0:0]  pc_we = 1'b0;
wire        [31:0] epcr;
wire        [31:0] eear;
wire        [15:0] esr;
reg         [0:0]  sr_we = 1'b0;
reg         [15:0] to_sr = 16'b0;
reg         [15:0] sr = 16'b0;
reg         [31:0] lsu_addr = 32'b0;
wire        [0:0]  abort_ex;
reg         [0:0]  icpu_ack_i = 1'b0;
reg         [0:0]  icpu_err_i = 1'b0;
reg         [0:0]  dcpu_ack_i = 1'b0;
reg         [0:0]  dcpu_err_i = 1'b0;
reg                __obs = 1'b0;


// DUT instance
or1200_except _conc_top_inst(
   .clk            (clk),
   .rst            (rst),
   .sig_ibuserr    (sig_ibuserr),
   .sig_dbuserr    (sig_dbuserr),
   .sig_illegal    (sig_illegal),
   .sig_align      (sig_align),
   .sig_range      (sig_range),
   .sig_dtlbmiss   (sig_dtlbmiss),
   .sig_dmmufault  (sig_dmmufault),
   .sig_int        (sig_int),
   .sig_syscall    (sig_syscall),
   .sig_trap       (sig_trap),
   .sig_itlbmiss   (sig_itlbmiss),
   .sig_immufault  (sig_immufault),
   .sig_tick       (sig_tick),
   .branch_taken   (branch_taken),
   .genpc_freeze   (genpc_freeze),
   .id_freeze      (id_freeze),
   .ex_freeze      (ex_freeze),
   .wb_freeze      (wb_freeze),
   .if_stall       (if_stall),
   .if_pc          (if_pc),
   .id_pc          (id_pc),
   .lr_sav         (lr_sav),
   .flushpipe      (flushpipe),
   .extend_flush   (extend_flush),
   .except_type    (except_type),
   .except_start   (except_start),
   .except_started (except_started),
   .except_stop    (except_stop),
   .ex_void        (ex_void),
   .spr_dat_ppc    (spr_dat_ppc),
   .spr_dat_npc    (spr_dat_npc),
   .datain         (datain),
   .du_dsr         (du_dsr),
   .epcr_we        (epcr_we),
   .eear_we        (eear_we),
   .esr_we         (esr_we),
   .pc_we          (pc_we),
   .epcr           (epcr),
   .eear           (eear),
   .esr            (esr),
   .sr_we          (sr_we),
   .to_sr          (to_sr),
   .sr             (sr),
   .lsu_addr       (lsu_addr),
   .abort_ex       (abort_ex),
   .icpu_ack_i     (icpu_ack_i),
   .icpu_err_i     (icpu_err_i),
   .dcpu_ack_i     (dcpu_ack_i),
   .dcpu_err_i     (dcpu_err_i),
   .__obs          (__obs));

// Internal signals used in the testbench
reg [31:0]  _conc_pc     ;
reg [171:0] _conc_opcode ;
reg [171:0] _conc_ram    [0:210];


// VCD file generation
initial begin
    $dumpfile("./test/Exception/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clk = ~clk;
end

// Program counter logic
always @(posedge clk) begin
    _conc_opcode = _conc_ram[_conc_pc];
    sig_ibuserr <= #5 _conc_opcode[0];
    sig_dbuserr <= #5 _conc_opcode[1];
    sig_illegal <= #5 _conc_opcode[2];
    sig_align <= #5 _conc_opcode[3];
    sig_range <= #5 _conc_opcode[4];
    sig_dtlbmiss <= #5 _conc_opcode[5];
    sig_dmmufault <= #5 _conc_opcode[6];
    sig_int <= #5 _conc_opcode[7];
    sig_syscall <= #5 _conc_opcode[8];
    sig_trap <= #5 _conc_opcode[9];
    sig_itlbmiss <= #5 _conc_opcode[10];
    sig_immufault <= #5 _conc_opcode[11];
    sig_tick <= #5 _conc_opcode[12];
    branch_taken <= #5 _conc_opcode[13];
    genpc_freeze <= #5 _conc_opcode[14];
    id_freeze <= #5 _conc_opcode[15];
    ex_freeze <= #5 _conc_opcode[16];
    wb_freeze <= #5 _conc_opcode[17];
    if_stall <= #5 _conc_opcode[18];
    if_pc <= #5 _conc_opcode[50:19];
    ex_void <= #5 _conc_opcode[51];
    datain <= #5 _conc_opcode[83:52];
    du_dsr <= #5 _conc_opcode[97:84];
    epcr_we <= #5 _conc_opcode[98];
    eear_we <= #5 _conc_opcode[99];
    esr_we <= #5 _conc_opcode[100];
    pc_we <= #5 _conc_opcode[101];
    sr_we <= #5 _conc_opcode[102];
    to_sr <= #5 _conc_opcode[118:103];
    sr <= #5 _conc_opcode[134:119];
    lsu_addr <= #5 _conc_opcode[166:135];
    icpu_ack_i <= #5 _conc_opcode[167];
    icpu_err_i <= #5 _conc_opcode[168];
    dcpu_ack_i <= #5 _conc_opcode[169];
    dcpu_err_i <= #5 _conc_opcode[170];
    __obs <= #5 _conc_opcode[171];
    $strobe(";_P sig_ibuserr %b", sig_ibuserr);
    $strobe(";_P sig_dbuserr %b", sig_dbuserr);
    $strobe(";_P sig_illegal %b", sig_illegal);
    $strobe(";_P sig_align %b", sig_align);
    $strobe(";_P sig_range %b", sig_range);
    $strobe(";_P sig_dtlbmiss %b", sig_dtlbmiss);
    $strobe(";_P sig_dmmufault %b", sig_dmmufault);
    $strobe(";_P sig_int %b", sig_int);
    $strobe(";_P sig_syscall %b", sig_syscall);
    $strobe(";_P sig_trap %b", sig_trap);
    $strobe(";_P sig_itlbmiss %b", sig_itlbmiss);
    $strobe(";_P sig_immufault %b", sig_immufault);
    $strobe(";_P sig_tick %b", sig_tick);
    $strobe(";_P branch_taken %b", branch_taken);
    $strobe(";_P genpc_freeze %b", genpc_freeze);
    $strobe(";_P id_freeze %b", id_freeze);
    $strobe(";_P ex_freeze %b", ex_freeze);
    $strobe(";_P wb_freeze %b", wb_freeze);
    $strobe(";_P if_stall %b", if_stall);
    $strobe(";_P if_pc %b", if_pc);
    $strobe(";_P ex_void %b", ex_void);
    $strobe(";_P datain %b", datain);
    $strobe(";_P du_dsr %b", du_dsr);
    $strobe(";_P epcr_we %b", epcr_we);
    $strobe(";_P eear_we %b", eear_we);
    $strobe(";_P esr_we %b", esr_we);
    $strobe(";_P pc_we %b", pc_we);
    $strobe(";_P sr_we %b", sr_we);
    $strobe(";_P to_sr %b", to_sr);
    $strobe(";_P sr %b", sr);
    $strobe(";_P lsu_addr %b", lsu_addr);
    $strobe(";_P icpu_ack_i %b", icpu_ack_i);
    $strobe(";_P icpu_err_i %b", icpu_err_i);
    $strobe(";_P dcpu_ack_i %b", dcpu_ack_i);
    $strobe(";_P dcpu_err_i %b", dcpu_err_i);
    $strobe(";_P __obs %b", __obs);
    _conc_pc = _conc_pc + 1;
    $strobe(";_C %d", _conc_pc);
    $strobe(";_Input %b", _conc_opcode);
end

// Generate the initial block
initial begin
    clk = 1'b0;
    rst = 1'b0;
    _conc_pc = 32'b0;
    $readmemb("./test/Exception/data.mem", _conc_ram);
    #2 clk = 1'b1;
    rst = 1'b1;
    #10 rst = 1'b0;
    #2200 $finish;
end
endmodule
