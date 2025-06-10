//Following code is from line 1
module usb_phy(RxError_o, txdn, DataOut_i, TxValid_i, DataIn_o, LineState_o, rxd, rst, txdp, rxdn, txoe, RxValid_o, TxReady_o, phy_tx_mode, usb_rst, rxdp, RxActive_o, clk, __obs);

    input               clk;
    input               rst;
    input               phy_tx_mode;
    output              usb_rst;
    output              txdp;
    output              txdn;
    output              txoe;
    input               rxd;
    input               rxdp;
    input               rxdn;
    input         [7:0] DataOut_i;
    input               TxValid_i;
    output              TxReady_o;
    output        [7:0] DataIn_o;
    output              RxValid_o;
    output              RxActive_o;
    output              RxError_o;
    output        [1:0] LineState_o;
    input               __obs;

    reg usb_rst = 1'b0;
    reg txdp = 1'b0;
    reg txdn = 1'b0;
    reg txoe = 1'b0;
    reg TxReady_o = 1'b0;
    reg [7:0] DataIn_o = 8'b0;
    reg RxValid_o = 1'b0;
    reg RxActive_o = 1'b0;
    reg RxError_o = 1'b0;
    reg [1:0] LineState_o = 2'b0;
    //Parameter Declaration
    reg  [4:0]  rst_cnt = 5'b0;
    wire   fs_ce;
    wire   i_tx_phy_clk;
    wire   i_tx_phy_rst;
    wire   i_tx_phy_fs_ce;
    wire   i_tx_phy_phy_mode;
    reg  i_tx_phy_txdp = 1'b0;
    reg  i_tx_phy_txdn = 1'b0;
    reg  i_tx_phy_txoe = 1'b0;
    wire  [7:0] i_tx_phy_DataOut_i;
    wire   i_tx_phy_TxValid_i;
    reg  i_tx_phy_TxReady_o = 1'b0;
    reg  [2:0]  i_tx_phy_state = 3'b0;
    reg  [2:0]  i_tx_phy_next_state = 3'b0;
    reg  i_tx_phy_tx_ready_d = 1'b0;
    reg  i_tx_phy_ld_sop_d = 1'b0;
    reg  i_tx_phy_ld_data_d = 1'b0;
    reg  i_tx_phy_ld_eop_d = 1'b0;
    reg  i_tx_phy_tx_ip = 1'b0;
    reg  i_tx_phy_tx_ip_sync = 1'b0;
    reg  [2:0]  i_tx_phy_bit_cnt = 3'b0;
    reg  [7:0]  i_tx_phy_hold_reg = 8'b0;
    reg  [7:0]  i_tx_phy_hold_reg_d = 8'b0;
    reg  i_tx_phy_sd_raw_o = 1'b0;
    wire   i_tx_phy_hold;
    reg  i_tx_phy_data_done = 1'b0;
    reg  i_tx_phy_sft_done = 1'b0;
    reg  i_tx_phy_sft_done_r = 1'b0;
    wire   i_tx_phy_sft_done_e;
    reg  i_tx_phy_ld_data = 1'b0;
    wire   i_tx_phy_eop_done;
    reg  [2:0]  i_tx_phy_one_cnt = 3'b0;
    wire   i_tx_phy_stuff;
    reg  i_tx_phy_sd_bs_o = 1'b0;
    reg  i_tx_phy_sd_nrzi_o = 1'b0;
    reg  i_tx_phy_append_eop = 1'b0;
    reg  i_tx_phy_append_eop_sync1 = 1'b0;
    reg  i_tx_phy_append_eop_sync2 = 1'b0;
    reg  i_tx_phy_append_eop_sync3 = 1'b0;
    reg  i_tx_phy_append_eop_sync4 = 1'b0;
    reg  i_tx_phy_txoe_r1 = 1'b0;
    reg  i_tx_phy_txoe_r2 = 1'b0;
    wire   i_rx_phy_clk;
    wire   i_rx_phy_rst;
    reg  i_rx_phy_fs_ce = 1'b0;
    wire   i_rx_phy_rxd;
    wire   i_rx_phy_rxdp;
    wire   i_rx_phy_rxdn;
    wire  [7:0] i_rx_phy_DataIn_o;
    wire   i_rx_phy_RxValid_o;
    wire   i_rx_phy_RxActive_o;
    wire   i_rx_phy_RxError_o;
    wire   i_rx_phy_RxEn_i;
    wire  [1:0] i_rx_phy_LineState;
    reg  i_rx_phy_rxd_s0 = 1'b0;
    reg  i_rx_phy_rxd_s1 = 1'b0;
    reg  i_rx_phy_rxd_s = 1'b0;
    reg  i_rx_phy_rxdp_s0 = 1'b0;
    reg  i_rx_phy_rxdp_s1 = 1'b0;
    reg  i_rx_phy_rxdp_s = 1'b0;
    reg  i_rx_phy_rxdp_s_r = 1'b0;
    reg  i_rx_phy_rxdn_s0 = 1'b0;
    reg  i_rx_phy_rxdn_s1 = 1'b0;
    reg  i_rx_phy_rxdn_s = 1'b0;
    reg  i_rx_phy_rxdn_s_r = 1'b0;
    reg  i_rx_phy_synced_d = 1'b0;
    wire   i_rx_phy_k;
    wire   i_rx_phy_j;
    wire   i_rx_phy_se0;
    reg  i_rx_phy_rxd_r = 1'b0;
    reg  i_rx_phy_rx_en = 1'b0;
    reg  i_rx_phy_rx_active = 1'b0;
    reg  [2:0]  i_rx_phy_bit_cnt = 3'b0;
    reg  i_rx_phy_rx_valid1 = 1'b0;
    reg  i_rx_phy_rx_valid = 1'b0;
    reg  i_rx_phy_shift_en = 1'b0;
    reg  i_rx_phy_sd_r = 1'b0;
    reg  i_rx_phy_sd_nrzi = 1'b0;
    reg  [7:0]  i_rx_phy_hold_reg = 8'b0;
    wire   i_rx_phy_drop_bit;
    reg  [2:0]  i_rx_phy_one_cnt = 3'b0;
    reg  [1:0]  i_rx_phy_dpll_state = 2'b0;
    reg  [1:0]  i_rx_phy_dpll_next_state = 2'b0;
    reg  i_rx_phy_fs_ce_d = 1'b0;
    wire   i_rx_phy_change;
    wire   i_rx_phy_lock_en;
    reg  [2:0]  i_rx_phy_fs_state = 3'b0;
    reg  [2:0]  i_rx_phy_fs_next_state = 3'b0;
    reg  i_rx_phy_rx_valid_r = 1'b0;
    reg  i_rx_phy_sync_err_d = 1'b0;
    reg  i_rx_phy_sync_err = 1'b0;
    reg  i_rx_phy_bit_stuff_err = 1'b0;
    reg  i_rx_phy_se0_r = 1'b0;
    reg  i_rx_phy_byte_err = 1'b0;
    reg  i_rx_phy_se0_s = 1'b0;
    reg  i_rx_phy_fs_ce_r1 = 1'b0;
    reg  i_rx_phy_fs_ce_r2 = 1'b0;

    //Following code is from line 121
        always @(posedge clk or negedge rst) begin
            if ((~rst))
                begin
                    rst_cnt <= 5'h0;  $display(";A 2");  //assertion( rst_cnt = 0) 2
                end
            else
                begin
                    if ((LineState_o != 2'h0))
                        begin
                          $display(";A 3");                          //assertion( 0 != LineState_o = True) 3
                            rst_cnt <= 5'h0;  $display(";A 5");  //assertion( rst_cnt = 0) 5
                        end
                    else
                        begin
                          $display(";A 4");                          //assertion( 0 != LineState_o = False) 4
                            if (((~usb_rst) && fs_ce))
                                begin
                                  $display(";A 6");                                  //assertion( And(If(Not(usb_rst == 1) == True, 1, 0) == 1, fs_ce == 1) = True) 6
                                    rst_cnt <= (rst_cnt + 5'h1);  $display(";A 8");  //assertion( rst_cnt = rst_cnt + 1) 8
                                end
                            else
                                  $display(";A 7");                                  //assertion( And(If(Not(usb_rst == 1) == True, 1, 0) == 1, fs_ce == 1) = False) 7
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 142
        always @(posedge clk or negedge rst) begin
            if ((~rst))
                begin
                    usb_rst <= 1'b0;  $display(";A 11");  //assertion( usb_rst = 0) 11
                end
            else
                begin
                    usb_rst <= (rst_cnt == 5'h1f);  $display(";A 12");  //assertion( usb_rst = 31 == rst_cnt) 12
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_tx_phy_clk = clk;

  //assertion( i_tx_phy_clk = clk) 13
    assign i_tx_phy_rst = rst;

  //assertion( i_tx_phy_rst = rst) 14
    assign i_tx_phy_fs_ce = fs_ce;

  //assertion( i_tx_phy_fs_ce = fs_ce) 15
    assign i_tx_phy_phy_mode = phy_tx_mode;

  //assertion( i_tx_phy_phy_mode = phy_tx_mode) 16
    //Following code is from line 158
        always @( * ) begin
            txdp = i_tx_phy_txdp;  $display(";A 17");  //assertion( txdp = i_tx_phy_txdp) 17
            txdn = i_tx_phy_txdn;  $display(";A 18");  //assertion( txdn = i_tx_phy_txdn) 18
            txoe = i_tx_phy_txoe;  $display(";A 19");  //assertion( txoe = i_tx_phy_txoe) 19
            TxReady_o = i_tx_phy_TxReady_o;  $display(";A 20");  //assertion( TxReady_o = i_tx_phy_TxReady_o) 20
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_tx_phy_DataOut_i = DataOut_i;

  //assertion( i_tx_phy_DataOut_i = DataOut_i) 21
    assign i_tx_phy_TxValid_i = TxValid_i;

  //assertion( i_tx_phy_TxValid_i = TxValid_i) 22
    //Following code is from line 168
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 23");                  //assertion( Not(i_tx_phy_rst == 1) = True) 23
                    i_tx_phy_TxReady_o <= 1'b0;  $display(";A 25");  //assertion( i_tx_phy_TxReady_o = 0) 25
                end
            else
                begin
                  $display(";A 24");                  //assertion( Not(i_tx_phy_rst == 1) = False) 24
                    i_tx_phy_TxReady_o <= (i_tx_phy_tx_ready_d & i_tx_phy_TxValid_i);  $display(";A 26");  //assertion( i_tx_phy_TxReady_o = i_tx_phy_tx_ready_d & i_tx_phy_TxValid_i) 26
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 179
        always @(posedge i_tx_phy_clk) begin
            i_tx_phy_ld_data <= i_tx_phy_ld_data_d;  $display(";A 27");  //assertion( i_tx_phy_ld_data = i_tx_phy_ld_data_d) 27
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 183
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 28");                  //assertion( Not(i_tx_phy_rst == 1) = True) 28
                    i_tx_phy_tx_ip <= 1'b0;  $display(";A 30");  //assertion( i_tx_phy_tx_ip = 0) 30
                end
            else
                begin
                  $display(";A 29");                  //assertion( Not(i_tx_phy_rst == 1) = False) 29
                    if (i_tx_phy_ld_sop_d)
                        begin
                          $display(";A 31");                          //assertion( 0 != i_tx_phy_ld_sop_d = True) 31
                            i_tx_phy_tx_ip <= 1'b1;  $display(";A 33");  //assertion( i_tx_phy_tx_ip = 1) 33
                        end
                    else
                        begin
                          $display(";A 32");                          //assertion( 0 != i_tx_phy_ld_sop_d = False) 32
                            if (i_tx_phy_eop_done)
                                begin
                                  $display(";A 34");                                  //assertion( 0 != i_tx_phy_eop_done = True) 34
                                    i_tx_phy_tx_ip <= 1'b0;  $display(";A 36");  //assertion( i_tx_phy_tx_ip = 0) 36
                                end
                            else
                                  $display(";A 35");                                  //assertion( 0 != i_tx_phy_eop_done = False) 35
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 204
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 37");                  //assertion( Not(i_tx_phy_rst == 1) = True) 37
                    i_tx_phy_tx_ip_sync <= 1'b0;  $display(";A 39");  //assertion( i_tx_phy_tx_ip_sync = 0) 39
                end
            else
                begin
                  $display(";A 38");                  //assertion( Not(i_tx_phy_rst == 1) = False) 38
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 40");                          //assertion( 0 != i_tx_phy_fs_ce = True) 40
                            i_tx_phy_tx_ip_sync <= i_tx_phy_tx_ip;  $display(";A 42");  //assertion( i_tx_phy_tx_ip_sync = i_tx_phy_tx_ip) 42
                        end
                    else
                          $display(";A 41");                          //assertion( 0 != i_tx_phy_fs_ce = False) 41
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 218
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 43");                  //assertion( Not(i_tx_phy_rst == 1) = True) 43
                    i_tx_phy_data_done <= 1'b0;  $display(";A 45");  //assertion( i_tx_phy_data_done = 0) 45
                end
            else
                begin
                  $display(";A 44");                  //assertion( Not(i_tx_phy_rst == 1) = False) 44
                    if ((i_tx_phy_TxValid_i && (~i_tx_phy_tx_ip)))
                        begin
                          $display(";A 46");                          //assertion( And(i_tx_phy_TxValid_i == 1, If(Not(i_tx_phy_tx_ip == 1) == True, 1, 0) == 1) = True) 46
                            i_tx_phy_data_done <= 1'b1;  $display(";A 48");  //assertion( i_tx_phy_data_done = 1) 48
                        end
                    else
                        begin
                          $display(";A 47");                          //assertion( And(i_tx_phy_TxValid_i == 1, If(Not(i_tx_phy_tx_ip == 1) == True, 1, 0) == 1) = False) 47
                            if ((~i_tx_phy_TxValid_i))
                                begin
                                  $display(";A 49");                                  //assertion( Not(i_tx_phy_TxValid_i == 1) = True) 49
                                    i_tx_phy_data_done <= 1'b0;  $display(";A 51");  //assertion( i_tx_phy_data_done = 0) 51
                                end
                            else
                                  $display(";A 50");                                  //assertion( Not(i_tx_phy_TxValid_i == 1) = False) 50
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 239
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 52");                  //assertion( Not(i_tx_phy_rst == 1) = True) 52
                    i_tx_phy_bit_cnt <= 3'h0;  $display(";A 54");  //assertion( i_tx_phy_bit_cnt = 0) 54
                end
            else
                begin
                  $display(";A 53");                  //assertion( Not(i_tx_phy_rst == 1) = False) 53
                    if ((~i_tx_phy_tx_ip_sync))
                        begin
                          $display(";A 55");                          //assertion( Not(i_tx_phy_tx_ip_sync == 1) = True) 55
                            i_tx_phy_bit_cnt <= 3'h0;  $display(";A 57");  //assertion( i_tx_phy_bit_cnt = 0) 57
                        end
                    else
                        begin
                          $display(";A 56");                          //assertion( Not(i_tx_phy_tx_ip_sync == 1) = False) 56
                            if ((i_tx_phy_fs_ce && (~i_tx_phy_hold)))
                                begin
                                  $display(";A 58");                                  //assertion( And(i_tx_phy_fs_ce == 1, If(Not(i_tx_phy_hold == 1) == True, 1, 0) == 1) = True) 58
                                    i_tx_phy_bit_cnt <= (i_tx_phy_bit_cnt + 3'h1);  $display(";A 60");  //assertion( i_tx_phy_bit_cnt = i_tx_phy_bit_cnt + 1) 60
                                end
                            else
                                  $display(";A 59");                                  //assertion( And(i_tx_phy_fs_ce == 1, If(Not(i_tx_phy_hold == 1) == True, 1, 0) == 1) = False) 59
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_tx_phy_hold = i_tx_phy_stuff;

  //assertion( i_tx_phy_hold = i_tx_phy_stuff) 61
    //Following code is from line 261
        always @(posedge i_tx_phy_clk) begin
            if ((~i_tx_phy_tx_ip_sync))
                begin
                  $display(";A 62");                  //assertion( Not(i_tx_phy_tx_ip_sync == 1) = True) 62
                    i_tx_phy_sd_raw_o <= 1'b0;  $display(";A 64");  //assertion( i_tx_phy_sd_raw_o = 0) 64
                end
            else
                begin
                  $display(";A 63");                  //assertion( Not(i_tx_phy_tx_ip_sync == 1) = False) 63
                    case (i_tx_phy_bit_cnt)
                      3'h0:
                        begin
                          $display(";A 65");                          //assertion( 0 == i_tx_phy_bit_cnt = True) 65
                            i_tx_phy_sd_raw_o <= i_tx_phy_hold_reg_d[0];  $display(";A 66");  //assertion( i_tx_phy_sd_raw_o = Extract(0, 0, i_tx_phy_hold_reg_d)) 66
                        end
                      3'h1:
                        begin
                          $display(";A 67");                          //assertion( 1 == i_tx_phy_bit_cnt = True) 67
                            i_tx_phy_sd_raw_o <= i_tx_phy_hold_reg_d[1];  $display(";A 68");  //assertion( i_tx_phy_sd_raw_o = Extract(1, 1, i_tx_phy_hold_reg_d)) 68
                        end
                      3'h2:
                        begin
                          $display(";A 69");                          //assertion( 2 == i_tx_phy_bit_cnt = True) 69
                            i_tx_phy_sd_raw_o <= i_tx_phy_hold_reg_d[2];  $display(";A 70");  //assertion( i_tx_phy_sd_raw_o = Extract(2, 2, i_tx_phy_hold_reg_d)) 70
                        end
                      3'h3:
                        begin
                          $display(";A 71");                          //assertion( 3 == i_tx_phy_bit_cnt = True) 71
                            i_tx_phy_sd_raw_o <= i_tx_phy_hold_reg_d[3];  $display(";A 72");  //assertion( i_tx_phy_sd_raw_o = Extract(3, 3, i_tx_phy_hold_reg_d)) 72
                        end
                      3'h4:
                        begin
                          $display(";A 73");                          //assertion( 4 == i_tx_phy_bit_cnt = True) 73
                            i_tx_phy_sd_raw_o <= i_tx_phy_hold_reg_d[4];  $display(";A 74");  //assertion( i_tx_phy_sd_raw_o = Extract(4, 4, i_tx_phy_hold_reg_d)) 74
                        end
                      3'h5:
                        begin
                          $display(";A 75");                          //assertion( 5 == i_tx_phy_bit_cnt = True) 75
                            i_tx_phy_sd_raw_o <= i_tx_phy_hold_reg_d[5];  $display(";A 76");  //assertion( i_tx_phy_sd_raw_o = Extract(5, 5, i_tx_phy_hold_reg_d)) 76
                        end
                      3'h6:
                        begin
                          $display(";A 77");                          //assertion( 6 == i_tx_phy_bit_cnt = True) 77
                            i_tx_phy_sd_raw_o <= i_tx_phy_hold_reg_d[6];  $display(";A 78");  //assertion( i_tx_phy_sd_raw_o = Extract(6, 6, i_tx_phy_hold_reg_d)) 78
                        end
                      3'h7:
                        begin
                          $display(";A 79");                          //assertion( 7 == i_tx_phy_bit_cnt = True) 79
                            i_tx_phy_sd_raw_o <= i_tx_phy_hold_reg_d[7];  $display(";A 80");  //assertion( i_tx_phy_sd_raw_o = Extract(7, 7, i_tx_phy_hold_reg_d)) 80
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 305
        always @(posedge i_tx_phy_clk) begin
            i_tx_phy_sft_done <= ((~i_tx_phy_hold) & (i_tx_phy_bit_cnt == 3'h7));  $display(";A 81");  //assertion( i_tx_phy_sft_done = If(Not(i_tx_phy_hold == 1) == True, 1, 0) & If((7 == i_tx_phy_bit_cnt) == True, 1, 0)) 81
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 309
        always @(posedge i_tx_phy_clk) begin
            i_tx_phy_sft_done_r <= i_tx_phy_sft_done;  $display(";A 82");  //assertion( i_tx_phy_sft_done_r = i_tx_phy_sft_done) 82
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_tx_phy_sft_done_e = (i_tx_phy_sft_done & (~i_tx_phy_sft_done_r));

  //assertion( i_tx_phy_sft_done_e = i_tx_phy_sft_done & If(Not(i_tx_phy_sft_done_r == 1) == True, 1, 0)) 83
    //Following code is from line 314
        always @(posedge i_tx_phy_clk) begin
            if (i_tx_phy_ld_sop_d)
                begin
                  $display(";A 84");                  //assertion( 0 != i_tx_phy_ld_sop_d = True) 84
                    i_tx_phy_hold_reg <= 8'h80;  $display(";A 86");  //assertion( i_tx_phy_hold_reg = 128) 86
                end
            else
                begin
                  $display(";A 85");                  //assertion( 0 != i_tx_phy_ld_sop_d = False) 85
                    if (i_tx_phy_ld_data)
                        begin
                          $display(";A 87");                          //assertion( 0 != i_tx_phy_ld_data = True) 87
                            i_tx_phy_hold_reg <= i_tx_phy_DataOut_i;  $display(";A 89");  //assertion( i_tx_phy_hold_reg = i_tx_phy_DataOut_i) 89
                            
                        end
                    else
                          $display(";A 88");                          //assertion( 0 != i_tx_phy_ld_data = False) 88
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 328
        always @(posedge i_tx_phy_clk) begin
            i_tx_phy_hold_reg_d <= i_tx_phy_hold_reg;  $display(";A 90");  //assertion( i_tx_phy_hold_reg_d = i_tx_phy_hold_reg) 90
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 332
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 91");                  //assertion( Not(i_tx_phy_rst == 1) = True) 91
                    i_tx_phy_one_cnt <= 3'h0;  $display(";A 93");  //assertion( i_tx_phy_one_cnt = 0) 93
                end
            else
                begin
                  $display(";A 92");                  //assertion( Not(i_tx_phy_rst == 1) = False) 92
                    if ((~i_tx_phy_tx_ip_sync))
                        begin
                          $display(";A 94");                          //assertion( Not(i_tx_phy_tx_ip_sync == 1) = True) 94
                            i_tx_phy_one_cnt <= 3'h0;  $display(";A 96");  //assertion( i_tx_phy_one_cnt = 0) 96
                        end
                    else
                        begin
                          $display(";A 95");                          //assertion( Not(i_tx_phy_tx_ip_sync == 1) = False) 95
                            if (i_tx_phy_fs_ce)
                                begin
                                  $display(";A 97");                                  //assertion( 0 != i_tx_phy_fs_ce = True) 97
                                    if (((~i_tx_phy_sd_raw_o) || i_tx_phy_stuff))
                                        begin
                                          $display(";A 99");                                          //assertion( Or(If(Not(i_tx_phy_sd_raw_o == 1) == True, 1, 0) == 1, i_tx_phy_stuff == 1) = True) 99
                                            i_tx_phy_one_cnt <= 3'h0;  $display(";A 101");  //assertion( i_tx_phy_one_cnt = 0) 101
                                        end
                                    else
                                        begin
                                          $display(";A 100");                                          //assertion( Or(If(Not(i_tx_phy_sd_raw_o == 1) == True, 1, 0) == 1, i_tx_phy_stuff == 1) = False) 100
                                            i_tx_phy_one_cnt <= (i_tx_phy_one_cnt + 3'h1);  $display(";A 102");  //assertion( i_tx_phy_one_cnt = i_tx_phy_one_cnt + 1) 102
                                        end
                                end
                            else
                                  $display(";A 98");                                  //assertion( 0 != i_tx_phy_fs_ce = False) 98
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_tx_phy_stuff = (i_tx_phy_one_cnt == 3'h6);

  //assertion( i_tx_phy_stuff = 6 == i_tx_phy_one_cnt) 103
    //Following code is from line 361
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 104");                  //assertion( Not(i_tx_phy_rst == 1) = True) 104
                    i_tx_phy_sd_bs_o <= 1'h0;  $display(";A 106");  //assertion( i_tx_phy_sd_bs_o = 0) 106
                end
            else
                begin
                  $display(";A 105");                  //assertion( Not(i_tx_phy_rst == 1) = False) 105
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 107");                          //assertion( 0 != i_tx_phy_fs_ce = True) 107
                            i_tx_phy_sd_bs_o <= (~i_tx_phy_tx_ip_sync) ? 1'b0 : i_tx_phy_stuff ? 1'b0 : i_tx_phy_sd_raw_o;  $display(";A 109");  //assertion( i_tx_phy_sd_bs_o = If(Not(i_tx_phy_tx_ip_sync == 1) == True, 0, If(0 != i_tx_phy_stuff == True, 0, i_tx_phy_sd_raw_o))) 109
                        end
                    else
                          $display(";A 108");                          //assertion( 0 != i_tx_phy_fs_ce = False) 108
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 375
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 110");                  //assertion( Not(i_tx_phy_rst == 1) = True) 110
                    i_tx_phy_sd_nrzi_o <= 1'b1;  $display(";A 112");  //assertion( i_tx_phy_sd_nrzi_o = 1) 112
                end
            else
                begin
                  $display(";A 111");                  //assertion( Not(i_tx_phy_rst == 1) = False) 111
                    if (((~i_tx_phy_tx_ip_sync) || (~i_tx_phy_txoe_r1)))
                        begin
                          $display(";A 113");                          //assertion( Or(If(Not(i_tx_phy_tx_ip_sync == 1) == True, 1, 0) == 1, If(Not(i_tx_phy_txoe_r1 == 1) == True, 1, 0) == 1) = True) 113
                            i_tx_phy_sd_nrzi_o <= 1'b1;  $display(";A 115");  //assertion( i_tx_phy_sd_nrzi_o = 1) 115
                        end
                    else
                        begin
                          $display(";A 114");                          //assertion( Or(If(Not(i_tx_phy_tx_ip_sync == 1) == True, 1, 0) == 1, If(Not(i_tx_phy_txoe_r1 == 1) == True, 1, 0) == 1) = False) 114
                            if (i_tx_phy_fs_ce)
                                begin
                                  $display(";A 116");                                  //assertion( 0 != i_tx_phy_fs_ce = True) 116
                                    i_tx_phy_sd_nrzi_o <= i_tx_phy_sd_bs_o ? i_tx_phy_sd_nrzi_o : (~i_tx_phy_sd_nrzi_o);  $display(";A 118");  //assertion( i_tx_phy_sd_nrzi_o = If(0 != i_tx_phy_sd_bs_o == True, i_tx_phy_sd_nrzi_o, ~i_tx_phy_sd_nrzi_o)) 118
                                end
                            else
                                  $display(";A 117");                                  //assertion( 0 != i_tx_phy_fs_ce = False) 117
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 396
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 119");                  //assertion( Not(i_tx_phy_rst == 1) = True) 119
                    i_tx_phy_append_eop <= 1'b0;  $display(";A 121");  //assertion( i_tx_phy_append_eop = 0) 121
                end
            else
                begin
                  $display(";A 120");                  //assertion( Not(i_tx_phy_rst == 1) = False) 120
                    if (i_tx_phy_ld_eop_d)
                        begin
                          $display(";A 122");                          //assertion( 0 != i_tx_phy_ld_eop_d = True) 122
                            i_tx_phy_append_eop <= 1'b1;  $display(";A 124");  //assertion( i_tx_phy_append_eop = 1) 124
                        end
                    else
                        begin
                          $display(";A 123");                          //assertion( 0 != i_tx_phy_ld_eop_d = False) 123
                            if (i_tx_phy_append_eop_sync2)
                                begin
                                  $display(";A 125");                                  //assertion( 0 != i_tx_phy_append_eop_sync2 = True) 125
                                    i_tx_phy_append_eop <= 1'b0;  $display(";A 127");  //assertion( i_tx_phy_append_eop = 0) 127
                                end
                            else
                                  $display(";A 126");                                  //assertion( 0 != i_tx_phy_append_eop_sync2 = False) 126
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 417
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 128");                  //assertion( Not(i_tx_phy_rst == 1) = True) 128
                    i_tx_phy_append_eop_sync1 <= 1'b0;  $display(";A 130");  //assertion( i_tx_phy_append_eop_sync1 = 0) 130
                end
            else
                begin
                  $display(";A 129");                  //assertion( Not(i_tx_phy_rst == 1) = False) 129
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 131");                          //assertion( 0 != i_tx_phy_fs_ce = True) 131
                            i_tx_phy_append_eop_sync1 <= i_tx_phy_append_eop;  $display(";A 133");  //assertion( i_tx_phy_append_eop_sync1 = i_tx_phy_append_eop) 133
                        end
                    else
                          $display(";A 132");                          //assertion( 0 != i_tx_phy_fs_ce = False) 132
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 431
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 134");                  //assertion( Not(i_tx_phy_rst == 1) = True) 134
                    i_tx_phy_append_eop_sync2 <= 1'b0;  $display(";A 136");  //assertion( i_tx_phy_append_eop_sync2 = 0) 136
                end
            else
                begin
                  $display(";A 135");                  //assertion( Not(i_tx_phy_rst == 1) = False) 135
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 137");                          //assertion( 0 != i_tx_phy_fs_ce = True) 137
                            i_tx_phy_append_eop_sync2 <= i_tx_phy_append_eop_sync1;  $display(";A 139");  //assertion( i_tx_phy_append_eop_sync2 = i_tx_phy_append_eop_sync1) 139
                        end
                    else
                          $display(";A 138");                          //assertion( 0 != i_tx_phy_fs_ce = False) 138
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 445
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 140");                  //assertion( Not(i_tx_phy_rst == 1) = True) 140
                    i_tx_phy_append_eop_sync3 <= 1'b0;  $display(";A 142");  //assertion( i_tx_phy_append_eop_sync3 = 0) 142
                end
            else
                begin
                  $display(";A 141");                  //assertion( Not(i_tx_phy_rst == 1) = False) 141
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 143");                          //assertion( 0 != i_tx_phy_fs_ce = True) 143
                            i_tx_phy_append_eop_sync3 <= (i_tx_phy_append_eop_sync2 | (i_tx_phy_append_eop_sync3 & (~i_tx_phy_append_eop_sync4)));  $display(";A 145");  //assertion( i_tx_phy_append_eop_sync3 = i_tx_phy_append_eop_sync2 | i_tx_phy_append_eop_sync3 & If(Not(i_tx_phy_append_eop_sync4 == 1) == True, 1, 0)) 145
                        end
                    else
                          $display(";A 144");                          //assertion( 0 != i_tx_phy_fs_ce = False) 144
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 459
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 146");                  //assertion( Not(i_tx_phy_rst == 1) = True) 146
                    i_tx_phy_append_eop_sync4 <= 1'b0;  $display(";A 148");  //assertion( i_tx_phy_append_eop_sync4 = 0) 148
                end
            else
                begin
                  $display(";A 147");                  //assertion( Not(i_tx_phy_rst == 1) = False) 147
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 149");                          //assertion( 0 != i_tx_phy_fs_ce = True) 149
                            i_tx_phy_append_eop_sync4 <= i_tx_phy_append_eop_sync3;  $display(";A 151");  //assertion( i_tx_phy_append_eop_sync4 = i_tx_phy_append_eop_sync3) 151
                        end
                    else
                          $display(";A 150");                          //assertion( 0 != i_tx_phy_fs_ce = False) 150
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_tx_phy_eop_done = i_tx_phy_append_eop_sync3;

  //assertion( i_tx_phy_eop_done = i_tx_phy_append_eop_sync3) 152
    //Following code is from line 474
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 153");                  //assertion( Not(i_tx_phy_rst == 1) = True) 153
                    i_tx_phy_txoe_r1 <= 1'b0;  $display(";A 155");  //assertion( i_tx_phy_txoe_r1 = 0) 155
                end
            else
                begin
                  $display(";A 154");                  //assertion( Not(i_tx_phy_rst == 1) = False) 154
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 156");                          //assertion( 0 != i_tx_phy_fs_ce = True) 156
                            i_tx_phy_txoe_r1 <= i_tx_phy_tx_ip_sync;  $display(";A 158");  //assertion( i_tx_phy_txoe_r1 = i_tx_phy_tx_ip_sync) 158
                        end
                    else
                          $display(";A 157");                          //assertion( 0 != i_tx_phy_fs_ce = False) 157
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 488
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 159");                  //assertion( Not(i_tx_phy_rst == 1) = True) 159
                    i_tx_phy_txoe_r2 <= 1'b0;  $display(";A 161");  //assertion( i_tx_phy_txoe_r2 = 0) 161
                end
            else
                begin
                  $display(";A 160");                  //assertion( Not(i_tx_phy_rst == 1) = False) 160
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 162");                          //assertion( 0 != i_tx_phy_fs_ce = True) 162
                            i_tx_phy_txoe_r2 <= i_tx_phy_txoe_r1;  $display(";A 164");  //assertion( i_tx_phy_txoe_r2 = i_tx_phy_txoe_r1) 164
                        end
                    else
                          $display(";A 163");                          //assertion( 0 != i_tx_phy_fs_ce = False) 163
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 502
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 165");                  //assertion( Not(i_tx_phy_rst == 1) = True) 165
                    i_tx_phy_txoe <= 1'b1;  $display(";A 167");  //assertion( i_tx_phy_txoe = 1) 167
                end
            else
                begin
                  $display(";A 166");                  //assertion( Not(i_tx_phy_rst == 1) = False) 166
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 168");                          //assertion( 0 != i_tx_phy_fs_ce = True) 168
                            i_tx_phy_txoe <= (~(i_tx_phy_txoe_r1 | i_tx_phy_txoe_r2));  $display(";A 170");  //assertion( i_tx_phy_txoe = Not(i_tx_phy_txoe_r1 | i_tx_phy_txoe_r2 == 1)) 170
                        end
                    else
                          $display(";A 169");                          //assertion( 0 != i_tx_phy_fs_ce = False) 169
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 516
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 171");                  //assertion( Not(i_tx_phy_rst == 1) = True) 171
                    i_tx_phy_txdp <= 1'b1;  $display(";A 173");  //assertion( i_tx_phy_txdp = 1) 173
                end
            else
                begin
                  $display(";A 172");                  //assertion( Not(i_tx_phy_rst == 1) = False) 172
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 174");                          //assertion( 0 != i_tx_phy_fs_ce = True) 174
                            i_tx_phy_txdp <= i_tx_phy_phy_mode ? ((~i_tx_phy_append_eop_sync3) & i_tx_phy_sd_nrzi_o) : i_tx_phy_sd_nrzi_o;  $display(";A 176");  //assertion( i_tx_phy_txdp = If(0 != i_tx_phy_phy_mode == True, If(Not(i_tx_phy_append_eop_sync3 == 1) == True, 1, 0) & i_tx_phy_sd_nrzi_o, i_tx_phy_sd_nrzi_o)) 176
                        end
                    else
                          $display(";A 175");                          //assertion( 0 != i_tx_phy_fs_ce = False) 175
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 530
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 177");                  //assertion( Not(i_tx_phy_rst == 1) = True) 177
                    i_tx_phy_txdn <= 1'b0;  $display(";A 179");  //assertion( i_tx_phy_txdn = 0) 179
                end
            else
                begin
                  $display(";A 178");                  //assertion( Not(i_tx_phy_rst == 1) = False) 178
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 180");                          //assertion( 0 != i_tx_phy_fs_ce = True) 180
                            i_tx_phy_txdn <= i_tx_phy_phy_mode ? ((~i_tx_phy_append_eop_sync3) & (~i_tx_phy_sd_nrzi_o)) : i_tx_phy_append_eop_sync3;  $display(";A 182");  //assertion( i_tx_phy_txdn = If(0 != i_tx_phy_phy_mode == True, If(Not(i_tx_phy_append_eop_sync3 == 1) == True, 1, 0) & ~i_tx_phy_sd_nrzi_o, i_tx_phy_append_eop_sync3)) 182
                        end
                    else
                          $display(";A 181");                          //assertion( 0 != i_tx_phy_fs_ce = False) 181
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 544
        always @(posedge i_tx_phy_clk or negedge i_tx_phy_rst) begin
            if ((~i_tx_phy_rst))
                begin
                  $display(";A 183");                  //assertion( Not(i_tx_phy_rst == 1) = True) 183
                    i_tx_phy_state <= 3'd0;  $display(";A 185");  //assertion( i_tx_phy_state = 0) 185
                end
            else
                begin
                  $display(";A 184");                  //assertion( Not(i_tx_phy_rst == 1) = False) 184
                    i_tx_phy_state <= i_tx_phy_next_state;  $display(";A 186");  //assertion( i_tx_phy_state = i_tx_phy_next_state) 186
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 555
        always @(i_tx_phy_state or i_tx_phy_TxValid_i or i_tx_phy_data_done or i_tx_phy_sft_done_e or i_tx_phy_eop_done or i_tx_phy_fs_ce) begin
            i_tx_phy_next_state = i_tx_phy_state;  $display(";A 187");  //assertion( i_tx_phy_next_state = i_tx_phy_state) 187
            i_tx_phy_tx_ready_d = 1'b0;  $display(";A 188");  //assertion( i_tx_phy_tx_ready_d = 0) 188
            i_tx_phy_ld_sop_d = 1'b0;  $display(";A 189");  //assertion( i_tx_phy_ld_sop_d = 0) 189
            i_tx_phy_ld_data_d = 1'b0;  $display(";A 190");  //assertion( i_tx_phy_ld_data_d = 0) 190
            i_tx_phy_ld_eop_d = 1'b0;  $display(";A 191");  //assertion( i_tx_phy_ld_eop_d = 0) 191
            case (i_tx_phy_state)
              3'd0:
                begin
                  $display(";A 192");                  //assertion( 0 == i_tx_phy_state = True) 192
                    if (i_tx_phy_TxValid_i)
                        begin
                          $display(";A 193");                          //assertion( 0 != i_tx_phy_TxValid_i = True) 193
                            i_tx_phy_ld_sop_d = 1'b1;  $display(";A 195");  //assertion( i_tx_phy_ld_sop_d = 1) 195
                            i_tx_phy_next_state = 3'h1;  $display(";A 196");  //assertion( i_tx_phy_next_state = 1) 196
                        end
                    else
                          $display(";A 194");                          //assertion( 0 != i_tx_phy_TxValid_i = False) 194
                end
              3'h1:
                begin
                  $display(";A 197");                  //assertion( 1 == i_tx_phy_state = True) 197
                    if (i_tx_phy_sft_done_e)
                        begin
                          $display(";A 198");                          //assertion( 0 != i_tx_phy_sft_done_e = True) 198
                            i_tx_phy_tx_ready_d = 1'b1;  $display(";A 200");  //assertion( i_tx_phy_tx_ready_d = 1) 200
                            i_tx_phy_ld_data_d = 1'b1;  $display(";A 201");  //assertion( i_tx_phy_ld_data_d = 1) 201
                            i_tx_phy_next_state = 3'h2;  $display(";A 202");  //assertion( i_tx_phy_next_state = 2) 202
                        end
                    else
                          $display(";A 199");                          //assertion( 0 != i_tx_phy_sft_done_e = False) 199
                end
              3'h2:
                begin
                  $display(";A 203");                  //assertion( 2 == i_tx_phy_state = True) 203
                    if (((~i_tx_phy_data_done) && i_tx_phy_sft_done_e))
                        begin
                          $display(";A 204");                          //assertion( And(If(Not(i_tx_phy_data_done == 1) == True, 1, 0) == 1, i_tx_phy_sft_done_e == 1) = True) 204
                            i_tx_phy_ld_eop_d = 1'b1;  $display(";A 206");  //assertion( i_tx_phy_ld_eop_d = 1) 206
                            i_tx_phy_next_state = 3'h3;  $display(";A 207");  //assertion( i_tx_phy_next_state = 3) 207
                        end
                    else
                          $display(";A 205");                          //assertion( And(If(Not(i_tx_phy_data_done == 1) == True, 1, 0) == 1, i_tx_phy_sft_done_e == 1) = False) 205
                    if ((i_tx_phy_data_done && i_tx_phy_sft_done_e))
                        begin
                          $display(";A 208");                          //assertion( And(i_tx_phy_data_done == 1, i_tx_phy_sft_done_e == 1) = True) 208
                            i_tx_phy_tx_ready_d = 1'b1;  $display(";A 210");  //assertion( i_tx_phy_tx_ready_d = 1) 210
                            i_tx_phy_ld_data_d = 1'b1;  $display(";A 211");  //assertion( i_tx_phy_ld_data_d = 1) 211
                        end
                    else
                          $display(";A 209");                          //assertion( And(i_tx_phy_data_done == 1, i_tx_phy_sft_done_e == 1) = False) 209
                end
              3'h3:
                begin
                  $display(";A 212");                  //assertion( 3 == i_tx_phy_state = True) 212
                    if (i_tx_phy_eop_done)
                        begin
                          $display(";A 213");                          //assertion( 0 != i_tx_phy_eop_done = True) 213
                            i_tx_phy_next_state = 3'h4;  $display(";A 215");  //assertion( i_tx_phy_next_state = 4) 215
                        end
                    else
                          $display(";A 214");                          //assertion( 0 != i_tx_phy_eop_done = False) 214
                end
              3'h4:
                begin
                  $display(";A 216");                  //assertion( 4 == i_tx_phy_state = True) 216
                    if (((~i_tx_phy_eop_done) && i_tx_phy_fs_ce))
                        begin
                          $display(";A 217");                          //assertion( And(If(Not(i_tx_phy_eop_done == 1) == True, 1, 0) == 1, i_tx_phy_fs_ce == 1) = True) 217
                            i_tx_phy_next_state = 3'h5;  $display(";A 219");  //assertion( i_tx_phy_next_state = 5) 219
                        end
                    else
                          $display(";A 218");                          //assertion( And(If(Not(i_tx_phy_eop_done == 1) == True, 1, 0) == 1, i_tx_phy_fs_ce == 1) = False) 218
                end
              3'h5:
                begin
                  $display(";A 220");                  //assertion( 5 == i_tx_phy_state = True) 220
                    if (i_tx_phy_fs_ce)
                        begin
                          $display(";A 221");                          //assertion( 0 != i_tx_phy_fs_ce = True) 221
                            i_tx_phy_next_state = 3'd0;  $display(";A 223");  //assertion( i_tx_phy_next_state = 0) 223
                        end
                    else
                          $display(";A 222");                          //assertion( 0 != i_tx_phy_fs_ce = False) 222
                end
            endcase
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_rx_phy_clk = clk;

  //assertion( i_rx_phy_clk = clk) 224
    assign i_rx_phy_rst = rst;

  //assertion( i_rx_phy_rst = rst) 225
    assign fs_ce = i_rx_phy_fs_ce;

  //assertion( fs_ce = i_rx_phy_fs_ce) 226
    assign i_rx_phy_rxd = rxd;

  //assertion( i_rx_phy_rxd = rxd) 227
    assign i_rx_phy_rxdp = rxdp;

  //assertion( i_rx_phy_rxdp = rxdp) 228
    assign i_rx_phy_rxdn = rxdn;

  //assertion( i_rx_phy_rxdn = rxdn) 229
    //Following code is from line 622
        always @( * ) begin
            DataIn_o = i_rx_phy_DataIn_o;  $display(";A 230");  //assertion( DataIn_o = i_rx_phy_DataIn_o) 230
            RxValid_o = i_rx_phy_RxValid_o;  $display(";A 231");  //assertion( RxValid_o = i_rx_phy_RxValid_o) 231
            RxActive_o = i_rx_phy_RxActive_o;  $display(";A 232");  //assertion( RxActive_o = i_rx_phy_RxActive_o) 232
            RxError_o = i_rx_phy_RxError_o;  $display(";A 233");  //assertion( RxError_o = i_rx_phy_RxError_o) 233
            LineState_o = i_rx_phy_LineState;  $display(";A 234");  //assertion( LineState_o = i_rx_phy_LineState) 234
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_rx_phy_RxEn_i = txoe;

  //assertion( i_rx_phy_RxEn_i = txoe) 235
    assign i_rx_phy_RxActive_o = i_rx_phy_rx_active;

  //assertion( i_rx_phy_RxActive_o = i_rx_phy_rx_active) 236
    assign i_rx_phy_RxValid_o = i_rx_phy_rx_valid;

  //assertion( i_rx_phy_RxValid_o = i_rx_phy_rx_valid) 237
    assign i_rx_phy_RxError_o = ((i_rx_phy_sync_err | i_rx_phy_bit_stuff_err) | i_rx_phy_byte_err);

  //assertion( i_rx_phy_RxError_o = i_rx_phy_sync_err | i_rx_phy_bit_stuff_err | i_rx_phy_byte_err) 238
    assign i_rx_phy_DataIn_o = i_rx_phy_hold_reg;

  //assertion( i_rx_phy_DataIn_o = i_rx_phy_hold_reg) 239
    assign i_rx_phy_LineState = {i_rx_phy_rxdn_s1, i_rx_phy_rxdp_s1};

  //assertion( i_rx_phy_LineState = Concat(i_rx_phy_rxdn_s1, i_rx_phy_rxdp_s1)) 240
    //Following code is from line 636
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rx_en <= i_rx_phy_RxEn_i;  $display(";A 241");  //assertion( i_rx_phy_rx_en = i_rx_phy_RxEn_i) 241
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 640
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_sync_err <= ((~i_rx_phy_rx_active) & i_rx_phy_sync_err_d);  $display(";A 242");  //assertion( i_rx_phy_sync_err = If(Not(i_rx_phy_rx_active == 1) == True, 1, 0) & i_rx_phy_sync_err_d) 242
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 644
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxd_s0 <= i_rx_phy_rxd;  $display(";A 243");  //assertion( i_rx_phy_rxd_s0 = i_rx_phy_rxd) 243
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 648
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxd_s1 <= i_rx_phy_rxd_s0;  $display(";A 244");  //assertion( i_rx_phy_rxd_s1 = i_rx_phy_rxd_s0) 244
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 652
        always @(posedge i_rx_phy_clk) begin
            if ((i_rx_phy_rxd_s0 && i_rx_phy_rxd_s1))
                begin
                  $display(";A 245");                  //assertion( And(i_rx_phy_rxd_s0 == 1, i_rx_phy_rxd_s1 == 1) = True) 245
                    i_rx_phy_rxd_s <= 1'b1;  $display(";A 247");  //assertion( i_rx_phy_rxd_s = 1) 247
                end
            else
                begin
                  $display(";A 246");                  //assertion( And(i_rx_phy_rxd_s0 == 1, i_rx_phy_rxd_s1 == 1) = False) 246
                    if (((~i_rx_phy_rxd_s0) && (~i_rx_phy_rxd_s1)))
                        begin
                          $display(";A 248");                          //assertion( And(If(Not(i_rx_phy_rxd_s0 == 1) == True, 1, 0) == 1, If(Not(i_rx_phy_rxd_s1 == 1) == True, 1, 0) == 1) = True) 248
                            i_rx_phy_rxd_s <= 1'b0;  $display(";A 250");  //assertion( i_rx_phy_rxd_s = 0) 250
                        end
                    else
                          $display(";A 249");                          //assertion( And(If(Not(i_rx_phy_rxd_s0 == 1) == True, 1, 0) == 1, If(Not(i_rx_phy_rxd_s1 == 1) == True, 1, 0) == 1) = False) 249
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 666
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxdp_s0 <= i_rx_phy_rxdp;  $display(";A 251");  //assertion( i_rx_phy_rxdp_s0 = i_rx_phy_rxdp) 251
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 670
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxdp_s1 <= i_rx_phy_rxdp_s0;  $display(";A 252");  //assertion( i_rx_phy_rxdp_s1 = i_rx_phy_rxdp_s0) 252
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 674
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxdp_s_r <= (i_rx_phy_rxdp_s0 & i_rx_phy_rxdp_s1);  $display(";A 253");  //assertion( i_rx_phy_rxdp_s_r = i_rx_phy_rxdp_s0 & i_rx_phy_rxdp_s1) 253
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 678
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxdp_s <= ((i_rx_phy_rxdp_s0 & i_rx_phy_rxdp_s1) | i_rx_phy_rxdp_s_r);  $display(";A 254");  //assertion( i_rx_phy_rxdp_s = i_rx_phy_rxdp_s0 & i_rx_phy_rxdp_s1 | i_rx_phy_rxdp_s_r) 254
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 682
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxdn_s0 <= i_rx_phy_rxdn;  $display(";A 255");  //assertion( i_rx_phy_rxdn_s0 = i_rx_phy_rxdn) 255
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 686
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxdn_s1 <= i_rx_phy_rxdn_s0;  $display(";A 256");  //assertion( i_rx_phy_rxdn_s1 = i_rx_phy_rxdn_s0) 256
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 690
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxdn_s_r <= (i_rx_phy_rxdn_s0 & i_rx_phy_rxdn_s1);  $display(";A 257");  //assertion( i_rx_phy_rxdn_s_r = i_rx_phy_rxdn_s0 & i_rx_phy_rxdn_s1) 257
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 694
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxdn_s <= ((i_rx_phy_rxdn_s0 & i_rx_phy_rxdn_s1) | i_rx_phy_rxdn_s_r);  $display(";A 258");  //assertion( i_rx_phy_rxdn_s = i_rx_phy_rxdn_s0 & i_rx_phy_rxdn_s1 | i_rx_phy_rxdn_s_r) 258
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_rx_phy_k = ((~i_rx_phy_rxdp_s) & i_rx_phy_rxdn_s);

  //assertion( i_rx_phy_k = If(Not(i_rx_phy_rxdp_s == 1) == True, 1, 0) & i_rx_phy_rxdn_s) 259
    assign i_rx_phy_j = (i_rx_phy_rxdp_s & (~i_rx_phy_rxdn_s));

  //assertion( i_rx_phy_j = i_rx_phy_rxdp_s & If(Not(i_rx_phy_rxdn_s == 1) == True, 1, 0)) 260
    assign i_rx_phy_se0 = ((~i_rx_phy_rxdp_s) & (~i_rx_phy_rxdn_s));

  //assertion( i_rx_phy_se0 = If(Not(i_rx_phy_rxdp_s == 1) == True, 1, 0) & If(Not(i_rx_phy_rxdn_s == 1) == True, 1, 0)) 261
    //Following code is from line 701
        always @(posedge i_rx_phy_clk) begin
            if (i_rx_phy_fs_ce)
                begin
                  $display(";A 262");                  //assertion( 0 != i_rx_phy_fs_ce = True) 262
                    i_rx_phy_se0_s <= i_rx_phy_se0;  $display(";A 264");  //assertion( i_rx_phy_se0_s = i_rx_phy_se0) 264
                end
            else
                  $display(";A 263");                  //assertion( 0 != i_rx_phy_fs_ce = False) 263
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_rx_phy_lock_en = i_rx_phy_rx_en;

  //assertion( i_rx_phy_lock_en = i_rx_phy_rx_en) 265
    //Following code is from line 709
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rxd_r <= i_rx_phy_rxd_s;  $display(";A 266");  //assertion( i_rx_phy_rxd_r = i_rx_phy_rxd_s) 266
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_rx_phy_change = (i_rx_phy_rxd_r != i_rx_phy_rxd_s);

  //assertion( i_rx_phy_change = i_rx_phy_rxd_r != i_rx_phy_rxd_s) 267
    //Following code is from line 714
        always @(posedge i_rx_phy_clk or negedge i_rx_phy_rst) begin
            if ((~i_rx_phy_rst))
                begin
                  $display(";A 268");                  //assertion( Not(i_rx_phy_rst == 1) = True) 268
                    i_rx_phy_dpll_state <= 2'h1;  $display(";A 270");  //assertion( i_rx_phy_dpll_state = 1) 270
                end
            else
                begin
                  $display(";A 269");                  //assertion( Not(i_rx_phy_rst == 1) = False) 269
                    i_rx_phy_dpll_state <= i_rx_phy_dpll_next_state;  $display(";A 271");  //assertion( i_rx_phy_dpll_state = i_rx_phy_dpll_next_state) 271
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 725
        always @(i_rx_phy_dpll_state or i_rx_phy_lock_en or i_rx_phy_change) begin
            i_rx_phy_fs_ce_d = 1'b0;  $display(";A 272");  //assertion( i_rx_phy_fs_ce_d = 0) 272
            case (i_rx_phy_dpll_state)
              2'h0:
                begin
                  $display(";A 273");                  //assertion( 0 == i_rx_phy_dpll_state = True) 273
                    if ((i_rx_phy_lock_en && i_rx_phy_change))
                        begin
                          $display(";A 274");                          //assertion( And(i_rx_phy_lock_en == 1, i_rx_phy_change == 1) = True) 274
                            i_rx_phy_dpll_next_state = 2'h0;  $display(";A 276");  //assertion( i_rx_phy_dpll_next_state = 0) 276
                        end
                    else
                        begin
                          $display(";A 275");                          //assertion( And(i_rx_phy_lock_en == 1, i_rx_phy_change == 1) = False) 275
                            i_rx_phy_dpll_next_state = 2'h1;  $display(";A 277");  //assertion( i_rx_phy_dpll_next_state = 1) 277
                        end
                end
              2'h1:
                begin
                  $display(";A 278");                  //assertion( 1 == i_rx_phy_dpll_state = True) 278
                    i_rx_phy_fs_ce_d = 1'b1;  $display(";A 279");  //assertion( i_rx_phy_fs_ce_d = 1) 279
                    if ((i_rx_phy_lock_en && i_rx_phy_change))
                        begin
                          $display(";A 280");                          //assertion( And(i_rx_phy_lock_en == 1, i_rx_phy_change == 1) = True) 280
                            i_rx_phy_dpll_next_state = 2'h3;  $display(";A 282");  //assertion( i_rx_phy_dpll_next_state = 3) 282
                        end
                    else
                        begin
                          $display(";A 281");                          //assertion( And(i_rx_phy_lock_en == 1, i_rx_phy_change == 1) = False) 281
                            i_rx_phy_dpll_next_state = 2'h2;  $display(";A 283");  //assertion( i_rx_phy_dpll_next_state = 2) 283
                        end
                end
              2'h2:
                begin
                  $display(";A 284");                  //assertion( 2 == i_rx_phy_dpll_state = True) 284
                    if ((i_rx_phy_lock_en && i_rx_phy_change))
                        begin
                          $display(";A 285");                          //assertion( And(i_rx_phy_lock_en == 1, i_rx_phy_change == 1) = True) 285
                            i_rx_phy_dpll_next_state = 2'h0;  $display(";A 287");  //assertion( i_rx_phy_dpll_next_state = 0) 287
                        end
                    else
                        begin
                          $display(";A 286");                          //assertion( And(i_rx_phy_lock_en == 1, i_rx_phy_change == 1) = False) 286
                            i_rx_phy_dpll_next_state = 2'h3;  $display(";A 288");  //assertion( i_rx_phy_dpll_next_state = 3) 288
                        end
                end
              2'h3:
                begin
                  $display(";A 289");                  //assertion( 3 == i_rx_phy_dpll_state = True) 289
                    if ((i_rx_phy_lock_en && i_rx_phy_change))
                        begin
                          $display(";A 290");                          //assertion( And(i_rx_phy_lock_en == 1, i_rx_phy_change == 1) = True) 290
                            i_rx_phy_dpll_next_state = 2'h0;  $display(";A 292");  //assertion( i_rx_phy_dpll_next_state = 0) 292
                        end
                    else
                        begin
                          $display(";A 291");                          //assertion( And(i_rx_phy_lock_en == 1, i_rx_phy_change == 1) = False) 291
                            i_rx_phy_dpll_next_state = 2'h0;  $display(";A 293");  //assertion( i_rx_phy_dpll_next_state = 0) 293
                        end
                end
            endcase
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 776
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_fs_ce_r1 <= i_rx_phy_fs_ce_d;  $display(";A 294");  //assertion( i_rx_phy_fs_ce_r1 = i_rx_phy_fs_ce_d) 294
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 780
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_fs_ce_r2 <= i_rx_phy_fs_ce_r1;  $display(";A 295");  //assertion( i_rx_phy_fs_ce_r2 = i_rx_phy_fs_ce_r1) 295
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 784
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_fs_ce <= i_rx_phy_fs_ce_r2;  $display(";A 296");  //assertion( i_rx_phy_fs_ce = i_rx_phy_fs_ce_r2) 296
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 788
        always @(posedge i_rx_phy_clk or negedge i_rx_phy_rst) begin
            if ((~i_rx_phy_rst))
                begin
                  $display(";A 297");                  //assertion( Not(i_rx_phy_rst == 1) = True) 297
                    i_rx_phy_fs_state <= 3'h0;  $display(";A 299");  //assertion( i_rx_phy_fs_state = 0) 299
                end
            else
                begin
                  $display(";A 298");                  //assertion( Not(i_rx_phy_rst == 1) = False) 298
                    i_rx_phy_fs_state <= i_rx_phy_fs_next_state;  $display(";A 300");  //assertion( i_rx_phy_fs_state = i_rx_phy_fs_next_state) 300
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 799
        always @(i_rx_phy_fs_state or i_rx_phy_fs_ce or i_rx_phy_k or i_rx_phy_j or i_rx_phy_rx_en or i_rx_phy_rx_active or i_rx_phy_se0 or i_rx_phy_se0_s) begin
            i_rx_phy_synced_d = 1'b0;  $display(";A 301");  //assertion( i_rx_phy_synced_d = 0) 301
            i_rx_phy_sync_err_d = 1'b0;  $display(";A 302");  //assertion( i_rx_phy_sync_err_d = 0) 302
            i_rx_phy_fs_next_state = i_rx_phy_fs_state;  $display(";A 303");  //assertion( i_rx_phy_fs_next_state = i_rx_phy_fs_state) 303
            if ((((i_rx_phy_fs_ce && (~i_rx_phy_rx_active)) && (~i_rx_phy_se0)) && (~i_rx_phy_se0_s)))
                begin
                  $display(";A 304");                  //assertion( And(If(And(If(And(i_rx_phy_fs_ce == 1, If(Not(i_rx_phy_rx_active == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, If(Not(i_rx_phy_se0 == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, If(Not(i_rx_phy_se0_s == 1) == True, 1, 0) == 1) = True) 304
                    case (i_rx_phy_fs_state)
                      3'h0:
                        begin
                          $display(";A 306");                          //assertion( 0 == i_rx_phy_fs_state = True) 306
                            if ((i_rx_phy_k && i_rx_phy_rx_en))
                                begin
                                  $display(";A 307");                                  //assertion( And(i_rx_phy_k == 1, i_rx_phy_rx_en == 1) = True) 307
                                    i_rx_phy_fs_next_state = 3'h1;  $display(";A 309");  //assertion( i_rx_phy_fs_next_state = 1) 309
                                end
                            else
                                  $display(";A 308");                                  //assertion( And(i_rx_phy_k == 1, i_rx_phy_rx_en == 1) = False) 308
                        end
                      3'h1:
                        begin
                          $display(";A 310");                          //assertion( 1 == i_rx_phy_fs_state = True) 310
                            if ((i_rx_phy_j && i_rx_phy_rx_en))
                                begin
                                  $display(";A 311");                                  //assertion( And(i_rx_phy_j == 1, i_rx_phy_rx_en == 1) = True) 311
                                    i_rx_phy_fs_next_state = 3'h2;  $display(";A 313");  //assertion( i_rx_phy_fs_next_state = 2) 313
                                end
                            else
                                begin
                                  $display(";A 312");                                  //assertion( And(i_rx_phy_j == 1, i_rx_phy_rx_en == 1) = False) 312
                                    i_rx_phy_sync_err_d = 1'b1;  $display(";A 314");  //assertion( i_rx_phy_sync_err_d = 1) 314
                                    i_rx_phy_fs_next_state = 3'h0;  $display(";A 315");  //assertion( i_rx_phy_fs_next_state = 0) 315
                                end
                        end
                      3'h2:
                        begin
                          $display(";A 316");                          //assertion( 2 == i_rx_phy_fs_state = True) 316
                            if ((i_rx_phy_k && i_rx_phy_rx_en))
                                begin
                                  $display(";A 317");                                  //assertion( And(i_rx_phy_k == 1, i_rx_phy_rx_en == 1) = True) 317
                                    i_rx_phy_fs_next_state = 3'h3;  $display(";A 319");  //assertion( i_rx_phy_fs_next_state = 3) 319
                                end
                            else
                                begin
                                  $display(";A 318");                                  //assertion( And(i_rx_phy_k == 1, i_rx_phy_rx_en == 1) = False) 318
                                    i_rx_phy_sync_err_d = 1'b1;  $display(";A 320");  //assertion( i_rx_phy_sync_err_d = 1) 320
                                    i_rx_phy_fs_next_state = 3'h0;  $display(";A 321");  //assertion( i_rx_phy_fs_next_state = 0) 321
                                end
                        end
                      3'h3:
                        begin
                          $display(";A 322");                          //assertion( 3 == i_rx_phy_fs_state = True) 322
                            if ((i_rx_phy_j && i_rx_phy_rx_en))
                                begin
                                  $display(";A 323");                                  //assertion( And(i_rx_phy_j == 1, i_rx_phy_rx_en == 1) = True) 323
                                    i_rx_phy_fs_next_state = 3'h4;  $display(";A 325");  //assertion( i_rx_phy_fs_next_state = 4) 325
                                end
                            else
                                begin
                                  $display(";A 324");                                  //assertion( And(i_rx_phy_j == 1, i_rx_phy_rx_en == 1) = False) 324
                                    i_rx_phy_sync_err_d = 1'b1;  $display(";A 326");  //assertion( i_rx_phy_sync_err_d = 1) 326
                                    i_rx_phy_fs_next_state = 3'h0;  $display(";A 327");  //assertion( i_rx_phy_fs_next_state = 0) 327
                                end
                        end
                      3'h4:
                        begin
                          $display(";A 328");                          //assertion( 4 == i_rx_phy_fs_state = True) 328
                            if ((i_rx_phy_k && i_rx_phy_rx_en))
                                begin
                                  $display(";A 329");                                  //assertion( And(i_rx_phy_k == 1, i_rx_phy_rx_en == 1) = True) 329
                                    i_rx_phy_fs_next_state = 3'h5;  $display(";A 331");  //assertion( i_rx_phy_fs_next_state = 5) 331
                                end
                            else
                                begin
                                  $display(";A 330");                                  //assertion( And(i_rx_phy_k == 1, i_rx_phy_rx_en == 1) = False) 330
                                    i_rx_phy_sync_err_d = 1'b1;  $display(";A 332");  //assertion( i_rx_phy_sync_err_d = 1) 332
                                    i_rx_phy_fs_next_state = 3'h0;  $display(";A 333");  //assertion( i_rx_phy_fs_next_state = 0) 333
                                end
                        end
                      3'h5:
                        begin
                          $display(";A 334");                          //assertion( 5 == i_rx_phy_fs_state = True) 334
                            if ((i_rx_phy_j && i_rx_phy_rx_en))
                                begin
                                  $display(";A 335");                                  //assertion( And(i_rx_phy_j == 1, i_rx_phy_rx_en == 1) = True) 335
                                    i_rx_phy_fs_next_state = 3'h6;  $display(";A 337");  //assertion( i_rx_phy_fs_next_state = 6) 337
                                end
                            else
                                begin
                                  $display(";A 336");                                  //assertion( And(i_rx_phy_j == 1, i_rx_phy_rx_en == 1) = False) 336
                                    if ((i_rx_phy_k && i_rx_phy_rx_en))
                                        begin
                                          $display(";A 338");                                          //assertion( And(i_rx_phy_k == 1, i_rx_phy_rx_en == 1) = True) 338
                                            i_rx_phy_fs_next_state = 3'h0;  $display(";A 340");  //assertion( i_rx_phy_fs_next_state = 0) 340
                                            i_rx_phy_synced_d = 1'b1;  $display(";A 341");  //assertion( i_rx_phy_synced_d = 1) 341
                                        end
                                    else
                                        begin
                                          $display(";A 339");                                          //assertion( And(i_rx_phy_k == 1, i_rx_phy_rx_en == 1) = False) 339
                                            i_rx_phy_sync_err_d = 1'b1;  $display(";A 342");  //assertion( i_rx_phy_sync_err_d = 1) 342
                                            i_rx_phy_fs_next_state = 3'h0;  $display(";A 343");  //assertion( i_rx_phy_fs_next_state = 0) 343
                                        end
                                end
                        end
                      3'h6:
                        begin
                          $display(";A 344");                          //assertion( 6 == i_rx_phy_fs_state = True) 344
                            if ((i_rx_phy_k && i_rx_phy_rx_en))
                                begin
                                  $display(";A 345");                                  //assertion( And(i_rx_phy_k == 1, i_rx_phy_rx_en == 1) = True) 345
                                    i_rx_phy_fs_next_state = 3'h7;  $display(";A 347");  //assertion( i_rx_phy_fs_next_state = 7) 347
                                end
                            else
                                begin
                                  $display(";A 346");                                  //assertion( And(i_rx_phy_k == 1, i_rx_phy_rx_en == 1) = False) 346
                                    i_rx_phy_sync_err_d = 1'b1;  $display(";A 348");  //assertion( i_rx_phy_sync_err_d = 1) 348
                                    i_rx_phy_fs_next_state = 3'h0;  $display(";A 349");  //assertion( i_rx_phy_fs_next_state = 0) 349
                                end
                        end
                      3'h7:
                        begin
                          $display(";A 350");                          //assertion( 7 == i_rx_phy_fs_state = True) 350
                            if (i_rx_phy_k)
                                begin
                                  $display(";A 351");                                  //assertion( 0 != i_rx_phy_k = True) 351
                                    i_rx_phy_synced_d = 1'b1;  $display(";A 353");  //assertion( i_rx_phy_synced_d = 1) 353
                                end
                            else
                                  $display(";A 352");                                  //assertion( 0 != i_rx_phy_k = False) 352
                            i_rx_phy_fs_next_state = 3'h0;  $display(";A 354");  //assertion( i_rx_phy_fs_next_state = 0) 354
                        end
                    endcase
                end
            else
                  $display(";A 305");                  //assertion( And(If(And(If(And(i_rx_phy_fs_ce == 1, If(Not(i_rx_phy_rx_active == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, If(Not(i_rx_phy_se0 == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, If(Not(i_rx_phy_se0_s == 1) == True, 1, 0) == 1) = False) 305
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 905
        always @(posedge i_rx_phy_clk or negedge i_rx_phy_rst) begin
            if ((~i_rx_phy_rst))
                begin
                  $display(";A 355");                  //assertion( Not(i_rx_phy_rst == 1) = True) 355
                    i_rx_phy_rx_active <= 1'b0;  $display(";A 357");  //assertion( i_rx_phy_rx_active = 0) 357
                end
            else
                begin
                  $display(";A 356");                  //assertion( Not(i_rx_phy_rst == 1) = False) 356
                    if ((i_rx_phy_synced_d && i_rx_phy_rx_en))
                        begin
                          $display(";A 358");                          //assertion( And(i_rx_phy_synced_d == 1, i_rx_phy_rx_en == 1) = True) 358
                            i_rx_phy_rx_active <= 1'b1;  $display(";A 360");  //assertion( i_rx_phy_rx_active = 1) 360
                        end
                    else
                        begin
                          $display(";A 359");                          //assertion( And(i_rx_phy_synced_d == 1, i_rx_phy_rx_en == 1) = False) 359
                            if ((i_rx_phy_se0 && i_rx_phy_rx_valid_r))
                                begin
                                  $display(";A 361");                                  //assertion( And(i_rx_phy_se0 == 1, i_rx_phy_rx_valid_r == 1) = True) 361
                                    i_rx_phy_rx_active <= 1'b0;  $display(";A 363");  //assertion( i_rx_phy_rx_active = 0) 363
                                end
                            else
                                  $display(";A 362");                                  //assertion( And(i_rx_phy_se0 == 1, i_rx_phy_rx_valid_r == 1) = False) 362
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 926
        always @(posedge i_rx_phy_clk) begin
            if (i_rx_phy_rx_valid)
                begin
                  $display(";A 364");                  //assertion( 0 != i_rx_phy_rx_valid = True) 364
                    i_rx_phy_rx_valid_r <= 1'b1;  $display(";A 366");  //assertion( i_rx_phy_rx_valid_r = 1) 366
                end
            else
                begin
                  $display(";A 365");                  //assertion( 0 != i_rx_phy_rx_valid = False) 365
                    if (i_rx_phy_fs_ce)
                        begin
                          $display(";A 367");                          //assertion( 0 != i_rx_phy_fs_ce = True) 367
                            i_rx_phy_rx_valid_r <= 1'b0;  $display(";A 369");  //assertion( i_rx_phy_rx_valid_r = 0) 369
                        end
                    else
                          $display(";A 368");                          //assertion( 0 != i_rx_phy_fs_ce = False) 368
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 940
        always @(posedge i_rx_phy_clk) begin
            if (i_rx_phy_fs_ce)
                begin
                  $display(";A 370");                  //assertion( 0 != i_rx_phy_fs_ce = True) 370
                    i_rx_phy_sd_r <= i_rx_phy_rxd_s;  $display(";A 372");  //assertion( i_rx_phy_sd_r = i_rx_phy_rxd_s) 372
                end
            else
                  $display(";A 371");                  //assertion( 0 != i_rx_phy_fs_ce = False) 371
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 947
        always @(posedge i_rx_phy_clk or negedge i_rx_phy_rst) begin
            if ((~i_rx_phy_rst))
                begin
                  $display(";A 373");                  //assertion( Not(i_rx_phy_rst == 1) = True) 373
                    i_rx_phy_sd_nrzi <= 1'b0;  $display(";A 375");  //assertion( i_rx_phy_sd_nrzi = 0) 375
                end
            else
                begin
                  $display(";A 374");                  //assertion( Not(i_rx_phy_rst == 1) = False) 374
                    if ((~i_rx_phy_rx_active))
                        begin
                          $display(";A 376");                          //assertion( Not(i_rx_phy_rx_active == 1) = True) 376
                            i_rx_phy_sd_nrzi <= 1'b1;  $display(";A 378");  //assertion( i_rx_phy_sd_nrzi = 1) 378
                        end
                    else
                        begin
                          $display(";A 377");                          //assertion( Not(i_rx_phy_rx_active == 1) = False) 377
                            if ((i_rx_phy_rx_active && i_rx_phy_fs_ce))
                                begin
                                  $display(";A 379");                                  //assertion( And(i_rx_phy_rx_active == 1, i_rx_phy_fs_ce == 1) = True) 379
                                    i_rx_phy_sd_nrzi <= (~(i_rx_phy_rxd_s ^ i_rx_phy_sd_r));  $display(";A 381");  //assertion( i_rx_phy_sd_nrzi = Not(i_rx_phy_rxd_s ^ i_rx_phy_sd_r == 1)) 381
                                end
                            else
                                  $display(";A 380");                                  //assertion( And(i_rx_phy_rx_active == 1, i_rx_phy_fs_ce == 1) = False) 380
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 968
        always @(posedge i_rx_phy_clk or negedge i_rx_phy_rst) begin
            if ((~i_rx_phy_rst))
                begin
                  $display(";A 382");                  //assertion( Not(i_rx_phy_rst == 1) = True) 382
                    i_rx_phy_one_cnt <= 3'h0;  $display(";A 384");  //assertion( i_rx_phy_one_cnt = 0) 384
                end
            else
                begin
                  $display(";A 383");                  //assertion( Not(i_rx_phy_rst == 1) = False) 383
                    if ((~i_rx_phy_shift_en))
                        begin
                          $display(";A 385");                          //assertion( Not(i_rx_phy_shift_en == 1) = True) 385
                            i_rx_phy_one_cnt <= 3'h0;  $display(";A 387");  //assertion( i_rx_phy_one_cnt = 0) 387
                        end
                    else
                        begin
                          $display(";A 386");                          //assertion( Not(i_rx_phy_shift_en == 1) = False) 386
                            if (i_rx_phy_fs_ce)
                                begin
                                  $display(";A 388");                                  //assertion( 0 != i_rx_phy_fs_ce = True) 388
                                    if (((~i_rx_phy_sd_nrzi) || i_rx_phy_drop_bit))
                                        begin
                                          $display(";A 390");                                          //assertion( Or(If(Not(i_rx_phy_sd_nrzi == 1) == True, 1, 0) == 1, i_rx_phy_drop_bit == 1) = True) 390
                                            i_rx_phy_one_cnt <= 3'h0;  $display(";A 392");  //assertion( i_rx_phy_one_cnt = 0) 392
                                        end
                                    else
                                        begin
                                          $display(";A 391");                                          //assertion( Or(If(Not(i_rx_phy_sd_nrzi == 1) == True, 1, 0) == 1, i_rx_phy_drop_bit == 1) = False) 391
                                            i_rx_phy_one_cnt <= (i_rx_phy_one_cnt + 3'h1);  $display(";A 393");  //assertion( i_rx_phy_one_cnt = i_rx_phy_one_cnt + 1) 393
                                        end
                                end
                            else
                                  $display(";A 389");                                  //assertion( 0 != i_rx_phy_fs_ce = False) 389
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign i_rx_phy_drop_bit = (i_rx_phy_one_cnt == 3'h6);

  //assertion( i_rx_phy_drop_bit = 6 == i_rx_phy_one_cnt) 394
    //Following code is from line 997
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_bit_stuff_err <= ((((i_rx_phy_drop_bit & i_rx_phy_sd_nrzi) & i_rx_phy_fs_ce) & (~i_rx_phy_se0)) & i_rx_phy_rx_active);  $display(";A 395");  //assertion( i_rx_phy_bit_stuff_err = i_rx_phy_drop_bit & i_rx_phy_sd_nrzi & i_rx_phy_fs_ce & If(Not(i_rx_phy_se0 == 1) == True, 1, 0) & i_rx_phy_rx_active) 395
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 1001
        always @(posedge i_rx_phy_clk) begin
            if (i_rx_phy_fs_ce)
                begin
                  $display(";A 396");                  //assertion( 0 != i_rx_phy_fs_ce = True) 396
                    i_rx_phy_shift_en <= (i_rx_phy_synced_d | i_rx_phy_rx_active);  $display(";A 398");  //assertion( i_rx_phy_shift_en = i_rx_phy_synced_d | i_rx_phy_rx_active) 398
                end
            else
                  $display(";A 397");                  //assertion( 0 != i_rx_phy_fs_ce = False) 397
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 1008
        always @(posedge i_rx_phy_clk) begin
            if (((i_rx_phy_fs_ce && i_rx_phy_shift_en) && (~i_rx_phy_drop_bit)))
                begin
                  $display(";A 399");                  //assertion( And(If(And(i_rx_phy_fs_ce == 1, i_rx_phy_shift_en == 1) == True, 1, 0) == 1, If(Not(i_rx_phy_drop_bit == 1) == True, 1, 0) == 1) = True) 399
                    i_rx_phy_hold_reg <= {i_rx_phy_sd_nrzi, i_rx_phy_hold_reg[7:1]};  $display(";A 401");  //assertion( i_rx_phy_hold_reg = Concat(i_rx_phy_sd_nrzi, Extract(7, 1, i_rx_phy_hold_reg))) 401
                end
            else
                  $display(";A 400");                  //assertion( And(If(And(i_rx_phy_fs_ce == 1, i_rx_phy_shift_en == 1) == True, 1, 0) == 1, If(Not(i_rx_phy_drop_bit == 1) == True, 1, 0) == 1) = False) 400
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 1015
        always @(posedge i_rx_phy_clk or negedge i_rx_phy_rst) begin
            if ((~i_rx_phy_rst))
                begin
                  $display(";A 402");                  //assertion( Not(i_rx_phy_rst == 1) = True) 402
                    i_rx_phy_bit_cnt <= 3'b0;  $display(";A 404");  //assertion( i_rx_phy_bit_cnt = 0) 404
                end
            else
                begin
                  $display(";A 403");                  //assertion( Not(i_rx_phy_rst == 1) = False) 403
                    if ((~i_rx_phy_shift_en))
                        begin
                          $display(";A 405");                          //assertion( Not(i_rx_phy_shift_en == 1) = True) 405
                            i_rx_phy_bit_cnt <= 3'h0;  $display(";A 407");  //assertion( i_rx_phy_bit_cnt = 0) 407
                        end
                    else
                        begin
                          $display(";A 406");                          //assertion( Not(i_rx_phy_shift_en == 1) = False) 406
                            if ((i_rx_phy_fs_ce && (~i_rx_phy_drop_bit)))
                                begin
                                  $display(";A 408");                                  //assertion( And(i_rx_phy_fs_ce == 1, If(Not(i_rx_phy_drop_bit == 1) == True, 1, 0) == 1) = True) 408
                                    i_rx_phy_bit_cnt <= (i_rx_phy_bit_cnt + 3'h1);  $display(";A 410");  //assertion( i_rx_phy_bit_cnt = i_rx_phy_bit_cnt + 1) 410
                                end
                            else
                                  $display(";A 409");                                  //assertion( And(i_rx_phy_fs_ce == 1, If(Not(i_rx_phy_drop_bit == 1) == True, 1, 0) == 1) = False) 409
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 1036
        always @(posedge i_rx_phy_clk or negedge i_rx_phy_rst) begin
            if ((~i_rx_phy_rst))
                begin
                  $display(";A 411");                  //assertion( Not(i_rx_phy_rst == 1) = True) 411
                    i_rx_phy_rx_valid1 <= 1'b0;  $display(";A 413");  //assertion( i_rx_phy_rx_valid1 = 0) 413
                end
            else
                begin
                  $display(";A 412");                  //assertion( Not(i_rx_phy_rst == 1) = False) 412
                    if (((i_rx_phy_fs_ce && (~i_rx_phy_drop_bit)) && (i_rx_phy_bit_cnt == 3'h7)))
                        begin
                          $display(";A 414");                          //assertion( And(If(And(i_rx_phy_fs_ce == 1, If(Not(i_rx_phy_drop_bit == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, If((7 == i_rx_phy_bit_cnt) == True, 1, 0) == 1) = True) 414
                            i_rx_phy_rx_valid1 <= 1'b1;  $display(";A 416");  //assertion( i_rx_phy_rx_valid1 = 1) 416
                        end
                    else
                        begin
                          $display(";A 415");                          //assertion( And(If(And(i_rx_phy_fs_ce == 1, If(Not(i_rx_phy_drop_bit == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, If((7 == i_rx_phy_bit_cnt) == True, 1, 0) == 1) = False) 415
                            if (((i_rx_phy_rx_valid1 && i_rx_phy_fs_ce) && (~i_rx_phy_drop_bit)))
                                begin
                                  $display(";A 417");                                  //assertion( And(If(And(i_rx_phy_rx_valid1 == 1, i_rx_phy_fs_ce == 1) == True, 1, 0) == 1, If(Not(i_rx_phy_drop_bit == 1) == True, 1, 0) == 1) = True) 417
                                    i_rx_phy_rx_valid1 <= 1'b0;  $display(";A 419");  //assertion( i_rx_phy_rx_valid1 = 0) 419
                                end
                            else
                                  $display(";A 418");                                  //assertion( And(If(And(i_rx_phy_rx_valid1 == 1, i_rx_phy_fs_ce == 1) == True, 1, 0) == 1, If(Not(i_rx_phy_drop_bit == 1) == True, 1, 0) == 1) = False) 418
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 1057
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_rx_valid <= (((~i_rx_phy_drop_bit) & i_rx_phy_rx_valid1) & i_rx_phy_fs_ce);  $display(";A 420");  //assertion( i_rx_phy_rx_valid = If(Not(i_rx_phy_drop_bit == 1) == True, 1, 0) & i_rx_phy_rx_valid1 & i_rx_phy_fs_ce) 420
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 1061
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_se0_r <= i_rx_phy_se0;  $display(";A 421");  //assertion( i_rx_phy_se0_r = i_rx_phy_se0) 421
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 1065
        always @(posedge i_rx_phy_clk) begin
            i_rx_phy_byte_err <= (((i_rx_phy_se0 & (~i_rx_phy_se0_r)) & (|i_rx_phy_bit_cnt[2:1])) & i_rx_phy_rx_active);  $display(";A 422");  //assertion( i_rx_phy_byte_err = i_rx_phy_se0 & If(Not(i_rx_phy_se0_r == 1) == True, 1, 0) & bvredor(Extract(2, 1, i_rx_phy_bit_cnt)) & i_rx_phy_rx_active) 422
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

endmodule
