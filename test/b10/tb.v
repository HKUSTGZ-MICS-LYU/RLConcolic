module conquest_tb_multi();

// Generated multi-input top module testbench
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
reg [11:0] _conc_ram    [0:6];
reg _conc_valid;

// Packing map from _conc_opcode to DUT inputs (msb:lsb)
// r_button         <- _conc_opcode[0:0]  width=1
// g_button         <- _conc_opcode[1:1]  width=1
// key              <- _conc_opcode[2:2]  width=1
// start            <- _conc_opcode[3:3]  width=1
// test             <- _conc_opcode[4:4]  width=1
// rts              <- _conc_opcode[5:5]  width=1
// rtr              <- _conc_opcode[6:6]  width=1
// v_in             <- _conc_opcode[10:7]  width=4
// __obs            <- _conc_opcode[11:11]  width=1


// VCD file generation
initial begin
    $dumpfile("./test/b10/conquest_tb_multi.vcd");
    $dumpvars(0, conquest_tb_multi);
end

// Clock pulse generator
always begin
    #5 clock = ~clock;
end

// Program counter logic
always @(posedge clock) begin
    if(!reset && _conc_valid && _conc_pc < 7) begin
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
end

// Generate the initial block for multiple inputs
initial begin
    clock = 1'b0;
    reset = 1'b0;
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;

    // Inputs directory and memory files
    // Python side collected: ./test/b10/inputs_history

    // --- Test input 1: data_1.mem ---
    $display("Testing data_1.mem");
    $readmemb("./test/b10/inputs_history/data_1.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b1;
    repeat (7) @(posedge clock);
    _conc_valid = 1'b0;

    // --- Test input 2: data_10.mem ---
    $display("Testing data_10.mem");
    $readmemb("./test/b10/inputs_history/data_10.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b1;
    repeat (7) @(posedge clock);
    _conc_valid = 1'b0;

    // --- Test input 3: data_2.mem ---
    $display("Testing data_2.mem");
    $readmemb("./test/b10/inputs_history/data_2.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b1;
    repeat (7) @(posedge clock);
    _conc_valid = 1'b0;

    // --- Test input 4: data_3.mem ---
    $display("Testing data_3.mem");
    $readmemb("./test/b10/inputs_history/data_3.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b1;
    repeat (7) @(posedge clock);
    _conc_valid = 1'b0;

    // --- Test input 5: data_4.mem ---
    $display("Testing data_4.mem");
    $readmemb("./test/b10/inputs_history/data_4.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b1;
    repeat (7) @(posedge clock);
    _conc_valid = 1'b0;

    // --- Test input 6: data_5.mem ---
    $display("Testing data_5.mem");
    $readmemb("./test/b10/inputs_history/data_5.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b1;
    repeat (7) @(posedge clock);
    _conc_valid = 1'b0;

    // --- Test input 7: data_6.mem ---
    $display("Testing data_6.mem");
    $readmemb("./test/b10/inputs_history/data_6.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b1;
    repeat (7) @(posedge clock);
    _conc_valid = 1'b0;

    // --- Test input 8: data_7.mem ---
    $display("Testing data_7.mem");
    $readmemb("./test/b10/inputs_history/data_7.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b1;
    repeat (7) @(posedge clock);
    _conc_valid = 1'b0;

    // --- Test input 9: data_8.mem ---
    $display("Testing data_8.mem");
    $readmemb("./test/b10/inputs_history/data_8.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b1;
    repeat (7) @(posedge clock);
    _conc_valid = 1'b0;

    // --- Test input 10: data_9.mem ---
    $display("Testing data_9.mem");
    $readmemb("./test/b10/inputs_history/data_9.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b1;
    repeat (7) @(posedge clock);
    _conc_valid = 1'b0;
    $finish;
end

endmodule
