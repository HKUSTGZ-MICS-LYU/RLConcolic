module conquest_tb();

// Generated top module signals
reg         [0:0]  clk_i;
reg         [0:0]  rst_i;
reg         [19:0] pic_ints_i = 20'b0;
reg         [1:0]  clmode_i = 2'b0;
reg         [0:0]  iwb_clk_i = 1'b0;
reg         [0:0]  iwb_rst_i = 1'b0;
reg         [0:0]  iwb_ack_i = 1'b0;
reg         [0:0]  iwb_err_i = 1'b0;
reg         [0:0]  iwb_rty_i = 1'b0;
reg         [31:0] iwb_dat_i = 32'b0;
wire        [0:0]  iwb_cyc_o;
wire        [31:0] iwb_adr_o;
wire        [0:0]  iwb_stb_o;
wire        [0:0]  iwb_we_o;
wire        [3:0]  iwb_sel_o;
wire        [31:0] iwb_dat_o;
wire        [2:0]  iwb_cti_o;
wire        [1:0]  iwb_bte_o;
reg         [0:0]  dwb_clk_i = 1'b0;
reg         [0:0]  dwb_rst_i = 1'b0;
reg         [0:0]  dwb_ack_i = 1'b0;
reg         [0:0]  dwb_err_i = 1'b0;
reg         [0:0]  dwb_rty_i = 1'b0;
reg         [31:0] dwb_dat_i = 32'b0;
wire        [0:0]  dwb_cyc_o;
wire        [31:0] dwb_adr_o;
wire        [0:0]  dwb_stb_o;
wire        [0:0]  dwb_we_o;
wire        [3:0]  dwb_sel_o;
wire        [31:0] dwb_dat_o;
wire        [2:0]  dwb_cti_o;
wire        [1:0]  dwb_bte_o;
reg         [0:0]  dbg_stall_i = 1'b0;
reg         [0:0]  dbg_ewt_i = 1'b0;
wire        [3:0]  dbg_lss_o;
wire        [1:0]  dbg_is_o;
wire        [10:0] dbg_wp_o;
wire        [0:0]  dbg_bp_o;
reg         [0:0]  dbg_stb_i = 1'b0;
reg         [0:0]  dbg_we_i = 1'b0;
reg         [31:0] dbg_adr_i = 32'b0;
reg         [31:0] dbg_dat_i = 32'b0;
wire        [31:0] dbg_dat_o;
wire        [0:0]  dbg_ack_o;
reg         [0:0]  pm_cpustall_i = 1'b0;
wire        [3:0]  pm_clksd_o;
wire        [0:0]  pm_dc_gate_o;
wire        [0:0]  pm_ic_gate_o;
wire        [0:0]  pm_dmmu_gate_o;
wire        [0:0]  pm_immu_gate_o;
wire        [0:0]  pm_tt_gate_o;
wire        [0:0]  pm_cpu_gate_o;
wire        [0:0]  pm_wakeup_o;
wire        [0:0]  pm_lvolt_o;
wire        [0:0]  sig_tick;
reg                __obs = 1'b0;


// DUT instance
or1200_top _conc_top_inst(
   .clk_i          (clk_i),
   .rst_i          (rst_i),
   .pic_ints_i     (pic_ints_i),
   .clmode_i       (clmode_i),
   .iwb_clk_i      (iwb_clk_i),
   .iwb_rst_i      (iwb_rst_i),
   .iwb_ack_i      (iwb_ack_i),
   .iwb_err_i      (iwb_err_i),
   .iwb_rty_i      (iwb_rty_i),
   .iwb_dat_i      (iwb_dat_i),
   .iwb_cyc_o      (iwb_cyc_o),
   .iwb_adr_o      (iwb_adr_o),
   .iwb_stb_o      (iwb_stb_o),
   .iwb_we_o       (iwb_we_o),
   .iwb_sel_o      (iwb_sel_o),
   .iwb_dat_o      (iwb_dat_o),
   .iwb_cti_o      (iwb_cti_o),
   .iwb_bte_o      (iwb_bte_o),
   .dwb_clk_i      (dwb_clk_i),
   .dwb_rst_i      (dwb_rst_i),
   .dwb_ack_i      (dwb_ack_i),
   .dwb_err_i      (dwb_err_i),
   .dwb_rty_i      (dwb_rty_i),
   .dwb_dat_i      (dwb_dat_i),
   .dwb_cyc_o      (dwb_cyc_o),
   .dwb_adr_o      (dwb_adr_o),
   .dwb_stb_o      (dwb_stb_o),
   .dwb_we_o       (dwb_we_o),
   .dwb_sel_o      (dwb_sel_o),
   .dwb_dat_o      (dwb_dat_o),
   .dwb_cti_o      (dwb_cti_o),
   .dwb_bte_o      (dwb_bte_o),
   .dbg_stall_i    (dbg_stall_i),
   .dbg_ewt_i      (dbg_ewt_i),
   .dbg_lss_o      (dbg_lss_o),
   .dbg_is_o       (dbg_is_o),
   .dbg_wp_o       (dbg_wp_o),
   .dbg_bp_o       (dbg_bp_o),
   .dbg_stb_i      (dbg_stb_i),
   .dbg_we_i       (dbg_we_i),
   .dbg_adr_i      (dbg_adr_i),
   .dbg_dat_i      (dbg_dat_i),
   .dbg_dat_o      (dbg_dat_o),
   .dbg_ack_o      (dbg_ack_o),
   .pm_cpustall_i  (pm_cpustall_i),
   .pm_clksd_o     (pm_clksd_o),
   .pm_dc_gate_o   (pm_dc_gate_o),
   .pm_ic_gate_o   (pm_ic_gate_o),
   .pm_dmmu_gate_o (pm_dmmu_gate_o),
   .pm_immu_gate_o (pm_immu_gate_o),
   .pm_tt_gate_o   (pm_tt_gate_o),
   .pm_cpu_gate_o  (pm_cpu_gate_o),
   .pm_wakeup_o    (pm_wakeup_o),
   .pm_lvolt_o     (pm_lvolt_o),
   .sig_tick       (sig_tick),
   .__obs          (__obs));

// Internal signals used in the testbench
reg [31:0]  _conc_pc     ;
reg [165:0] _conc_opcode ;
reg [165:0] _conc_ram    [0:70];


// VCD file generation
initial begin
    $dumpfile("./test/or1200/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clk_i = ~clk_i;
end

// Program counter logic
always @(posedge clk_i) begin
    _conc_opcode = _conc_ram[_conc_pc];
    pic_ints_i <= #5 _conc_opcode[19:0];
    clmode_i <= #5 _conc_opcode[21:20];
    iwb_clk_i <= #5 _conc_opcode[22];
    iwb_rst_i <= #5 _conc_opcode[23];
    iwb_ack_i <= #5 _conc_opcode[24];
    iwb_err_i <= #5 _conc_opcode[25];
    iwb_rty_i <= #5 _conc_opcode[26];
    iwb_dat_i <= #5 _conc_opcode[58:27];
    dwb_clk_i <= #5 _conc_opcode[59];
    dwb_rst_i <= #5 _conc_opcode[60];
    dwb_ack_i <= #5 _conc_opcode[61];
    dwb_err_i <= #5 _conc_opcode[62];
    dwb_rty_i <= #5 _conc_opcode[63];
    dwb_dat_i <= #5 _conc_opcode[95:64];
    dbg_stall_i <= #5 _conc_opcode[96];
    dbg_ewt_i <= #5 _conc_opcode[97];
    dbg_stb_i <= #5 _conc_opcode[98];
    dbg_we_i <= #5 _conc_opcode[99];
    dbg_adr_i <= #5 _conc_opcode[131:100];
    dbg_dat_i <= #5 _conc_opcode[163:132];
    pm_cpustall_i <= #5 _conc_opcode[164];
    __obs <= #5 _conc_opcode[165];
    $strobe(";_P pic_ints_i %b", pic_ints_i);
    $strobe(";_P clmode_i %b", clmode_i);
    $strobe(";_P iwb_clk_i %b", iwb_clk_i);
    $strobe(";_P iwb_rst_i %b", iwb_rst_i);
    $strobe(";_P iwb_ack_i %b", iwb_ack_i);
    $strobe(";_P iwb_err_i %b", iwb_err_i);
    $strobe(";_P iwb_rty_i %b", iwb_rty_i);
    $strobe(";_P iwb_dat_i %b", iwb_dat_i);
    $strobe(";_P dwb_clk_i %b", dwb_clk_i);
    $strobe(";_P dwb_rst_i %b", dwb_rst_i);
    $strobe(";_P dwb_ack_i %b", dwb_ack_i);
    $strobe(";_P dwb_err_i %b", dwb_err_i);
    $strobe(";_P dwb_rty_i %b", dwb_rty_i);
    $strobe(";_P dwb_dat_i %b", dwb_dat_i);
    $strobe(";_P dbg_stall_i %b", dbg_stall_i);
    $strobe(";_P dbg_ewt_i %b", dbg_ewt_i);
    $strobe(";_P dbg_stb_i %b", dbg_stb_i);
    $strobe(";_P dbg_we_i %b", dbg_we_i);
    $strobe(";_P dbg_adr_i %b", dbg_adr_i);
    $strobe(";_P dbg_dat_i %b", dbg_dat_i);
    $strobe(";_P pm_cpustall_i %b", pm_cpustall_i);
    $strobe(";_P __obs %b", __obs);
    _conc_pc = _conc_pc + 1;
    $strobe(";_C %d", _conc_pc);
    $strobe(";_Input %b", _conc_opcode);
end

// Generate the initial block
initial begin
    clk_i = 1'b0;
    rst_i = 1'b0;
    _conc_pc = 32'b0;
    $readmemb("./test/or1200/data.mem", _conc_ram);
    #2 clk_i = 1'b1;
    rst_i = 1'b1;
    #10 rst_i = 1'b0;
    #900 $finish;
end
endmodule
