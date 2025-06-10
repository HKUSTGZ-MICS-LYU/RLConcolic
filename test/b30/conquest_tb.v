module conquest_tb();

// Generated top module signals
reg         [5:0]  a_bus = 6'b0;
reg         [0:0]  clock;
reg         [0:0]  cs = 1'b0;
reg         [20:0] digital_input = 21'b0;
reg         [0:0]  ds = 1'b0;
reg         [2:0]  fbk_pwm = 3'b0;
reg         [5:0]  inj_cmd = 6'b0;
reg         [0:0]  in_speed = 1'b0;
reg         [1:0]  i_fbk = 2'b0;
reg         [6:0]  nssm_in = 7'b0;
reg         [0:0]  reset;
reg         [0:0]  rpm_in = 1'b0;
reg         [0:0]  r_w = 1'b0;
reg         [0:0]  seg_speed_hall = 1'b0;
reg         [0:0]  seg_speed_pickup = 1'b0;
reg         [0:0]  trg_knock1 = 1'b0;
reg         [0:0]  trg_knock2 = 1'b0;
reg         [0:0]  turbo_speed = 1'b0;
reg         [0:0]  vehicle_speed = 1'b0;
reg         [5:0]  v_fbk = 6'b0;
wire        [0:0]  cam_smot;
wire        [7:0]  digital_output;
wire        [1:0]  hlo;
wire        [0:0]  in_speed_lev;
wire        [0:0]  irq;
wire        [1:0]  knock1;
wire        [0:0]  knock1u;
wire        [1:0]  knock2;
wire        [0:0]  knock2u;
wire        [0:0]  relpot;
wire        [0:0]  rpm_out;
wire        [0:0]  seg_speed_lev;
wire        [0:0]  smot60;
wire        [5:0]  t1;
wire        [5:0]  t2;
wire        [1:0]  t3;
wire        [0:0]  turbo;
wire        [0:0]  turbo_speed_lev;
wire        [0:0]  vehicle;
wire        [15:0] d_bus_ext;
reg                __obs = 1'b0;


// DUT instance
b30 _conc_top_inst(
   .a_bus            (a_bus),
   .clock            (clock),
   .cs               (cs),
   .digital_input    (digital_input),
   .ds               (ds),
   .fbk_pwm          (fbk_pwm),
   .inj_cmd          (inj_cmd),
   .in_speed         (in_speed),
   .i_fbk            (i_fbk),
   .nssm_in          (nssm_in),
   .reset            (reset),
   .rpm_in           (rpm_in),
   .r_w              (r_w),
   .seg_speed_hall   (seg_speed_hall),
   .seg_speed_pickup (seg_speed_pickup),
   .trg_knock1       (trg_knock1),
   .trg_knock2       (trg_knock2),
   .turbo_speed      (turbo_speed),
   .vehicle_speed    (vehicle_speed),
   .v_fbk            (v_fbk),
   .cam_smot         (cam_smot),
   .digital_output   (digital_output),
   .hlo              (hlo),
   .in_speed_lev     (in_speed_lev),
   .irq              (irq),
   .knock1           (knock1),
   .knock1u          (knock1u),
   .knock2           (knock2),
   .knock2u          (knock2u),
   .relpot           (relpot),
   .rpm_out          (rpm_out),
   .seg_speed_lev    (seg_speed_lev),
   .smot60           (smot60),
   .t1               (t1),
   .t2               (t2),
   .t3               (t3),
   .turbo            (turbo),
   .turbo_speed_lev  (turbo_speed_lev),
   .vehicle          (vehicle),
   .d_bus_ext        (d_bus_ext),
   .__obs            (__obs));

// Internal signals used in the testbench
reg [31:0] _conc_pc     ;
reg [62:0] _conc_opcode ;
reg [62:0] _conc_ram    [0:220];


// VCD file generation
initial begin
    $dumpfile("./test/b30/conquest_tb.vcd");
    $dumpvars(0, conquest_tb);
end

// Clock pulse generator
always begin
    #5 clock = ~clock;
end

// Program counter logic
always @(posedge clock) begin
    _conc_opcode = _conc_ram[_conc_pc];
    a_bus <= #5 _conc_opcode[5:0];
    cs <= #5 _conc_opcode[6];
    digital_input <= #5 _conc_opcode[27:7];
    ds <= #5 _conc_opcode[28];
    fbk_pwm <= #5 _conc_opcode[31:29];
    inj_cmd <= #5 _conc_opcode[37:32];
    in_speed <= #5 _conc_opcode[38];
    i_fbk <= #5 _conc_opcode[40:39];
    nssm_in <= #5 _conc_opcode[47:41];
    rpm_in <= #5 _conc_opcode[48];
    r_w <= #5 _conc_opcode[49];
    seg_speed_hall <= #5 _conc_opcode[50];
    seg_speed_pickup <= #5 _conc_opcode[51];
    trg_knock1 <= #5 _conc_opcode[52];
    trg_knock2 <= #5 _conc_opcode[53];
    turbo_speed <= #5 _conc_opcode[54];
    vehicle_speed <= #5 _conc_opcode[55];
    v_fbk <= #5 _conc_opcode[61:56];
    __obs <= #5 _conc_opcode[62];
    $strobe(";_P a_bus %b", a_bus);
    $strobe(";_P cs %b", cs);
    $strobe(";_P digital_input %b", digital_input);
    $strobe(";_P ds %b", ds);
    $strobe(";_P fbk_pwm %b", fbk_pwm);
    $strobe(";_P inj_cmd %b", inj_cmd);
    $strobe(";_P in_speed %b", in_speed);
    $strobe(";_P i_fbk %b", i_fbk);
    $strobe(";_P nssm_in %b", nssm_in);
    $strobe(";_P rpm_in %b", rpm_in);
    $strobe(";_P r_w %b", r_w);
    $strobe(";_P seg_speed_hall %b", seg_speed_hall);
    $strobe(";_P seg_speed_pickup %b", seg_speed_pickup);
    $strobe(";_P trg_knock1 %b", trg_knock1);
    $strobe(";_P trg_knock2 %b", trg_knock2);
    $strobe(";_P turbo_speed %b", turbo_speed);
    $strobe(";_P vehicle_speed %b", vehicle_speed);
    $strobe(";_P v_fbk %b", v_fbk);
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
    $readmemb("./test/b30/data.mem", _conc_ram);
    #2 clock = 1'b1;
    reset = 1'b1;
    #10 reset = 1'b0;
    #2400 $finish;
end
endmodule
