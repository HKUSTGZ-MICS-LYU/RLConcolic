module conquest_tb();

// Generated top module signals
reg         [0:0]  clock;
reg         [0:0]  reset;
reg         [0:0]  auto_buffer_out_a_ready = 1'b0;
wire        [0:0]  auto_buffer_out_a_valid;
wire        [2:0]  auto_buffer_out_a_bits_opcode;
wire        [2:0]  auto_buffer_out_a_bits_param;
wire        [3:0]  auto_buffer_out_a_bits_size;
wire        [1:0]  auto_buffer_out_a_bits_source;
wire        [31:0] auto_buffer_out_a_bits_address;
wire        [7:0]  auto_buffer_out_a_bits_mask;
wire        [63:0] auto_buffer_out_a_bits_data;
wire        [0:0]  auto_buffer_out_b_ready;
reg         [0:0]  auto_buffer_out_b_valid = 1'b0;
reg         [2:0]  auto_buffer_out_b_bits_opcode = 3'b0;
reg         [1:0]  auto_buffer_out_b_bits_param = 2'b0;
reg         [3:0]  auto_buffer_out_b_bits_size = 4'b0;
reg         [1:0]  auto_buffer_out_b_bits_source = 2'b0;
reg         [31:0] auto_buffer_out_b_bits_address = 32'b0;
reg         [7:0]  auto_buffer_out_b_bits_mask = 8'b0;
reg         [0:0]  auto_buffer_out_b_bits_corrupt = 1'b0;
reg         [0:0]  auto_buffer_out_c_ready = 1'b0;
wire        [0:0]  auto_buffer_out_c_valid;
wire        [2:0]  auto_buffer_out_c_bits_opcode;
wire        [2:0]  auto_buffer_out_c_bits_param;
wire        [3:0]  auto_buffer_out_c_bits_size;
wire        [1:0]  auto_buffer_out_c_bits_source;
wire        [31:0] auto_buffer_out_c_bits_address;
wire        [63:0] auto_buffer_out_c_bits_data;
wire        [0:0]  auto_buffer_out_d_ready;
reg         [0:0]  auto_buffer_out_d_valid = 1'b0;
reg         [2:0]  auto_buffer_out_d_bits_opcode = 3'b0;
reg         [1:0]  auto_buffer_out_d_bits_param = 2'b0;
reg         [3:0]  auto_buffer_out_d_bits_size = 4'b0;
reg         [1:0]  auto_buffer_out_d_bits_source = 2'b0;
reg         [1:0]  auto_buffer_out_d_bits_sink = 2'b0;
reg         [0:0]  auto_buffer_out_d_bits_denied = 1'b0;
reg         [63:0] auto_buffer_out_d_bits_data = 64'b0;
reg         [0:0]  auto_buffer_out_d_bits_corrupt = 1'b0;
reg         [0:0]  auto_buffer_out_e_ready = 1'b0;
wire        [0:0]  auto_buffer_out_e_valid;
wire        [1:0]  auto_buffer_out_e_bits_sink;
wire        [0:0]  auto_wfi_out_0;
reg         [0:0]  auto_int_local_in_2_0 = 1'b0;
reg         [0:0]  auto_int_local_in_1_0 = 1'b0;
reg         [0:0]  auto_int_local_in_1_1 = 1'b0;
reg         [0:0]  auto_int_local_in_0_0 = 1'b0;
reg         [0:0]  auto_hartid_in = 1'b0;
reg                __obs = 1'b0;


// DUT instance
RocketTile _conc_top_inst(
   .clock                          (clock),
   .reset                          (reset),
   .auto_buffer_out_a_ready        (auto_buffer_out_a_ready),
   .auto_buffer_out_a_valid        (auto_buffer_out_a_valid),
   .auto_buffer_out_a_bits_opcode  (auto_buffer_out_a_bits_opcode),
   .auto_buffer_out_a_bits_param   (auto_buffer_out_a_bits_param),
   .auto_buffer_out_a_bits_size    (auto_buffer_out_a_bits_size),
   .auto_buffer_out_a_bits_source  (auto_buffer_out_a_bits_source),
   .auto_buffer_out_a_bits_address (auto_buffer_out_a_bits_address),
   .auto_buffer_out_a_bits_mask    (auto_buffer_out_a_bits_mask),
   .auto_buffer_out_a_bits_data    (auto_buffer_out_a_bits_data),
   .auto_buffer_out_b_ready        (auto_buffer_out_b_ready),
   .auto_buffer_out_b_valid        (auto_buffer_out_b_valid),
   .auto_buffer_out_b_bits_opcode  (auto_buffer_out_b_bits_opcode),
   .auto_buffer_out_b_bits_param   (auto_buffer_out_b_bits_param),
   .auto_buffer_out_b_bits_size    (auto_buffer_out_b_bits_size),
   .auto_buffer_out_b_bits_source  (auto_buffer_out_b_bits_source),
   .auto_buffer_out_b_bits_address (auto_buffer_out_b_bits_address),
   .auto_buffer_out_b_bits_mask    (auto_buffer_out_b_bits_mask),
   .auto_buffer_out_b_bits_corrupt (auto_buffer_out_b_bits_corrupt),
   .auto_buffer_out_c_ready        (auto_buffer_out_c_ready),
   .auto_buffer_out_c_valid        (auto_buffer_out_c_valid),
   .auto_buffer_out_c_bits_opcode  (auto_buffer_out_c_bits_opcode),
   .auto_buffer_out_c_bits_param   (auto_buffer_out_c_bits_param),
   .auto_buffer_out_c_bits_size    (auto_buffer_out_c_bits_size),
   .auto_buffer_out_c_bits_source  (auto_buffer_out_c_bits_source),
   .auto_buffer_out_c_bits_address (auto_buffer_out_c_bits_address),
   .auto_buffer_out_c_bits_data    (auto_buffer_out_c_bits_data),
   .auto_buffer_out_d_ready        (auto_buffer_out_d_ready),
   .auto_buffer_out_d_valid        (auto_buffer_out_d_valid),
   .auto_buffer_out_d_bits_opcode  (auto_buffer_out_d_bits_opcode),
   .auto_buffer_out_d_bits_param   (auto_buffer_out_d_bits_param),
   .auto_buffer_out_d_bits_size    (auto_buffer_out_d_bits_size),
   .auto_buffer_out_d_bits_source  (auto_buffer_out_d_bits_source),
   .auto_buffer_out_d_bits_sink    (auto_buffer_out_d_bits_sink),
   .auto_buffer_out_d_bits_denied  (auto_buffer_out_d_bits_denied),
   .auto_buffer_out_d_bits_data    (auto_buffer_out_d_bits_data),
   .auto_buffer_out_d_bits_corrupt (auto_buffer_out_d_bits_corrupt),
   .auto_buffer_out_e_ready        (auto_buffer_out_e_ready),
   .auto_buffer_out_e_valid        (auto_buffer_out_e_valid),
   .auto_buffer_out_e_bits_sink    (auto_buffer_out_e_bits_sink),
   .auto_wfi_out_0                 (auto_wfi_out_0),
   .auto_int_local_in_2_0          (auto_int_local_in_2_0),
   .auto_int_local_in_1_0          (auto_int_local_in_1_0),
   .auto_int_local_in_1_1          (auto_int_local_in_1_1),
   .auto_int_local_in_0_0          (auto_int_local_in_0_0),
   .auto_hartid_in                 (auto_hartid_in),
   .__obs                          (__obs));

// Internal signals used in the testbench
reg [31:0]  _conc_pc     ;
reg [141:0] _conc_opcode ;
reg [141:0] _conc_ram    [0:70];


// VCD file generation
initial begin
    $dumpfile("/hpc/home/connect.ytan910/code/Concolic/test/rocketchip/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clock = ~clock;
end

// Program counter logic
always @(posedge clock) begin
    _conc_opcode = _conc_ram[_conc_pc];
    auto_buffer_out_a_ready <= #5 _conc_opcode[0];
    auto_buffer_out_b_valid <= #5 _conc_opcode[1];
    auto_buffer_out_b_bits_opcode <= #5 _conc_opcode[4:2];
    auto_buffer_out_b_bits_param <= #5 _conc_opcode[6:5];
    auto_buffer_out_b_bits_size <= #5 _conc_opcode[10:7];
    auto_buffer_out_b_bits_source <= #5 _conc_opcode[12:11];
    auto_buffer_out_b_bits_address <= #5 _conc_opcode[44:13];
    auto_buffer_out_b_bits_mask <= #5 _conc_opcode[52:45];
    auto_buffer_out_b_bits_corrupt <= #5 _conc_opcode[53];
    auto_buffer_out_c_ready <= #5 _conc_opcode[54];
    auto_buffer_out_d_valid <= #5 _conc_opcode[55];
    auto_buffer_out_d_bits_opcode <= #5 _conc_opcode[58:56];
    auto_buffer_out_d_bits_param <= #5 _conc_opcode[60:59];
    auto_buffer_out_d_bits_size <= #5 _conc_opcode[64:61];
    auto_buffer_out_d_bits_source <= #5 _conc_opcode[66:65];
    auto_buffer_out_d_bits_sink <= #5 _conc_opcode[68:67];
    auto_buffer_out_d_bits_denied <= #5 _conc_opcode[69];
    auto_buffer_out_d_bits_data <= #5 _conc_opcode[133:70];
    auto_buffer_out_d_bits_corrupt <= #5 _conc_opcode[134];
    auto_buffer_out_e_ready <= #5 _conc_opcode[135];
    auto_int_local_in_2_0 <= #5 _conc_opcode[136];
    auto_int_local_in_1_0 <= #5 _conc_opcode[137];
    auto_int_local_in_1_1 <= #5 _conc_opcode[138];
    auto_int_local_in_0_0 <= #5 _conc_opcode[139];
    auto_hartid_in <= #5 _conc_opcode[140];
    __obs <= #5 _conc_opcode[141];
    $strobe(";_P auto_buffer_out_a_ready %b", auto_buffer_out_a_ready);
    $strobe(";_P auto_buffer_out_b_valid %b", auto_buffer_out_b_valid);
    $strobe(";_P auto_buffer_out_b_bits_opcode %b", auto_buffer_out_b_bits_opcode);
    $strobe(";_P auto_buffer_out_b_bits_param %b", auto_buffer_out_b_bits_param);
    $strobe(";_P auto_buffer_out_b_bits_size %b", auto_buffer_out_b_bits_size);
    $strobe(";_P auto_buffer_out_b_bits_source %b", auto_buffer_out_b_bits_source);
    $strobe(";_P auto_buffer_out_b_bits_address %b", auto_buffer_out_b_bits_address);
    $strobe(";_P auto_buffer_out_b_bits_mask %b", auto_buffer_out_b_bits_mask);
    $strobe(";_P auto_buffer_out_b_bits_corrupt %b", auto_buffer_out_b_bits_corrupt);
    $strobe(";_P auto_buffer_out_c_ready %b", auto_buffer_out_c_ready);
    $strobe(";_P auto_buffer_out_d_valid %b", auto_buffer_out_d_valid);
    $strobe(";_P auto_buffer_out_d_bits_opcode %b", auto_buffer_out_d_bits_opcode);
    $strobe(";_P auto_buffer_out_d_bits_param %b", auto_buffer_out_d_bits_param);
    $strobe(";_P auto_buffer_out_d_bits_size %b", auto_buffer_out_d_bits_size);
    $strobe(";_P auto_buffer_out_d_bits_source %b", auto_buffer_out_d_bits_source);
    $strobe(";_P auto_buffer_out_d_bits_sink %b", auto_buffer_out_d_bits_sink);
    $strobe(";_P auto_buffer_out_d_bits_denied %b", auto_buffer_out_d_bits_denied);
    $strobe(";_P auto_buffer_out_d_bits_data %b", auto_buffer_out_d_bits_data);
    $strobe(";_P auto_buffer_out_d_bits_corrupt %b", auto_buffer_out_d_bits_corrupt);
    $strobe(";_P auto_buffer_out_e_ready %b", auto_buffer_out_e_ready);
    $strobe(";_P auto_int_local_in_2_0 %b", auto_int_local_in_2_0);
    $strobe(";_P auto_int_local_in_1_0 %b", auto_int_local_in_1_0);
    $strobe(";_P auto_int_local_in_1_1 %b", auto_int_local_in_1_1);
    $strobe(";_P auto_int_local_in_0_0 %b", auto_int_local_in_0_0);
    $strobe(";_P auto_hartid_in %b", auto_hartid_in);
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
    $readmemb("/hpc/home/connect.ytan910/code/Concolic/test/rocketchip/inputs_history/input5/data.mem", _conc_ram);
    #2 clock = 1'b1;
    reset = 1'b1;
    #10 reset = 1'b0;
    #900 $finish;
end
endmodule
