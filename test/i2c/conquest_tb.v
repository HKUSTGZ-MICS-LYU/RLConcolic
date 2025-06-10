module conquest_tb();

// Generated top module signals
reg         [0:0] wb_clk_i;
reg         [0:0] wb_rst_i;
reg         [0:0] arst_i = 1'b0;
reg         [2:0] wb_adr_i = 3'b0;
reg         [7:0] wb_dat_i = 8'b0;
wire        [7:0] wb_dat_o;
reg         [0:0] wb_we_i = 1'b0;
reg         [0:0] wb_stb_i = 1'b0;
reg         [0:0] wb_cyc_i = 1'b0;
wire        [0:0] wb_ack_o;
wire        [0:0] wb_inta_o;
reg         [0:0] scl_pad_i = 1'b0;
wire        [0:0] scl_pad_o;
wire        [0:0] scl_padoen_o;
reg         [0:0] sda_pad_i = 1'b0;
wire        [0:0] sda_pad_o;
wire        [0:0] sda_padoen_o;
reg               __obs = 1'b0;


// DUT instance
top _conc_top_inst(
   .wb_clk_i     (wb_clk_i),
   .wb_rst_i     (wb_rst_i),
   .arst_i       (arst_i),
   .wb_adr_i     (wb_adr_i),
   .wb_dat_i     (wb_dat_i),
   .wb_dat_o     (wb_dat_o),
   .wb_we_i      (wb_we_i),
   .wb_stb_i     (wb_stb_i),
   .wb_cyc_i     (wb_cyc_i),
   .wb_ack_o     (wb_ack_o),
   .wb_inta_o    (wb_inta_o),
   .scl_pad_i    (scl_pad_i),
   .scl_pad_o    (scl_pad_o),
   .scl_padoen_o (scl_padoen_o),
   .sda_pad_i    (sda_pad_i),
   .sda_pad_o    (sda_pad_o),
   .sda_padoen_o (sda_padoen_o),
   .__obs        (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [17:0] _conc_opcode ;
reg [17:0] _conc_ram    [0:110];


// VCD file generation
initial begin
    $dumpfile("./test/i2c/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 wb_clk_i = ~wb_clk_i;
end

// Program counter logic
always @(posedge wb_clk_i) begin
    _conc_opcode = _conc_ram[_conc_pc];
    arst_i <= #5 _conc_opcode[0];
    wb_adr_i <= #5 _conc_opcode[3:1];
    wb_dat_i <= #5 _conc_opcode[11:4];
    wb_we_i <= #5 _conc_opcode[12];
    wb_stb_i <= #5 _conc_opcode[13];
    wb_cyc_i <= #5 _conc_opcode[14];
    scl_pad_i <= #5 _conc_opcode[15];
    sda_pad_i <= #5 _conc_opcode[16];
    __obs <= #5 _conc_opcode[17];
    $strobe(";_P arst_i %b", arst_i);
    $strobe(";_P wb_adr_i %b", wb_adr_i);
    $strobe(";_P wb_dat_i %b", wb_dat_i);
    $strobe(";_P wb_we_i %b", wb_we_i);
    $strobe(";_P wb_stb_i %b", wb_stb_i);
    $strobe(";_P wb_cyc_i %b", wb_cyc_i);
    $strobe(";_P scl_pad_i %b", scl_pad_i);
    $strobe(";_P sda_pad_i %b", sda_pad_i);
    $strobe(";_P __obs %b", __obs);
    _conc_pc = _conc_pc + 1;
    $strobe(";_C %d", _conc_pc);
    $strobe(";_Input %b", _conc_opcode);
end

// Generate the initial block
initial begin
    wb_clk_i = 1'b0;
    wb_rst_i = 1'b0;
    _conc_pc = 32'b0;
    $readmemb("./test/i2c/data.mem", _conc_ram);
    #2 wb_clk_i = 1'b1;
    wb_rst_i = 1'b1;
    #10 wb_rst_i = 1'b0;
    #1200 $finish;
end
endmodule
