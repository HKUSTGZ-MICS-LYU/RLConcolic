module conquest_tb();

// Generated top module signals
reg         [0:0]  clock;
reg         [0:0]  reset;
reg         [31:0] si = 32'b0;
wire        [19:0] so;
wire        [0:0]  rd;
wire        [0:0]  wr;
reg                __obs = 1'b0;


// DUT instance
b21 _conc_top_inst(
   .clock (clock),
   .reset (reset),
   .si    (si),
   .so    (so),
   .rd    (rd),
   .wr    (wr),
   .__obs (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [32:0] _conc_opcode ;
reg [32:0] _conc_ram    [0:210];


// VCD file generation
initial begin
    $dumpfile("./test/b21/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clock = ~clock;
end

// Program counter logic
always @(posedge clock) begin
    _conc_opcode = _conc_ram[_conc_pc];
    si <= #5 _conc_opcode[31:0];
    __obs <= #5 _conc_opcode[32];
    $strobe(";R so %d", _conc_top_inst.so);
    $strobe(";R rd %d", _conc_top_inst.rd);
    $strobe(";R wr %d", _conc_top_inst.wr);
    $strobe(";R ad1 %d", _conc_top_inst.ad1);
    $strobe(";R ad2 %d", _conc_top_inst.ad2);
    $strobe(";R di1 %d", _conc_top_inst.di1);
    $strobe(";R di2 %d", _conc_top_inst.di2);
    $strobe(";R do1 %d", _conc_top_inst.do1);
    $strobe(";R do2 %d", _conc_top_inst.do2);
    $strobe(";R r1 %d", _conc_top_inst.r1);
    $strobe(";R r2 %d", _conc_top_inst.r2);
    $strobe(";R w1 %d", _conc_top_inst.w1);
    $strobe(";R w2 %d", _conc_top_inst.w2);
    $strobe(";R P1_clock %d", _conc_top_inst.P1_clock);
    $strobe(";R P1_reset %d", _conc_top_inst.P1_reset);
    $strobe(";R P1_addr %d", _conc_top_inst.P1_addr);
    $strobe(";R P1_datai %d", _conc_top_inst.P1_datai);
    $strobe(";R P1_datao %d", _conc_top_inst.P1_datao);
    $strobe(";R P1_rd %d", _conc_top_inst.P1_rd);
    $strobe(";R P1_wr %d", _conc_top_inst.P1_wr);
    $strobe(";R P1_s %d", _conc_top_inst.P1_s);
    $strobe(";R P1_temp %d", _conc_top_inst.P1_temp);
    $strobe(";R P1_d %d", _conc_top_inst.P1_d);
    $strobe(";R P1_t %d", _conc_top_inst.P1_t);
    $strobe(";R P1_m %d", _conc_top_inst.P1_m);
    $strobe(";R P1_r %d", _conc_top_inst.P1_r);
    $strobe(";R P1_state %d", _conc_top_inst.P1_state);
    $strobe(";R P1_IR %d", _conc_top_inst.P1_IR);
    $strobe(";R P1_tail %d", _conc_top_inst.P1_tail);
    $strobe(";R P1_ff %d", _conc_top_inst.P1_ff);
    $strobe(";R P1_cf %d", _conc_top_inst.P1_cf);
    $strobe(";R P1_df %d", _conc_top_inst.P1_df);
    $strobe(";R P1_mf %d", _conc_top_inst.P1_mf);
    $strobe(";R P1_MBR %d", _conc_top_inst.P1_MBR);
    $strobe(";R P1_MAR %d", _conc_top_inst.P1_MAR);
    $strobe(";R P1_B %d", _conc_top_inst.P1_B);
    $strobe(";R P1_reg3 %d", _conc_top_inst.P1_reg3);
    $strobe(";R P1_reg2 %d", _conc_top_inst.P1_reg2);
    $strobe(";R P1_reg1 %d", _conc_top_inst.P1_reg1);
    $strobe(";R P1_reg0 %d", _conc_top_inst.P1_reg0);
    $strobe(";R P2_clock %d", _conc_top_inst.P2_clock);
    $strobe(";R P2_reset %d", _conc_top_inst.P2_reset);
    $strobe(";R P2_addr %d", _conc_top_inst.P2_addr);
    $strobe(";R P2_datai %d", _conc_top_inst.P2_datai);
    $strobe(";R P2_datao %d", _conc_top_inst.P2_datao);
    $strobe(";R P2_rd %d", _conc_top_inst.P2_rd);
    $strobe(";R P2_wr %d", _conc_top_inst.P2_wr);
    $strobe(";R P2_s %d", _conc_top_inst.P2_s);
    $strobe(";R P2_temp %d", _conc_top_inst.P2_temp);
    $strobe(";R P2_d %d", _conc_top_inst.P2_d);
    $strobe(";R P2_t %d", _conc_top_inst.P2_t);
    $strobe(";R P2_m %d", _conc_top_inst.P2_m);
    $strobe(";R P2_r %d", _conc_top_inst.P2_r);
    $strobe(";R P2_state %d", _conc_top_inst.P2_state);
    $strobe(";R P2_IR %d", _conc_top_inst.P2_IR);
    $strobe(";R P2_tail %d", _conc_top_inst.P2_tail);
    $strobe(";R P2_ff %d", _conc_top_inst.P2_ff);
    $strobe(";R P2_cf %d", _conc_top_inst.P2_cf);
    $strobe(";R P2_df %d", _conc_top_inst.P2_df);
    $strobe(";R P2_mf %d", _conc_top_inst.P2_mf);
    $strobe(";R P2_MBR %d", _conc_top_inst.P2_MBR);
    $strobe(";R P2_MAR %d", _conc_top_inst.P2_MAR);
    $strobe(";R P2_B %d", _conc_top_inst.P2_B);
    $strobe(";R P2_reg3 %d", _conc_top_inst.P2_reg3);
    $strobe(";R P2_reg2 %d", _conc_top_inst.P2_reg2);
    $strobe(";R P2_reg1 %d", _conc_top_inst.P2_reg1);
    $strobe(";R P2_reg0 %d", _conc_top_inst.P2_reg0);
    _conc_pc = _conc_pc + 1;
    $strobe(";_C %d", _conc_pc);
    $strobe(";_Input %b", _conc_opcode);
end

// Generate the initial block
initial begin
    clock = 1'b0;
    reset = 1'b0;
    _conc_pc = 32'b0;
    $readmemb("./test/b21/data.mem", _conc_ram);
    #2 clock = 1'b1;
    reset = 1'b1;
    #10 reset = 1'b0;
    #2200 $finish;
end
endmodule
