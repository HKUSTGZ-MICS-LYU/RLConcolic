module conquest_tb_multi();

// Generated multi-input top module testbench
reg         [0:0] clock;
reg         [0:0] line1 = 1'b0;
reg         [0:0] line2 = 1'b0;
reg         [0:0] reset;
wire        [0:0] outp;
wire        [0:0] overflw;
reg               __obs = 1'b0;


// DUT instance
b01 _conc_top_inst(
   .clock   (clock),
   .line1   (line1),
   .line2   (line2),
   .reset   (reset),
   .outp    (outp),
   .overflw (overflw),
   .__obs   (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [2:0]  _conc_opcode ;
reg [2:0]  _conc_ram    [0:60];

// Packing map from _conc_opcode to DUT inputs (msb:lsb)
// line1            <- _conc_opcode[0:0]  width=1
// line2            <- _conc_opcode[1:1]  width=1
// __obs            <- _conc_opcode[2:2]  width=1


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
    _conc_opcode = _conc_ram[_conc_pc];
    line1 <= #5 _conc_opcode[0];
    line2 <= #5 _conc_opcode[1];
    __obs <= #5 _conc_opcode[2];
    $strobe(";_P line1 %b", line1);
    $strobe(";_P line2 %b", line2);
    $strobe(";_P __obs %b", __obs);
    _conc_pc = _conc_pc + 1;
    $strobe(";_C %d", _conc_pc);
    $strobe(";_Input %b", _conc_opcode);
end

// Generate the initial block for multiple inputs
initial begin
    clock = 1'b0;
    reset = 1'b0;
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;

    // Inputs directory and memory files
    // Python side collected: ./test/b01/inputs_history

    // --- Test input 1: data_1.mem ---
    $display("Testing data_1.mem");
    $readmemb("./test/b01/inputs_history/data_1.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b;
    repeat (70) @(posedge clock);

    // --- Test input 2: data_10.mem ---
    $display("Testing data_10.mem");
    $readmemb("./test/b01/inputs_history/data_10.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b;
    repeat (70) @(posedge clock);

    // --- Test input 3: data_11.mem ---
    $display("Testing data_11.mem");
    $readmemb("./test/b01/inputs_history/data_11.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b;
    repeat (70) @(posedge clock);

    // --- Test input 4: data_12.mem ---
    $display("Testing data_12.mem");
    $readmemb("./test/b01/inputs_history/data_12.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b;
    repeat (70) @(posedge clock);

    // --- Test input 5: data_13.mem ---
    $display("Testing data_13.mem");
    $readmemb("./test/b01/inputs_history/data_13.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b;
    repeat (70) @(posedge clock);

    // --- Test input 6: data_14.mem ---
    $display("Testing data_14.mem");
    $readmemb("./test/b01/inputs_history/data_14.mem", _conc_ram);
    _conc_pc = 32'b0;
    _conc_valid = 1'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    _conc_valid = 1'b;
    repeat (70) @(posedge clock);

    // --- Test input 7: data_15.mem ---
    $display("Testing data_15.mem");
    $readmemb("./test/b01/inputs_history/data_15.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 8: data_16.mem ---
    $display("Testing data_16.mem");
    $readmemb("./test/b01/inputs_history/data_16.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 9: data_17.mem ---
    $display("Testing data_17.mem");
    $readmemb("./test/b01/inputs_history/data_17.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 10: data_18.mem ---
    $display("Testing data_18.mem");
    $readmemb("./test/b01/inputs_history/data_18.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 11: data_19.mem ---
    $display("Testing data_19.mem");
    $readmemb("./test/b01/inputs_history/data_19.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 12: data_2.mem ---
    $display("Testing data_2.mem");
    $readmemb("./test/b01/inputs_history/data_2.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 13: data_20.mem ---
    $display("Testing data_20.mem");
    $readmemb("./test/b01/inputs_history/data_20.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 14: data_21.mem ---
    $display("Testing data_21.mem");
    $readmemb("./test/b01/inputs_history/data_21.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 15: data_22.mem ---
    $display("Testing data_22.mem");
    $readmemb("./test/b01/inputs_history/data_22.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 16: data_23.mem ---
    $display("Testing data_23.mem");
    $readmemb("./test/b01/inputs_history/data_23.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 17: data_24.mem ---
    $display("Testing data_24.mem");
    $readmemb("./test/b01/inputs_history/data_24.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 18: data_25.mem ---
    $display("Testing data_25.mem");
    $readmemb("./test/b01/inputs_history/data_25.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 19: data_26.mem ---
    $display("Testing data_26.mem");
    $readmemb("./test/b01/inputs_history/data_26.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 20: data_27.mem ---
    $display("Testing data_27.mem");
    $readmemb("./test/b01/inputs_history/data_27.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 21: data_28.mem ---
    $display("Testing data_28.mem");
    $readmemb("./test/b01/inputs_history/data_28.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 22: data_29.mem ---
    $display("Testing data_29.mem");
    $readmemb("./test/b01/inputs_history/data_29.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 23: data_3.mem ---
    $display("Testing data_3.mem");
    $readmemb("./test/b01/inputs_history/data_3.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 24: data_30.mem ---
    $display("Testing data_30.mem");
    $readmemb("./test/b01/inputs_history/data_30.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 25: data_31.mem ---
    $display("Testing data_31.mem");
    $readmemb("./test/b01/inputs_history/data_31.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 26: data_32.mem ---
    $display("Testing data_32.mem");
    $readmemb("./test/b01/inputs_history/data_32.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 27: data_33.mem ---
    $display("Testing data_33.mem");
    $readmemb("./test/b01/inputs_history/data_33.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 28: data_34.mem ---
    $display("Testing data_34.mem");
    $readmemb("./test/b01/inputs_history/data_34.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 29: data_35.mem ---
    $display("Testing data_35.mem");
    $readmemb("./test/b01/inputs_history/data_35.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 30: data_36.mem ---
    $display("Testing data_36.mem");
    $readmemb("./test/b01/inputs_history/data_36.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 31: data_37.mem ---
    $display("Testing data_37.mem");
    $readmemb("./test/b01/inputs_history/data_37.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 32: data_38.mem ---
    $display("Testing data_38.mem");
    $readmemb("./test/b01/inputs_history/data_38.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 33: data_39.mem ---
    $display("Testing data_39.mem");
    $readmemb("./test/b01/inputs_history/data_39.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 34: data_4.mem ---
    $display("Testing data_4.mem");
    $readmemb("./test/b01/inputs_history/data_4.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 35: data_40.mem ---
    $display("Testing data_40.mem");
    $readmemb("./test/b01/inputs_history/data_40.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 36: data_41.mem ---
    $display("Testing data_41.mem");
    $readmemb("./test/b01/inputs_history/data_41.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 37: data_42.mem ---
    $display("Testing data_42.mem");
    $readmemb("./test/b01/inputs_history/data_42.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 38: data_43.mem ---
    $display("Testing data_43.mem");
    $readmemb("./test/b01/inputs_history/data_43.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 39: data_44.mem ---
    $display("Testing data_44.mem");
    $readmemb("./test/b01/inputs_history/data_44.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 40: data_45.mem ---
    $display("Testing data_45.mem");
    $readmemb("./test/b01/inputs_history/data_45.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 41: data_46.mem ---
    $display("Testing data_46.mem");
    $readmemb("./test/b01/inputs_history/data_46.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 42: data_47.mem ---
    $display("Testing data_47.mem");
    $readmemb("./test/b01/inputs_history/data_47.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 43: data_48.mem ---
    $display("Testing data_48.mem");
    $readmemb("./test/b01/inputs_history/data_48.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 44: data_49.mem ---
    $display("Testing data_49.mem");
    $readmemb("./test/b01/inputs_history/data_49.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 45: data_5.mem ---
    $display("Testing data_5.mem");
    $readmemb("./test/b01/inputs_history/data_5.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 46: data_50.mem ---
    $display("Testing data_50.mem");
    $readmemb("./test/b01/inputs_history/data_50.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 47: data_51.mem ---
    $display("Testing data_51.mem");
    $readmemb("./test/b01/inputs_history/data_51.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 48: data_52.mem ---
    $display("Testing data_52.mem");
    $readmemb("./test/b01/inputs_history/data_52.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 49: data_6.mem ---
    $display("Testing data_6.mem");
    $readmemb("./test/b01/inputs_history/data_6.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 50: data_7.mem ---
    $display("Testing data_7.mem");
    $readmemb("./test/b01/inputs_history/data_7.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 51: data_8.mem ---
    $display("Testing data_8.mem");
    $readmemb("./test/b01/inputs_history/data_8.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);

    // --- Test input 52: data_9.mem ---
    $display("Testing data_9.mem");
    $readmemb("./test/b01/inputs_history/data_9.mem", _conc_ram);
    _conc_pc = 32'b0;
    reset = 1'b1;
    repeat (2) @(posedge clock);
    reset = 1'b0;
    repeat (70) @(posedge clock);
    $finish;
end

endmodule
