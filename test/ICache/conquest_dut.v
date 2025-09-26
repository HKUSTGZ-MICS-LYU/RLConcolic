//Following code is from line 9
module or1200_ic_fsm(icqmem_cycstb_i, saved_addr, tagcomp_miss, start_addr, biu_read, burst, biudata_valid, first_miss_ack, rst, biudata_error, icqmem_ci_i, clk, tag_we, first_hit_ack, icram_we, ic_en, first_miss_err, __obs);

    input                clk;
    input                rst;
    input                ic_en;
    input                icqmem_cycstb_i;
    input                icqmem_ci_i;
    input                tagcomp_miss;
    input                biudata_valid;
    input                biudata_error;
    input         [31:0] start_addr;
    output        [31:0] saved_addr;
    output        [3:0]  icram_we;
    output               biu_read;
    output               first_hit_ack;
    output               first_miss_ack;
    output               first_miss_err;
    output               burst;
    output               tag_we;
    input                __obs;

    //Parameter Declaration
    wire   biu_read;
    wire   biudata_error;
    wire   biudata_valid;
    wire   burst;
    reg  cache_inhibit = 1'b0;
    wire   clk;
    reg  [2:0]  cnt = 3'b0;
    wire   first_hit_ack;
    wire   first_miss_ack;
    wire   first_miss_err;
    reg  hitmiss_eval = 1'b0;
    wire   ic_en;
    wire   icqmem_ci_i;
    wire   icqmem_cycstb_i;
    wire  [3:0] icram_we;
    reg  load = 1'b0;
    wire   rst;
    wire  [31:0] saved_addr;
    reg  [31:0] saved_addr_r = 32'b0;
    wire  [31:0] start_addr;
    reg  [1:0]  state = 2'b0;
    wire   tag_we;
    wire   tagcomp_miss;

    assign icram_we = { 4{ ((biu_read & biudata_valid) & ~|cache_inhibit) } };

  //assertion( icram_we = Concat(Concat(Concat(biu_read & biudata_valid & ~bvredor(cache_inhibit), biu_read & biudata_valid & ~bvredor(cache_inhibit)), biu_read & biudata_valid & ~bvredor(cache_inhibit)), biu_read & biudata_valid & ~bvredor(cache_inhibit))) 0
    assign tag_we = ((biu_read & biudata_valid) & ~|cache_inhibit);

  //assertion( tag_we = biu_read & biudata_valid & ~bvredor(cache_inhibit)) 1
    assign biu_read = ((hitmiss_eval & tagcomp_miss) | (~|hitmiss_eval & load));

  //assertion( biu_read = hitmiss_eval & tagcomp_miss | ~bvredor(hitmiss_eval) & load) 2
    assign saved_addr = saved_addr_r;

  //assertion( saved_addr = saved_addr_r) 3
    assign first_hit_ack = (((((state == 2'h1) & hitmiss_eval) & ~|tagcomp_miss) & ~|cache_inhibit) & ~|icqmem_ci_i);

  //assertion( first_hit_ack = If((1 == state) == True, 1, 0) & hitmiss_eval & ~bvredor(tagcomp_miss) & ~bvredor(cache_inhibit) & ~bvredor(icqmem_ci_i)) 4
    assign first_miss_ack = ((state == 2'h1) & biudata_valid);

  //assertion( first_miss_ack = If((1 == state) == True, 1, 0) & biudata_valid) 5
    assign first_miss_err = ((state == 2'h1) & biudata_error);

  //assertion( first_miss_err = If((1 == state) == True, 1, 0) & biudata_error) 6
    assign burst = ((((state == 2'h1) & tagcomp_miss) & ~|cache_inhibit) | (state == 2'h2));

  //assertion( burst = If((1 == state) == True, 1, 0) & tagcomp_miss & ~bvredor(cache_inhibit) | If((2 == state) == True, 1, 0)) 7
    //Following code is from line 62
        always @(posedge rst or posedge clk) begin
            if (rst)
                begin
                    state <= 2'h0;  $display(";A 10");  //assertion( state = 0) 10
                    saved_addr_r <= 32'h00000000;  $display(";A 11");  //assertion( saved_addr_r = 0) 11
                    hitmiss_eval <= 1'b0;  $display(";A 12");  //assertion( hitmiss_eval = 0) 12
                    load <= 1'b0;  $display(";A 13");  //assertion( load = 0) 13
                    cnt <= 3'h0;  $display(";A 14");  //assertion( cnt = 0) 14
                    cache_inhibit <= 1'b0;  $display(";A 15");  //assertion( cache_inhibit = 0) 15
                end
            else
                begin
                    case (state)
                      2'h0:
                        begin
                          $display(";A 16");                          //assertion( 0 == state = True) 16
                            if ((ic_en & icqmem_cycstb_i))
                                begin
                                  $display(";A 17");                                  //assertion( ic_en & icqmem_cycstb_i = True) 17
                                    state <= 2'h1;  $display(";A 19");  //assertion( state = 1) 19
                                    saved_addr_r <= start_addr;  $display(";A 20");  //assertion( saved_addr_r = start_addr) 20
                                    hitmiss_eval <= 1'b1;  $display(";A 21");  //assertion( hitmiss_eval = 1) 21
                                    load <= 1'b1;  $display(";A 22");  //assertion( load = 1) 22
                                    cache_inhibit <= 1'b0;  $display(";A 23");  //assertion( cache_inhibit = 0) 23
                                end
                            else
                                begin
                                  $display(";A 18");                                  //assertion( ic_en & icqmem_cycstb_i = False) 18
                                    hitmiss_eval <= 1'b0;  $display(";A 24");  //assertion( hitmiss_eval = 0) 24
                                    load <= 1'b0;  $display(";A 25");  //assertion( load = 0) 25
                                    cache_inhibit <= 1'b0;  $display(";A 26");  //assertion( cache_inhibit = 0) 26
                                end
                        end
                      2'h1:
                        begin
                          $display(";A 27");                          //assertion( 1 == state = True) 27
                            if ((icqmem_cycstb_i & icqmem_ci_i))
                                begin
                                  $display(";A 28");                                  //assertion( icqmem_cycstb_i & icqmem_ci_i = True) 28
                                    cache_inhibit <= 1'b1;  $display(";A 30");  //assertion( cache_inhibit = 1) 30
                                end
                            else
                                  $display(";A 29");                                  //assertion( icqmem_cycstb_i & icqmem_ci_i = False) 29
                            if (hitmiss_eval)
                                begin
                                  $display(";A 31");                                  //assertion( 0 != hitmiss_eval = True) 31
                                    saved_addr_r[31:13] <= start_addr[31:13];  $display(";A 33");  //assertion( Extract(31, 13, saved_addr_r) = Extract(31, 13, start_addr)) 33
                                end
                            else
                                  $display(";A 32");                                  //assertion( 0 != hitmiss_eval = False) 32
                            if (((((~ic_en) || (hitmiss_eval & (~icqmem_cycstb_i))) || biudata_error) || (cache_inhibit & biudata_valid)))
                                begin
                                  $display(";A 34");                                  //assertion( Or(If(Or(If(Or(If(Not(ic_en == 1) == True, 1, 0) == 1, hitmiss_eval & If(Not(icqmem_cycstb_i == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, biudata_error == 1) == True, 1, 0) == 1, cache_inhibit & biudata_valid == 1) = True) 34
                                    state <= 2'h0;  $display(";A 36");  //assertion( state = 0) 36
                                    hitmiss_eval <= 1'b0;  $display(";A 37");  //assertion( hitmiss_eval = 0) 37
                                    load <= 1'b0;  $display(";A 38");  //assertion( load = 0) 38
                                    cache_inhibit <= 1'b0;  $display(";A 39");  //assertion( cache_inhibit = 0) 39
                                end
                            else
                                begin
                                  $display(";A 35");                                  //assertion( Or(If(Or(If(Or(If(Not(ic_en == 1) == True, 1, 0) == 1, hitmiss_eval & If(Not(icqmem_cycstb_i == 1) == True, 1, 0) == 1) == True, 1, 0) == 1, biudata_error == 1) == True, 1, 0) == 1, cache_inhibit & biudata_valid == 1) = False) 35
                                    if ((tagcomp_miss & biudata_valid))
                                        begin
                                          $display(";A 40");                                          //assertion( tagcomp_miss & biudata_valid = True) 40
                                            state <= 2'h2;  $display(";A 42");  //assertion( state = 2) 42
                                            saved_addr_r[3:2] <= (saved_addr_r[3:2] + 2'h1);  $display(";A 43");  //assertion( Extract(3, 2, saved_addr_r) = Extract(3, 2, saved_addr_r) + 1) 43
                                            hitmiss_eval <= 1'b0;  $display(";A 44");  //assertion( hitmiss_eval = 0) 44
                                            cnt <= 2;  $display(";A 45");  //assertion( cnt = 2) 45
                                            cache_inhibit <= 1'b0;  $display(";A 46");  //assertion( cache_inhibit = 0) 46
                                        end
                                    else
                                        begin
                                          $display(";A 41");                                          //assertion( tagcomp_miss & biudata_valid = False) 41
                                            if (((~tagcomp_miss) & (~icqmem_ci_i)))
                                                begin
                                                  $display(";A 47");                                                  //assertion( If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(icqmem_ci_i == 1) == True, 1, 0) = True) 47
                                                    saved_addr_r <= start_addr;  $display(";A 49");  //assertion( saved_addr_r = start_addr) 49
                                                    cache_inhibit <= 1'b0;  $display(";A 50");  //assertion( cache_inhibit = 0) 50
                                                end
                                            else
                                                begin
                                                  $display(";A 48");                                                  //assertion( If(Not(tagcomp_miss == 1) == True, 1, 0) & If(Not(icqmem_ci_i == 1) == True, 1, 0) = False) 48
                                                    if ((~icqmem_cycstb_i))
                                                        begin
                                                          $display(";A 51");                                                          //assertion( Not(icqmem_cycstb_i == 1) = True) 51
                                                            state <= 2'h0;  $display(";A 53");  //assertion( state = 0) 53
                                                            hitmiss_eval <= 1'b0;  $display(";A 54");  //assertion( hitmiss_eval = 0) 54
                                                            load <= 1'b0;  $display(";A 55");  //assertion( load = 0) 55
                                                            cache_inhibit <= 1'b0;  $display(";A 56");  //assertion( cache_inhibit = 0) 56
                                                        end
                                                    else
                                                        begin
                                                          $display(";A 52");                                                          //assertion( Not(icqmem_cycstb_i == 1) = False) 52
                                                            hitmiss_eval <= 1'b0;  $display(";A 57");  //assertion( hitmiss_eval = 0) 57
                                                        end
                                                end
                                        end
                                end
                        end
                      2'h2:
                        begin
                          $display(";A 58");                          //assertion( 2 == state = True) 58
                            if ((biudata_valid && (|cnt)))
                                begin
                                  $display(";A 59");                                  //assertion( And(biudata_valid == 1, bvredor(cnt) == 1) = True) 59
                                    cnt <= (cnt - 3'h1);  $display(";A 61");  //assertion( cnt = cnt - 1) 61
                                    saved_addr_r[3:2] <= (saved_addr_r[3:2] + 2'h1);  $display(";A 62");  //assertion( Extract(3, 2, saved_addr_r) = Extract(3, 2, saved_addr_r) + 1) 62
                                end
                            else
                                begin
                                  $display(";A 60");                                  //assertion( And(biudata_valid == 1, bvredor(cnt) == 1) = False) 60
                                    if (biudata_valid)
                                        begin
                                          $display(";A 63");                                          //assertion( 0 != biudata_valid = True) 63
                                            state <= 2'h0;  $display(";A 65");  //assertion( state = 0) 65
                                            saved_addr_r <= start_addr;  $display(";A 66");  //assertion( saved_addr_r = start_addr) 66
                                            hitmiss_eval <= 1'b0;  $display(";A 67");  //assertion( hitmiss_eval = 0) 67
                                            load <= 1'b0;  $display(";A 68");  //assertion( load = 0) 68
                                        end
                                    else
                                          $display(";A 64");                                          //assertion( 0 != biudata_valid = False) 64
                                end
                        end
                      default:
                        begin
                          $display(";A 69");                          //assertion( If(0 != state == True, 1, 0) & If(1 != state == True, 1, 0) & If(2 != state == True, 1, 0) = True) 69
                            state <= 2'h0;  $display(";A 70");  //assertion( state = 0) 70
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

endmodule
