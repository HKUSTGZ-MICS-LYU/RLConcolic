module conquest_tb();

// Generated top module signals
reg         [0:0] clock;
reg         [0:0] reset;
reg         [0:0] start = 1'b0;
wire        [7:0] punti_retta;
reg               __obs = 1'b0;


// DUT instance
b07 _conc_top_inst(
   .clock       (clock),
   .reset       (reset),
   .start       (start),
   .punti_retta (punti_retta),
   .__obs       (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [1:0]  _conc_opcode ;
reg [1:0]  _conc_ram    [0:120];


// VCD file generation
initial begin
    $dumpfile("./test/b07/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clock = ~clock;
end

// Program counter logic
always @(posedge clock) begin
    _conc_opcode = _conc_ram[_conc_pc];
    start <= #5 _conc_opcode[0];
    __obs <= #5 _conc_opcode[1];
    $strobe(";_P start %b", start);
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
    $readmemb("./test/b07/data.mem", _conc_ram);
    #2 clock = 1'b1;
    reset = 1'b1;
    #10 reset = 1'b0;
    #1400 $finish;
end
endmodule
