module conquest_tb();

// Generated top module signals
reg         [0:0] r_button = 1'b0;
reg         [0:0] g_button = 1'b0;
reg         [0:0] key = 1'b0;
reg         [0:0] start = 1'b0;
reg         [0:0] reset;
reg         [0:0] test = 1'b0;
wire        [0:0] cts;
wire        [0:0] ctr;
reg         [0:0] rts = 1'b0;
reg         [0:0] rtr = 1'b0;
reg         [0:0] clock;
reg         [3:0] v_in = 4'b0;
wire        [3:0] v_out;
reg               __obs = 1'b0;


// DUT instance
b10 _conc_top_inst(
   .r_button (r_button),
   .g_button (g_button),
   .key      (key),
   .start    (start),
   .reset    (reset),
   .test     (test),
   .cts      (cts),
   .ctr      (ctr),
   .rts      (rts),
   .rtr      (rtr),
   .clock    (clock),
   .v_in     (v_in),
   .v_out    (v_out),
   .__obs    (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [11:0] _conc_opcode ;
reg [11:0] _conc_ram    [0:11];


// VCD file generation
initial begin
    $dumpfile("./test/b10/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clock = ~clock;
end

// Program counter logic
always @(posedge clock) begin
    _conc_opcode = _conc_ram[_conc_pc];
    r_button <= #5 _conc_opcode[0];
    g_button <= #5 _conc_opcode[1];
    key <= #5 _conc_opcode[2];
    start <= #5 _conc_opcode[3];
    test <= #5 _conc_opcode[4];
    rts <= #5 _conc_opcode[5];
    rtr <= #5 _conc_opcode[6];
    v_in <= #5 _conc_opcode[10:7];
    __obs <= #5 _conc_opcode[11];
    $strobe(";_P r_button %b", r_button);
    $strobe(";_P g_button %b", g_button);
    $strobe(";_P key %b", key);
    $strobe(";_P start %b", start);
    $strobe(";_P test %b", test);
    $strobe(";_P rts %b", rts);
    $strobe(";_P rtr %b", rtr);
    $strobe(";_P v_in %b", v_in);
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
    $readmemb("./test/b10/data.mem", _conc_ram);
    #2 clock = 1'b1;
    reset = 1'b1;
    #10 reset = 1'b0;
    #120 $finish;
end
endmodule
