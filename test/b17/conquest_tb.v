module conquest_tb();

// Generated top module signals
reg         [0:0]  clock;
reg         [0:0]  reset;
reg         [31:0] datai = 32'b0;
wire signed [31:0] datao;
reg         [0:0]  hold = 1'b0;
reg         [0:0]  na = 1'b0;
reg         [0:0]  bs16 = 1'b0;
wire        [29:0] address1;
wire        [29:0] address2;
wire        [0:0]  wr;
wire        [0:0]  dc;
wire        [0:0]  mio;
wire        [0:0]  ast1;
wire        [0:0]  ast2;
reg         [0:0]  ready1 = 1'b0;
reg         [0:0]  ready2 = 1'b0;
reg                __obs = 1'b0;


// DUT instance
b17 _conc_top_inst(
   .clock    (clock),
   .reset    (reset),
   .datai    (datai),
   .datao    (datao),
   .hold     (hold),
   .na       (na),
   .bs16     (bs16),
   .address1 (address1),
   .address2 (address2),
   .wr       (wr),
   .dc       (dc),
   .mio      (mio),
   .ast1     (ast1),
   .ast2     (ast2),
   .ready1   (ready1),
   .ready2   (ready2),
   .__obs    (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [37:0] _conc_opcode ;
reg [37:0] _conc_ram    [0:25];


// VCD file generation
initial begin
    $dumpfile("./test/b17/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clock = ~clock;
end

// Program counter logic
always @(posedge clock) begin
    _conc_opcode = _conc_ram[_conc_pc];
    datai <= #5 _conc_opcode[31:0];
    hold <= #5 _conc_opcode[32];
    na <= #5 _conc_opcode[33];
    bs16 <= #5 _conc_opcode[34];
    ready1 <= #5 _conc_opcode[35];
    ready2 <= #5 _conc_opcode[36];
    __obs <= #5 _conc_opcode[37];
    $strobe(";_P datai %b", datai);
    $strobe(";_P hold %b", hold);
    $strobe(";_P na %b", na);
    $strobe(";_P bs16 %b", bs16);
    $strobe(";_P ready1 %b", ready1);
    $strobe(";_P ready2 %b", ready2);
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
    $readmemb("./test/b17/data.mem", _conc_ram);
    #2 clock = 1'b1;
    reset = 1'b1;
    #10 reset = 1'b0;
    #300 $finish;
end
endmodule
