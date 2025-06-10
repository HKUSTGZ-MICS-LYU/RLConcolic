//Following code is from line 2
module b10(key, g_button, reset, clock, test, v_in, cts, start, r_button, rtr, rts, ctr, v_out, __obs);

    input               r_button;
    input               g_button;
    input               key;
    input               start;
    input               reset;
    input               test;
    output              cts;
    output              ctr;
    input               rts;
    input               rtr;
    input               clock;
    input         [3:0] v_in;
    output        [3:0] v_out;
    input               __obs;

    reg cts = 1'b0;
    reg ctr = 1'b0;
    reg [3:0] v_out = 4'b0;
    //Parameter Declaration
    reg  [3:0]  stato = 4'b0;
    reg  voto0 = 1'b0;
    reg  voto1 = 1'b0;
    reg  voto2 = 1'b0;
    reg  voto3 = 1'b0;
    reg  [3:0]  sign = 4'b0;
    reg  last_g = 1'b0;
    reg  last_r = 1'b0;

    //Following code is from line 30
        always @(posedge clock) begin
            if ((reset == 1'b1))
                begin
                    stato <= 4'b0000;  $display(";A 2");  //assertion( stato = 0) 2
                    voto0 <= 1'b0;  $display(";A 3");  //assertion( voto0 = 0) 3
                    voto1 <= 1'b0;  $display(";A 4");  //assertion( voto1 = 0) 4
                    voto2 <= 1'b0;  $display(";A 5");  //assertion( voto2 = 0) 5
                    voto3 <= 1'b0;  $display(";A 6");  //assertion( voto3 = 0) 6
                    sign <= 4'b0000;  $display(";A 7");  //assertion( sign = 0) 7
                    last_g <= 1'b0;  $display(";A 8");  //assertion( last_g = 0) 8
                    last_r <= 1'b0;  $display(";A 9");  //assertion( last_r = 0) 9
                    cts <= 1'b0;  $display(";A 10");  //assertion( cts = 0) 10
                    ctr <= 1'b0;  $display(";A 11");  //assertion( ctr = 0) 11
                    v_out <= 4'b0000;  $display(";A 12");  //assertion( v_out = 0) 12
                end
            else
                begin
                    case (stato)
                      4'b0000:
                        begin
                          $display(";A 13");                          //assertion( 0 == stato = True) 13
                            voto0 <= 1'b0;  $display(";A 14");  //assertion( voto0 = 0) 14
                            voto1 <= 1'b0;  $display(";A 15");  //assertion( voto1 = 0) 15
                            voto2 <= 1'b0;  $display(";A 16");  //assertion( voto2 = 0) 16
                            voto3 <= 1'b0;  $display(";A 17");  //assertion( voto3 = 0) 17
                            cts <= 1'b0;  $display(";A 18");  //assertion( cts = 0) 18
                            ctr <= 1'b0;  $display(";A 19");  //assertion( ctr = 0) 19
                            if ((test == 1'b0))
                                begin
                                  $display(";A 20");                                  //assertion( 0 == test = True) 20
                                    sign <= 4'b0000;  $display(";A 22");  //assertion( sign = 0) 22
                                    stato <= 4'b1001;  $display(";A 23");  //assertion( stato = 9) 23
                                end
                            else
                                begin
                                  $display(";A 21");                                  //assertion( 0 == test = False) 21
                                    voto0 <= 1'b0;  $display(";A 24");  //assertion( voto0 = 0) 24
                                    voto1 <= 1'b0;  $display(";A 25");  //assertion( voto1 = 0) 25
                                    voto2 <= 1'b0;  $display(";A 26");  //assertion( voto2 = 0) 26
                                    voto3 <= 1'b0;  $display(";A 27");  //assertion( voto3 = 0) 27
                                    stato <= 4'b0001;  $display(";A 28");  //assertion( stato = 1) 28
                                end
                        end
                      4'b0001:
                        begin
                          $display(";A 29");                          //assertion( 1 == stato = True) 29
                            if ((start == 1'b1))
                                begin
                                  $display(";A 30");                                  //assertion( 1 == start = True) 30
                                    voto0 <= 1'b0;  $display(";A 32");  //assertion( voto0 = 0) 32
                                    voto1 <= 1'b0;  $display(";A 33");  //assertion( voto1 = 0) 33
                                    voto2 <= 1'b0;  $display(";A 34");  //assertion( voto2 = 0) 34
                                    voto3 <= 1'b0;  $display(";A 35");  //assertion( voto3 = 0) 35
                                    stato <= 4'b0010;  $display(";A 36");  //assertion( stato = 2) 36
                                end
                            else
                                  $display(";A 31");                                  //assertion( 1 == start = False) 31
                            if ((rtr == 1'b1))
                                begin
                                  $display(";A 37");                                  //assertion( 1 == rtr = True) 37
                                    cts <= 1'b1;  $display(";A 39");  //assertion( cts = 1) 39
                                end
                            else
                                  $display(";A 38");                                  //assertion( 1 == rtr = False) 38
                            if ((rtr == 1'b0))
                                begin
                                  $display(";A 40");                                  //assertion( 0 == rtr = True) 40
                                    cts <= 1'b0;  $display(";A 42");  //assertion( cts = 0) 42
                                end
                            else
                                  $display(";A 41");                                  //assertion( 0 == rtr = False) 41
                        end
                      4'b0010:
                        begin
                          $display(";A 43");                          //assertion( 2 == stato = True) 43
                            if ((start == 1'b0))
                                begin
                                  $display(";A 44");                                  //assertion( 0 == start = True) 44
                                    stato <= 4'b0011;  $display(";A 46");  //assertion( stato = 3) 46
                                end
                            else
                                begin
                                  $display(";A 45");                                  //assertion( 0 == start = False) 45
                                    if ((key == 1'b1))
                                        begin
                                          $display(";A 47");                                          //assertion( 1 == key = True) 47
                                            voto0 <= key;  $display(";A 49");  //assertion( voto0 = key) 49
                                            if ((((g_button ^ last_g) & g_button) == 1'b1))
                                                begin
                                                  $display(";A 50");                                                  //assertion( 1 == (g_button ^ last_g) & g_button = True) 50
                                                    voto1 <= (~voto1);  $display(";A 52");  //assertion( voto1 = ~voto1) 52
                                                end
                                            else
                                                  $display(";A 51");                                                  //assertion( 1 == (g_button ^ last_g) & g_button = False) 51
                                            if ((((r_button ^ last_r) & r_button) == 1'b1))
                                                begin
                                                  $display(";A 53");                                                  //assertion( 1 == (r_button ^ last_r) & r_button = True) 53
                                                    voto2 <= (~voto2);  $display(";A 55");  //assertion( voto2 = ~voto2) 55
                                                end
                                            else
                                                  $display(";A 54");                                                  //assertion( 1 == (r_button ^ last_r) & r_button = False) 54
                                            last_g <= g_button;  $display(";A 56");  //assertion( last_g = g_button) 56
                                            last_r <= r_button;  $display(";A 57");  //assertion( last_r = r_button) 57
                                        end
                                    else
                                        begin
                                          $display(";A 48");                                          //assertion( 1 == key = False) 48
                                            voto0 <= 1'b0;  $display(";A 58");  //assertion( voto0 = 0) 58
                                            voto1 <= 1'b0;  $display(";A 59");  //assertion( voto1 = 0) 59
                                            voto2 <= 1'b0;  $display(";A 60");  //assertion( voto2 = 0) 60
                                            voto3 <= 1'b0;  $display(";A 61");  //assertion( voto3 = 0) 61
                                        end
                                end
                        end
                      4'b0011:
                        begin
                          $display(";A 62");                          //assertion( 3 == stato = True) 62
                            voto3 <= (voto0 ^ (voto1 ^ voto2));  $display(";A 63");  //assertion( voto3 = voto0 ^ voto1 ^ voto2) 63
                            stato <= 4'b0100;  $display(";A 64");  //assertion( stato = 4) 64
                            voto0 <= 1'b0;  $display(";A 65");  //assertion( voto0 = 0) 65
                        end
                      4'b0100:
                        begin
                          $display(";A 66");                          //assertion( 4 == stato = True) 66
                            if ((rtr == 1'b1))
                                begin
                                  $display(";A 67");                                  //assertion( 1 == rtr = True) 67
                                    v_out <= {voto3, voto2, voto1, voto0};  $display(";A 69");  //assertion( v_out = Concat(Concat(Concat(voto3, voto2), voto1), voto0)) 69
                                    cts <= 1'b1;  $display(";A 70");  //assertion( cts = 1) 70
                                    if (((((voto0 == 1'b0) && (voto1 == 1'b1)) && (voto2 == 1'b1)) && (voto3 == 1'b0)))
                                        begin
                                          $display(";A 71");                                          //assertion( And(If(And(If(And(If((0 == voto0) == True, 1, 0) == 1, If((1 == voto1) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto2) == True, 1, 0) == 1) == True, 1, 0) == 1, If((0 == voto3) == True, 1, 0) == 1) = True) 71
                                            stato <= 4'b1000;  $display(";A 73");  //assertion( stato = 8) 73
                                        end
                                    else
                                        begin
                                          $display(";A 72");                                          //assertion( And(If(And(If(And(If((0 == voto0) == True, 1, 0) == 1, If((1 == voto1) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto2) == True, 1, 0) == 1) == True, 1, 0) == 1, If((0 == voto3) == True, 1, 0) == 1) = False) 72
                                            stato <= 4'b0101;  $display(";A 74");  //assertion( stato = 5) 74
                                        end
                                end
                            else
                                  $display(";A 68");                                  //assertion( 1 == rtr = False) 68
                        end
                      4'b0101:
                        begin
                          $display(";A 75");                          //assertion( 5 == stato = True) 75
                            if ((rts == 1'b0))
                                begin
                                  $display(";A 76");                                  //assertion( 0 == rts = True) 76
                                    ctr <= 1'b1;  $display(";A 78");  //assertion( ctr = 1) 78
                                    stato <= 4'b0110;  $display(";A 79");  //assertion( stato = 6) 79
                                end
                            else
                                  $display(";A 77");                                  //assertion( 0 == rts = False) 77
                        end
                      4'b0110:
                        begin
                          $display(";A 80");                          //assertion( 6 == stato = True) 80
                            if ((rts == 1'b1))
                                begin
                                  $display(";A 81");                                  //assertion( 1 == rts = True) 81
                                    voto0 <= v_in[0];  $display(";A 83");  //assertion( voto0 = Extract(0, 0, v_in)) 83
                                    voto1 <= v_in[1];  $display(";A 84");  //assertion( voto1 = Extract(1, 1, v_in)) 84
                                    voto2 <= v_in[2];  $display(";A 85");  //assertion( voto2 = Extract(2, 2, v_in)) 85
                                    voto3 <= v_in[3];  $display(";A 86");  //assertion( voto3 = Extract(3, 3, v_in)) 86
                                    ctr <= 1'b0;  $display(";A 87");  //assertion( ctr = 0) 87
                                    stato <= 4'b0111;  $display(";A 88");  //assertion( stato = 7) 88
                                end
                            else
                                  $display(";A 82");                                  //assertion( 1 == rts = False) 82
                        end
                      4'b0111:
                        begin
                          $display(";A 89");                          //assertion( 7 == stato = True) 89
                            if ((rtr == 1'b0))
                                begin
                                  $display(";A 90");                                  //assertion( 0 == rtr = True) 90
                                    cts <= 1'b0;  $display(";A 92");  //assertion( cts = 0) 92
                                    stato <= 4'b0100;  $display(";A 93");  //assertion( stato = 4) 93
                                end
                            else
                                  $display(";A 91");                                  //assertion( 0 == rtr = False) 91
                        end
                      4'b1000:
                        begin
                          $display(";A 94");                          //assertion( 8 == stato = True) 94
                            if ((rtr == 1'b0))
                                begin
                                  $display(";A 95");                                  //assertion( 0 == rtr = True) 95
                                    cts <= 1'b0;  $display(";A 97");  //assertion( cts = 0) 97
                                    stato <= 4'b0001;  $display(";A 98");  //assertion( stato = 1) 98
                                end
                            else
                                  $display(";A 96");                                  //assertion( 0 == rtr = False) 96
                        end
                      4'b1001:
                        begin
                          $display(";A 99");                          //assertion( 9 == stato = True) 99
                            voto0 <= v_in[0];  $display(";A 100");  //assertion( voto0 = Extract(0, 0, v_in)) 100
                            voto1 <= v_in[1];  $display(";A 101");  //assertion( voto1 = Extract(1, 1, v_in)) 101
                            voto2 <= v_in[2];  $display(";A 102");  //assertion( voto2 = Extract(2, 2, v_in)) 102
                            voto3 <= v_in[3];  $display(";A 103");  //assertion( voto3 = Extract(3, 3, v_in)) 103
                            sign <= 4'b1000;  $display(";A 104");  //assertion( sign = 8) 104
                            if (((((voto0 == 1'b1) && (voto1 == 1'b1)) && (voto2 == 1'b1)) && (voto3 == 1'b1)))
                                begin
                                  $display(";A 105");                                  //assertion( And(If(And(If(And(If((1 == voto0) == True, 1, 0) == 1, If((1 == voto1) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto2) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto3) == True, 1, 0) == 1) = True) 105
                                    stato <= 4'b1010;  $display(";A 107");  //assertion( stato = 10) 107
                                end
                            else
                                  $display(";A 106");                                  //assertion( And(If(And(If(And(If((1 == voto0) == True, 1, 0) == 1, If((1 == voto1) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto2) == True, 1, 0) == 1) == True, 1, 0) == 1, If((1 == voto3) == True, 1, 0) == 1) = False) 106
                        end
                      4'b1010:
                        begin
                          $display(";A 108");                          //assertion( 10 == stato = True) 108
                            voto0 <= (1'b1 ^ sign[0]);  $display(";A 109");  //assertion( voto0 = 1 ^ Extract(0, 0, sign)) 109
                            voto0 <= (1'b0 ^ sign[1]);  $display(";A 110");  //assertion( voto0 = 0 ^ Extract(1, 1, sign)) 110
                            voto0 <= (1'b0 ^ sign[2]);  $display(";A 111");  //assertion( voto0 = 0 ^ Extract(2, 2, sign)) 111
                            voto0 <= (1'b1 ^ sign[3]);  $display(";A 112");  //assertion( voto0 = 1 ^ Extract(3, 3, sign)) 112
                            stato <= 4'b0100;  $display(";A 113");  //assertion( stato = 4) 113
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R register = 1",);
            end
        end

    // Display the variables
    begin
    $display(";R register = 1",);
    end
endmodule
module conquest_tb(input clock, input reset);

// Generated top module signals
reg         [0:0] r_button = 1'b0;
reg         [0:0] g_button = 1'b0;
reg         [0:0] key = 1'b0;
reg         [0:0] start = 1'b0;
reg         [0:0] test = 1'b0;
wire        [0:0] cts;
wire        [0:0] ctr;
reg         [0:0] rts = 1'b0;
reg         [0:0] rtr = 1'b0;
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
reg [11:0] _conc_ram    [0:8];

// Program counter logic
always @(posedge clock) begin
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
    $strobe(";R cts %d", _conc_top_inst.cts);
    $strobe(";R ctr %d", _conc_top_inst.ctr);
    $strobe(";R v_out %d", _conc_top_inst.v_out);
    $strobe(";R stato %d", _conc_top_inst.stato);
    $strobe(";R voto0 %d", _conc_top_inst.voto0);
    $strobe(";R voto1 %d", _conc_top_inst.voto1);
    $strobe(";R voto2 %d", _conc_top_inst.voto2);
    $strobe(";R voto3 %d", _conc_top_inst.voto3);
    $strobe(";R sign %d", _conc_top_inst.sign);
    $strobe(";R last_g %d", _conc_top_inst.last_g);
    $strobe(";R last_r %d", _conc_top_inst.last_r);
    _conc_pc = _conc_pc + 1;
    $strobe(";_C %d", _conc_pc);
    $strobe(";_Input %b", _conc_opcode);
end

// Generate the initial block
initial begin
    _conc_pc = 32'b0;
    $readmemb("./test/b10/data.mem", _conc_ram);
end
endmodule
