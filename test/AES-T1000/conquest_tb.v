module conquest_tb();

// Generated top module signals
reg         [0:0]   clk;
reg         [0:0]   rst;
reg         [127:0] state = 128'b0;
reg         [127:0] key = 128'b0;
wire        [127:0] out;
wire        [63:0]  Capacitance;
reg                 __obs = 1'b0;


// DUT instance
top _conc_top_inst(
   .clk         (clk),
   .rst         (rst),
   .state       (state),
   .key         (key),
   .out         (out),
   .Capacitance (Capacitance),
   .__obs       (__obs));

// Internal signals used in the testbench
reg [31:0]  _conc_pc     ;
reg [256:0] _conc_opcode ;
reg [256:0] _conc_ram    [0:60];


// VCD file generation
initial begin
    $dumpfile("./test/AES-T1000/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clk = ~clk;
end

// Program counter logic
always @(posedge clk) begin
    _conc_opcode = _conc_ram[_conc_pc];
    state <= #5 _conc_opcode[127:0];
    key <= #5 _conc_opcode[255:128];
    __obs <= #5 _conc_opcode[256];
    $strobe(";_P state %b", state);
    $strobe(";_P key %b", key);
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
    $readmemb("./test/AES-T1000/data.mem", _conc_ram);
    #5 clk = 1'b1;
    rst = 1'b1;
    #10 rst = 1'b0;
    #700 $finish;
end
endmodule
