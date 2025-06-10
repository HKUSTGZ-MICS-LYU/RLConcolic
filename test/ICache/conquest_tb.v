module conquest_tb();

// Generated top module signals
reg         [0:0]  clk;
reg         [0:0]  rst;
reg         [0:0]  ic_en = 1'b0;
reg         [0:0]  icqmem_cycstb_i = 1'b0;
reg         [0:0]  icqmem_ci_i = 1'b0;
reg         [0:0]  tagcomp_miss = 1'b0;
reg         [0:0]  biudata_valid = 1'b0;
reg         [0:0]  biudata_error = 1'b0;
reg         [31:0] start_addr = 32'b0;
wire        [31:0] saved_addr;
wire        [3:0]  icram_we;
wire        [0:0]  biu_read;
wire        [0:0]  first_hit_ack;
wire        [0:0]  first_miss_ack;
wire        [0:0]  first_miss_err;
wire        [0:0]  burst;
wire        [0:0]  tag_we;
reg                __obs = 1'b0;


// DUT instance
or1200_ic_fsm _conc_top_inst(
   .clk             (clk),
   .rst             (rst),
   .ic_en           (ic_en),
   .icqmem_cycstb_i (icqmem_cycstb_i),
   .icqmem_ci_i     (icqmem_ci_i),
   .tagcomp_miss    (tagcomp_miss),
   .biudata_valid   (biudata_valid),
   .biudata_error   (biudata_error),
   .start_addr      (start_addr),
   .saved_addr      (saved_addr),
   .icram_we        (icram_we),
   .biu_read        (biu_read),
   .first_hit_ack   (first_hit_ack),
   .first_miss_ack  (first_miss_ack),
   .first_miss_err  (first_miss_err),
   .burst           (burst),
   .tag_we          (tag_we),
   .__obs           (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [38:0] _conc_opcode ;
reg [38:0] _conc_ram    [0:105];


// VCD file generation
initial begin
    $dumpfile("./test/ICache/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clk = ~clk;
end

// Program counter logic
always @(posedge clk) begin
    _conc_opcode = _conc_ram[_conc_pc];
    ic_en <= #5 _conc_opcode[0];
    icqmem_cycstb_i <= #5 _conc_opcode[1];
    icqmem_ci_i <= #5 _conc_opcode[2];
    tagcomp_miss <= #5 _conc_opcode[3];
    biudata_valid <= #5 _conc_opcode[4];
    biudata_error <= #5 _conc_opcode[5];
    start_addr <= #5 _conc_opcode[37:6];
    __obs <= #5 _conc_opcode[38];
    $strobe(";_P ic_en %b", ic_en);
    $strobe(";_P icqmem_cycstb_i %b", icqmem_cycstb_i);
    $strobe(";_P icqmem_ci_i %b", icqmem_ci_i);
    $strobe(";_P tagcomp_miss %b", tagcomp_miss);
    $strobe(";_P biudata_valid %b", biudata_valid);
    $strobe(";_P biudata_error %b", biudata_error);
    $strobe(";_P start_addr %b", start_addr);
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
    $readmemb("./test/ICache/data.mem", _conc_ram);
    #2 clk = 1'b1;
    rst = 1'b1;
    #10 rst = 1'b0;
    #1100 $finish;
end
endmodule
