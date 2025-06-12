module conquest_tb();

// Generated top module signals
reg         [0:0] clock;
reg         [0:0] reset;
reg         [0:0] start = 1'b0;
reg         [3:0] k = 4'b0;
wire        [0:0] nloss;
wire        [3:0] nl;
wire        [0:0] speaker;
reg               __obs = 1'b0;


// DUT instance
b12 _conc_top_inst(
   .clock   (clock),
   .reset   (reset),
   .start   (start),
   .k       (k),
   .nloss   (nloss),
   .nl      (nl),
   .speaker (speaker),
   .__obs   (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [5:0]  _conc_opcode ;
reg [5:0]  _conc_ram    [0:70];


// VCD file generation
initial begin
    $dumpfile("./test/b12/conquest_tb.vcd");
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
    k <= #5 _conc_opcode[4:1];
    __obs <= #5 _conc_opcode[5];
    $strobe(";_P start %b", start);
    $strobe(";_P k %b", k);
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
    $readmemb("./test/b12/data.mem", _conc_ram);
    #2 clock = 1'b1;
    reset = 1'b1;
    #10 reset = 1'b0;
    #900 $finish;
end
endmodule
