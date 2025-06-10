module conquest_tb();

// Generated top module signals
reg         [0:0]  clk;
reg         [0:0]  rst;
reg         [0:0]  dc_en = 1'b0;
reg         [0:0]  dcqmem_cycstb_i = 1'b0;
reg         [0:0]  dcqmem_ci_i = 1'b0;
reg         [0:0]  dcqmem_we_i = 1'b0;
reg         [3:0]  dcqmem_sel_i = 4'b0;
reg         [0:0]  tagcomp_miss = 1'b0;
reg         [0:0]  biudata_valid = 1'b0;
reg         [0:0]  biudata_error = 1'b0;
reg         [31:0] lsu_addr = 32'b0;
wire        [3:0]  dcram_we;
wire        [0:0]  biu_read;
wire        [0:0]  biu_write;
wire        [0:0]  biu_do_sel;
wire        [0:0]  dcram_di_sel;
wire        [0:0]  first_hit_ack;
wire        [0:0]  first_miss_ack;
wire        [0:0]  first_miss_err;
wire        [0:0]  burst;
wire        [0:0]  tag_we;
wire        [0:0]  tag_valid;
wire        [31:0] dc_addr;
reg         [0:0]  dc_no_writethrough = 1'b0;
wire        [0:0]  tag_dirty;
reg         [0:0]  dirty = 1'b0;
reg         [18:0] tag = 19'b0;
reg         [0:0]  tag_v = 1'b0;
reg         [0:0]  dc_block_flush = 1'b0;
reg         [0:0]  dc_block_writeback = 1'b0;
reg         [31:0] spr_dat_i = 32'b0;
wire        [0:0]  mtspr_dc_done;
reg         [0:0]  spr_cswe = 1'b0;
reg                __obs = 1'b0;


// DUT instance
or1200_dc_fsm _conc_top_inst(
   .clk                (clk),
   .rst                (rst),
   .dc_en              (dc_en),
   .dcqmem_cycstb_i    (dcqmem_cycstb_i),
   .dcqmem_ci_i        (dcqmem_ci_i),
   .dcqmem_we_i        (dcqmem_we_i),
   .dcqmem_sel_i       (dcqmem_sel_i),
   .tagcomp_miss       (tagcomp_miss),
   .biudata_valid      (biudata_valid),
   .biudata_error      (biudata_error),
   .lsu_addr           (lsu_addr),
   .dcram_we           (dcram_we),
   .biu_read           (biu_read),
   .biu_write          (biu_write),
   .biu_do_sel         (biu_do_sel),
   .dcram_di_sel       (dcram_di_sel),
   .first_hit_ack      (first_hit_ack),
   .first_miss_ack     (first_miss_ack),
   .first_miss_err     (first_miss_err),
   .burst              (burst),
   .tag_we             (tag_we),
   .tag_valid          (tag_valid),
   .dc_addr            (dc_addr),
   .dc_no_writethrough (dc_no_writethrough),
   .tag_dirty          (tag_dirty),
   .dirty              (dirty),
   .tag                (tag),
   .tag_v              (tag_v),
   .dc_block_flush     (dc_block_flush),
   .dc_block_writeback (dc_block_writeback),
   .spr_dat_i          (spr_dat_i),
   .mtspr_dc_done      (mtspr_dc_done),
   .spr_cswe           (spr_cswe),
   .__obs              (__obs));

// Internal signals used in the testbench
reg [31:0]  _conc_pc     ;
reg [100:0] _conc_opcode ;
reg [100:0] _conc_ram    [0:210];


// VCD file generation
initial begin
    $dumpfile("./test/DCache/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clk = ~clk;
end

// Program counter logic
always @(posedge clk) begin
    _conc_opcode = _conc_ram[_conc_pc];
    dc_en <= #5 _conc_opcode[0];
    dcqmem_cycstb_i <= #5 _conc_opcode[1];
    dcqmem_ci_i <= #5 _conc_opcode[2];
    dcqmem_we_i <= #5 _conc_opcode[3];
    dcqmem_sel_i <= #5 _conc_opcode[7:4];
    tagcomp_miss <= #5 _conc_opcode[8];
    biudata_valid <= #5 _conc_opcode[9];
    biudata_error <= #5 _conc_opcode[10];
    lsu_addr <= #5 _conc_opcode[42:11];
    dc_no_writethrough <= #5 _conc_opcode[43];
    dirty <= #5 _conc_opcode[44];
    tag <= #5 _conc_opcode[63:45];
    tag_v <= #5 _conc_opcode[64];
    dc_block_flush <= #5 _conc_opcode[65];
    dc_block_writeback <= #5 _conc_opcode[66];
    spr_dat_i <= #5 _conc_opcode[98:67];
    spr_cswe <= #5 _conc_opcode[99];
    __obs <= #5 _conc_opcode[100];
    $strobe(";_P dc_en %b", dc_en);
    $strobe(";_P dcqmem_cycstb_i %b", dcqmem_cycstb_i);
    $strobe(";_P dcqmem_ci_i %b", dcqmem_ci_i);
    $strobe(";_P dcqmem_we_i %b", dcqmem_we_i);
    $strobe(";_P dcqmem_sel_i %b", dcqmem_sel_i);
    $strobe(";_P tagcomp_miss %b", tagcomp_miss);
    $strobe(";_P biudata_valid %b", biudata_valid);
    $strobe(";_P biudata_error %b", biudata_error);
    $strobe(";_P lsu_addr %b", lsu_addr);
    $strobe(";_P dc_no_writethrough %b", dc_no_writethrough);
    $strobe(";_P dirty %b", dirty);
    $strobe(";_P tag %b", tag);
    $strobe(";_P tag_v %b", tag_v);
    $strobe(";_P dc_block_flush %b", dc_block_flush);
    $strobe(";_P dc_block_writeback %b", dc_block_writeback);
    $strobe(";_P spr_dat_i %b", spr_dat_i);
    $strobe(";_P spr_cswe %b", spr_cswe);
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
    $readmemb("./test/DCache/data.mem", _conc_ram);
    #2 clk = 1'b1;
    rst = 1'b1;
    #10 rst = 1'b0;
    #2200 $finish;
end
endmodule
