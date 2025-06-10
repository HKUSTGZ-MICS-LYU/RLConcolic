module conquest_tb();

// Generated top module signals
reg         [0:0] clk;
reg         [0:0] rst;
wire        [7:0] pc;
reg               __obs = 1'b0;


// DUT instance
mips _conc_top_inst(
   .clk (clk),
   .rst (rst),
   .pc  (pc),
   .__obs (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [0:0]  _conc_opcode ;
reg [0:0]  _conc_ram    [0:110];


// VCD file generation
initial begin
    $dumpfile("./test/mips/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clk = ~clk;
end

// Program counter logic
always @(posedge clk) begin
    _conc_opcode = _conc_ram[_conc_pc];
    __obs <= #5 _conc_opcode[0];
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
    $readmemb("./test/mips/data.mem", _conc_ram);
    #2 clk = 1'b1;
    rst = 1'b1;
    #10 rst = 1'b0;
    #1200 $finish;
end
endmodule
