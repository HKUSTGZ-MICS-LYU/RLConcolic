//Following code is from line 9
module or1200_dc_fsm(biu_read, dcqmem_ci_i, dc_block_writeback, tag_dirty, clk, first_hit_ack, dcqmem_cycstb_i, dirty, dcram_we, first_miss_err, dc_no_writethrough, tag_we, biu_do_sel, tag, rst, first_miss_ack, spr_dat_i, dcram_di_sel, dc_addr, dcqmem_we_i, biudata_error, dc_block_flush, dc_en, lsu_addr, tagcomp_miss, biudata_valid, biu_write, dcqmem_sel_i, tag_v, tag_valid, burst, mtspr_dc_done, spr_cswe, __obs);

    input                clk;
    input                rst;
    input                dc_en;
    input                dcqmem_cycstb_i;
    input                dcqmem_ci_i;
    input                dcqmem_we_i;
    input         [3:0]  dcqmem_sel_i;
    input                tagcomp_miss;
    input                biudata_valid;
    input                biudata_error;
    input         [31:0] lsu_addr;
    output        [3:0]  dcram_we;
    output               biu_read;
    output               biu_write;
    output               biu_do_sel;
    output               dcram_di_sel;
    output               first_hit_ack;
    output               first_miss_ack;
    output               first_miss_err;
    output               burst;
    output               tag_we;
    output               tag_valid;
    output        [31:0] dc_addr;
    input                dc_no_writethrough;
    output               tag_dirty;
    input                dirty;
    input         [18:0] tag;
    input                tag_v;
    input                dc_block_flush;
    input                dc_block_writeback;
    input         [31:0] spr_dat_i;
    output               mtspr_dc_done;
    input                spr_cswe;
    input                __obs;

    //Parameter Declaration
    reg  [31:0] addr_r = 32'b0;
    wire   biu_do_sel;
    wire   biu_read;
    wire   biu_write;
    wire   biudata_error;
    wire   biudata_valid;
    wire   burst;
    reg  cache_dirty_needs_writeback = 1'b0;
    reg  cache_inhibit = 1'b0;
    wire   cache_inhibit_with_eval;
    reg  cache_miss = 1'b0;
    reg  cache_spr_block_flush = 1'b0;
    reg  cache_spr_block_writeback = 1'b0;
    reg  cache_wb = 1'b0;
    wire   clk;
    reg  [3:0]  cnt = 4'b0;
    wire  [31:0] dc_addr;
    wire   dc_block_flush;
    wire   dc_block_writeback;
    wire   dc_en;
    wire   dc_no_writethrough;
    wire   dcqmem_ci_i;
    wire   dcqmem_cycstb_i;
    wire  [3:0] dcqmem_sel_i;
    wire   dcqmem_we_i;
    wire   dcram_di_sel;
    wire  [3:0] dcram_we;
    wire   dcram_we_after_line_load;
    wire   dcram_we_during_line_load;
    reg  did_early_load_ack = 1'b0;
    wire   dirty;
    wire   first_hit_ack;
    wire   first_miss_ack;
    wire   first_miss_err;
    reg  hitmiss_eval = 1'b0;
    reg  load = 1'b0;
    wire   load_hit_ack;
    wire   load_inhibit_ack;
    wire   load_miss_ack;
    wire  [31:0] lsu_addr;
    wire   mtspr_dc_done;
    wire  [1:0] next_addr_word;
    wire   rst;
    wire   spr_cswe;
    wire  [31:0] spr_dat_i;
    reg  [2:0]  state = 3'b0;
    reg  store = 1'b0;
    wire   store_hit_ack;
    wire   store_hit_writethrough_ack;
    wire   store_inhibit_ack;
    wire   store_miss_ack;
    wire   store_miss_writethrough_ack;
    wire  [18:0] tag;
    wire   tag_dirty;
    wire   tag_v;
    wire   tag_valid;
    wire   tag_we;
    wire   tagcomp_miss;
    wire   tagram_dirty_bit_set;
    wire   tagram_we_end_of_loadstore_loop;
    wire   writethrough;

    assign mtspr_dc_done = 1'b1;

  //assertion( mtspr_dc_done = 1) 0
    assign tagram_dirty_bit_set = 0;

  //assertion( tagram_dirty_bit_set = 0) 1
    assign writethrough = -1;

  //assertion( writethrough = -1) 2
    assign next_addr_word = (addr_r[3:2] + 2'h1);

  //assertion( next_addr_word = Extract(3, 2, addr_r) + 1) 3
    assign dc_addr = ((dc_block_flush & ~|cache_spr_block_flush) | (dc_block_writeback & ~|cache_spr_block_writeback)) ? spr_dat_i : (state == 3'h5) ? addr_r : ((state == 3'h0) | hitmiss_eval) ? lsu_addr : (((state == 3'h2) & biudata_valid) & store) ? {addr_r[31:4], next_addr_word, 2'h0} : addr_r;

  //assertion( dc_addr = If((1 == dc_block_flush & ~bvredor(cache_spr_block_flush) | dc_block_writeback & ~bvredor(cache_spr_block_writeback)) == True, spr_dat_i, If((5 == state) == True, addr_r, If((1 == If((0 == state) == True, 1, 0) | hitmiss_eval) == True, lsu_addr, If((1 == If((2 == state) == True, 1, 0) & biudata_valid & store) == True, Concat(Concat(Extract(31, 4, addr_r), next_addr_word), 0), addr_r))))) 4
    assign burst = (state == 3'h2);

  //assertion( burst = 2 == state) 5
    assign cache_inhibit_with_eval = ((hitmiss_eval & dcqmem_ci_i) | (~|hitmiss_eval & cache_inhibit));

  //assertion( cache_inhibit_with_eval = hitmiss_eval & dcqmem_ci_i | ~bvredor(hitmiss_eval) & cache_inhibit) 6
    assign dcram_we_after_line_load = ((((state == 3'h3) & dcqmem_we_i) & ~|cache_dirty_needs_writeback) & ~|did_early_load_ack);

  //assertion( dcram_we_after_line_load = If((3 == state) == True, 1, 0) & dcqmem_we_i & ~bvredor(cache_dirty_needs_writeback) & ~bvredor(did_early_load_ack)) 7
    assign dcram_we_during_line_load = (((state == 3'h2) & load) & biudata_valid);

  //assertion( dcram_we_during_line_load = If((2 == state) == True, 1, 0) & load & biudata_valid) 8
    assign dcram_we = ((({ 4{ (store_hit_ack | store_hit_writethrough_ack) } } | { 4{ dcram_we_after_line_load } }) & dcqmem_sel_i) | { 4{ dcram_we_during_line_load } });

  //assertion( dcram_we = (Concat(Concat(Concat(store_hit_ack | store_hit_writethrough_ack, store_hit_ack | store_hit_writethrough_ack), store_hit_ack | store_hit_writethrough_ack), store_hit_ack | store_hit_writethrough_ack) | Concat(Concat(Concat(dcram_we_after_line_load, dcram_we_after_line_load), dcram_we_after_line_load), dcram_we_after_line_load)) & dcqmem_sel_i | Concat(Concat(Concat(dcram_we_during_line_load, dcram_we_during_line_load), dcram_we_during_line_load), dcram_we_during_line_load)) 9
    assign tagram_we_end_of_loadstore_loop = (((state == 3'h2) & biudata_valid) & ~|(|cnt));

  //assertion( tagram_we_end_of_loadstore_loop = If((2 == state) == True, 1, 0) & biudata_valid & ~bvredor(bvredor(cnt))) 10
    assign tag_dirty = tagram_dirty_bit_set;

  //assertion( tag_dirty = tagram_dirty_bit_set) 11
    assign tag_we = ((tagram_we_end_of_loadstore_loop | tagram_dirty_bit_set) | (state == 3'h6));

  //assertion( tag_we = tagram_we_end_of_loadstore_loop | tagram_dirty_bit_set | If((6 == state) == True, 1, 0)) 12
    assign tag_valid = ((tagram_we_end_of_loadstore_loop & (load | (store & cache_spr_block_writeback))) | tagram_dirty_bit_set);

  //assertion( tag_valid = tagram_we_end_of_loadstore_loop & (load | store & cache_spr_block_writeback) | tagram_dirty_bit_set) 13
    assign biu_read = (((state == 3'h1) & (((((hitmiss_eval & tagcomp_miss) & ~|dirty) & ~|(store & writethrough)) | (load & cache_inhibit_with_eval)) & dcqmem_cycstb_i)) | ((state == 3'h2) & load));

  //assertion( biu_read = If((1 == state) == True, 1, 0) & (hitmiss_eval & tagcomp_miss & ~bvredor(dirty) & ~bvredor(store & writethrough) | load & cache_inhibit_with_eval) & dcqmem_cycstb_i | If((2 == state) == True, 1, 0) & load) 14
    assign biu_write = ((((state == 3'h1) & ((((hitmiss_eval & tagcomp_miss) & dirty) | (store & writethrough)) | (store & cache_inhibit_with_eval))) & dcqmem_cycstb_i) | ((state == 3'h2) & store));

  //assertion( biu_write = If((1 == state) == True, 1, 0) & (hitmiss_eval & tagcomp_miss & dirty | store & writethrough | store & cache_inhibit_with_eval) & dcqmem_cycstb_i | If((2 == state) == True, 1, 0) & store) 15
    assign dcram_di_sel = load;

  //assertion( dcram_di_sel = load) 16
    assign biu_do_sel = ((state == 3'h2) & store);

  //assertion( biu_do_sel = If((2 == state) == True, 1, 0) & store) 17
    assign first_hit_ack = (((((load_hit_ack | store_hit_ack) | store_hit_writethrough_ack) | store_miss_writethrough_ack) | store_inhibit_ack) | store_miss_ack);

  //assertion( first_hit_ack = load_hit_ack | store_hit_ack | store_hit_writethrough_ack | store_miss_writethrough_ack | store_inhibit_ack | store_miss_ack) 18
    assign first_miss_ack = ((~first_hit_ack) & (load_miss_ack | load_inhibit_ack));

  //assertion( first_miss_ack = ~first_hit_ack & (load_miss_ack | load_inhibit_ack)) 19
    assign load_hit_ack = (((((state == 3'h1) & hitmiss_eval) & ~|tagcomp_miss) & ~|dcqmem_ci_i) & load);

  //assertion( load_hit_ack = If((1 == state) == True, 1, 0) & hitmiss_eval & ~bvredor(tagcomp_miss) & ~bvredor(dcqmem_ci_i) & load) 20
    assign store_hit_ack = ((((((state == 3'h1) & hitmiss_eval) & ~|tagcomp_miss) & ~|dcqmem_ci_i) & store) & ~|writethrough);

  //assertion( store_hit_ack = If((1 == state) == True, 1, 0) & hitmiss_eval & ~bvredor(tagcomp_miss) & ~bvredor(dcqmem_ci_i) & store & ~bvredor(writethrough)) 21
    assign store_hit_writethrough_ack = ((((((state == 3'h1) & ~|cache_miss) & ~|cache_inhibit) & store) & writethrough) & biudata_valid);

  //assertion( store_hit_writethrough_ack = If((1 == state) == True, 1, 0) & ~bvredor(cache_miss) & ~bvredor(cache_inhibit) & store & writethrough & biudata_valid) 22
    assign store_miss_writethrough_ack = ((((((state == 3'h1) & cache_miss) & ~|cache_inhibit) & store) & writethrough) & biudata_valid);

  //assertion( store_miss_writethrough_ack = If((1 == state) == True, 1, 0) & cache_miss & ~bvredor(cache_inhibit) & store & writethrough & biudata_valid) 23
    assign store_inhibit_ack = ((((state == 3'h1) & store) & cache_inhibit) & biudata_valid);

  //assertion( store_inhibit_ack = If((1 == state) == True, 1, 0) & store & cache_inhibit & biudata_valid) 24
    assign load_miss_ack = (((((state == 3'h2) & load) & ({28'h0000000, cnt} == 32'h0000000c)) & biudata_valid) & ~|(dcqmem_we_i & ~|writethrough));

  //assertion( load_miss_ack = If((2 == state) == True, 1, 0) & load & If((12 == Concat(0, cnt)) == True, 1, 0) & biudata_valid & ~bvredor(dcqmem_we_i & ~bvredor(writethrough))) 25
    assign load_inhibit_ack = ((((state == 3'h1) & load) & cache_inhibit) & biudata_valid);

  //assertion( load_inhibit_ack = If((1 == state) == True, 1, 0) & load & cache_inhibit & biudata_valid) 26
    assign store_miss_ack = dcram_we_after_line_load;

  //assertion( store_miss_ack = dcram_we_after_line_load) 27
    assign first_miss_err = (biudata_error & dcqmem_cycstb_i);

  //assertion( first_miss_err = biudata_error & dcqmem_cycstb_i) 28
    //Following code is from line 138
        always @(posedge rst or posedge clk) begin
            if ((rst == 1'b1))
                begin
                    state <= 3'h0;  $display(";A 31");  //assertion( state = 0) 31
                    addr_r <= 32'h00000000;  $display(";A 32");  //assertion( addr_r = 0) 32
                    hitmiss_eval <= 1'b0;  $display(";A 33");  //assertion( hitmiss_eval = 0) 33
                    store <= 1'b0;  $display(";A 34");  //assertion( store = 0) 34
                    load <= 1'b0;  $display(";A 35");  //assertion( load = 0) 35
                    cnt <= 4'h0;  $display(";A 36");  //assertion( cnt = 0) 36
                    cache_miss <= 1'b0;  $display(";A 37");  //assertion( cache_miss = 0) 37
                    cache_dirty_needs_writeback <= 1'b0;  $display(";A 38");  //assertion( cache_dirty_needs_writeback = 0) 38
                    cache_inhibit <= 1'b0;  $display(";A 39");  //assertion( cache_inhibit = 0) 39
                    did_early_load_ack <= 1'b0;  $display(";A 40");  //assertion( did_early_load_ack = 0) 40
                    cache_spr_block_flush <= 1'b0;  $display(";A 41");  //assertion( cache_spr_block_flush = 0) 41
                    cache_spr_block_writeback <= 1'b0;  $display(";A 42");  //assertion( cache_spr_block_writeback = 0) 42
                end
            else
                begin
                    case (state)
                      3'h0:
                        begin
                          $display(";A 43");                          //assertion( 0 == state = True) 43
                            if ((dc_en & (dc_block_flush | dc_block_writeback)))
                                begin
                                  $display(";A 44");                                  //assertion( dc_en & (dc_block_flush | dc_block_writeback) = True) 44
                                    cache_spr_block_flush <= dc_block_flush;  $display(";A 46");  //assertion( cache_spr_block_flush = dc_block_flush) 46
                                    cache_spr_block_writeback <= dc_block_writeback;  $display(";A 47");  //assertion( cache_spr_block_writeback = dc_block_writeback) 47
                                    hitmiss_eval <= 1'b1;  $display(";A 48");  //assertion( hitmiss_eval = 1) 48
                                    state <= 3'h5;  $display(";A 49");  //assertion( state = 5) 49
                                    addr_r <= spr_dat_i;  $display(";A 50");  //assertion( addr_r = spr_dat_i) 50
                                end
                            else
                                begin
                                  $display(";A 45");                                  //assertion( dc_en & (dc_block_flush | dc_block_writeback) = False) 45
                                    if ((dc_en & dcqmem_cycstb_i))
                                        begin
                                          $display(";A 51");                                          //assertion( dc_en & dcqmem_cycstb_i = True) 51
                                            state <= 3'h1;  $display(";A 53");  //assertion( state = 1) 53
                                            hitmiss_eval <= 1'b1;  $display(";A 54");  //assertion( hitmiss_eval = 1) 54
                                            store <= dcqmem_we_i;  $display(";A 55");  //assertion( store = dcqmem_we_i) 55
                                            load <= (~dcqmem_we_i);  $display(";A 56");  //assertion( load = Not(dcqmem_we_i == 1)) 56
                                        end
                                    else
                                          $display(";A 52");                                          //assertion( dc_en & dcqmem_cycstb_i = False) 52
                                end
                        end
                      3'h1:
                        begin
                          $display(";A 57");                          //assertion( 1 == state = True) 57
                            hitmiss_eval <= 1'b0;  $display(";A 58");  //assertion( hitmiss_eval = 0) 58
                            if (hitmiss_eval)
                                begin
                                  $display(";A 59");                                  //assertion( 0 != hitmiss_eval = True) 59
                                    cache_inhibit <= dcqmem_ci_i;  $display(";A 61");  //assertion( cache_inhibit = dcqmem_ci_i) 61
                                    cache_miss <= tagcomp_miss;  $display(";A 62");  //assertion( cache_miss = tagcomp_miss) 62
                                    cache_dirty_needs_writeback <= dirty;  $display(";A 63");  //assertion( cache_dirty_needs_writeback = dirty) 63
                                    addr_r <= lsu_addr;  $display(";A 64");  //assertion( addr_r = lsu_addr) 64
                                end
                            else
                                  $display(";A 60");                                  //assertion( 0 != hitmiss_eval = False) 60
                            if ((((hitmiss_eval & tagcomp_miss) & (~(store & writethrough))) & (~dcqmem_ci_i)))
                                begin
                                  $display(";A 65");                                  //assertion( hitmiss_eval & tagcomp_miss & If(Not(store & writethrough == 1) == True, 1, 0) & If(Not(dcqmem_ci_i == 1) == True, 1, 0) = True) 65
                                    if (dirty)
                                        begin
                                          $display(";A 67");                                          //assertion( 0 != dirty = True) 67
                                            addr_r <= {tag, lsu_addr[12:2], 2'h0};  $display(";A 69");  //assertion( addr_r = Concat(Concat(tag, Extract(12, 2, lsu_addr)), 0)) 69
                                            load <= 1'b0;  $display(";A 70");  //assertion( load = 0) 70
                                            store <= 1'b1;  $display(";A 71");  //assertion( store = 1) 71
                                        end
                                    else
                                        begin
                                          $display(";A 68");                                          //assertion( 0 != dirty = False) 68
                                            addr_r <= lsu_addr;  $display(";A 72");  //assertion( addr_r = lsu_addr) 72
                                            load <= 1'b1;  $display(";A 73");  //assertion( load = 1) 73
                                            store <= 1'b0;  $display(";A 74");  //assertion( store = 0) 74
                                        end
                                    state <= 3'h2;  $display(";A 75");  //assertion( state = 2) 75
                                    cnt <= -4;  $display(";A 76");  //assertion( cnt = -4) 76
                                end
                            else
                                begin
                                  $display(";A 66");                                  //assertion( hitmiss_eval & tagcomp_miss & If(Not(store & writethrough == 1) == True, 1, 0) & If(Not(dcqmem_ci_i == 1) == True, 1, 0) = False) 66
                                    if ((((~dcqmem_cycstb_i) | ((~hitmiss_eval) & (biudata_valid | biudata_error))) | (((hitmiss_eval & (~tagcomp_miss)) & (~dcqmem_ci_i)) & (~(store & writethrough)))))
                                        begin
                                          $display(";A 77");                                          //assertion( If(Not(dcqmem_cycstb_i == 1) == True, 1, 0) | If(Not(hitmiss_eval == 1) == True, 1, 0) & (biudata_valid | biudata_error) | hitmiss_eval & If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(dcqmem_ci_i == 1) == True, 1, 0) & If(Not(store & writethrough == 1) == True, 1, 0) = True) 77
                                            state <= 3'h0;  $display(";A 79");  //assertion( state = 0) 79
                                            load <= 1'b0;  $display(";A 80");  //assertion( load = 0) 80
                                            store <= 1'b0;  $display(";A 81");  //assertion( store = 0) 81
                                            cache_inhibit <= 1'b0;  $display(";A 82");  //assertion( cache_inhibit = 0) 82
                                            cache_dirty_needs_writeback <= 1'b0;  $display(";A 83");  //assertion( cache_dirty_needs_writeback = 0) 83
                                        end
                                    else
                                          $display(";A 78");                                          //assertion( If(Not(dcqmem_cycstb_i == 1) == True, 1, 0) | If(Not(hitmiss_eval == 1) == True, 1, 0) & (biudata_valid | biudata_error) | hitmiss_eval & If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(dcqmem_ci_i == 1) == True, 1, 0) & If(Not(store & writethrough == 1) == True, 1, 0) = False) 78
                                end
                        end
                      3'h2:
                        begin
                          $display(";A 84");                          //assertion( 2 == state = True) 84
                            if (((~dc_en) | biudata_error))
                                begin
                                  $display(";A 85");                                  //assertion( If(Not(dc_en == 1) == True, 1, 0) | biudata_error = True) 85
                                    state <= 3'h0;  $display(";A 87");  //assertion( state = 0) 87
                                    load <= 1'b0;  $display(";A 88");  //assertion( load = 0) 88
                                    store <= 1'b0;  $display(";A 89");  //assertion( store = 0) 89
                                    cnt <= 4'h0;  $display(";A 90");  //assertion( cnt = 0) 90
                                end
                            else
                                  $display(";A 86");                                  //assertion( If(Not(dc_en == 1) == True, 1, 0) | biudata_error = False) 86
                            if ((biudata_valid & (|cnt)))
                                begin
                                  $display(";A 91");                                  //assertion( biudata_valid & bvredor(cnt) = True) 91
                                    cnt <= (cnt - 4'h4);  $display(";A 93");  //assertion( cnt = cnt - 4) 93
                                    addr_r <= {addr_r[31:4], (addr_r[3:2] + 2'h1), addr_r[1:0]};  $display(";A 94");  //assertion( addr_r = Concat(Concat(Extract(31, 4, addr_r), Extract(3, 2, addr_r) + 1), Extract(1, 0, addr_r))) 94
                                end
                            else
                                begin
                                  $display(";A 92");                                  //assertion( biudata_valid & bvredor(cnt) = False) 92
                                    if ((biudata_valid & (~(|cnt))))
                                        begin
                                          $display(";A 95");                                          //assertion( biudata_valid & If(Not(bvredor(cnt) == 1) == True, 1, 0) = True) 95
                                            state <= 3'h3;  $display(";A 97");  //assertion( state = 3) 97
                                            addr_r <= lsu_addr;  $display(";A 98");  //assertion( addr_r = lsu_addr) 98
                                            load <= 1'b0;  $display(";A 99");  //assertion( load = 0) 99
                                            store <= 1'b0;  $display(";A 100");  //assertion( store = 0) 100
                                        end
                                    else
                                          $display(";A 96");                                          //assertion( biudata_valid & If(Not(bvredor(cnt) == 1) == True, 1, 0) = False) 96
                                end
                            if (load_miss_ack)
                                begin
                                  $display(";A 101");                                  //assertion( 0 != load_miss_ack = True) 101
                                    did_early_load_ack <= 1'b1;  $display(";A 103");  //assertion( did_early_load_ack = 1) 103
                                end
                            else
                                  $display(";A 102");                                  //assertion( 0 != load_miss_ack = False) 102
                        end
                      3'h3:
                        begin
                          $display(";A 104");                          //assertion( 3 == state = True) 104
                            if (cache_dirty_needs_writeback)
                                begin
                                  $display(";A 105");                                  //assertion( 0 != cache_dirty_needs_writeback = True) 105
                                    load <= 1'b1;  $display(";A 107");  //assertion( load = 1) 107
                                    cnt <= -4;  $display(";A 108");  //assertion( cnt = -4) 108
                                    addr_r <= lsu_addr;  $display(";A 109");  //assertion( addr_r = lsu_addr) 109
                                    cache_dirty_needs_writeback <= 1'b0;  $display(";A 110");  //assertion( cache_dirty_needs_writeback = 0) 110
                                    state <= 3'h2;  $display(";A 111");  //assertion( state = 2) 111
                                end
                            else
                                begin
                                  $display(";A 106");                                  //assertion( 0 != cache_dirty_needs_writeback = False) 106
                                    if ((cache_spr_block_flush | cache_spr_block_writeback))
                                        begin
                                          $display(";A 112");                                          //assertion( cache_spr_block_flush | cache_spr_block_writeback = True) 112
                                            cache_spr_block_flush <= 1'b0;  $display(";A 114");  //assertion( cache_spr_block_flush = 0) 114
                                            cache_spr_block_writeback <= 1'b0;  $display(";A 115");  //assertion( cache_spr_block_writeback = 0) 115
                                            state <= 3'h7;  $display(";A 116");  //assertion( state = 7) 116
                                        end
                                    else
                                        begin
                                          $display(";A 113");                                          //assertion( cache_spr_block_flush | cache_spr_block_writeback = False) 113
                                            did_early_load_ack <= 1'b0;  $display(";A 117");  //assertion( did_early_load_ack = 0) 117
                                            state <= 3'h4;  $display(";A 118");  //assertion( state = 4) 118
                                        end
                                end
                        end
                      3'h4:
                        begin
                          $display(";A 119");                          //assertion( 4 == state = True) 119
                            state <= 3'h0;  $display(";A 120");  //assertion( state = 0) 120
                        end
                      3'h5:
                        begin
                          $display(";A 121");                          //assertion( 5 == state = True) 121
                            hitmiss_eval <= 1'b0;  $display(";A 122");  //assertion( hitmiss_eval = 0) 122
                            if ((hitmiss_eval & (~tag_v)))
                                begin
                                  $display(";A 123");                                  //assertion( hitmiss_eval & If(Not(tag_v == 1) == True, 1, 0) = True) 123
                                    cache_spr_block_flush <= 1'b0;  $display(";A 125");  //assertion( cache_spr_block_flush = 0) 125
                                    cache_spr_block_writeback <= 1'b0;  $display(";A 126");  //assertion( cache_spr_block_writeback = 0) 126
                                    state <= 3'h7;  $display(";A 127");  //assertion( state = 7) 127
                                end
                            else
                                begin
                                  $display(";A 124");                                  //assertion( hitmiss_eval & If(Not(tag_v == 1) == True, 1, 0) = False) 124
                                    if ((hitmiss_eval & tag_v))
                                        begin
                                          $display(";A 128");                                          //assertion( hitmiss_eval & tag_v = True) 128
                                            if (((cache_spr_block_flush | cache_spr_block_writeback) & dirty))
                                                begin
                                                  $display(";A 130");                                                  //assertion( (cache_spr_block_flush | cache_spr_block_writeback) & dirty = True) 130
                                                    addr_r <= {tag, addr_r[12:2], 2'h0};  $display(";A 132");  //assertion( addr_r = Concat(Concat(tag, Extract(12, 2, addr_r)), 0)) 132
                                                    load <= 1'b0;  $display(";A 133");  //assertion( load = 0) 133
                                                    store <= 1'b1;  $display(";A 134");  //assertion( store = 1) 134
                                                    state <= 3'h2;  $display(";A 135");  //assertion( state = 2) 135
                                                    cnt <= -4;  $display(";A 136");  //assertion( cnt = -4) 136
                                                end
                                            else
                                                begin
                                                  $display(";A 131");                                                  //assertion( (cache_spr_block_flush | cache_spr_block_writeback) & dirty = False) 131
                                                    if ((cache_spr_block_flush & (~dirty)))
                                                        begin
                                                          $display(";A 137");                                                          //assertion( cache_spr_block_flush & If(Not(dirty == 1) == True, 1, 0) = True) 137
                                                            state <= 3'h6;  $display(";A 139");  //assertion( state = 6) 139
                                                        end
                                                    else
                                                        begin
                                                          $display(";A 138");                                                          //assertion( cache_spr_block_flush & If(Not(dirty == 1) == True, 1, 0) = False) 138
                                                            if ((cache_spr_block_writeback & (~dirty)))
                                                                begin
                                                                  $display(";A 140");                                                                  //assertion( cache_spr_block_writeback & If(Not(dirty == 1) == True, 1, 0) = True) 140
                                                                    cache_spr_block_writeback <= 1'b0;  $display(";A 142");  //assertion( cache_spr_block_writeback = 0) 142
                                                                    state <= 3'h7;  $display(";A 143");  //assertion( state = 7) 143
                                                                end
                                                            else
                                                                  $display(";A 141");                                                                  //assertion( cache_spr_block_writeback & If(Not(dirty == 1) == True, 1, 0) = False) 141
                                                        end
                                                end
                                        end
                                    else
                                          $display(";A 129");                                          //assertion( hitmiss_eval & tag_v = False) 129
                                end
                        end
                      3'h6:
                        begin
                          $display(";A 144");                          //assertion( 6 == state = True) 144
                            cache_spr_block_flush <= 1'b0;  $display(";A 145");  //assertion( cache_spr_block_flush = 0) 145
                            if ((~spr_cswe))
                                begin
                                  $display(";A 146");                                  //assertion( Not(spr_cswe == 1) = True) 146
                                    state <= 3'h0;  $display(";A 148");  //assertion( state = 0) 148
                                end
                            else
                                  $display(";A 147");                                  //assertion( Not(spr_cswe == 1) = False) 147
                        end
                      3'h7:
                        begin
                          $display(";A 149");                          //assertion( 7 == state = True) 149
                            if ((~spr_cswe))
                                begin
                                  $display(";A 150");                                  //assertion( Not(spr_cswe == 1) = True) 150
                                    state <= 3'h0;  $display(";A 152");  //assertion( state = 0) 152
                                end
                            else
                                  $display(";A 151");                                  //assertion( Not(spr_cswe == 1) = False) 151
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

endmodule
