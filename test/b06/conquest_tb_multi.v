module conquest_tb_multi();

// Generated multi-input top module testbench
reg         [0:0] eql = 1'b0;
reg         [0:0] clock;
reg         [0:0] reset;
reg         [0:0] cont_eql = 1'b0;
wire        [1:0] cc_mux;
wire        [1:0] uscite;
wire        [0:0] enable_count;
wire        [0:0] ackout;
reg               __obs = 1'b0;


// DUT instance
b06 _conc_top_inst(
   .eql          (eql),
   .clock        (clock),
   .reset        (reset),
   .cont_eql     (cont_eql),
   .cc_mux       (cc_mux),
   .uscite       (uscite),
   .enable_count (enable_count),
   .ackout       (ackout),
   .__obs        (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [2:0]  _conc_opcode ;
reg [2:0]  _conc_ram    [0:55];
reg _conc_valid;
// Packing map from _conc_opcode to DUT inputs (msb:lsb)
// eql              <- _conc_opcode[0:0]  width=1
// cont_eql         <- _conc_opcode[1:1]  width=1
// __obs            <- _conc_opcode[2:2]  width=1


// VCD file generation
initial begin
    $dumpfile("./test/b06/conquest_tb_multi.vcd");
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
    eql <= #5 _conc_opcode[0];
    cont_eql <= #5 _conc_opcode[1];
    __obs <= #5 _conc_opcode[2];
    $strobe(";_P eql %b", eql);
    $strobe(";_P cont_eql %b", cont_eql);
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
    // Python side collected: ./test/b06/inputs_history
    $finish;
end

endmodule
