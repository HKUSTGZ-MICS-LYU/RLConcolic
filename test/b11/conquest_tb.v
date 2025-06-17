module conquest_tb();

// Generated top module signals
reg         [5:0] x_in = 6'b0;
reg         [0:0] stbi = 1'b0;
reg         [0:0] clock;
reg         [0:0] reset;
wire        [5:0] x_out;
reg               __obs = 1'b0;


// DUT instance
b11 _conc_top_inst(
   .x_in  (x_in),
   .stbi  (stbi),
   .clock (clock),
   .reset (reset),
   .x_out (x_out),
   .__obs (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [7:0]  _conc_opcode ;
reg [7:0]  _conc_ram    [0:80];


// VCD file generation
initial begin
    $dumpfile("./test/b11/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clock = ~clock;
end

// Program counter logic
always @(posedge clock) begin
    _conc_opcode = _conc_ram[_conc_pc];
    x_in <= #5 _conc_opcode[5:0];
    stbi <= #5 _conc_opcode[6];
    __obs <= #5 _conc_opcode[7];
    $strobe(";_P x_in %b", x_in);
    $strobe(";_P stbi %b", stbi);
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
    $readmemb("./test/b11/data.mem", _conc_ram);
    #2 clock = 1'b1;
    reset = 1'b1;
    #10 reset = 1'b0;
    #1000 $finish;
end
endmodule
