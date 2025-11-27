module conquest_tb_multi();

// Generated multi-input top module testbench
reg         [0:0] clock;
reg         [0:0] reset;
reg         [2:0] in = 3'b0;
wire        [0:0] out;
reg               __obs = 1'b0;


// DUT instance
b01 _conc_top_inst(
   .clock (clock),
   .reset (reset),
   .in    (in),
   .out   (out),
   .__obs (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [3:0]  _conc_opcode ;
reg [3:0]  _conc_ram    [0:55];
reg _conc_valid;
// Packing map from _conc_opcode to DUT inputs (msb:lsb)
// in               <- _conc_opcode[2:0]  width=3
// __obs            <- _conc_opcode[3:3]  width=1


// VCD file generation
initial begin
    $dumpfile("./test/b01/conquest_tb_multi.vcd");
    $dumpvars(0, conquest_tb_multi);
end

// Clock pulse generator
always begin
    #5 clock = ~clock;
end

// Program counter logic
always @(posedge clock) begin
    if (!reset && _conc_valid) begin
    _conc_opcode = _conc_ram[_conc_pc];
    in <= #5 _conc_opcode[2:0];
    __obs <= #5 _conc_opcode[3];
    $strobe(";_P in %b", in);
    $strobe(";_P __obs %b", __obs);
    _conc_pc = _conc_pc + 1;
    $strobe(";_C %d", _conc_pc);
    $strobe(";_Input %b", _conc_opcode);
    end
end

// Generate the initial block for multiple inputs
initial begin
    clock = 1'b0;
    reset = 1'b0;
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;

    // Inputs directory and memory files
    // Python side collected: ./test/b01/inputs_history
    $finish;
end

endmodule
