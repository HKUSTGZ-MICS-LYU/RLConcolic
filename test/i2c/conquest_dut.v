//Following code is from line 1
module top(scl_pad_i, wb_dat_o, wb_stb_i, scl_pad_o, wb_inta_o, wb_we_i, wb_dat_i, wb_cyc_i, wb_rst_i, wb_clk_i, scl_padoen_o, sda_padoen_o, wb_adr_i, arst_i, wb_ack_o, sda_pad_i, sda_pad_o, __obs);

    input               wb_clk_i;
    input               wb_rst_i;
    input               arst_i;
    input         [2:0] wb_adr_i;
    input         [7:0] wb_dat_i;
    output        [7:0] wb_dat_o;
    input               wb_we_i;
    input               wb_stb_i;
    input               wb_cyc_i;
    output              wb_ack_o;
    output              wb_inta_o;
    input               scl_pad_i;
    output              scl_pad_o;
    output              scl_padoen_o;
    input               sda_pad_i;
    output              sda_pad_o;
    output              sda_padoen_o;
    input               __obs;

    reg [7:0] wb_dat_o = 8'b0;
    reg wb_ack_o = 1'b0;
    reg wb_inta_o = 1'b0;
    reg scl_padoen_o = 1'b0;
    reg sda_padoen_o = 1'b0;
    //Parameter Declaration
    parameter top___ARST_LVL = 0;
    parameter top___byte_controller___ST_IDLE = 0;
    parameter top___byte_controller___ST_START = 1;
    parameter top___byte_controller___ST_READ = 2;
    parameter top___byte_controller___ST_WRITE = 4;
    parameter top___byte_controller___ST_ACK = 8;
    parameter top___byte_controller___ST_STOP = 16;
    parameter top___byte_controller___bit_controller___idle = 0;
    parameter top___byte_controller___bit_controller___start_a = 1;
    parameter top___byte_controller___bit_controller___start_b = 2;
    parameter top___byte_controller___bit_controller___start_c = 4;
    parameter top___byte_controller___bit_controller___start_d = 8;
    parameter top___byte_controller___bit_controller___start_e = 16;
    parameter top___byte_controller___bit_controller___stop_a = 32;
    parameter top___byte_controller___bit_controller___stop_b = 64;
    parameter top___byte_controller___bit_controller___stop_c = 128;
    parameter top___byte_controller___bit_controller___stop_d = 256;
    parameter top___byte_controller___bit_controller___rd_a = 512;
    parameter top___byte_controller___bit_controller___rd_b = 1024;
    parameter top___byte_controller___bit_controller___rd_c = 2048;
    parameter top___byte_controller___bit_controller___rd_d = 4096;
    parameter top___byte_controller___bit_controller___wr_a = 8192;
    parameter top___byte_controller___bit_controller___wr_b = 16384;
    parameter top___byte_controller___bit_controller___wr_c = 32768;
    parameter top___byte_controller___bit_controller___wr_d = 65536;
    wire   top___wb_clk_i;
    wire   top___wb_rst_i;
    wire   top___arst_i;
    wire  [2:0] top___wb_adr_i;
    wire  [7:0] top___wb_dat_i;
    wire  [7:0] top___wb_dat_o;
    wire   top___wb_we_i;
    wire   top___wb_stb_i;
    wire   top___wb_cyc_i;
    wire   top___wb_ack_o;
    wire   top___wb_inta_o;
    wire   top___scl_pad_i;
    wire   top___scl_pad_o;
    wire   top___scl_padoen_o;
    wire   top___sda_pad_i;
    wire   top___sda_pad_o;
    wire   top___sda_padoen_o;
    reg  [15:0] top___prer = 16'b0;
    reg  [7:0]  top___ctr = 8'b0;
    reg  [7:0]  top___txr = 8'b0;
    wire  [7:0] top___rxr;
    reg  [7:0]  top___cr = 8'b0;
    wire  [7:0] top___sr;
    reg  top___done = 1'b0;
    wire   top___core_en;
    wire   top___ien;
    reg  top___irxack = 1'b0;
    reg  top___rxack = 1'b0;
    reg  top___tip = 1'b0;
    reg  top___irq_flag = 1'b0;
    reg  top___i2c_busy = 1'b0;
    reg  top___i2c_al = 1'b0;
    reg  top___al = 1'b0;
    wire   top___rst_i;
    wire   top___wb_wacc;
    wire   top___sta;
    wire   top___sto;
    wire   top___rd;
    wire   top___wr;
    wire   top___ack;
    wire   top___iack;
    wire   top___byte_controller___clk;
    wire   top___byte_controller___rst;
    wire   top___byte_controller___nReset;
    wire   top___byte_controller___ena;
    wire  [15:0] top___byte_controller___clk_cnt;
    wire   top___byte_controller___start;
    wire   top___byte_controller___stop;
    wire   top___byte_controller___read;
    wire   top___byte_controller___write;
    wire   top___byte_controller___ack_in;
    wire  [7:0] top___byte_controller___din;
    wire   top___byte_controller___cmd_ack;
    wire   top___byte_controller___ack_out;
    wire  [7:0] top___byte_controller___dout;
    wire   top___byte_controller___i2c_busy;
    wire   top___byte_controller___i2c_al;
    wire   top___byte_controller___scl_i;
    wire   top___byte_controller___scl_o;
    wire   top___byte_controller___scl_oen;
    wire   top___byte_controller___sda_i;
    wire   top___byte_controller___sda_o;
    wire   top___byte_controller___sda_oen;
    reg  [3:0]  top___byte_controller___core_cmd = 4'b0;
    reg  top___byte_controller___core_txd = 1'b0;
    reg  top___byte_controller___core_ack = 1'b0;
    reg  top___byte_controller___core_rxd = 1'b0;
    reg  [7:0]  top___byte_controller___sr = 8'b0;
    reg  top___byte_controller___shift = 1'b0;
    reg  top___byte_controller___ld = 1'b0;
    wire   top___byte_controller___go;
    reg  [2:0]  top___byte_controller___dcnt = 3'b0;
    wire   top___byte_controller___cnt_done;
    reg  [4:0]  top___byte_controller___c_state = 5'b0;
    wire   top___byte_controller___bit_controller___clk;
    wire   top___byte_controller___bit_controller___rst;
    wire   top___byte_controller___bit_controller___nReset;
    wire   top___byte_controller___bit_controller___ena;
    wire  [15:0] top___byte_controller___bit_controller___clk_cnt;
    wire  [3:0] top___byte_controller___bit_controller___cmd;
    wire   top___byte_controller___bit_controller___cmd_ack;
    wire   top___byte_controller___bit_controller___busy;
    wire   top___byte_controller___bit_controller___al;
    wire   top___byte_controller___bit_controller___din;
    wire   top___byte_controller___bit_controller___dout;
    wire   top___byte_controller___bit_controller___scl_i;
    wire   top___byte_controller___bit_controller___scl_o;
    wire   top___byte_controller___bit_controller___scl_oen;
    wire   top___byte_controller___bit_controller___sda_i;
    wire   top___byte_controller___bit_controller___sda_o;
    wire   top___byte_controller___bit_controller___sda_oen;
    reg  [1:0]  top___byte_controller___bit_controller___cSCL = 2'b0;
    reg  [1:0]  top___byte_controller___bit_controller___cSDA = 2'b0;
    reg  [2:0]  top___byte_controller___bit_controller___fSCL = 3'b0;
    reg  [2:0]  top___byte_controller___bit_controller___fSDA = 3'b0;
    reg  top___byte_controller___bit_controller___sSCL = 1'b0;
    reg  top___byte_controller___bit_controller___sSDA = 1'b0;
    reg  top___byte_controller___bit_controller___dSCL = 1'b0;
    reg  top___byte_controller___bit_controller___dSDA = 1'b0;
    reg  top___byte_controller___bit_controller___dscl_oen = 1'b0;
    reg  top___byte_controller___bit_controller___sda_chk = 1'b0;
    reg  top___byte_controller___bit_controller___clk_en = 1'b0;
    reg  top___byte_controller___bit_controller___slave_wait = 1'b0;
    reg  [15:0] top___byte_controller___bit_controller___cnt = 16'b0;
    reg  [13:0] top___byte_controller___bit_controller___filter_cnt = 14'b0;
    reg  [17:0] top___byte_controller___bit_controller___c_state = 18'b0;
    wire   top___byte_controller___bit_controller___scl_sync;
    reg  top___byte_controller___bit_controller___sta_condition = 1'b0;
    reg  top___byte_controller___bit_controller___sto_condition = 1'b0;
    reg  top___byte_controller___bit_controller___cmd_stop = 1'b0;

    assign top___byte_controller___bit_controller___scl_o = 1'h0;

  //assertion( top___byte_controller___bit_controller___scl_o = 0) 0
    assign top___byte_controller___bit_controller___sda_o = 1'h0;

  //assertion( top___byte_controller___bit_controller___sda_o = 0) 1
    assign top___wb_clk_i = wb_clk_i;

  //assertion( top___wb_clk_i = wb_clk_i) 2
    assign top___wb_rst_i = wb_rst_i;

  //assertion( top___wb_rst_i = wb_rst_i) 3
    assign top___arst_i = arst_i;

  //assertion( top___arst_i = arst_i) 4
    assign top___wb_adr_i = wb_adr_i;

  //assertion( top___wb_adr_i = wb_adr_i) 5
    assign top___wb_dat_i = wb_dat_i;

  //assertion( top___wb_dat_i = wb_dat_i) 6
    assign top___wb_dat_o = wb_dat_o;

  //assertion( top___wb_dat_o = wb_dat_o) 7
    assign top___wb_we_i = wb_we_i;

  //assertion( top___wb_we_i = wb_we_i) 8
    assign top___wb_stb_i = wb_stb_i;

  //assertion( top___wb_stb_i = wb_stb_i) 9
    assign top___wb_cyc_i = wb_cyc_i;

  //assertion( top___wb_cyc_i = wb_cyc_i) 10
    assign top___wb_ack_o = wb_ack_o;

  //assertion( top___wb_ack_o = wb_ack_o) 11
    assign top___wb_inta_o = wb_inta_o;

  //assertion( top___wb_inta_o = wb_inta_o) 12
    assign top___scl_pad_i = scl_pad_i;

  //assertion( top___scl_pad_i = scl_pad_i) 13
    assign top___scl_pad_o = scl_pad_o;

  //assertion( top___scl_pad_o = scl_pad_o) 14
    assign top___scl_padoen_o = scl_padoen_o;

  //assertion( top___scl_padoen_o = scl_padoen_o) 15
    assign top___sda_pad_i = sda_pad_i;

  //assertion( top___sda_pad_i = sda_pad_i) 16
    assign top___sda_pad_o = sda_pad_o;

  //assertion( top___sda_pad_o = sda_pad_o) 17
    assign top___sda_padoen_o = sda_padoen_o;

  //assertion( top___sda_padoen_o = sda_padoen_o) 18
    assign top___rst_i = arst_i;

  //assertion( top___rst_i = arst_i) 19
    assign top___wb_wacc = (wb_we_i & wb_ack_o);

  //assertion( top___wb_wacc = wb_we_i & wb_ack_o) 20
    //Following code is from line 177
        always @(posedge wb_clk_i) begin
            wb_ack_o <= ((wb_cyc_i & wb_stb_i) & (~wb_ack_o));  $display(";A 21");  //assertion( wb_ack_o = wb_cyc_i & wb_stb_i & ~wb_ack_o) 21
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 180
        always @(posedge wb_clk_i) begin
            case (wb_adr_i)
              3'h0:
                begin
                  $display(";A 22");                  //assertion( 0 == wb_adr_i = True) 22
                    wb_dat_o <= top___prer[7:0];  $display(";A 23");  //assertion( wb_dat_o = Extract(7, 0, top___prer)) 23
                end
              3'h1:
                begin
                  $display(";A 24");                  //assertion( 1 == wb_adr_i = True) 24
                    wb_dat_o <= top___prer[15:8];  $display(";A 25");  //assertion( wb_dat_o = Extract(15, 8, top___prer)) 25
                end
              3'h2:
                begin
                  $display(";A 26");                  //assertion( 2 == wb_adr_i = True) 26
                    wb_dat_o <= top___ctr;  $display(";A 27");  //assertion( wb_dat_o = top___ctr) 27
                end
              3'h3:
                begin
                  $display(";A 28");                  //assertion( 3 == wb_adr_i = True) 28
                    wb_dat_o <= top___rxr;  $display(";A 29");  //assertion( wb_dat_o = top___rxr) 29
                end
              3'h4:
                begin
                  $display(";A 30");                  //assertion( 4 == wb_adr_i = True) 30
                    wb_dat_o <= top___sr;  $display(";A 31");  //assertion( wb_dat_o = top___sr) 31
                end
              3'h5:
                begin
                  $display(";A 32");                  //assertion( 5 == wb_adr_i = True) 32
                    wb_dat_o <= top___txr;  $display(";A 33");  //assertion( wb_dat_o = top___txr) 33
                end
              3'h6:
                begin
                  $display(";A 34");                  //assertion( 6 == wb_adr_i = True) 34
                    wb_dat_o <= top___cr;  $display(";A 35");  //assertion( wb_dat_o = top___cr) 35
                end
              3'h7:
                begin
                  $display(";A 36");                  //assertion( 7 == wb_adr_i = True) 36
                    wb_dat_o <= 8'h0;  $display(";A 37");  //assertion( wb_dat_o = 0) 37
                end
            endcase
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 208
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 38");                  //assertion( 0 != top___rst_i = True) 38
                    if (wb_rst_i)
                        begin
                            top___prer <= 16'hffff;  $display(";A 42");  //assertion( top___prer = 65535) 42
                            top___ctr <= 8'h0;  $display(";A 43");  //assertion( top___ctr = 0) 43
                            top___txr <= 8'h0;  $display(";A 44");  //assertion( top___txr = 0) 44
                        end
                    else
                        begin
                            if (top___wb_wacc)
                                begin
                                  $display(";A 45");                                  //assertion( 0 != top___wb_wacc = True) 45
                                    case (wb_adr_i)
                                      3'h0:
                                        begin
                                          $display(";A 47");                                          //assertion( 0 == wb_adr_i = True) 47
                                            top___prer[7:0] <= wb_dat_i;  $display(";A 48");  //assertion( Extract(7, 0, top___prer) = wb_dat_i) 48
                                        end
                                      3'h1:
                                        begin
                                          $display(";A 49");                                          //assertion( 1 == wb_adr_i = True) 49
                                            top___prer[15:8] <= wb_dat_i;  $display(";A 50");  //assertion( Extract(15, 8, top___prer) = wb_dat_i) 50
                                        end
                                      3'h2:
                                        begin
                                          $display(";A 51");                                          //assertion( 2 == wb_adr_i = True) 51
                                            top___ctr <= wb_dat_i;  $display(";A 52");  //assertion( top___ctr = wb_dat_i) 52
                                        end
                                      3'h3:
                                        begin
                                          $display(";A 53");                                          //assertion( 3 == wb_adr_i = True) 53
                                            top___txr <= wb_dat_i;  $display(";A 54");  //assertion( top___txr = wb_dat_i) 54
                                        end
                                      default:
                                        begin
                                          $display(";A 55");                                          //assertion( If(0 != wb_adr_i == True, 1, 0) & If(1 != wb_adr_i == True, 1, 0) & If(2 != wb_adr_i == True, 1, 0) & If(3 != wb_adr_i == True, 1, 0) = True) 55
                                        end
                                    endcase
                                end
                            else
                                  $display(";A 46");                                  //assertion( 0 != top___wb_wacc = False) 46
                        end
                end
            else
                begin
                  $display(";A 39");                  //assertion( 0 != top___rst_i = False) 39
                    top___prer <= 16'hffff;  $display(";A 56");  //assertion( top___prer = 65535) 56
                    top___ctr <= 8'h0;  $display(";A 57");  //assertion( top___ctr = 0) 57
                    top___txr <= 8'h0;  $display(";A 58");  //assertion( top___txr = 0) 58
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 240
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 59");                  //assertion( 0 != top___rst_i = True) 59
                    if (wb_rst_i)
                        begin
                            top___cr <= 8'h0;  $display(";A 63");  //assertion( top___cr = 0) 63
                        end
                    else
                        begin
                            if (top___wb_wacc)
                                begin
                                  $display(";A 64");                                  //assertion( 0 != top___wb_wacc = True) 64
                                    if ((top___core_en & (3'h4 == wb_adr_i)))
                                        begin
                                          $display(";A 66");                                          //assertion( top___core_en & If((4 == wb_adr_i) == True, 1, 0) = True) 66
                                            top___cr <= wb_dat_i;  $display(";A 68");  //assertion( top___cr = wb_dat_i) 68
                                        end
                                    else
                                          $display(";A 67");                                          //assertion( top___core_en & If((4 == wb_adr_i) == True, 1, 0) = False) 67
                                end
                            else
                                begin
                                  $display(";A 65");                                  //assertion( 0 != top___wb_wacc = False) 65
                                    if ((top___done | top___i2c_al))
                                        begin
                                          $display(";A 69");                                          //assertion( top___done | top___i2c_al = True) 69
                                            top___cr[7:4] <= 4'h0;  $display(";A 71");  //assertion( Extract(7, 4, top___cr) = 0) 71
                                        end
                                    else
                                          $display(";A 70");                                          //assertion( top___done | top___i2c_al = False) 70
                                    top___cr[2:0] <= 3'h0;  $display(";A 72");  //assertion( Extract(2, 0, top___cr) = 0) 72
                                end
                        end
                end
            else
                begin
                  $display(";A 60");                  //assertion( 0 != top___rst_i = False) 60
                    top___cr <= 8'h0;  $display(";A 73");  //assertion( top___cr = 0) 73
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign top___sta = top___cr[7];

  //assertion( top___sta = Extract(7, 7, top___cr)) 74
    assign top___sto = top___cr[6];

  //assertion( top___sto = Extract(6, 6, top___cr)) 75
    assign top___rd = top___cr[5];

  //assertion( top___rd = Extract(5, 5, top___cr)) 76
    assign top___wr = top___cr[4];

  //assertion( top___wr = Extract(4, 4, top___cr)) 77
    assign top___ack = top___cr[3];

  //assertion( top___ack = Extract(3, 3, top___cr)) 78
    assign top___iack = top___cr[0];

  //assertion( top___iack = Extract(0, 0, top___cr)) 79
    assign top___core_en = top___ctr[7];

  //assertion( top___core_en = Extract(7, 7, top___ctr)) 80
    assign top___ien = top___ctr[6];

  //assertion( top___ien = Extract(6, 6, top___ctr)) 81
    //Following code is from line 268
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 82");                  //assertion( 0 != top___rst_i = True) 82
                    if (wb_rst_i)
                        begin
                            top___al <= 1'h0;  $display(";A 86");  //assertion( top___al = 0) 86
                            top___rxack <= 1'h0;  $display(";A 87");  //assertion( top___rxack = 0) 87
                            top___tip <= 1'h0;  $display(";A 88");  //assertion( top___tip = 0) 88
                            top___irq_flag <= 1'h0;  $display(";A 89");  //assertion( top___irq_flag = 0) 89
                        end
                    else
                        begin
                            top___al <= (top___i2c_al | (top___al & (~top___sta)));  $display(";A 90");  //assertion( top___al = top___i2c_al | top___al & ~top___sta) 90
                            top___rxack <= top___irxack;  $display(";A 91");  //assertion( top___rxack = top___irxack) 91
                            top___tip <= (top___rd | top___wr);  $display(";A 92");  //assertion( top___tip = top___rd | top___wr) 92
                            top___irq_flag <= (((top___done | top___i2c_al) | top___irq_flag) & (~top___iack));  $display(";A 93");  //assertion( top___irq_flag = (top___done | top___i2c_al | top___irq_flag) & ~top___iack) 93
                        end
                end
            else
                begin
                  $display(";A 83");                  //assertion( 0 != top___rst_i = False) 83
                    top___al <= 1'h0;  $display(";A 94");  //assertion( top___al = 0) 94
                    top___rxack <= 1'h0;  $display(";A 95");  //assertion( top___rxack = 0) 95
                    top___tip <= 1'h0;  $display(";A 96");  //assertion( top___tip = 0) 96
                    top___irq_flag <= 1'h0;  $display(";A 97");  //assertion( top___irq_flag = 0) 97
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 288
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            wb_inta_o <= (top___rst_i & ((~wb_rst_i) & (top___irq_flag & top___ien)));  $display(";A 98");  //assertion( wb_inta_o = top___rst_i & ~wb_rst_i & top___irq_flag & top___ien) 98
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign top___sr[7:2] = {top___rxack, top___i2c_busy, top___al, 3'h0};

  //assertion( Extract(7, 2, top___sr) = Concat(Concat(Concat(top___rxack, top___i2c_busy), top___al), 0)) 99
    assign top___sr[1:0] = {top___tip, top___irq_flag};

  //assertion( Extract(1, 0, top___sr) = Concat(top___tip, top___irq_flag)) 100
    assign top___byte_controller___clk = top___wb_clk_i;

  //assertion( top___byte_controller___clk = top___wb_clk_i) 101
    assign top___byte_controller___rst = top___wb_rst_i;

  //assertion( top___byte_controller___rst = top___wb_rst_i) 102
    assign top___byte_controller___nReset = top___rst_i;

  //assertion( top___byte_controller___nReset = top___rst_i) 103
    assign top___byte_controller___ena = top___core_en;

  //assertion( top___byte_controller___ena = top___core_en) 104
    assign top___byte_controller___clk_cnt = top___prer;

  //assertion( top___byte_controller___clk_cnt = top___prer) 105
    assign top___byte_controller___start = top___sta;

  //assertion( top___byte_controller___start = top___sta) 106
    assign top___byte_controller___stop = top___sto;

  //assertion( top___byte_controller___stop = top___sto) 107
    assign top___byte_controller___read = top___rd;

  //assertion( top___byte_controller___read = top___rd) 108
    assign top___byte_controller___write = top___wr;

  //assertion( top___byte_controller___write = top___wr) 109
    assign top___byte_controller___ack_in = top___ack;

  //assertion( top___byte_controller___ack_in = top___ack) 110
    assign top___byte_controller___din = top___txr;

  //assertion( top___byte_controller___din = top___txr) 111
    assign top___byte_controller___cmd_ack = top___done;

  //assertion( top___byte_controller___cmd_ack = top___done) 112
    assign top___byte_controller___ack_out = top___irxack;

  //assertion( top___byte_controller___ack_out = top___irxack) 113
    assign top___byte_controller___dout = top___rxr;

  //assertion( top___byte_controller___dout = top___rxr) 114
    assign top___byte_controller___i2c_busy = top___i2c_busy;

  //assertion( top___byte_controller___i2c_busy = top___i2c_busy) 115
    assign top___byte_controller___i2c_al = top___i2c_al;

  //assertion( top___byte_controller___i2c_al = top___i2c_al) 116
    assign top___byte_controller___scl_i = top___scl_pad_i;

  //assertion( top___byte_controller___scl_i = top___scl_pad_i) 117
    assign top___byte_controller___scl_o = top___scl_pad_o;

  //assertion( top___byte_controller___scl_o = top___scl_pad_o) 118
    assign top___byte_controller___scl_oen = top___scl_padoen_o;

  //assertion( top___byte_controller___scl_oen = top___scl_padoen_o) 119
    assign top___byte_controller___sda_i = top___sda_pad_i;

  //assertion( top___byte_controller___sda_i = top___sda_pad_i) 120
    assign top___byte_controller___sda_o = top___sda_pad_o;

  //assertion( top___byte_controller___sda_o = top___sda_pad_o) 121
    assign top___byte_controller___sda_oen = top___sda_padoen_o;

  //assertion( top___byte_controller___sda_oen = top___sda_padoen_o) 122
    assign top___byte_controller___go = (((top___rd | top___wr) | top___sto) & (~top___done));

  //assertion( top___byte_controller___go = (top___rd | top___wr | top___sto) & ~top___done) 123
    assign top___rxr = top___byte_controller___sr;

  //assertion( top___rxr = top___byte_controller___sr) 124
    //Following code is from line 317
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 125");                  //assertion( 0 != top___rst_i = True) 125
                    if (wb_rst_i)
                        begin
                            top___byte_controller___sr <= 8'h0;  $display(";A 129");  //assertion( top___byte_controller___sr = 0) 129
                        end
                    else
                        begin
                            if (top___byte_controller___ld)
                                begin
                                  $display(";A 130");                                  //assertion( 0 != top___byte_controller___ld = True) 130
                                    top___byte_controller___sr <= top___txr;  $display(";A 132");  //assertion( top___byte_controller___sr = top___txr) 132
                                end
                            else
                                begin
                                  $display(";A 131");                                  //assertion( 0 != top___byte_controller___ld = False) 131
                                    if (top___byte_controller___shift)
                                        begin
                                          $display(";A 133");                                          //assertion( 0 != top___byte_controller___shift = True) 133
                                            top___byte_controller___sr <= {top___byte_controller___sr[6:0], top___byte_controller___core_rxd};  $display(";A 135");  //assertion( top___byte_controller___sr = Concat(Extract(6, 0, top___byte_controller___sr), top___byte_controller___core_rxd)) 135
                                        end
                                    else
                                          $display(";A 134");                                          //assertion( 0 != top___byte_controller___shift = False) 134
                                end
                        end
                end
            else
                begin
                  $display(";A 126");                  //assertion( 0 != top___rst_i = False) 126
                    top___byte_controller___sr <= 8'h0;  $display(";A 136");  //assertion( top___byte_controller___sr = 0) 136
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 334
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 137");                  //assertion( 0 != top___rst_i = True) 137
                    if (wb_rst_i)
                        begin
                            top___byte_controller___dcnt <= 3'h0;  $display(";A 141");  //assertion( top___byte_controller___dcnt = 0) 141
                        end
                    else
                        begin
                            if (top___byte_controller___ld)
                                begin
                                  $display(";A 142");                                  //assertion( 0 != top___byte_controller___ld = True) 142
                                    top___byte_controller___dcnt <= 3'h7;  $display(";A 144");  //assertion( top___byte_controller___dcnt = 7) 144
                                end
                            else
                                begin
                                  $display(";A 143");                                  //assertion( 0 != top___byte_controller___ld = False) 143
                                    if (top___byte_controller___shift)
                                        begin
                                          $display(";A 145");                                          //assertion( 0 != top___byte_controller___shift = True) 145
                                            top___byte_controller___dcnt <= (top___byte_controller___dcnt - 3'h1);  $display(";A 147");  //assertion( top___byte_controller___dcnt = top___byte_controller___dcnt - 1) 147
                                        end
                                    else
                                          $display(";A 146");                                          //assertion( 0 != top___byte_controller___shift = False) 146
                                end
                        end
                end
            else
                begin
                  $display(";A 138");                  //assertion( 0 != top___rst_i = False) 138
                    top___byte_controller___dcnt <= 3'h0;  $display(";A 148");  //assertion( top___byte_controller___dcnt = 0) 148
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign top___byte_controller___cnt_done = (~(|top___byte_controller___dcnt));

  //assertion( top___byte_controller___cnt_done = ~bvredor(top___byte_controller___dcnt)) 149
    //Following code is from line 352
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 150");                  //assertion( 0 != top___rst_i = True) 150
                    if ((wb_rst_i | top___i2c_al))
                        begin
                            top___byte_controller___core_cmd <= 4'h0;  $display(";A 154");  //assertion( top___byte_controller___core_cmd = 0) 154
                            top___byte_controller___core_txd <= 1'h0;  $display(";A 155");  //assertion( top___byte_controller___core_txd = 0) 155
                            top___byte_controller___shift <= 1'h0;  $display(";A 156");  //assertion( top___byte_controller___shift = 0) 156
                            top___byte_controller___ld <= 1'h0;  $display(";A 157");  //assertion( top___byte_controller___ld = 0) 157
                            top___done <= 1'h0;  $display(";A 158");  //assertion( top___done = 0) 158
                            top___byte_controller___c_state <= 5'h0;  $display(";A 159");  //assertion( top___byte_controller___c_state = 0) 159
                            top___irxack <= 1'h0;  $display(";A 160");  //assertion( top___irxack = 0) 160
                        end
                    else
                        begin
                            top___byte_controller___core_txd <= top___byte_controller___sr[7];  $display(";A 161");  //assertion( top___byte_controller___core_txd = Extract(7, 7, top___byte_controller___sr)) 161
                            top___byte_controller___shift <= 1'h0;  $display(";A 162");  //assertion( top___byte_controller___shift = 0) 162
                            top___byte_controller___ld <= 1'h0;  $display(";A 163");  //assertion( top___byte_controller___ld = 0) 163
                            top___done <= 1'h0;  $display(";A 164");  //assertion( top___done = 0) 164
                            case (top___byte_controller___c_state)
                              5'h0:
                                begin
                                  $display(";A 165");                                  //assertion( 0 == top___byte_controller___c_state = True) 165
                                    if (top___byte_controller___go)
                                        begin
                                          $display(";A 166");                                          //assertion( 0 != top___byte_controller___go = True) 166
                                            if (top___sta)
                                                begin
                                                  $display(";A 168");                                                  //assertion( 0 != top___sta = True) 168
                                                    top___byte_controller___c_state <= 5'h1;  $display(";A 170");  //assertion( top___byte_controller___c_state = 1) 170
                                                    top___byte_controller___core_cmd <= 4'h1;  $display(";A 171");  //assertion( top___byte_controller___core_cmd = 1) 171
                                                end
                                            else
                                                begin
                                                  $display(";A 169");                                                  //assertion( 0 != top___sta = False) 169
                                                    if (top___rd)
                                                        begin
                                                          $display(";A 172");                                                          //assertion( 0 != top___rd = True) 172
                                                            top___byte_controller___c_state <= 5'h2;  $display(";A 174");  //assertion( top___byte_controller___c_state = 2) 174
                                                            top___byte_controller___core_cmd <= 4'h8;  $display(";A 175");  //assertion( top___byte_controller___core_cmd = 8) 175
                                                        end
                                                    else
                                                        begin
                                                          $display(";A 173");                                                          //assertion( 0 != top___rd = False) 173
                                                            if (top___wr)
                                                                begin
                                                                  $display(";A 176");                                                                  //assertion( 0 != top___wr = True) 176
                                                                    top___byte_controller___c_state <= 5'h4;  $display(";A 178");  //assertion( top___byte_controller___c_state = 4) 178
                                                                    top___byte_controller___core_cmd <= 4'h4;  $display(";A 179");  //assertion( top___byte_controller___core_cmd = 4) 179
                                                                end
                                                            else
                                                                begin
                                                                  $display(";A 177");                                                                  //assertion( 0 != top___wr = False) 177
                                                                    top___byte_controller___c_state <= 5'h10;  $display(";A 180");  //assertion( top___byte_controller___c_state = 16) 180
                                                                    top___byte_controller___core_cmd <= 4'h2;  $display(";A 181");  //assertion( top___byte_controller___core_cmd = 2) 181
                                                                end
                                                        end
                                                end
                                            top___byte_controller___ld <= 1'h1;  $display(";A 182");  //assertion( top___byte_controller___ld = 1) 182
                                        end
                                    else
                                          $display(";A 167");                                          //assertion( 0 != top___byte_controller___go = False) 167
                                end
                              5'h1:
                                begin
                                  $display(";A 183");                                  //assertion( 1 == top___byte_controller___c_state = True) 183
                                    if (top___byte_controller___core_ack)
                                        begin
                                          $display(";A 184");                                          //assertion( 0 != top___byte_controller___core_ack = True) 184
                                            if (top___rd)
                                                begin
                                                  $display(";A 186");                                                  //assertion( 0 != top___rd = True) 186
                                                    top___byte_controller___c_state <= 5'h2;  $display(";A 188");  //assertion( top___byte_controller___c_state = 2) 188
                                                    top___byte_controller___core_cmd <= 4'h8;  $display(";A 189");  //assertion( top___byte_controller___core_cmd = 8) 189
                                                end
                                            else
                                                begin
                                                  $display(";A 187");                                                  //assertion( 0 != top___rd = False) 187
                                                    top___byte_controller___c_state <= 5'h4;  $display(";A 190");  //assertion( top___byte_controller___c_state = 4) 190
                                                    top___byte_controller___core_cmd <= 4'h4;  $display(";A 191");  //assertion( top___byte_controller___core_cmd = 4) 191
                                                end
                                            top___byte_controller___ld <= 1'h1;  $display(";A 192");  //assertion( top___byte_controller___ld = 1) 192
                                        end
                                    else
                                          $display(";A 185");                                          //assertion( 0 != top___byte_controller___core_ack = False) 185
                                end
                              5'h4:
                                begin
                                  $display(";A 193");                                  //assertion( 4 == top___byte_controller___c_state = True) 193
                                    if (top___byte_controller___core_ack)
                                        begin
                                          $display(";A 194");                                          //assertion( 0 != top___byte_controller___core_ack = True) 194
                                            if (top___byte_controller___cnt_done)
                                                begin
                                                  $display(";A 196");                                                  //assertion( 0 != top___byte_controller___cnt_done = True) 196
                                                    top___byte_controller___c_state <= 5'h8;  $display(";A 198");  //assertion( top___byte_controller___c_state = 8) 198
                                                    top___byte_controller___core_cmd <= 4'h8;  $display(";A 199");  //assertion( top___byte_controller___core_cmd = 8) 199
                                                end
                                            else
                                                begin
                                                  $display(";A 197");                                                  //assertion( 0 != top___byte_controller___cnt_done = False) 197
                                                    top___byte_controller___c_state <= 5'h4;  $display(";A 200");  //assertion( top___byte_controller___c_state = 4) 200
                                                    top___byte_controller___core_cmd <= 4'h4;  $display(";A 201");  //assertion( top___byte_controller___core_cmd = 4) 201
                                                    top___byte_controller___shift <= 1'h1;  $display(";A 202");  //assertion( top___byte_controller___shift = 1) 202
                                                end
                                        end
                                    else
                                          $display(";A 195");                                          //assertion( 0 != top___byte_controller___core_ack = False) 195
                                end
                              5'h2:
                                begin
                                  $display(";A 203");                                  //assertion( 2 == top___byte_controller___c_state = True) 203
                                    if (top___byte_controller___core_ack)
                                        begin
                                          $display(";A 204");                                          //assertion( 0 != top___byte_controller___core_ack = True) 204
                                            if (top___byte_controller___cnt_done)
                                                begin
                                                  $display(";A 206");                                                  //assertion( 0 != top___byte_controller___cnt_done = True) 206
                                                    top___byte_controller___c_state <= 5'h8;  $display(";A 208");  //assertion( top___byte_controller___c_state = 8) 208
                                                    top___byte_controller___core_cmd <= 4'h4;  $display(";A 209");  //assertion( top___byte_controller___core_cmd = 4) 209
                                                end
                                            else
                                                begin
                                                  $display(";A 207");                                                  //assertion( 0 != top___byte_controller___cnt_done = False) 207
                                                    top___byte_controller___c_state <= 5'h2;  $display(";A 210");  //assertion( top___byte_controller___c_state = 2) 210
                                                    top___byte_controller___core_cmd <= 4'h8;  $display(";A 211");  //assertion( top___byte_controller___core_cmd = 8) 211
                                                end
                                            top___byte_controller___shift <= 1'h1;  $display(";A 212");  //assertion( top___byte_controller___shift = 1) 212
                                            top___byte_controller___core_txd <= top___ack;  $display(";A 213");  //assertion( top___byte_controller___core_txd = top___ack) 213
                                        end
                                    else
                                          $display(";A 205");                                          //assertion( 0 != top___byte_controller___core_ack = False) 205
                                end
                              5'h8:
                                begin
                                  $display(";A 214");                                  //assertion( 8 == top___byte_controller___c_state = True) 214
                                    if (top___byte_controller___core_ack)
                                        begin
                                          $display(";A 215");                                          //assertion( 0 != top___byte_controller___core_ack = True) 215
                                            if (top___sto)
                                                begin
                                                  $display(";A 217");                                                  //assertion( 0 != top___sto = True) 217
                                                    top___byte_controller___c_state <= 5'h10;  $display(";A 219");  //assertion( top___byte_controller___c_state = 16) 219
                                                    top___byte_controller___core_cmd <= 4'h2;  $display(";A 220");  //assertion( top___byte_controller___core_cmd = 2) 220
                                                end
                                            else
                                                begin
                                                  $display(";A 218");                                                  //assertion( 0 != top___sto = False) 218
                                                    top___byte_controller___c_state <= 5'h0;  $display(";A 221");  //assertion( top___byte_controller___c_state = 0) 221
                                                    top___byte_controller___core_cmd <= 4'h0;  $display(";A 222");  //assertion( top___byte_controller___core_cmd = 0) 222
                                                    top___done <= 1'h1;  $display(";A 223");  //assertion( top___done = 1) 223
                                                end
                                            top___irxack <= top___byte_controller___core_rxd;  $display(";A 224");  //assertion( top___irxack = top___byte_controller___core_rxd) 224
                                            top___byte_controller___core_txd <= 1'h1;  $display(";A 225");  //assertion( top___byte_controller___core_txd = 1) 225
                                        end
                                    else
                                        begin
                                          $display(";A 216");                                          //assertion( 0 != top___byte_controller___core_ack = False) 216
                                            top___byte_controller___core_txd <= top___ack;  $display(";A 226");  //assertion( top___byte_controller___core_txd = top___ack) 226
                                        end
                                end
                              5'h10:
                                begin
                                  $display(";A 227");                                  //assertion( 16 == top___byte_controller___c_state = True) 227
                                    if (top___byte_controller___core_ack)
                                        begin
                                          $display(";A 228");                                          //assertion( 0 != top___byte_controller___core_ack = True) 228
                                            top___byte_controller___c_state <= 5'h0;  $display(";A 230");  //assertion( top___byte_controller___c_state = 0) 230
                                            top___byte_controller___core_cmd <= 4'h0;  $display(";A 231");  //assertion( top___byte_controller___core_cmd = 0) 231
                                            top___done <= 1'h1;  $display(";A 232");  //assertion( top___done = 1) 232
                                        end
                                    else
                                          $display(";A 229");                                          //assertion( 0 != top___byte_controller___core_ack = False) 229
                                end
                            endcase
                        end
                end
            else
                begin
                  $display(";A 151");                  //assertion( 0 != top___rst_i = False) 151
                    top___byte_controller___core_cmd <= 4'h0;  $display(";A 233");  //assertion( top___byte_controller___core_cmd = 0) 233
                    top___byte_controller___core_txd <= 1'h0;  $display(";A 234");  //assertion( top___byte_controller___core_txd = 0) 234
                    top___byte_controller___shift <= 1'h0;  $display(";A 235");  //assertion( top___byte_controller___shift = 0) 235
                    top___byte_controller___ld <= 1'h0;  $display(";A 236");  //assertion( top___byte_controller___ld = 0) 236
                    top___done <= 1'h0;  $display(";A 237");  //assertion( top___done = 0) 237
                    top___byte_controller___c_state <= 5'h0;  $display(";A 238");  //assertion( top___byte_controller___c_state = 0) 238
                    top___irxack <= 1'h0;  $display(";A 239");  //assertion( top___irxack = 0) 239
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign top___byte_controller___bit_controller___clk = top___byte_controller___clk;

  //assertion( top___byte_controller___bit_controller___clk = top___byte_controller___clk) 240
    assign top___byte_controller___bit_controller___rst = top___byte_controller___rst;

  //assertion( top___byte_controller___bit_controller___rst = top___byte_controller___rst) 241
    assign top___byte_controller___bit_controller___nReset = top___byte_controller___nReset;

  //assertion( top___byte_controller___bit_controller___nReset = top___byte_controller___nReset) 242
    assign top___byte_controller___bit_controller___ena = top___byte_controller___ena;

  //assertion( top___byte_controller___bit_controller___ena = top___byte_controller___ena) 243
    assign top___byte_controller___bit_controller___clk_cnt = top___byte_controller___clk_cnt;

  //assertion( top___byte_controller___bit_controller___clk_cnt = top___byte_controller___clk_cnt) 244
    assign top___byte_controller___bit_controller___cmd = top___byte_controller___core_cmd;

  //assertion( top___byte_controller___bit_controller___cmd = top___byte_controller___core_cmd) 245
    assign top___byte_controller___bit_controller___cmd_ack = top___byte_controller___core_ack;

  //assertion( top___byte_controller___bit_controller___cmd_ack = top___byte_controller___core_ack) 246
    assign top___byte_controller___bit_controller___busy = top___byte_controller___i2c_busy;

  //assertion( top___byte_controller___bit_controller___busy = top___byte_controller___i2c_busy) 247
    assign top___byte_controller___bit_controller___al = top___byte_controller___i2c_al;

  //assertion( top___byte_controller___bit_controller___al = top___byte_controller___i2c_al) 248
    assign top___byte_controller___bit_controller___din = top___byte_controller___core_txd;

  //assertion( top___byte_controller___bit_controller___din = top___byte_controller___core_txd) 249
    assign top___byte_controller___bit_controller___dout = top___byte_controller___core_rxd;

  //assertion( top___byte_controller___bit_controller___dout = top___byte_controller___core_rxd) 250
    assign top___byte_controller___bit_controller___scl_i = top___byte_controller___scl_i;

  //assertion( top___byte_controller___bit_controller___scl_i = top___byte_controller___scl_i) 251
    assign top___byte_controller___bit_controller___scl_o = top___byte_controller___scl_o;

  //assertion( top___byte_controller___bit_controller___scl_o = top___byte_controller___scl_o) 252
    assign top___byte_controller___bit_controller___scl_oen = top___byte_controller___scl_oen;

  //assertion( top___byte_controller___bit_controller___scl_oen = top___byte_controller___scl_oen) 253
    assign top___byte_controller___bit_controller___sda_i = top___byte_controller___sda_i;

  //assertion( top___byte_controller___bit_controller___sda_i = top___byte_controller___sda_i) 254
    assign top___byte_controller___bit_controller___sda_o = top___byte_controller___sda_o;

  //assertion( top___byte_controller___bit_controller___sda_o = top___byte_controller___sda_o) 255
    assign top___byte_controller___bit_controller___sda_oen = top___byte_controller___sda_oen;

  //assertion( top___byte_controller___bit_controller___sda_oen = top___byte_controller___sda_oen) 256
    //Following code is from line 479
        always @(posedge wb_clk_i) begin
            top___byte_controller___bit_controller___dscl_oen <= scl_padoen_o;  $display(";A 257");  //assertion( top___byte_controller___bit_controller___dscl_oen = scl_padoen_o) 257
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 482
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            top___byte_controller___bit_controller___slave_wait <= (top___rst_i & (((scl_padoen_o & (~top___byte_controller___bit_controller___dscl_oen)) & (~top___byte_controller___bit_controller___sSCL)) | (top___byte_controller___bit_controller___slave_wait & (~top___byte_controller___bit_controller___sSCL))));  $display(";A 258");  //assertion( top___byte_controller___bit_controller___slave_wait = top___rst_i & (scl_padoen_o & ~top___byte_controller___bit_controller___dscl_oen & ~top___byte_controller___bit_controller___sSCL | top___byte_controller___bit_controller___slave_wait & ~top___byte_controller___bit_controller___sSCL)) 258
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign top___byte_controller___bit_controller___scl_sync = ((top___byte_controller___bit_controller___dSCL & (~top___byte_controller___bit_controller___sSCL)) & scl_padoen_o);

  //assertion( top___byte_controller___bit_controller___scl_sync = top___byte_controller___bit_controller___dSCL & ~top___byte_controller___bit_controller___sSCL & scl_padoen_o) 259
    //Following code is from line 486
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 260");                  //assertion( 0 != top___rst_i = True) 260
                    if ((((wb_rst_i | (~(|top___byte_controller___bit_controller___cnt))) | (~top___core_en)) | top___byte_controller___bit_controller___scl_sync))
                        begin
                            top___byte_controller___bit_controller___cnt <= top___prer;  $display(";A 264");  //assertion( top___byte_controller___bit_controller___cnt = top___prer) 264
                            top___byte_controller___bit_controller___clk_en <= 1'h1;  $display(";A 265");  //assertion( top___byte_controller___bit_controller___clk_en = 1) 265
                        end
                    else
                        begin
                            if (top___byte_controller___bit_controller___slave_wait)
                                begin
                                  $display(";A 266");                                  //assertion( 0 != top___byte_controller___bit_controller___slave_wait = True) 266
                                    top___byte_controller___bit_controller___cnt <= top___byte_controller___bit_controller___cnt;  $display(";A 268");  //assertion( top___byte_controller___bit_controller___cnt = top___byte_controller___bit_controller___cnt) 268
                                    top___byte_controller___bit_controller___clk_en <= 1'h0;  $display(";A 269");  //assertion( top___byte_controller___bit_controller___clk_en = 0) 269
                                end
                            else
                                begin
                                  $display(";A 267");                                  //assertion( 0 != top___byte_controller___bit_controller___slave_wait = False) 267
                                    top___byte_controller___bit_controller___cnt <= (top___byte_controller___bit_controller___cnt - 16'h1);  $display(";A 270");  //assertion( top___byte_controller___bit_controller___cnt = top___byte_controller___bit_controller___cnt - 1) 270
                                    top___byte_controller___bit_controller___clk_en <= 1'h0;  $display(";A 271");  //assertion( top___byte_controller___bit_controller___clk_en = 0) 271
                                end
                        end
                end
            else
                begin
                  $display(";A 261");                  //assertion( 0 != top___rst_i = False) 261
                    top___byte_controller___bit_controller___cnt <= 16'h0;  $display(";A 272");  //assertion( top___byte_controller___bit_controller___cnt = 0) 272
                    top___byte_controller___bit_controller___clk_en <= 1'h1;  $display(";A 273");  //assertion( top___byte_controller___bit_controller___clk_en = 1) 273
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 505
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 274");                  //assertion( 0 != top___rst_i = True) 274
                    if (wb_rst_i)
                        begin
                            top___byte_controller___bit_controller___cSCL <= 2'h0;  $display(";A 278");  //assertion( top___byte_controller___bit_controller___cSCL = 0) 278
                            top___byte_controller___bit_controller___cSDA <= 2'h0;  $display(";A 279");  //assertion( top___byte_controller___bit_controller___cSDA = 0) 279
                        end
                    else
                        begin
                            top___byte_controller___bit_controller___cSCL <= {top___byte_controller___bit_controller___cSCL[0], scl_pad_i};  $display(";A 280");  //assertion( top___byte_controller___bit_controller___cSCL = Concat(Extract(0, 0, top___byte_controller___bit_controller___cSCL), scl_pad_i)) 280
                            top___byte_controller___bit_controller___cSDA <= {top___byte_controller___bit_controller___cSDA[0], sda_pad_i};  $display(";A 281");  //assertion( top___byte_controller___bit_controller___cSDA = Concat(Extract(0, 0, top___byte_controller___bit_controller___cSDA), sda_pad_i)) 281
                        end
                end
            else
                begin
                  $display(";A 275");                  //assertion( 0 != top___rst_i = False) 275
                    top___byte_controller___bit_controller___cSCL <= 2'h0;  $display(";A 282");  //assertion( top___byte_controller___bit_controller___cSCL = 0) 282
                    top___byte_controller___bit_controller___cSDA <= 2'h0;  $display(";A 283");  //assertion( top___byte_controller___bit_controller___cSDA = 0) 283
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 519
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            top___byte_controller___bit_controller___filter_cnt <= top___rst_i ? (wb_rst_i | (~top___core_en)) ? 14'h0 : (|top___byte_controller___bit_controller___filter_cnt) ? (top___byte_controller___bit_controller___filter_cnt - 14'h1) : top___prer[15:2] : 14'h0;  $display(";A 284");  //assertion( top___byte_controller___bit_controller___filter_cnt = If(0 != top___rst_i == True, If((1 == wb_rst_i | ~top___core_en) == True, 0, If((1 == bvredor(top___byte_controller___bit_controller___filter_cnt)) == True, top___byte_controller___bit_controller___filter_cnt - 1, Extract(15, 2, top___prer))), 0)) 284
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 522
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 285");                  //assertion( 0 != top___rst_i = True) 285
                    if (wb_rst_i)
                        begin
                            top___byte_controller___bit_controller___fSCL <= 3'h7;  $display(";A 289");  //assertion( top___byte_controller___bit_controller___fSCL = 7) 289
                            top___byte_controller___bit_controller___fSDA <= 3'h7;  $display(";A 290");  //assertion( top___byte_controller___bit_controller___fSDA = 7) 290
                        end
                    else
                        begin
                            if ((~(|top___byte_controller___bit_controller___filter_cnt)))
                                begin
                                  $display(";A 291");                                  //assertion( ~bvredor(top___byte_controller___bit_controller___filter_cnt) = True) 291
                                    top___byte_controller___bit_controller___fSCL <= {top___byte_controller___bit_controller___fSCL[1:0], top___byte_controller___bit_controller___cSCL[1]};  $display(";A 293");  //assertion( top___byte_controller___bit_controller___fSCL = Concat(Extract(1, 0, top___byte_controller___bit_controller___fSCL), Extract(1, 1, top___byte_controller___bit_controller___cSCL))) 293
                                    top___byte_controller___bit_controller___fSDA <= {top___byte_controller___bit_controller___fSDA[1:0], top___byte_controller___bit_controller___cSDA[1]};  $display(";A 294");  //assertion( top___byte_controller___bit_controller___fSDA = Concat(Extract(1, 0, top___byte_controller___bit_controller___fSDA), Extract(1, 1, top___byte_controller___bit_controller___cSDA))) 294
                                end
                            else
                                  $display(";A 292");                                  //assertion( ~bvredor(top___byte_controller___bit_controller___filter_cnt) = False) 292
                        end
                end
            else
                begin
                  $display(";A 286");                  //assertion( 0 != top___rst_i = False) 286
                    top___byte_controller___bit_controller___fSCL <= 3'h7;  $display(";A 295");  //assertion( top___byte_controller___bit_controller___fSCL = 7) 295
                    top___byte_controller___bit_controller___fSDA <= 3'h7;  $display(";A 296");  //assertion( top___byte_controller___bit_controller___fSDA = 7) 296
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 538
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 297");                  //assertion( 0 != top___rst_i = True) 297
                    if (wb_rst_i)
                        begin
                            top___byte_controller___bit_controller___sSCL <= 1'h1;  $display(";A 301");  //assertion( top___byte_controller___bit_controller___sSCL = 1) 301
                            top___byte_controller___bit_controller___sSDA <= 1'h1;  $display(";A 302");  //assertion( top___byte_controller___bit_controller___sSDA = 1) 302
                            top___byte_controller___bit_controller___dSCL <= 1'h1;  $display(";A 303");  //assertion( top___byte_controller___bit_controller___dSCL = 1) 303
                            top___byte_controller___bit_controller___dSDA <= 1'h1;  $display(";A 304");  //assertion( top___byte_controller___bit_controller___dSDA = 1) 304
                        end
                    else
                        begin
                            top___byte_controller___bit_controller___sSCL <= (((&top___byte_controller___bit_controller___fSCL[2:1]) | (&top___byte_controller___bit_controller___fSCL[1:0])) | (top___byte_controller___bit_controller___fSCL[2] & top___byte_controller___bit_controller___fSCL[0]));  $display(";A 305");  //assertion( top___byte_controller___bit_controller___sSCL = bvredand(Extract(2, 1, top___byte_controller___bit_controller___fSCL)) | bvredand(Extract(1, 0, top___byte_controller___bit_controller___fSCL)) | Extract(2, 2, top___byte_controller___bit_controller___fSCL) & Extract(0, 0, top___byte_controller___bit_controller___fSCL)) 305
                            top___byte_controller___bit_controller___sSDA <= (((&top___byte_controller___bit_controller___fSDA[2:1]) | (&top___byte_controller___bit_controller___fSDA[1:0])) | (top___byte_controller___bit_controller___fSDA[2] & top___byte_controller___bit_controller___fSDA[0]));  $display(";A 306");  //assertion( top___byte_controller___bit_controller___sSDA = bvredand(Extract(2, 1, top___byte_controller___bit_controller___fSDA)) | bvredand(Extract(1, 0, top___byte_controller___bit_controller___fSDA)) | Extract(2, 2, top___byte_controller___bit_controller___fSDA) & Extract(0, 0, top___byte_controller___bit_controller___fSDA)) 306
                            top___byte_controller___bit_controller___dSCL <= top___byte_controller___bit_controller___sSCL;  $display(";A 307");  //assertion( top___byte_controller___bit_controller___dSCL = top___byte_controller___bit_controller___sSCL) 307
                            top___byte_controller___bit_controller___dSDA <= top___byte_controller___bit_controller___sSDA;  $display(";A 308");  //assertion( top___byte_controller___bit_controller___dSDA = top___byte_controller___bit_controller___sSDA) 308
                        end
                end
            else
                begin
                  $display(";A 298");                  //assertion( 0 != top___rst_i = False) 298
                    top___byte_controller___bit_controller___sSCL <= 1'h1;  $display(";A 309");  //assertion( top___byte_controller___bit_controller___sSCL = 1) 309
                    top___byte_controller___bit_controller___sSDA <= 1'h1;  $display(";A 310");  //assertion( top___byte_controller___bit_controller___sSDA = 1) 310
                    top___byte_controller___bit_controller___dSCL <= 1'h1;  $display(";A 311");  //assertion( top___byte_controller___bit_controller___dSCL = 1) 311
                    top___byte_controller___bit_controller___dSDA <= 1'h1;  $display(";A 312");  //assertion( top___byte_controller___bit_controller___dSDA = 1) 312
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 558
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 313");                  //assertion( 0 != top___rst_i = True) 313
                    if (wb_rst_i)
                        begin
                            top___byte_controller___bit_controller___sta_condition <= 1'h0;  $display(";A 317");  //assertion( top___byte_controller___bit_controller___sta_condition = 0) 317
                            top___byte_controller___bit_controller___sto_condition <= 1'h0;  $display(";A 318");  //assertion( top___byte_controller___bit_controller___sto_condition = 0) 318
                        end
                    else
                        begin
                            top___byte_controller___bit_controller___sta_condition <= (((~top___byte_controller___bit_controller___sSDA) & top___byte_controller___bit_controller___dSDA) & top___byte_controller___bit_controller___sSCL);  $display(";A 319");  //assertion( top___byte_controller___bit_controller___sta_condition = ~top___byte_controller___bit_controller___sSDA & top___byte_controller___bit_controller___dSDA & top___byte_controller___bit_controller___sSCL) 319
                            top___byte_controller___bit_controller___sto_condition <= ((top___byte_controller___bit_controller___sSDA & (~top___byte_controller___bit_controller___dSDA)) & top___byte_controller___bit_controller___sSCL);  $display(";A 320");  //assertion( top___byte_controller___bit_controller___sto_condition = top___byte_controller___bit_controller___sSDA & ~top___byte_controller___bit_controller___dSDA & top___byte_controller___bit_controller___sSCL) 320
                        end
                end
            else
                begin
                  $display(";A 314");                  //assertion( 0 != top___rst_i = False) 314
                    top___byte_controller___bit_controller___sta_condition <= 1'h0;  $display(";A 321");  //assertion( top___byte_controller___bit_controller___sta_condition = 0) 321
                    top___byte_controller___bit_controller___sto_condition <= 1'h0;  $display(";A 322");  //assertion( top___byte_controller___bit_controller___sto_condition = 0) 322
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 572
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            top___i2c_busy <= (top___rst_i & ((~wb_rst_i) & ((top___byte_controller___bit_controller___sta_condition | top___i2c_busy) & (~top___byte_controller___bit_controller___sto_condition))));  $display(";A 323");  //assertion( top___i2c_busy = top___rst_i & ~wb_rst_i & (top___byte_controller___bit_controller___sta_condition | top___i2c_busy) & ~top___byte_controller___bit_controller___sto_condition) 323
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 575
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 324");                  //assertion( 0 != top___rst_i = True) 324
                    if (wb_rst_i)
                        begin
                            top___byte_controller___bit_controller___cmd_stop <= 1'h0;  $display(";A 328");  //assertion( top___byte_controller___bit_controller___cmd_stop = 0) 328
                        end
                    else
                        begin
                            if (top___byte_controller___bit_controller___clk_en)
                                begin
                                  $display(";A 329");                                  //assertion( 0 != top___byte_controller___bit_controller___clk_en = True) 329
                                    top___byte_controller___bit_controller___cmd_stop <= (4'h2 == top___byte_controller___core_cmd);  $display(";A 331");  //assertion( top___byte_controller___bit_controller___cmd_stop = 2 == top___byte_controller___core_cmd) 331
                                end
                            else
                                  $display(";A 330");                                  //assertion( 0 != top___byte_controller___bit_controller___clk_en = False) 330
                        end
                end
            else
                begin
                  $display(";A 325");                  //assertion( 0 != top___rst_i = False) 325
                    top___byte_controller___bit_controller___cmd_stop <= 1'h0;  $display(";A 332");  //assertion( top___byte_controller___bit_controller___cmd_stop = 0) 332
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 588
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            top___i2c_al <= (top___rst_i & ((~wb_rst_i) & (((top___byte_controller___bit_controller___sda_chk & (~top___byte_controller___bit_controller___sSDA)) & sda_padoen_o) | (((|top___byte_controller___bit_controller___c_state) & top___byte_controller___bit_controller___sto_condition) & (~top___byte_controller___bit_controller___cmd_stop)))));  $display(";A 333");  //assertion( top___i2c_al = top___rst_i & ~wb_rst_i & (top___byte_controller___bit_controller___sda_chk & ~top___byte_controller___bit_controller___sSDA & sda_padoen_o | bvredor(top___byte_controller___bit_controller___c_state) & top___byte_controller___bit_controller___sto_condition & ~top___byte_controller___bit_controller___cmd_stop)) 333
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 591
        always @(posedge wb_clk_i) begin
            if ((top___byte_controller___bit_controller___sSCL & (~top___byte_controller___bit_controller___dSCL)))
                begin
                  $display(";A 334");                  //assertion( top___byte_controller___bit_controller___sSCL & ~top___byte_controller___bit_controller___dSCL = True) 334
                    top___byte_controller___core_rxd <= top___byte_controller___bit_controller___sSDA;  $display(";A 336");  //assertion( top___byte_controller___core_rxd = top___byte_controller___bit_controller___sSDA) 336
                end
            else
                  $display(";A 335");                  //assertion( top___byte_controller___bit_controller___sSCL & ~top___byte_controller___bit_controller___dSCL = False) 335
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 596
        always @(negedge top___rst_i or posedge wb_clk_i) begin
            if (top___rst_i)
                begin
                  $display(";A 337");                  //assertion( 0 != top___rst_i = True) 337
                    if ((wb_rst_i | top___i2c_al))
                        begin
                            top___byte_controller___bit_controller___c_state <= 18'h0;  $display(";A 341");  //assertion( top___byte_controller___bit_controller___c_state = 0) 341
                            top___byte_controller___core_ack <= 1'h0;  $display(";A 342");  //assertion( top___byte_controller___core_ack = 0) 342
                            scl_padoen_o <= 1'h1;  $display(";A 343");  //assertion( scl_padoen_o = 1) 343
                            sda_padoen_o <= 1'h1;  $display(";A 344");  //assertion( sda_padoen_o = 1) 344
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 345");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 345
                        end
                    else
                        begin
                            top___byte_controller___core_ack <= 1'h0;  $display(";A 346");  //assertion( top___byte_controller___core_ack = 0) 346
                            if (top___byte_controller___bit_controller___clk_en)
                                begin
                                  $display(";A 347");                                  //assertion( 0 != top___byte_controller___bit_controller___clk_en = True) 347
                                    case (top___byte_controller___bit_controller___c_state)
                                      18'h0:
                                        begin
                                          $display(";A 349");                                          //assertion( 0 == top___byte_controller___bit_controller___c_state = True) 349
                                            case (top___byte_controller___core_cmd)
                                              4'h1:
                                                begin
                                                  $display(";A 350");                                                  //assertion( 1 == top___byte_controller___core_cmd = True) 350
                                                    top___byte_controller___bit_controller___c_state <= 18'h1;  $display(";A 351");  //assertion( top___byte_controller___bit_controller___c_state = 1) 351
                                                end
                                              4'h2:
                                                begin
                                                  $display(";A 352");                                                  //assertion( 2 == top___byte_controller___core_cmd = True) 352
                                                    top___byte_controller___bit_controller___c_state <= 18'h20;  $display(";A 353");  //assertion( top___byte_controller___bit_controller___c_state = 32) 353
                                                end
                                              4'h4:
                                                begin
                                                  $display(";A 354");                                                  //assertion( 4 == top___byte_controller___core_cmd = True) 354
                                                    top___byte_controller___bit_controller___c_state <= 18'h2000;  $display(";A 355");  //assertion( top___byte_controller___bit_controller___c_state = 8192) 355
                                                end
                                              4'h8:
                                                begin
                                                  $display(";A 356");                                                  //assertion( 8 == top___byte_controller___core_cmd = True) 356
                                                    top___byte_controller___bit_controller___c_state <= 18'h200;  $display(";A 357");  //assertion( top___byte_controller___bit_controller___c_state = 512) 357
                                                end
                                              default:
                                                begin
                                                  $display(";A 358");                                                  //assertion( If(1 != top___byte_controller___core_cmd == True, 1, 0) & If(2 != top___byte_controller___core_cmd == True, 1, 0) & If(4 != top___byte_controller___core_cmd == True, 1, 0) & If(8 != top___byte_controller___core_cmd == True, 1, 0) = True) 358
                                                    top___byte_controller___bit_controller___c_state <= 18'h0;  $display(";A 359");  //assertion( top___byte_controller___bit_controller___c_state = 0) 359
                                                end
                                            endcase
                                            scl_padoen_o <= scl_padoen_o;  $display(";A 360");  //assertion( scl_padoen_o = scl_padoen_o) 360
                                            sda_padoen_o <= sda_padoen_o;  $display(";A 361");  //assertion( sda_padoen_o = sda_padoen_o) 361
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 362");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 362
                                        end
                                      18'h1:
                                        begin
                                          $display(";A 363");                                          //assertion( 1 == top___byte_controller___bit_controller___c_state = True) 363
                                            top___byte_controller___bit_controller___c_state <= 18'h2;  $display(";A 364");  //assertion( top___byte_controller___bit_controller___c_state = 2) 364
                                            scl_padoen_o <= scl_padoen_o;  $display(";A 365");  //assertion( scl_padoen_o = scl_padoen_o) 365
                                            sda_padoen_o <= 1'h1;  $display(";A 366");  //assertion( sda_padoen_o = 1) 366
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 367");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 367
                                        end
                                      18'h2:
                                        begin
                                          $display(";A 368");                                          //assertion( 2 == top___byte_controller___bit_controller___c_state = True) 368
                                            top___byte_controller___bit_controller___c_state <= 18'h4;  $display(";A 369");  //assertion( top___byte_controller___bit_controller___c_state = 4) 369
                                            scl_padoen_o <= 1'h1;  $display(";A 370");  //assertion( scl_padoen_o = 1) 370
                                            sda_padoen_o <= 1'h1;  $display(";A 371");  //assertion( sda_padoen_o = 1) 371
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 372");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 372
                                        end
                                      18'h4:
                                        begin
                                          $display(";A 373");                                          //assertion( 4 == top___byte_controller___bit_controller___c_state = True) 373
                                            top___byte_controller___bit_controller___c_state <= 18'h8;  $display(";A 374");  //assertion( top___byte_controller___bit_controller___c_state = 8) 374
                                            scl_padoen_o <= 1'h1;  $display(";A 375");  //assertion( scl_padoen_o = 1) 375
                                            sda_padoen_o <= 1'h0;  $display(";A 376");  //assertion( sda_padoen_o = 0) 376
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 377");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 377
                                        end
                                      18'h8:
                                        begin
                                          $display(";A 378");                                          //assertion( 8 == top___byte_controller___bit_controller___c_state = True) 378
                                            top___byte_controller___bit_controller___c_state <= 18'h10;  $display(";A 379");  //assertion( top___byte_controller___bit_controller___c_state = 16) 379
                                            scl_padoen_o <= 1'h1;  $display(";A 380");  //assertion( scl_padoen_o = 1) 380
                                            sda_padoen_o <= 1'h0;  $display(";A 381");  //assertion( sda_padoen_o = 0) 381
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 382");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 382
                                        end
                                      18'h10:
                                        begin
                                          $display(";A 383");                                          //assertion( 16 == top___byte_controller___bit_controller___c_state = True) 383
                                            top___byte_controller___bit_controller___c_state <= 18'h0;  $display(";A 384");  //assertion( top___byte_controller___bit_controller___c_state = 0) 384
                                            top___byte_controller___core_ack <= 1'h1;  $display(";A 385");  //assertion( top___byte_controller___core_ack = 1) 385
                                            scl_padoen_o <= 1'h0;  $display(";A 386");  //assertion( scl_padoen_o = 0) 386
                                            sda_padoen_o <= 1'h0;  $display(";A 387");  //assertion( sda_padoen_o = 0) 387
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 388");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 388
                                        end
                                      18'h20:
                                        begin
                                          $display(";A 389");                                          //assertion( 32 == top___byte_controller___bit_controller___c_state = True) 389
                                            top___byte_controller___bit_controller___c_state <= 18'h40;  $display(";A 390");  //assertion( top___byte_controller___bit_controller___c_state = 64) 390
                                            scl_padoen_o <= 1'h0;  $display(";A 391");  //assertion( scl_padoen_o = 0) 391
                                            sda_padoen_o <= 1'h0;  $display(";A 392");  //assertion( sda_padoen_o = 0) 392
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 393");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 393
                                        end
                                      18'h40:
                                        begin
                                          $display(";A 394");                                          //assertion( 64 == top___byte_controller___bit_controller___c_state = True) 394
                                            top___byte_controller___bit_controller___c_state <= 18'h80;  $display(";A 395");  //assertion( top___byte_controller___bit_controller___c_state = 128) 395
                                            scl_padoen_o <= 1'h1;  $display(";A 396");  //assertion( scl_padoen_o = 1) 396
                                            sda_padoen_o <= 1'h0;  $display(";A 397");  //assertion( sda_padoen_o = 0) 397
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 398");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 398
                                        end
                                      18'h80:
                                        begin
                                          $display(";A 399");                                          //assertion( 128 == top___byte_controller___bit_controller___c_state = True) 399
                                            top___byte_controller___bit_controller___c_state <= 18'h100;  $display(";A 400");  //assertion( top___byte_controller___bit_controller___c_state = 256) 400
                                            scl_padoen_o <= 1'h1;  $display(";A 401");  //assertion( scl_padoen_o = 1) 401
                                            sda_padoen_o <= 1'h0;  $display(";A 402");  //assertion( sda_padoen_o = 0) 402
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 403");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 403
                                        end
                                      18'h100:
                                        begin
                                          $display(";A 404");                                          //assertion( 256 == top___byte_controller___bit_controller___c_state = True) 404
                                            top___byte_controller___bit_controller___c_state <= 18'h0;  $display(";A 405");  //assertion( top___byte_controller___bit_controller___c_state = 0) 405
                                            top___byte_controller___core_ack <= 1'h1;  $display(";A 406");  //assertion( top___byte_controller___core_ack = 1) 406
                                            scl_padoen_o <= 1'h1;  $display(";A 407");  //assertion( scl_padoen_o = 1) 407
                                            sda_padoen_o <= 1'h1;  $display(";A 408");  //assertion( sda_padoen_o = 1) 408
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 409");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 409
                                        end
                                      18'h200:
                                        begin
                                          $display(";A 410");                                          //assertion( 512 == top___byte_controller___bit_controller___c_state = True) 410
                                            top___byte_controller___bit_controller___c_state <= 18'h400;  $display(";A 411");  //assertion( top___byte_controller___bit_controller___c_state = 1024) 411
                                            scl_padoen_o <= 1'h0;  $display(";A 412");  //assertion( scl_padoen_o = 0) 412
                                            sda_padoen_o <= 1'h1;  $display(";A 413");  //assertion( sda_padoen_o = 1) 413
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 414");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 414
                                        end
                                      18'h400:
                                        begin
                                          $display(";A 415");                                          //assertion( 1024 == top___byte_controller___bit_controller___c_state = True) 415
                                            top___byte_controller___bit_controller___c_state <= 18'h800;  $display(";A 416");  //assertion( top___byte_controller___bit_controller___c_state = 2048) 416
                                            scl_padoen_o <= 1'h1;  $display(";A 417");  //assertion( scl_padoen_o = 1) 417
                                            sda_padoen_o <= 1'h1;  $display(";A 418");  //assertion( sda_padoen_o = 1) 418
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 419");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 419
                                        end
                                      18'h800:
                                        begin
                                          $display(";A 420");                                          //assertion( 2048 == top___byte_controller___bit_controller___c_state = True) 420
                                            top___byte_controller___bit_controller___c_state <= 18'h1000;  $display(";A 421");  //assertion( top___byte_controller___bit_controller___c_state = 4096) 421
                                            scl_padoen_o <= 1'h1;  $display(";A 422");  //assertion( scl_padoen_o = 1) 422
                                            sda_padoen_o <= 1'h1;  $display(";A 423");  //assertion( sda_padoen_o = 1) 423
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 424");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 424
                                        end
                                      18'h1000:
                                        begin
                                          $display(";A 425");                                          //assertion( 4096 == top___byte_controller___bit_controller___c_state = True) 425
                                            top___byte_controller___bit_controller___c_state <= 18'h0;  $display(";A 426");  //assertion( top___byte_controller___bit_controller___c_state = 0) 426
                                            top___byte_controller___core_ack <= 1'h1;  $display(";A 427");  //assertion( top___byte_controller___core_ack = 1) 427
                                            scl_padoen_o <= 1'h0;  $display(";A 428");  //assertion( scl_padoen_o = 0) 428
                                            sda_padoen_o <= 1'h1;  $display(";A 429");  //assertion( sda_padoen_o = 1) 429
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 430");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 430
                                        end
                                      18'h2000:
                                        begin
                                          $display(";A 431");                                          //assertion( 8192 == top___byte_controller___bit_controller___c_state = True) 431
                                            top___byte_controller___bit_controller___c_state <= 18'h4000;  $display(";A 432");  //assertion( top___byte_controller___bit_controller___c_state = 16384) 432
                                            scl_padoen_o <= 1'h0;  $display(";A 433");  //assertion( scl_padoen_o = 0) 433
                                            sda_padoen_o <= top___byte_controller___core_txd;  $display(";A 434");  //assertion( sda_padoen_o = top___byte_controller___core_txd) 434
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 435");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 435
                                        end
                                      18'h4000:
                                        begin
                                          $display(";A 436");                                          //assertion( 16384 == top___byte_controller___bit_controller___c_state = True) 436
                                            top___byte_controller___bit_controller___c_state <= 18'h8000;  $display(";A 437");  //assertion( top___byte_controller___bit_controller___c_state = 32768) 437
                                            scl_padoen_o <= 1'h1;  $display(";A 438");  //assertion( scl_padoen_o = 1) 438
                                            sda_padoen_o <= top___byte_controller___core_txd;  $display(";A 439");  //assertion( sda_padoen_o = top___byte_controller___core_txd) 439
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 440");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 440
                                        end
                                      18'h8000:
                                        begin
                                          $display(";A 441");                                          //assertion( 32768 == top___byte_controller___bit_controller___c_state = True) 441
                                            top___byte_controller___bit_controller___c_state <= 18'h10000;  $display(";A 442");  //assertion( top___byte_controller___bit_controller___c_state = 65536) 442
                                            scl_padoen_o <= 1'h1;  $display(";A 443");  //assertion( scl_padoen_o = 1) 443
                                            sda_padoen_o <= top___byte_controller___core_txd;  $display(";A 444");  //assertion( sda_padoen_o = top___byte_controller___core_txd) 444
                                            top___byte_controller___bit_controller___sda_chk <= 1'h1;  $display(";A 445");  //assertion( top___byte_controller___bit_controller___sda_chk = 1) 445
                                        end
                                      18'h10000:
                                        begin
                                          $display(";A 446");                                          //assertion( 65536 == top___byte_controller___bit_controller___c_state = True) 446
                                            top___byte_controller___bit_controller___c_state <= 18'h0;  $display(";A 447");  //assertion( top___byte_controller___bit_controller___c_state = 0) 447
                                            top___byte_controller___core_ack <= 1'h1;  $display(";A 448");  //assertion( top___byte_controller___core_ack = 1) 448
                                            scl_padoen_o <= 1'h0;  $display(";A 449");  //assertion( scl_padoen_o = 0) 449
                                            sda_padoen_o <= top___byte_controller___core_txd;  $display(";A 450");  //assertion( sda_padoen_o = top___byte_controller___core_txd) 450
                                            top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 451");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 451
                                        end
                                    endcase
                                end
                            else
                                  $display(";A 348");                                  //assertion( 0 != top___byte_controller___bit_controller___clk_en = False) 348
                        end
                end
            else
                begin
                  $display(";A 338");                  //assertion( 0 != top___rst_i = False) 338
                    top___byte_controller___bit_controller___c_state <= 18'h0;  $display(";A 452");  //assertion( top___byte_controller___bit_controller___c_state = 0) 452
                    top___byte_controller___core_ack <= 1'h0;  $display(";A 453");  //assertion( top___byte_controller___core_ack = 0) 453
                    scl_padoen_o <= 1'h1;  $display(";A 454");  //assertion( scl_padoen_o = 1) 454
                    sda_padoen_o <= 1'h1;  $display(";A 455");  //assertion( sda_padoen_o = 1) 455
                    top___byte_controller___bit_controller___sda_chk <= 1'h0;  $display(";A 456");  //assertion( top___byte_controller___bit_controller___sda_chk = 0) 456
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign scl_pad_o = 1'h0;

  //assertion( scl_pad_o = 0) 457
    assign sda_pad_o = 1'h0;

  //assertion( sda_pad_o = 0) 458
endmodule
