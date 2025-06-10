//Following code is from line 9
module or1200_except(extend_flush, sig_itlbmiss, spr_dat_ppc, except_started, sr_we, clk, datain, epcr, sig_syscall, sig_tick, spr_dat_npc, except_stop, wb_freeze, flushpipe, genpc_freeze, branch_taken, if_pc, if_stall, except_type, du_dsr, dcpu_err_i, eear, id_pc, icpu_ack_i, id_freeze, lr_sav, sig_dtlbmiss, sig_ibuserr, sig_dbuserr, epcr_we, esr_we, dcpu_ack_i, to_sr, except_start, abort_ex, pc_we, esr, sig_trap, sig_illegal, sr, lsu_addr, sig_int, icpu_err_i, sig_align, sig_range, rst, eear_we, sig_immufault, ex_void, sig_dmmufault, ex_freeze, __obs);

    input                clk;
    input                rst;
    input                sig_ibuserr;
    input                sig_dbuserr;
    input                sig_illegal;
    input                sig_align;
    input                sig_range;
    input                sig_dtlbmiss;
    input                sig_dmmufault;
    input                sig_int;
    input                sig_syscall;
    input                sig_trap;
    input                sig_itlbmiss;
    input                sig_immufault;
    input                sig_tick;
    input                branch_taken;
    input                genpc_freeze;
    input                id_freeze;
    input                ex_freeze;
    input                wb_freeze;
    input                if_stall;
    input         [31:0] if_pc;
    output        [31:0] id_pc;
    output        [29:0] lr_sav;
    output               flushpipe;
    output               extend_flush;
    output        [3:0]  except_type;
    output               except_start;
    output               except_started;
    output        [12:0] except_stop;
    input                ex_void;
    output        [31:0] spr_dat_ppc;
    output        [31:0] spr_dat_npc;
    input         [31:0] datain;
    input         [13:0] du_dsr;
    input                epcr_we;
    input                eear_we;
    input                esr_we;
    input                pc_we;
    output        [31:0] epcr;
    output        [31:0] eear;
    output        [15:0] esr;
    input                sr_we;
    input         [15:0] to_sr;
    input         [15:0] sr;
    input         [31:0] lsu_addr;
    output               abort_ex;
    input                icpu_ack_i;
    input                icpu_err_i;
    input                dcpu_ack_i;
    input                dcpu_err_i;
    input                __obs;

    //Parameter Declaration
    wire   abort_ex;
    wire   branch_taken;
    wire   clk;
    wire  [31:0] datain;
    wire   dcpu_ack_i;
    wire   dcpu_err_i;
    reg  delayed1_ex_dslot = 1'b0;
    reg  delayed2_ex_dslot = 1'b0;
    reg  [2:0]  delayed_iee = 3'b0;
    reg  [2:0]  delayed_tee = 3'b0;
    wire  [13:0] du_dsr;
    reg  [31:0] eear = 32'b0;
    wire   eear_we;
    reg  [31:0] epcr = 32'b0;
    wire   epcr_we;
    reg  [15:0] esr = 16'b0;
    wire   esr_we;
    reg  ex_dslot = 1'b0;
    reg  [2:0]  ex_exceptflags = 3'b0;
    wire   ex_freeze;
    reg  [31:0] ex_pc = 32'b0;
    wire   ex_void;
    wire   except_flushpipe;
    wire   except_start;
    wire   except_started;
    wire  [12:0] except_stop;
    wire  [12:0] except_trig;
    reg  [3:0]  except_type = 4'b0;
    reg  extend_flush = 1'b0;
    reg  extend_flush_last = 1'b0;
    wire   flushpipe;
    wire   genpc_freeze;
    wire   icpu_ack_i;
    wire   icpu_err_i;
    reg  [2:0]  id_exceptflags = 3'b0;
    wire   id_freeze;
    reg  [31:0] id_pc = 32'b0;
    wire  [31:0] if_pc;
    wire   if_stall;
    wire   int_pending;
    wire  [29:0] lr_sav;
    wire  [31:0] lsu_addr;
    wire   pc_we;
    wire   rst;
    wire   sig_align;
    wire   sig_dbuserr;
    wire   sig_dmmufault;
    wire   sig_dtlbmiss;
    wire   sig_ibuserr;
    wire   sig_illegal;
    wire   sig_immufault;
    wire   sig_int;
    wire   sig_itlbmiss;
    wire   sig_range;
    wire   sig_syscall;
    wire   sig_tick;
    wire   sig_trap;
    wire  [31:0] spr_dat_npc;
    wire  [31:0] spr_dat_ppc;
    wire  [15:0] sr;
    wire   sr_we;
    reg  [2:0]  state = 3'b0;
    wire   tick_pending;
    wire  [15:0] to_sr;
    wire   wb_freeze;
    reg  [31:0] wb_pc = 32'b0;

    assign lr_sav = ex_pc[31:2];

  //assertion( lr_sav = Extract(31, 2, ex_pc)) 0
    assign spr_dat_npc = ex_void ? id_pc : ex_pc;

  //assertion( spr_dat_npc = If(0 != ex_void == True, id_pc, ex_pc)) 1
    assign except_trig = {(tick_pending & (~du_dsr[4])), (int_pending & (~du_dsr[7])), (ex_exceptflags[1] & (~du_dsr[9])), (ex_exceptflags[0] & (~du_dsr[3])), (ex_exceptflags[2] & (~du_dsr[1])), (sig_illegal & (~du_dsr[6])), (sig_align & (~du_dsr[5])), (sig_dtlbmiss & (~du_dsr[8])), (sig_dmmufault & (~du_dsr[2])), (sig_dbuserr & (~du_dsr[1])), (sig_range & (~du_dsr[10])), ((sig_trap & (~du_dsr[13])) & (~ex_freeze)), ((sig_syscall & (~du_dsr[11])) & (~ex_freeze))};

  //assertion( except_trig = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(tick_pending & ~Extract(4, 4, du_dsr), int_pending & ~Extract(7, 7, du_dsr)), Extract(1, 1, ex_exceptflags) & ~Extract(9, 9, du_dsr)), Extract(0, 0, ex_exceptflags) & ~Extract(3, 3, du_dsr)), Extract(2, 2, ex_exceptflags) & ~Extract(1, 1, du_dsr)), sig_illegal & ~Extract(6, 6, du_dsr)), sig_align & ~Extract(5, 5, du_dsr)), sig_dtlbmiss & ~Extract(8, 8, du_dsr)), sig_dmmufault & ~Extract(2, 2, du_dsr)), sig_dbuserr & ~Extract(1, 1, du_dsr)), sig_range & ~Extract(10, 10, du_dsr)), sig_trap & ~Extract(13, 13, du_dsr) & ~ex_freeze), sig_syscall & ~Extract(11, 11, du_dsr) & ~ex_freeze)) 2
    assign except_stop = {(tick_pending & du_dsr[4]), (int_pending & du_dsr[7]), (ex_exceptflags[1] & du_dsr[9]), (ex_exceptflags[0] & du_dsr[3]), (ex_exceptflags[2] & du_dsr[1]), (sig_illegal & du_dsr[6]), (sig_align & du_dsr[5]), (sig_dtlbmiss & du_dsr[8]), (sig_dmmufault & du_dsr[2]), (sig_dbuserr & du_dsr[1]), (sig_range & du_dsr[10]), ((sig_trap & du_dsr[13]) & (~ex_freeze)), ((sig_syscall & du_dsr[11]) & (~ex_freeze))};

  //assertion( except_stop = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(tick_pending & Extract(4, 4, du_dsr), int_pending & Extract(7, 7, du_dsr)), Extract(1, 1, ex_exceptflags) & Extract(9, 9, du_dsr)), Extract(0, 0, ex_exceptflags) & Extract(3, 3, du_dsr)), Extract(2, 2, ex_exceptflags) & Extract(1, 1, du_dsr)), sig_illegal & Extract(6, 6, du_dsr)), sig_align & Extract(5, 5, du_dsr)), sig_dtlbmiss & Extract(8, 8, du_dsr)), sig_dmmufault & Extract(2, 2, du_dsr)), sig_dbuserr & Extract(1, 1, du_dsr)), sig_range & Extract(10, 10, du_dsr)), sig_trap & Extract(13, 13, du_dsr) & ~ex_freeze), sig_syscall & Extract(11, 11, du_dsr) & ~ex_freeze)) 3
    assign except_started = (extend_flush & except_start);

  //assertion( except_started = extend_flush & except_start) 4
    assign spr_dat_ppc = wb_pc;

  //assertion( spr_dat_ppc = wb_pc) 5
    assign except_start = ((except_type != 4'h0) & extend_flush);

  //assertion( except_start = If(0 != except_type == True, 1, 0) & extend_flush) 6
    assign int_pending = ((((((sig_int & sr[2]) & delayed_iee[2]) & (~ex_freeze)) & (~branch_taken)) & (~ex_dslot)) & (~sr_we));

  //assertion( int_pending = sig_int & Extract(2, 2, sr) & Extract(2, 2, delayed_iee) & ~ex_freeze & ~branch_taken & ~ex_dslot & ~sr_we) 7
    assign tick_pending = (((((sig_tick & sr[1]) & (~ex_freeze)) & (~branch_taken)) & (~ex_dslot)) & (~sr_we));

  //assertion( tick_pending = sig_tick & Extract(1, 1, sr) & ~ex_freeze & ~branch_taken & ~ex_dslot & ~sr_we) 8
    assign abort_ex = ((((sig_dbuserr | sig_dmmufault) | sig_dtlbmiss) | sig_align) | sig_illegal);

  //assertion( abort_ex = sig_dbuserr | sig_dmmufault | sig_dtlbmiss | sig_align | sig_illegal) 9
    assign flushpipe = ((except_flushpipe | pc_we) | extend_flush);

  //assertion( flushpipe = except_flushpipe | pc_we | extend_flush) 10
    assign except_flushpipe = ((|except_trig) & ~|state);

  //assertion( except_flushpipe = bvredor(except_trig) & ~bvredor(state)) 11
    //Following code is from line 143
        always @(posedge rst or posedge clk) begin
            if (rst)
                begin
                    id_pc <= 32'h00000000;  $display(";A 14");  //assertion( id_pc = 0) 14
                    id_exceptflags <= 3'h0;  $display(";A 15");  //assertion( id_exceptflags = 0) 15
                end
            else
                begin
                    if (flushpipe)
                        begin
                          $display(";A 16");                          //assertion( 0 != flushpipe = True) 16
                            id_pc <= 32'h00000000;  $display(";A 18");  //assertion( id_pc = 0) 18
                            id_exceptflags <= 3'h0;  $display(";A 19");  //assertion( id_exceptflags = 0) 19
                        end
                    else
                        begin
                          $display(";A 17");                          //assertion( 0 != flushpipe = False) 17
                            if ((~id_freeze))
                                begin
                                  $display(";A 20");                                  //assertion( Not(id_freeze == 1) = True) 20
                                    id_pc <= if_pc;  $display(";A 22");  //assertion( id_pc = if_pc) 22
                                    id_exceptflags <= {sig_ibuserr, sig_itlbmiss, sig_immufault};  $display(";A 23");  //assertion( id_exceptflags = Concat(Concat(sig_ibuserr, sig_itlbmiss), sig_immufault)) 23
                                end
                            else
                                  $display(";A 21");                                  //assertion( Not(id_freeze == 1) = False) 21
                        end
                end
            // Display the variables
            begin
            $display(";R id_pc = %d", id_pc);
            $display(";R extend_flush = %d", extend_flush);
            $display(";R except_type = %d", except_type);
            $display(";R epcr = %d", epcr);
            $display(";R eear = %d", eear);
            $display(";R esr = %d", esr);
            $display(";R delayed1_ex_dslot = %d", delayed1_ex_dslot);
            $display(";R delayed2_ex_dslot = %d", delayed2_ex_dslot);
            $display(";R delayed_iee = %d", delayed_iee);
            $display(";R delayed_tee = %d", delayed_tee);
            $display(";R ex_dslot = %d", ex_dslot);
            $display(";R ex_exceptflags = %d", ex_exceptflags);
            $display(";R ex_pc = %d", ex_pc);
            $display(";R extend_flush_last = %d", extend_flush_last);
            $display(";R id_exceptflags = %d", id_exceptflags);
            $display(";R state = %d", state);
            $display(";R wb_pc = %d", wb_pc);
            end
        end

    //Following code is from line 156
        always @(posedge clk or posedge rst) begin
            if (rst)
                begin
                    delayed_iee <= 3'h0;  $display(";A 26");  //assertion( delayed_iee = 0) 26
                end
            else
                begin
                    if ((~sr[2]))
                        begin
                          $display(";A 27");                          //assertion( Not(Extract(2, 2, sr) == 1) = True) 27
                            delayed_iee <= 3'h0;  $display(";A 29");  //assertion( delayed_iee = 0) 29
                        end
                    else
                        begin
                          $display(";A 28");                          //assertion( Not(Extract(2, 2, sr) == 1) = False) 28
                            delayed_iee <= {delayed_iee[1:0], 1'b1};  $display(";A 30");  //assertion( delayed_iee = Concat(Extract(1, 0, delayed_iee), 1)) 30
                        end
                end
            // Display the variables
            begin
            $display(";R id_pc = %d", id_pc);
            $display(";R extend_flush = %d", extend_flush);
            $display(";R except_type = %d", except_type);
            $display(";R epcr = %d", epcr);
            $display(";R eear = %d", eear);
            $display(";R esr = %d", esr);
            $display(";R delayed1_ex_dslot = %d", delayed1_ex_dslot);
            $display(";R delayed2_ex_dslot = %d", delayed2_ex_dslot);
            $display(";R delayed_iee = %d", delayed_iee);
            $display(";R delayed_tee = %d", delayed_tee);
            $display(";R ex_dslot = %d", ex_dslot);
            $display(";R ex_exceptflags = %d", ex_exceptflags);
            $display(";R ex_pc = %d", ex_pc);
            $display(";R extend_flush_last = %d", extend_flush_last);
            $display(";R id_exceptflags = %d", id_exceptflags);
            $display(";R state = %d", state);
            $display(";R wb_pc = %d", wb_pc);
            end
        end

    //Following code is from line 160
        always @(posedge clk or posedge rst) begin
            if (rst)
                begin
                    delayed_tee <= 3'h0;  $display(";A 33");  //assertion( delayed_tee = 0) 33
                end
            else
                begin
                    if ((~sr[1]))
                        begin
                          $display(";A 34");                          //assertion( Not(Extract(1, 1, sr) == 1) = True) 34
                            delayed_tee <= 3'h0;  $display(";A 36");  //assertion( delayed_tee = 0) 36
                        end
                    else
                        begin
                          $display(";A 35");                          //assertion( Not(Extract(1, 1, sr) == 1) = False) 35
                            delayed_tee <= {delayed_tee[1:0], 1'b1};  $display(";A 37");  //assertion( delayed_tee = Concat(Extract(1, 0, delayed_tee), 1)) 37
                        end
                end
            // Display the variables
            begin
            $display(";R id_pc = %d", id_pc);
            $display(";R extend_flush = %d", extend_flush);
            $display(";R except_type = %d", except_type);
            $display(";R epcr = %d", epcr);
            $display(";R eear = %d", eear);
            $display(";R esr = %d", esr);
            $display(";R delayed1_ex_dslot = %d", delayed1_ex_dslot);
            $display(";R delayed2_ex_dslot = %d", delayed2_ex_dslot);
            $display(";R delayed_iee = %d", delayed_iee);
            $display(";R delayed_tee = %d", delayed_tee);
            $display(";R ex_dslot = %d", ex_dslot);
            $display(";R ex_exceptflags = %d", ex_exceptflags);
            $display(";R ex_pc = %d", ex_pc);
            $display(";R extend_flush_last = %d", extend_flush_last);
            $display(";R id_exceptflags = %d", id_exceptflags);
            $display(";R state = %d", state);
            $display(";R wb_pc = %d", wb_pc);
            end
        end

    //Following code is from line 164
        always @(posedge rst or posedge clk) begin
            if (rst)
                begin
                    ex_dslot <= 1'b0;  $display(";A 40");  //assertion( ex_dslot = 0) 40
                    ex_pc <= 32'h00000000;  $display(";A 41");  //assertion( ex_pc = 0) 41
                    ex_exceptflags <= 3'h0;  $display(";A 42");  //assertion( ex_exceptflags = 0) 42
                    delayed1_ex_dslot <= 1'b0;  $display(";A 43");  //assertion( delayed1_ex_dslot = 0) 43
                    delayed2_ex_dslot <= 1'b0;  $display(";A 44");  //assertion( delayed2_ex_dslot = 0) 44
                end
            else
                begin
                    if (flushpipe)
                        begin
                          $display(";A 45");                          //assertion( 0 != flushpipe = True) 45
                            ex_dslot <= 1'b0;  $display(";A 47");  //assertion( ex_dslot = 0) 47
                            ex_pc <= 32'h00000000;  $display(";A 48");  //assertion( ex_pc = 0) 48
                            ex_exceptflags <= 3'h0;  $display(";A 49");  //assertion( ex_exceptflags = 0) 49
                            delayed1_ex_dslot <= 1'b0;  $display(";A 50");  //assertion( delayed1_ex_dslot = 0) 50
                            delayed2_ex_dslot <= 1'b0;  $display(";A 51");  //assertion( delayed2_ex_dslot = 0) 51
                        end
                    else
                        begin
                          $display(";A 46");                          //assertion( 0 != flushpipe = False) 46
                            if (((~ex_freeze) & id_freeze))
                                begin
                                  $display(";A 52");                                  //assertion( If(Not(ex_freeze == 1) == True, 1, 0) & id_freeze = True) 52
                                    ex_dslot <= 1'b0;  $display(";A 54");  //assertion( ex_dslot = 0) 54
                                    ex_pc <= id_pc;  $display(";A 55");  //assertion( ex_pc = id_pc) 55
                                    ex_exceptflags <= 3'h0;  $display(";A 56");  //assertion( ex_exceptflags = 0) 56
                                    delayed1_ex_dslot <= ex_dslot;  $display(";A 57");  //assertion( delayed1_ex_dslot = ex_dslot) 57
                                    delayed2_ex_dslot <= delayed1_ex_dslot;  $display(";A 58");  //assertion( delayed2_ex_dslot = delayed1_ex_dslot) 58
                                end
                            else
                                begin
                                  $display(";A 53");                                  //assertion( If(Not(ex_freeze == 1) == True, 1, 0) & id_freeze = False) 53
                                    if ((~ex_freeze))
                                        begin
                                          $display(";A 59");                                          //assertion( Not(ex_freeze == 1) = True) 59
                                            ex_dslot <= branch_taken;  $display(";A 61");  //assertion( ex_dslot = branch_taken) 61
                                            ex_pc <= id_pc;  $display(";A 62");  //assertion( ex_pc = id_pc) 62
                                            ex_exceptflags <= id_exceptflags;  $display(";A 63");  //assertion( ex_exceptflags = id_exceptflags) 63
                                            delayed1_ex_dslot <= ex_dslot;  $display(";A 64");  //assertion( delayed1_ex_dslot = ex_dslot) 64
                                            delayed2_ex_dslot <= delayed1_ex_dslot;  $display(";A 65");  //assertion( delayed2_ex_dslot = delayed1_ex_dslot) 65
                                        end
                                    else
                                          $display(";A 60");                                          //assertion( Not(ex_freeze == 1) = False) 60
                                end
                        end
                end
            // Display the variables
            begin
            $display(";R id_pc = %d", id_pc);
            $display(";R extend_flush = %d", extend_flush);
            $display(";R except_type = %d", except_type);
            $display(";R epcr = %d", epcr);
            $display(";R eear = %d", eear);
            $display(";R esr = %d", esr);
            $display(";R delayed1_ex_dslot = %d", delayed1_ex_dslot);
            $display(";R delayed2_ex_dslot = %d", delayed2_ex_dslot);
            $display(";R delayed_iee = %d", delayed_iee);
            $display(";R delayed_tee = %d", delayed_tee);
            $display(";R ex_dslot = %d", ex_dslot);
            $display(";R ex_exceptflags = %d", ex_exceptflags);
            $display(";R ex_pc = %d", ex_pc);
            $display(";R extend_flush_last = %d", extend_flush_last);
            $display(";R id_exceptflags = %d", id_exceptflags);
            $display(";R state = %d", state);
            $display(";R wb_pc = %d", wb_pc);
            end
        end

    //Following code is from line 193
        always @(posedge rst or posedge clk) begin
            if (rst)
                begin
                    wb_pc <= 32'h00000000;  $display(";A 68");  //assertion( wb_pc = 0) 68
                end
            else
                begin
                    if ((~wb_freeze))
                        begin
                          $display(";A 69");                          //assertion( Not(wb_freeze == 1) = True) 69
                            wb_pc <= ex_pc;  $display(";A 71");  //assertion( wb_pc = ex_pc) 71
                        end
                    else
                          $display(";A 70");                          //assertion( Not(wb_freeze == 1) = False) 70
                end
            // Display the variables
            begin
            $display(";R id_pc = %d", id_pc);
            $display(";R extend_flush = %d", extend_flush);
            $display(";R except_type = %d", except_type);
            $display(";R epcr = %d", epcr);
            $display(";R eear = %d", eear);
            $display(";R esr = %d", esr);
            $display(";R delayed1_ex_dslot = %d", delayed1_ex_dslot);
            $display(";R delayed2_ex_dslot = %d", delayed2_ex_dslot);
            $display(";R delayed_iee = %d", delayed_iee);
            $display(";R delayed_tee = %d", delayed_tee);
            $display(";R ex_dslot = %d", ex_dslot);
            $display(";R ex_exceptflags = %d", ex_exceptflags);
            $display(";R ex_pc = %d", ex_pc);
            $display(";R extend_flush_last = %d", extend_flush_last);
            $display(";R id_exceptflags = %d", id_exceptflags);
            $display(";R state = %d", state);
            $display(";R wb_pc = %d", wb_pc);
            end
        end

    //Following code is from line 196
        always @(posedge rst or posedge clk) begin
            if (rst)
                begin
                    state <= 3'h0;  $display(";A 74");  //assertion( state = 0) 74
                    except_type <= 4'h0;  $display(";A 75");  //assertion( except_type = 0) 75
                    extend_flush <= 1'b0;  $display(";A 76");  //assertion( extend_flush = 0) 76
                    epcr <= 32'h00000000;  $display(";A 77");  //assertion( epcr = 0) 77
                    eear <= 32'h00000000;  $display(";A 78");  //assertion( eear = 0) 78
                    esr <= 16'h8001;  $display(";A 79");  //assertion( esr = 32769) 79
                    extend_flush_last <= 1'b0;  $display(";A 80");  //assertion( extend_flush_last = 0) 80
                end
            else
                begin
                    case (state)
                      3'h0:
                        begin
                          $display(";A 81");                          //assertion( 0 == state = True) 81
                            if (except_flushpipe)
                                begin
                                  $display(";A 82");                                  //assertion( 0 != except_flushpipe = True) 82
                                    state <= 3'h1;  $display(";A 84");  //assertion( state = 1) 84
                                    extend_flush <= 1'b1;  $display(";A 85");  //assertion( extend_flush = 1) 85
                                    esr <= sr_we ? to_sr : sr;  $display(";A 86");  //assertion( esr = If(0 != sr_we == True, to_sr, sr)) 86
                                    case (except_trig)
                                      13'b1xxxxxxxxxxxx:
                                        begin
                                          $display(";A 87");                                          //assertion( 4096 == except_trig = True) 87
                                            except_type <= 4'h5;  $display(";A 88");  //assertion( except_type = 5) 88
                                            epcr <= ex_dslot ? wb_pc : delayed1_ex_dslot ? id_pc : delayed2_ex_dslot ? id_pc : id_pc;  $display(";A 89");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 89
                                        end
                                      13'b01xxxxxxxxxxx:
                                        begin
                                          $display(";A 90");                                          //assertion( 2048 == except_trig = True) 90
                                            except_type <= 4'h8;  $display(";A 91");  //assertion( except_type = 8) 91
                                            epcr <= ex_dslot ? wb_pc : delayed1_ex_dslot ? id_pc : delayed2_ex_dslot ? id_pc : id_pc;  $display(";A 92");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 92
                                        end
                                      13'b01xxxxxxxxxx:
                                        begin
                                          $display(";A 93");                                          //assertion( 1024 == except_trig = True) 93
                                            except_type <= 4'ha;  $display(";A 94");  //assertion( except_type = 10) 94
                                            eear <= ex_dslot ? ex_pc : ex_pc;  $display(";A 95");  //assertion( eear = If(0 != ex_dslot == True, ex_pc, ex_pc)) 95
                                            epcr <= ex_dslot ? wb_pc : ex_pc;  $display(";A 96");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 96
                                        end
                                      13'b01xxxxxxxxx:
                                        begin
                                          $display(";A 97");                                          //assertion( 512 == except_trig = True) 97
                                            except_type <= 4'h4;  $display(";A 98");  //assertion( except_type = 4) 98
                                            eear <= ex_dslot ? ex_pc : delayed1_ex_dslot ? id_pc : delayed2_ex_dslot ? id_pc : id_pc;  $display(";A 99");  //assertion( eear = If(0 != ex_dslot == True, ex_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 99
                                            epcr <= ex_dslot ? wb_pc : delayed1_ex_dslot ? id_pc : delayed2_ex_dslot ? id_pc : id_pc;  $display(";A 100");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 100
                                        end
                                      13'b01xxxxxxxx:
                                        begin
                                          $display(";A 101");                                          //assertion( 256 == except_trig = True) 101
                                            except_type <= 4'h2;  $display(";A 102");  //assertion( except_type = 2) 102
                                            eear <= ex_dslot ? wb_pc : ex_pc;  $display(";A 103");  //assertion( eear = If(0 != ex_dslot == True, wb_pc, ex_pc)) 103
                                            epcr <= ex_dslot ? wb_pc : ex_pc;  $display(";A 104");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 104
                                        end
                                      13'b01xxxxxxx:
                                        begin
                                          $display(";A 105");                                          //assertion( 128 == except_trig = True) 105
                                            except_type <= 4'h7;  $display(";A 106");  //assertion( except_type = 7) 106
                                            eear <= ex_pc;  $display(";A 107");  //assertion( eear = ex_pc) 107
                                            epcr <= ex_dslot ? wb_pc : ex_pc;  $display(";A 108");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 108
                                        end
                                      13'b01xxxxxx:
                                        begin
                                          $display(";A 109");                                          //assertion( 64 == except_trig = True) 109
                                            except_type <= 4'h6;  $display(";A 110");  //assertion( except_type = 6) 110
                                            eear <= lsu_addr;  $display(";A 111");  //assertion( eear = lsu_addr) 111
                                            epcr <= ex_dslot ? wb_pc : ex_pc;  $display(";A 112");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 112
                                        end
                                      13'b01xxxxx:
                                        begin
                                          $display(";A 113");                                          //assertion( 32 == except_trig = True) 113
                                            except_type <= 4'h9;  $display(";A 114");  //assertion( except_type = 9) 114
                                            eear <= lsu_addr;  $display(";A 115");  //assertion( eear = lsu_addr) 115
                                            epcr <= ex_dslot ? wb_pc : ex_pc;  $display(";A 116");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 116
                                        end
                                      13'b01xxxx:
                                        begin
                                          $display(";A 117");                                          //assertion( 16 == except_trig = True) 117
                                            except_type <= 4'h3;  $display(";A 118");  //assertion( except_type = 3) 118
                                            eear <= lsu_addr;  $display(";A 119");  //assertion( eear = lsu_addr) 119
                                            epcr <= ex_dslot ? wb_pc : ex_pc;  $display(";A 120");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 120
                                        end
                                      13'b01xxx:
                                        begin
                                          $display(";A 121");                                          //assertion( 8 == except_trig = True) 121
                                            except_type <= 4'h2;  $display(";A 122");  //assertion( except_type = 2) 122
                                            eear <= lsu_addr;  $display(";A 123");  //assertion( eear = lsu_addr) 123
                                            epcr <= ex_dslot ? wb_pc : ex_pc;  $display(";A 124");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 124
                                        end
                                      13'b01xx:
                                        begin
                                          $display(";A 125");                                          //assertion( 4 == except_trig = True) 125
                                            except_type <= 4'hb;  $display(";A 126");  //assertion( except_type = 11) 126
                                            epcr <= ex_dslot ? wb_pc : delayed1_ex_dslot ? id_pc : delayed2_ex_dslot ? id_pc : id_pc;  $display(";A 127");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 127
                                        end
                                      13'b01x:
                                        begin
                                          $display(";A 128");                                          //assertion( 2 == except_trig = True) 128
                                            except_type <= 4'he;  $display(";A 129");  //assertion( except_type = 14) 129
                                            epcr <= ex_dslot ? wb_pc : ex_pc;  $display(";A 130");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, ex_pc)) 130
                                        end
                                      13'h0001:
                                        begin
                                          $display(";A 131");                                          //assertion( 1 == except_trig = True) 131
                                            except_type <= 4'hc;  $display(";A 132");  //assertion( except_type = 12) 132
                                            epcr <= ex_dslot ? wb_pc : delayed1_ex_dslot ? id_pc : delayed2_ex_dslot ? id_pc : id_pc;  $display(";A 133");  //assertion( epcr = If(0 != ex_dslot == True, wb_pc, If(0 != delayed1_ex_dslot == True, id_pc, If(0 != delayed2_ex_dslot == True, id_pc, id_pc)))) 133
                                        end
                                      default:
                                        begin
                                          $display(";A 134");                                          //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 134
                                            except_type <= 4'h0;  $display(";A 135");  //assertion( except_type = 0) 135
                                        end
                                    endcase
                                end
                            else
                                begin
                                  $display(";A 83");                                  //assertion( 0 != except_flushpipe = False) 83
                                    if (pc_we)
                                        begin
                                          $display(";A 136");                                          //assertion( 0 != pc_we = True) 136
                                            state <= 3'h1;  $display(";A 138");  //assertion( state = 1) 138
                                            extend_flush <= 1'b1;  $display(";A 139");  //assertion( extend_flush = 1) 139
                                        end
                                    else
                                        begin
                                          $display(";A 137");                                          //assertion( 0 != pc_we = False) 137
                                            if (epcr_we)
                                                begin
                                                  $display(";A 140");                                                  //assertion( 0 != epcr_we = True) 140
                                                    epcr <= datain;  $display(";A 142");  //assertion( epcr = datain) 142
                                                end
                                            else
                                                  $display(";A 141");                                                  //assertion( 0 != epcr_we = False) 141
                                            if (eear_we)
                                                begin
                                                  $display(";A 143");                                                  //assertion( 0 != eear_we = True) 143
                                                    eear <= datain;  $display(";A 145");  //assertion( eear = datain) 145
                                                end
                                            else
                                                  $display(";A 144");                                                  //assertion( 0 != eear_we = False) 144
                                            if (esr_we)
                                                begin
                                                  $display(";A 146");                                                  //assertion( 0 != esr_we = True) 146
                                                    esr <= {1'b1, datain[14:0]};  $display(";A 148");  //assertion( esr = Concat(1, Extract(14, 0, datain))) 148
                                                end
                                            else
                                                  $display(";A 147");                                                  //assertion( 0 != esr_we = False) 147
                                        end
                                end
                        end
                      3'h1:
                        begin
                          $display(";A 149");                          //assertion( 1 == state = True) 149
                            if (((icpu_ack_i | icpu_err_i) | genpc_freeze))
                                begin
                                  $display(";A 150");                                  //assertion( icpu_ack_i | icpu_err_i | genpc_freeze = True) 150
                                    state <= 3'h2;  $display(";A 152");  //assertion( state = 2) 152
                                end
                            else
                                  $display(";A 151");                                  //assertion( icpu_ack_i | icpu_err_i | genpc_freeze = False) 151
                        end
                      3'h2:
                        begin
                          $display(";A 153");                          //assertion( 2 == state = True) 153
                            if ((except_type == 4'he))
                                begin
                                  $display(";A 154");                                  //assertion( 14 == except_type = True) 154
                                    state <= 3'h0;  $display(";A 156");  //assertion( state = 0) 156
                                    extend_flush <= 1'b0;  $display(";A 157");  //assertion( extend_flush = 0) 157
                                    extend_flush_last <= 1'b0;  $display(";A 158");  //assertion( extend_flush_last = 0) 158
                                    except_type <= 4'h0;  $display(";A 159");  //assertion( except_type = 0) 159
                                end
                            else
                                begin
                                  $display(";A 155");                                  //assertion( 14 == except_type = False) 155
                                    state <= 3'h3;  $display(";A 160");  //assertion( state = 3) 160
                                end
                        end
                      3'h3:
                        begin
                          $display(";A 161");                          //assertion( 3 == state = True) 161
                            state <= 3'h4;  $display(";A 162");  //assertion( state = 4) 162
                        end
                      3'h4:
                        begin
                          $display(";A 163");                          //assertion( 4 == state = True) 163
                            state <= 3'h5;  $display(";A 164");  //assertion( state = 5) 164
                            extend_flush <= 1'b0;  $display(";A 165");  //assertion( extend_flush = 0) 165
                            extend_flush_last <= 1'b0;  $display(";A 166");  //assertion( extend_flush_last = 0) 166
                        end
                      default:
                        begin
                          $display(";A 167");                          //assertion( If(0 != state == True, 1, 0) & If(1 != state == True, 1, 0) & If(2 != state == True, 1, 0) & If(3 != state == True, 1, 0) & If(4 != state == True, 1, 0) = True) 167
                            if (((~if_stall) && (~id_freeze)))
                                begin
                                  $display(";A 168");                                  //assertion( And(If(Not(if_stall == 1) == True, 1, 0) == 1, If(Not(id_freeze == 1) == True, 1, 0) == 1) = True) 168
                                    state <= 3'h0;  $display(";A 170");  //assertion( state = 0) 170
                                    except_type <= 4'h0;  $display(";A 171");  //assertion( except_type = 0) 171
                                    extend_flush_last <= 1'b0;  $display(";A 172");  //assertion( extend_flush_last = 0) 172
                                end
                            else
                                  $display(";A 169");                                  //assertion( And(If(Not(if_stall == 1) == True, 1, 0) == 1, If(Not(id_freeze == 1) == True, 1, 0) == 1) = False) 169
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R id_pc = %d", id_pc);
            $display(";R extend_flush = %d", extend_flush);
            $display(";R except_type = %d", except_type);
            $display(";R epcr = %d", epcr);
            $display(";R eear = %d", eear);
            $display(";R esr = %d", esr);
            $display(";R delayed1_ex_dslot = %d", delayed1_ex_dslot);
            $display(";R delayed2_ex_dslot = %d", delayed2_ex_dslot);
            $display(";R delayed_iee = %d", delayed_iee);
            $display(";R delayed_tee = %d", delayed_tee);
            $display(";R ex_dslot = %d", ex_dslot);
            $display(";R ex_exceptflags = %d", ex_exceptflags);
            $display(";R ex_pc = %d", ex_pc);
            $display(";R extend_flush_last = %d", extend_flush_last);
            $display(";R id_exceptflags = %d", id_exceptflags);
            $display(";R state = %d", state);
            $display(";R wb_pc = %d", wb_pc);
            end
        end

endmodule
