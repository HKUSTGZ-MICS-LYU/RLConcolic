module conquest_tb();

// Generated top module signals
reg         [0:0]  clock;
reg         [0:0]  reset;
reg         [0:0]  ready_n = 1'b0;
reg         [0:0]  hold = 1'b0;
reg         [0:0]  na_n = 1'b0;
reg         [0:0]  bs16_n = 1'b0;
reg         [31:0] datai = 32'b0;
wire        [3:0]  be_n;
wire        [29:0] address;
wire        [0:0]  w_r_n;
wire        [0:0]  d_c_n;
wire        [0:0]  m_io_n;
wire        [0:0]  ads_n;
wire        [31:0] datao;
reg                __obs = 1'b0;


// DUT instance
b15 _conc_top_inst(
   .clock   (clock),
   .reset   (reset),
   .ready_n (ready_n),
   .hold    (hold),
   .na_n    (na_n),
   .bs16_n  (bs16_n),
   .datai   (datai),
   .be_n    (be_n),
   .address (address),
   .w_r_n   (w_r_n),
   .d_c_n   (d_c_n),
   .m_io_n  (m_io_n),
   .ads_n   (ads_n),
   .datao   (datao),
   .__obs   (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [36:0] _conc_opcode ;
reg [36:0] _conc_ram    [0:210];


// VCD file generation
initial begin
    $dumpfile("./test/b15/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clock = ~clock;
end

// Program counter logic
always @(posedge clock) begin
    _conc_opcode = _conc_ram[_conc_pc];
    ready_n <= #5 _conc_opcode[0];
    hold <= #5 _conc_opcode[1];
    na_n <= #5 _conc_opcode[2];
    bs16_n <= #5 _conc_opcode[3];
    datai <= #5 _conc_opcode[35:4];
    __obs <= #5 _conc_opcode[36];
    $strobe(";_P ready_n %b", ready_n);
    $strobe(";_P hold %b", hold);
    $strobe(";_P na_n %b", na_n);
    $strobe(";_P bs16_n %b", bs16_n);
    $strobe(";_P datai %b", datai);
    $strobe(";_P __obs %b", __obs);
    _conc_pc = _conc_pc + 1;
    $strobe(";_C %d", _conc_pc);
    $strobe(";_Input %b", _conc_opcode);
end

// Generate the initial block
initial begin
    clock = 1'b0;
    reset = 1'b0;
    _conc_pc = 32'b0;
    $readmemb("./test/b15/data.mem", _conc_ram);
    #2 clock = 1'b1;
    reset = 1'b1;
    #10 reset = 1'b0;
    #2200 $finish;
end
endmodule
