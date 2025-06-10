module conquest_tb(input clock, input reset);

// Generated top module signals
reg         [0:0] line1 = 1'b0;
reg         [0:0] line2 = 1'b0;
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
reg [2:0]  _conc_ram    [0:8];

// Program counter logic
always @(posedge clock) begin
    _conc_opcode = _conc_ram[_conc_pc];
    line1 <= #5 _conc_opcode[0];
    line2 <= #5 _conc_opcode[1];
    __obs <= #5 _conc_opcode[2];
    $strobe(";R outp %d", _conc_top_inst.outp);
    $strobe(";R overflw %d", _conc_top_inst.overflw);
    $strobe(";R stato %d", _conc_top_inst.stato);
    _conc_pc = _conc_pc + 1;
    $strobe(";_C %d", _conc_pc);
    $strobe(";_Input %b", _conc_opcode);
end

// Generate the initial block
initial begin
    _conc_pc = 32'b0;
    $readmemb("./test/b01/data.mem", _conc_ram);
end
endmodule
