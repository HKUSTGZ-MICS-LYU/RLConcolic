module conquest_tb();

// Generated top module signals
reg         [0:0] clk;
reg         [0:0] rst;
reg         [0:0] phy_tx_mode = 1'b0;
wire        [0:0] usb_rst;
wire        [0:0] txdp;
wire        [0:0] txdn;
wire        [0:0] txoe;
reg         [0:0] rxd = 1'b0;
reg         [0:0] rxdp = 1'b0;
reg         [0:0] rxdn = 1'b0;
reg         [7:0] DataOut_i = 8'b0;
reg         [0:0] TxValid_i = 1'b0;
wire        [0:0] TxReady_o;
wire        [7:0] DataIn_o;
wire        [0:0] RxValid_o;
wire        [0:0] RxActive_o;
wire        [0:0] RxError_o;
wire        [1:0] LineState_o;
reg               __obs = 1'b0;


// DUT instance
usb_phy _conc_top_inst(
   .clk         (clk),
   .rst         (rst),
   .phy_tx_mode (phy_tx_mode),
   .usb_rst     (usb_rst),
   .txdp        (txdp),
   .txdn        (txdn),
   .txoe        (txoe),
   .rxd         (rxd),
   .rxdp        (rxdp),
   .rxdn        (rxdn),
   .DataOut_i   (DataOut_i),
   .TxValid_i   (TxValid_i),
   .TxReady_o   (TxReady_o),
   .DataIn_o    (DataIn_o),
   .RxValid_o   (RxValid_o),
   .RxActive_o  (RxActive_o),
   .RxError_o   (RxError_o),
   .LineState_o (LineState_o),
   .__obs       (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [13:0] _conc_opcode ;
reg [13:0] _conc_ram    [0:60];


// VCD file generation
initial begin
    $dumpfile("./test/usb_phy/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clk = ~clk;
end

// Program counter logic
always @(posedge clk) begin
    _conc_opcode = _conc_ram[_conc_pc];
    phy_tx_mode <= #5 _conc_opcode[0];
    rxd <= #5 _conc_opcode[1];
    rxdp <= #5 _conc_opcode[2];
    rxdn <= #5 _conc_opcode[3];
    DataOut_i <= #5 _conc_opcode[11:4];
    TxValid_i <= #5 _conc_opcode[12];
    __obs <= #5 _conc_opcode[13];
    $strobe(";_P phy_tx_mode %b", phy_tx_mode);
    $strobe(";_P rxd %b", rxd);
    $strobe(";_P rxdp %b", rxdp);
    $strobe(";_P rxdn %b", rxdn);
    $strobe(";_P DataOut_i %b", DataOut_i);
    $strobe(";_P TxValid_i %b", TxValid_i);
    $strobe(";_P __obs %b", __obs);
    _conc_pc = _conc_pc + 1;
    $strobe(";_C %d", _conc_pc);
    $strobe(";_Input %b", _conc_opcode);
end

// Generate the initial block
initial begin
    clk = 1'b0;
    rst = 1'b1;
    _conc_pc = 32'b0;
    $readmemb("./test/usb_phy/data.mem", _conc_ram);
    #2 clk = 1'b1;
    rst = 1'b0;
    #10 rst = 1'b1;
    #700 $finish;
end
endmodule
