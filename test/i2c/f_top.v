module top(
    input wb_clk_i,
    input wb_rst_i,
    input arst_i,
    input [2:0] wb_adr_i,
    input [7:0] wb_dat_i,
    output reg [7:0] wb_dat_o,
    input wb_we_i,
    input wb_stb_i,
    input wb_cyc_i,
    output reg wb_ack_o,
    output reg wb_inta_o,
    input scl_pad_i,
    output scl_pad_o,
    output reg scl_padoen_o, // 修改为 reg 类型
    input sda_pad_i,
    output sda_pad_o,
    output reg sda_padoen_o  // 修改为 reg 类型
    );

    wire top___wb_clk_i;
    wire top___wb_rst_i;
    wire top___arst_i;
    wire [2:0] top___wb_adr_i;
    wire [7:0] top___wb_dat_i;
    wire [7:0] top___wb_dat_o;
    wire top___wb_we_i;
    wire top___wb_stb_i;
    wire top___wb_cyc_i;
    wire top___wb_ack_o;
    wire top___wb_inta_o;
    wire top___scl_pad_i;
    wire top___scl_pad_o;
    wire top___scl_padoen_o;
    wire top___sda_pad_i;
    wire top___sda_pad_o;
    wire top___sda_padoen_o;
    parameter top___ARST_LVL = 1'h0;
    reg [15:0] top___prer;
    reg [7:0] top___ctr;
    reg [7:0] top___txr;
    wire [7:0] top___rxr;
    reg [7:0] top___cr;
    wire [7:0] top___sr;
    reg top___done;
    wire top___core_en;
    wire top___ien;
    reg top___irxack;
    reg top___rxack;
    reg top___tip;
    reg top___irq_flag;
    reg top___i2c_busy;
    reg top___i2c_al;
    reg top___al;
    wire top___rst_i;
    wire top___wb_wacc;
    wire top___sta;
    wire top___sto;
    wire top___rd;
    wire top___wr;
    wire top___ack;
    wire top___iack;
    wire top___byte_controller___clk;
    wire top___byte_controller___rst;
    wire top___byte_controller___nReset;
    wire top___byte_controller___ena;
    wire [15:0] top___byte_controller___clk_cnt;
    wire top___byte_controller___start;
    wire top___byte_controller___stop;
    wire top___byte_controller___read;
    wire top___byte_controller___write;
    wire top___byte_controller___ack_in;
    wire [7:0] top___byte_controller___din;
    wire top___byte_controller___cmd_ack;
    wire top___byte_controller___ack_out;
    wire [7:0] top___byte_controller___dout;
    wire top___byte_controller___i2c_busy;
    wire top___byte_controller___i2c_al;
    wire top___byte_controller___scl_i;
    wire top___byte_controller___scl_o;
    wire top___byte_controller___scl_oen;
    wire top___byte_controller___sda_i;
    wire top___byte_controller___sda_o;
    wire top___byte_controller___sda_oen;
    parameter [4:0] top___byte_controller___ST_IDLE = 5'h0;
    parameter [4:0] top___byte_controller___ST_START = 5'h1;
    parameter [4:0] top___byte_controller___ST_READ = 5'h2;
    parameter [4:0] top___byte_controller___ST_WRITE = 5'h4;
    parameter [4:0] top___byte_controller___ST_ACK = 5'h8;
    parameter [4:0] top___byte_controller___ST_STOP = 5'h10;
    reg [3:0] top___byte_controller___core_cmd;
    reg top___byte_controller___core_txd;
    reg top___byte_controller___core_ack;
    reg top___byte_controller___core_rxd;
    reg [7:0] top___byte_controller___sr;
    reg top___byte_controller___shift;
    reg top___byte_controller___ld;
    wire top___byte_controller___go;
    reg [2:0] top___byte_controller___dcnt;
    wire top___byte_controller___cnt_done;
    reg [4:0] top___byte_controller___c_state;
    wire top___byte_controller___bit_controller___clk;
    wire top___byte_controller___bit_controller___rst;
    wire top___byte_controller___bit_controller___nReset;
    wire top___byte_controller___bit_controller___ena;
    wire [15:0] top___byte_controller___bit_controller___clk_cnt;
    wire [3:0] top___byte_controller___bit_controller___cmd;
    wire top___byte_controller___bit_controller___cmd_ack;
    wire top___byte_controller___bit_controller___busy;
    wire top___byte_controller___bit_controller___al;
    wire top___byte_controller___bit_controller___din;
    wire top___byte_controller___bit_controller___dout;
    wire top___byte_controller___bit_controller___scl_i;
    wire top___byte_controller___bit_controller___scl_o;
    assign top___byte_controller___bit_controller___scl_o = 1'h0;
    wire top___byte_controller___bit_controller___scl_oen;
    wire top___byte_controller___bit_controller___sda_i;
    wire top___byte_controller___bit_controller___sda_o;
    assign top___byte_controller___bit_controller___sda_o = 1'h0;
    wire top___byte_controller___bit_controller___sda_oen;
    reg [1:0] top___byte_controller___bit_controller___cSCL;
    reg [1:0] top___byte_controller___bit_controller___cSDA;
    reg [2:0] top___byte_controller___bit_controller___fSCL;
    reg [2:0] top___byte_controller___bit_controller___fSDA;
    reg top___byte_controller___bit_controller___sSCL;
    reg top___byte_controller___bit_controller___sSDA;
    reg top___byte_controller___bit_controller___dSCL;
    reg top___byte_controller___bit_controller___dSDA;
    reg top___byte_controller___bit_controller___dscl_oen;
    reg top___byte_controller___bit_controller___sda_chk;
    reg top___byte_controller___bit_controller___clk_en;
    reg top___byte_controller___bit_controller___slave_wait;
    reg [15:0] top___byte_controller___bit_controller___cnt;
    reg [13:0] top___byte_controller___bit_controller___filter_cnt;
    reg [17:0] top___byte_controller___bit_controller___c_state;
    wire top___byte_controller___bit_controller___scl_sync;
    reg top___byte_controller___bit_controller___sta_condition;
    reg top___byte_controller___bit_controller___sto_condition;
    reg top___byte_controller___bit_controller___cmd_stop;
    parameter [17:0] top___byte_controller___bit_controller___idle = 18'h0;
    parameter [17:0] top___byte_controller___bit_controller___start_a = 18'h1;
    parameter [17:0] top___byte_controller___bit_controller___start_b = 18'h2;
    parameter [17:0] top___byte_controller___bit_controller___start_c = 18'h4;
    parameter [17:0] top___byte_controller___bit_controller___start_d = 18'h8;
    parameter [17:0] top___byte_controller___bit_controller___start_e = 18'h10;
    parameter [17:0] top___byte_controller___bit_controller___stop_a = 18'h20;
    parameter [17:0] top___byte_controller___bit_controller___stop_b = 18'h40;
    parameter [17:0] top___byte_controller___bit_controller___stop_c = 18'h80;
    parameter [17:0] top___byte_controller___bit_controller___stop_d = 18'h100;
    parameter [17:0] top___byte_controller___bit_controller___rd_a = 18'h200;
    parameter [17:0] top___byte_controller___bit_controller___rd_b = 18'h400;
    parameter [17:0] top___byte_controller___bit_controller___rd_c = 18'h800;
    parameter [17:0] top___byte_controller___bit_controller___rd_d = 18'h1000;
    parameter [17:0] top___byte_controller___bit_controller___wr_a = 18'h2000;
    parameter [17:0] top___byte_controller___bit_controller___wr_b = 18'h4000;
    parameter [17:0] top___byte_controller___bit_controller___wr_c = 18'h8000;
    parameter [17:0] top___byte_controller___bit_controller___wr_d = 18'h10000;
    assign top___wb_clk_i = wb_clk_i;
    assign top___wb_rst_i = wb_rst_i;
    assign top___arst_i = arst_i;
    assign top___wb_adr_i = wb_adr_i;
    assign top___wb_dat_i = wb_dat_i;
    assign top___wb_dat_o = wb_dat_o;
    assign top___wb_we_i = wb_we_i;
    assign top___wb_stb_i = wb_stb_i;
    assign top___wb_cyc_i = wb_cyc_i;
    assign top___wb_ack_o = wb_ack_o;
    assign top___wb_inta_o = wb_inta_o;
    assign top___scl_pad_i = scl_pad_i;
    assign top___scl_pad_o = scl_pad_o;
    assign top___scl_padoen_o = scl_padoen_o;
    assign top___sda_pad_i = sda_pad_i;
    assign top___sda_pad_o = sda_pad_o;
    assign top___sda_padoen_o = sda_padoen_o;
    assign top___rst_i = arst_i;
    assign top___wb_wacc = (wb_we_i & wb_ack_o);
    always @(posedge wb_clk_i) begin
        wb_ack_o <= ((wb_cyc_i & wb_stb_i) & ~(wb_ack_o));
    end
    always @(posedge wb_clk_i) begin
        case (wb_adr_i)
            3'h0: begin
                wb_dat_o <= top___prer[7:0];
            end
            3'h1: begin
                wb_dat_o <= top___prer[15:8];
            end
            3'h2: begin
                wb_dat_o <= top___ctr;
            end
            3'h3: begin
                wb_dat_o <= top___rxr;
            end
            3'h4: begin
                wb_dat_o <= top___sr;
            end
            3'h5: begin
                wb_dat_o <= top___txr;
            end
            3'h6: begin
                wb_dat_o <= top___cr;
            end
            3'h7: begin
                wb_dat_o <= 8'h0;
            end
        endcase
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if (wb_rst_i) begin
                top___prer <= 16'hffff;
                top___ctr <= 8'h0;
                top___txr <= 8'h0;
            end else begin
                if (top___wb_wacc) begin
                    case (wb_adr_i)
                        3'h0: begin
                            top___prer[7:0] <= wb_dat_i;
                        end
                        3'h1: begin
                            top___prer[15:8] <= wb_dat_i;
                        end
                        3'h2: begin
                            top___ctr <= wb_dat_i;
                        end
                        3'h3: begin
                            top___txr <= wb_dat_i;
                        end
                        default: begin
                        end
                    endcase
                end
            end
        end else begin
            top___prer <= 16'hffff;
            top___ctr <= 8'h0;
            top___txr <= 8'h0;
        end
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if (wb_rst_i) begin
                top___cr <= 8'h0;
            end else begin
                if (top___wb_wacc) begin
                    if ((top___core_en & (3'h4 == wb_adr_i))) begin
                        top___cr <= wb_dat_i;
                    end
                end else begin
                    if ((top___done | top___i2c_al)) begin
                        top___cr[7:4] <= 4'h0;
                    end
                    top___cr[2:0] <= 3'h0;
                end
            end
        end else begin
            top___cr <= 8'h0;
        end
    end
    assign top___sta = top___cr[7];
    assign top___sto = top___cr[6];
    assign top___rd = top___cr[5];
    assign top___wr = top___cr[4];
    assign top___ack = top___cr[3];
    assign top___iack = top___cr[0];
    assign top___core_en = top___ctr[7];
    assign top___ien = top___ctr[6];
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if (wb_rst_i) begin
                top___al <= 1'h0;
                top___rxack <= 1'h0;
                top___tip <= 1'h0;
                top___irq_flag <= 1'h0;
            end else begin
                top___al <= (top___i2c_al | (top___al & ~(top___sta)));
                top___rxack <= top___irxack;
                top___tip <= (top___rd | top___wr);
                top___irq_flag <= (((top___done | top___i2c_al) | top___irq_flag) & ~(top___iack));
            end
        end else begin
            top___al <= 1'h0;
            top___rxack <= 1'h0;
            top___tip <= 1'h0;
            top___irq_flag <= 1'h0;
        end
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        wb_inta_o <= (top___rst_i & (~(wb_rst_i) & (top___irq_flag & top___ien)));
    end
    assign top___sr[7:2] = {top___rxack, top___i2c_busy, top___al, 3'h0};
    assign top___sr[1:0] = {top___tip, top___irq_flag};
    assign top___byte_controller___clk = top___wb_clk_i;
    assign top___byte_controller___rst = top___wb_rst_i;
    assign top___byte_controller___nReset = top___rst_i;
    assign top___byte_controller___ena = top___core_en;
    assign top___byte_controller___clk_cnt = top___prer;
    assign top___byte_controller___start = top___sta;
    assign top___byte_controller___stop = top___sto;
    assign top___byte_controller___read = top___rd;
    assign top___byte_controller___write = top___wr;
    assign top___byte_controller___ack_in = top___ack;
    assign top___byte_controller___din = top___txr;
    assign top___byte_controller___cmd_ack = top___done;
    assign top___byte_controller___ack_out = top___irxack;
    assign top___byte_controller___dout = top___rxr;
    assign top___byte_controller___i2c_busy = top___i2c_busy;
    assign top___byte_controller___i2c_al = top___i2c_al;
    assign top___byte_controller___scl_i = top___scl_pad_i;
    assign top___byte_controller___scl_o = top___scl_pad_o;
    assign top___byte_controller___scl_oen = top___scl_padoen_o;
    assign top___byte_controller___sda_i = top___sda_pad_i;
    assign top___byte_controller___sda_o = top___sda_pad_o;
    assign top___byte_controller___sda_oen = top___sda_padoen_o;
    assign top___byte_controller___go = (((top___rd | top___wr) | top___sto) & ~(top___done));
    assign top___rxr = top___byte_controller___sr;
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if (wb_rst_i) begin
                top___byte_controller___sr <= 8'h0;
            end else begin
                if (top___byte_controller___ld) begin
                    top___byte_controller___sr <= top___txr;
                end else begin
                    if (top___byte_controller___shift) begin
                        top___byte_controller___sr <= {top___byte_controller___sr[6:0], top___byte_controller___core_rxd};
                    end
                end
            end
        end else begin
            top___byte_controller___sr <= 8'h0;
        end
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if (wb_rst_i) begin
                top___byte_controller___dcnt <= 3'h0;
            end else begin
                if (top___byte_controller___ld) begin
                    top___byte_controller___dcnt <= 3'h7;
                end else begin
                    if (top___byte_controller___shift) begin
                        top___byte_controller___dcnt <= (top___byte_controller___dcnt - 3'h1);
                    end
                end
            end
        end else begin
            top___byte_controller___dcnt <= 3'h0;
        end
    end
    assign top___byte_controller___cnt_done = ~(|(top___byte_controller___dcnt));
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if ((wb_rst_i | top___i2c_al)) begin
                top___byte_controller___core_cmd <= 4'h0;
                top___byte_controller___core_txd <= 1'h0;
                top___byte_controller___shift <= 1'h0;
                top___byte_controller___ld <= 1'h0;
                top___done <= 1'h0;
                top___byte_controller___c_state <= 5'h0;
                top___irxack <= 1'h0;
            end else begin
                top___byte_controller___core_txd <= top___byte_controller___sr[7];
                top___byte_controller___shift <= 1'h0;
                top___byte_controller___ld <= 1'h0;
                top___done <= 1'h0;
                case (top___byte_controller___c_state)
                    5'h0: begin
                        if (top___byte_controller___go) begin
                            if (top___sta) begin
                                top___byte_controller___c_state <= 5'h1;
                                top___byte_controller___core_cmd <= 4'h1;
                            end else begin
                                if (top___rd) begin
                                    top___byte_controller___c_state <= 5'h2;
                                    top___byte_controller___core_cmd <= 4'h8;
                                end else begin
                                    if (top___wr) begin
                                        top___byte_controller___c_state <= 5'h4;
                                        top___byte_controller___core_cmd <= 4'h4;
                                    end else begin
                                        top___byte_controller___c_state <= 5'h10;
                                        top___byte_controller___core_cmd <= 4'h2;
                                    end
                                end
                            end
                            top___byte_controller___ld <= 1'h1;
                        end
                    end
                    5'h1: begin
                        if (top___byte_controller___core_ack) begin
                            if (top___rd) begin
                                top___byte_controller___c_state <= 5'h2;
                                top___byte_controller___core_cmd <= 4'h8;
                            end else begin
                                top___byte_controller___c_state <= 5'h4;
                                top___byte_controller___core_cmd <= 4'h4;
                            end
                            top___byte_controller___ld <= 1'h1;
                        end
                    end
                    5'h4: begin
                        if (top___byte_controller___core_ack) begin
                            if (top___byte_controller___cnt_done) begin
                                top___byte_controller___c_state <= 5'h8;
                                top___byte_controller___core_cmd <= 4'h8;
                            end else begin
                                top___byte_controller___c_state <= 5'h4;
                                top___byte_controller___core_cmd <= 4'h4;
                                top___byte_controller___shift <= 1'h1;
                            end
                        end
                    end
                    5'h2: begin
                        if (top___byte_controller___core_ack) begin
                            if (top___byte_controller___cnt_done) begin
                                top___byte_controller___c_state <= 5'h8;
                                top___byte_controller___core_cmd <= 4'h4;
                            end else begin
                                top___byte_controller___c_state <= 5'h2;
                                top___byte_controller___core_cmd <= 4'h8;
                            end
                            top___byte_controller___shift <= 1'h1;
                            top___byte_controller___core_txd <= top___ack;
                        end
                    end
                    5'h8: begin
                        if (top___byte_controller___core_ack) begin
                            if (top___sto) begin
                                top___byte_controller___c_state <= 5'h10;
                                top___byte_controller___core_cmd <= 4'h2;
                            end else begin
                                top___byte_controller___c_state <= 5'h0;
                                top___byte_controller___core_cmd <= 4'h0;
                                top___done <= 1'h1;
                            end
                            top___irxack <= top___byte_controller___core_rxd;
                            top___byte_controller___core_txd <= 1'h1;
                        end else begin
                            top___byte_controller___core_txd <= top___ack;
                        end
                    end
                    5'h10: begin
                        if (top___byte_controller___core_ack) begin
                            top___byte_controller___c_state <= 5'h0;
                            top___byte_controller___core_cmd <= 4'h0;
                            top___done <= 1'h1;
                        end
                    end
                endcase
            end
        end else begin
            top___byte_controller___core_cmd <= 4'h0;
            top___byte_controller___core_txd <= 1'h0;
            top___byte_controller___shift <= 1'h0;
            top___byte_controller___ld <= 1'h0;
            top___done <= 1'h0;
            top___byte_controller___c_state <= 5'h0;
            top___irxack <= 1'h0;
        end
    end
    assign top___byte_controller___bit_controller___clk = top___byte_controller___clk;
    assign top___byte_controller___bit_controller___rst = top___byte_controller___rst;
    assign top___byte_controller___bit_controller___nReset = top___byte_controller___nReset;
    assign top___byte_controller___bit_controller___ena = top___byte_controller___ena;
    assign top___byte_controller___bit_controller___clk_cnt = top___byte_controller___clk_cnt;
    assign top___byte_controller___bit_controller___cmd = top___byte_controller___core_cmd;
    assign top___byte_controller___bit_controller___cmd_ack = top___byte_controller___core_ack;
    assign top___byte_controller___bit_controller___busy = top___byte_controller___i2c_busy;
    assign top___byte_controller___bit_controller___al = top___byte_controller___i2c_al;
    assign top___byte_controller___bit_controller___din = top___byte_controller___core_txd;
    assign top___byte_controller___bit_controller___dout = top___byte_controller___core_rxd;
    assign top___byte_controller___bit_controller___scl_i = top___byte_controller___scl_i;
    assign top___byte_controller___bit_controller___scl_o = top___byte_controller___scl_o;
    assign top___byte_controller___bit_controller___scl_oen = top___byte_controller___scl_oen;
    assign top___byte_controller___bit_controller___sda_i = top___byte_controller___sda_i;
    assign top___byte_controller___bit_controller___sda_o = top___byte_controller___sda_o;
    assign top___byte_controller___bit_controller___sda_oen = top___byte_controller___sda_oen;
    always @(posedge wb_clk_i) begin
        top___byte_controller___bit_controller___dscl_oen <= scl_padoen_o;
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        top___byte_controller___bit_controller___slave_wait <= (top___rst_i & (((scl_padoen_o & ~(top___byte_controller___bit_controller___dscl_oen)) & ~(top___byte_controller___bit_controller___sSCL)) | (top___byte_controller___bit_controller___slave_wait & ~(top___byte_controller___bit_controller___sSCL))));
    end
    assign top___byte_controller___bit_controller___scl_sync = ((top___byte_controller___bit_controller___dSCL & ~(top___byte_controller___bit_controller___sSCL)) & scl_padoen_o);
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if ((((wb_rst_i | ~(|(top___byte_controller___bit_controller___cnt))) | ~(top___core_en)) | top___byte_controller___bit_controller___scl_sync)) begin
                top___byte_controller___bit_controller___cnt <= top___prer;
                top___byte_controller___bit_controller___clk_en <= 1'h1;
            end else begin
                if (top___byte_controller___bit_controller___slave_wait) begin
                    top___byte_controller___bit_controller___cnt <= top___byte_controller___bit_controller___cnt;
                    top___byte_controller___bit_controller___clk_en <= 1'h0;
                end else begin
                    top___byte_controller___bit_controller___cnt <= (top___byte_controller___bit_controller___cnt - 16'h1);
                    top___byte_controller___bit_controller___clk_en <= 1'h0;
                end
            end
        end else begin
            top___byte_controller___bit_controller___cnt <= 16'h0;
            top___byte_controller___bit_controller___clk_en <= 1'h1;
        end
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if (wb_rst_i) begin
                top___byte_controller___bit_controller___cSCL <= 2'h0;
                top___byte_controller___bit_controller___cSDA <= 2'h0;
            end else begin
                top___byte_controller___bit_controller___cSCL <= {top___byte_controller___bit_controller___cSCL[0], scl_pad_i};
                top___byte_controller___bit_controller___cSDA <= {top___byte_controller___bit_controller___cSDA[0], sda_pad_i};
            end
        end else begin
            top___byte_controller___bit_controller___cSCL <= 2'h0;
            top___byte_controller___bit_controller___cSDA <= 2'h0;
        end
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        top___byte_controller___bit_controller___filter_cnt <= (top___rst_i) ? ((wb_rst_i | ~(top___core_en)) ? 14'h0 : (|(top___byte_controller___bit_controller___filter_cnt) ? (top___byte_controller___bit_controller___filter_cnt - 14'h1) : top___prer[15:2])) : 14'h0;
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if (wb_rst_i) begin
                top___byte_controller___bit_controller___fSCL <= 3'h7;
                top___byte_controller___bit_controller___fSDA <= 3'h7;
            end else begin
                if (~(|(top___byte_controller___bit_controller___filter_cnt))) begin
                    top___byte_controller___bit_controller___fSCL <= {top___byte_controller___bit_controller___fSCL[1:0], top___byte_controller___bit_controller___cSCL[1]};
                    top___byte_controller___bit_controller___fSDA <= {top___byte_controller___bit_controller___fSDA[1:0], top___byte_controller___bit_controller___cSDA[1]};
                end
            end
        end else begin
            top___byte_controller___bit_controller___fSCL <= 3'h7;
            top___byte_controller___bit_controller___fSDA <= 3'h7;
        end
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if (wb_rst_i) begin
                top___byte_controller___bit_controller___sSCL <= 1'h1;
                top___byte_controller___bit_controller___sSDA <= 1'h1;
                top___byte_controller___bit_controller___dSCL <= 1'h1;
                top___byte_controller___bit_controller___dSDA <= 1'h1;
            end else begin
                top___byte_controller___bit_controller___sSCL <= ((&(top___byte_controller___bit_controller___fSCL[2:1]) | &(top___byte_controller___bit_controller___fSCL[1:0])) | (top___byte_controller___bit_controller___fSCL[2] & top___byte_controller___bit_controller___fSCL[0]));
                top___byte_controller___bit_controller___sSDA <= ((&(top___byte_controller___bit_controller___fSDA[2:1]) | &(top___byte_controller___bit_controller___fSDA[1:0])) | (top___byte_controller___bit_controller___fSDA[2] & top___byte_controller___bit_controller___fSDA[0]));
                top___byte_controller___bit_controller___dSCL <= top___byte_controller___bit_controller___sSCL;
                top___byte_controller___bit_controller___dSDA <= top___byte_controller___bit_controller___sSDA;
            end
        end else begin
            top___byte_controller___bit_controller___sSCL <= 1'h1;
            top___byte_controller___bit_controller___sSDA <= 1'h1;
            top___byte_controller___bit_controller___dSCL <= 1'h1;
            top___byte_controller___bit_controller___dSDA <= 1'h1;
        end
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if (wb_rst_i) begin
                top___byte_controller___bit_controller___sta_condition <= 1'h0;
                top___byte_controller___bit_controller___sto_condition <= 1'h0;
            end else begin
                top___byte_controller___bit_controller___sta_condition <= ((~(top___byte_controller___bit_controller___sSDA) & top___byte_controller___bit_controller___dSDA) & top___byte_controller___bit_controller___sSCL);
                top___byte_controller___bit_controller___sto_condition <= ((top___byte_controller___bit_controller___sSDA & ~(top___byte_controller___bit_controller___dSDA)) & top___byte_controller___bit_controller___sSCL);
            end
        end else begin
            top___byte_controller___bit_controller___sta_condition <= 1'h0;
            top___byte_controller___bit_controller___sto_condition <= 1'h0;
        end
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        top___i2c_busy <= (top___rst_i & (~(wb_rst_i) & ((top___byte_controller___bit_controller___sta_condition | top___i2c_busy) & ~(top___byte_controller___bit_controller___sto_condition))));
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if (wb_rst_i) begin
                top___byte_controller___bit_controller___cmd_stop <= 1'h0;
            end else begin
                if (top___byte_controller___bit_controller___clk_en) begin
                    top___byte_controller___bit_controller___cmd_stop <= (4'h2 == top___byte_controller___core_cmd);
                end
            end
        end else begin
            top___byte_controller___bit_controller___cmd_stop <= 1'h0;
        end
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        top___i2c_al <= (top___rst_i & (~(wb_rst_i) & (((top___byte_controller___bit_controller___sda_chk & ~(top___byte_controller___bit_controller___sSDA)) & sda_padoen_o) | ((|(top___byte_controller___bit_controller___c_state) & top___byte_controller___bit_controller___sto_condition) & ~(top___byte_controller___bit_controller___cmd_stop)))));
    end
    always @(posedge wb_clk_i) begin
        if ((top___byte_controller___bit_controller___sSCL & ~(top___byte_controller___bit_controller___dSCL))) begin
            top___byte_controller___core_rxd <= top___byte_controller___bit_controller___sSDA;
        end
    end
    always @(negedge top___rst_i or posedge wb_clk_i) begin
        if (top___rst_i) begin
            if ((wb_rst_i | top___i2c_al)) begin
                top___byte_controller___bit_controller___c_state <= 18'h0;
                top___byte_controller___core_ack <= 1'h0;
                scl_padoen_o <= 1'h1;
                sda_padoen_o <= 1'h1;
                top___byte_controller___bit_controller___sda_chk <= 1'h0;
            end else begin
                top___byte_controller___core_ack <= 1'h0;
                if (top___byte_controller___bit_controller___clk_en) begin
                    case (top___byte_controller___bit_controller___c_state)
                        18'h0: begin
                            case (top___byte_controller___core_cmd)
                                4'h1: begin
                                    top___byte_controller___bit_controller___c_state <= 18'h1;
                                end
                                4'h2: begin
                                    top___byte_controller___bit_controller___c_state <= 18'h20;
                                end
                                4'h4: begin
                                    top___byte_controller___bit_controller___c_state <= 18'h2000;
                                end
                                4'h8: begin
                                    top___byte_controller___bit_controller___c_state <= 18'h200;
                                end
                                default: begin
                                    top___byte_controller___bit_controller___c_state <= 18'h0;
                                end
                            endcase
                            scl_padoen_o <= scl_padoen_o;
                            sda_padoen_o <= sda_padoen_o;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h1: begin
                            top___byte_controller___bit_controller___c_state <= 18'h2;
                            scl_padoen_o <= scl_padoen_o;
                            sda_padoen_o <= 1'h1;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h2: begin
                            top___byte_controller___bit_controller___c_state <= 18'h4;
                            scl_padoen_o <= 1'h1;
                            sda_padoen_o <= 1'h1;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h4: begin
                            top___byte_controller___bit_controller___c_state <= 18'h8;
                            scl_padoen_o <= 1'h1;
                            sda_padoen_o <= 1'h0;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h8: begin
                            top___byte_controller___bit_controller___c_state <= 18'h10;
                            scl_padoen_o <= 1'h1;
                            sda_padoen_o <= 1'h0;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h10: begin
                            top___byte_controller___bit_controller___c_state <= 18'h0;
                            top___byte_controller___core_ack <= 1'h1;
                            scl_padoen_o <= 1'h0;
                            sda_padoen_o <= 1'h0;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h20: begin
                            top___byte_controller___bit_controller___c_state <= 18'h40;
                            scl_padoen_o <= 1'h0;
                            sda_padoen_o <= 1'h0;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h40: begin
                            top___byte_controller___bit_controller___c_state <= 18'h80;
                            scl_padoen_o <= 1'h1;
                            sda_padoen_o <= 1'h0;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h80: begin
                            top___byte_controller___bit_controller___c_state <= 18'h100;
                            scl_padoen_o <= 1'h1;
                            sda_padoen_o <= 1'h0;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h100: begin
                            top___byte_controller___bit_controller___c_state <= 18'h0;
                            top___byte_controller___core_ack <= 1'h1;
                            scl_padoen_o <= 1'h1;
                            sda_padoen_o <= 1'h1;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h200: begin
                            top___byte_controller___bit_controller___c_state <= 18'h400;
                            scl_padoen_o <= 1'h0;
                            sda_padoen_o <= 1'h1;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h400: begin
                            top___byte_controller___bit_controller___c_state <= 18'h800;
                            scl_padoen_o <= 1'h1;
                            sda_padoen_o <= 1'h1;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h800: begin
                            top___byte_controller___bit_controller___c_state <= 18'h1000;
                            scl_padoen_o <= 1'h1;
                            sda_padoen_o <= 1'h1;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h1000: begin
                            top___byte_controller___bit_controller___c_state <= 18'h0;
                            top___byte_controller___core_ack <= 1'h1;
                            scl_padoen_o <= 1'h0;
                            sda_padoen_o <= 1'h1;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h2000: begin
                            top___byte_controller___bit_controller___c_state <= 18'h4000;
                            scl_padoen_o <= 1'h0;
                            sda_padoen_o <= top___byte_controller___core_txd;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h4000: begin
                            top___byte_controller___bit_controller___c_state <= 18'h8000;
                            scl_padoen_o <= 1'h1;
                            sda_padoen_o <= top___byte_controller___core_txd;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                        18'h8000: begin
                            top___byte_controller___bit_controller___c_state <= 18'h10000;
                            scl_padoen_o <= 1'h1;
                            sda_padoen_o <= top___byte_controller___core_txd;
                            top___byte_controller___bit_controller___sda_chk <= 1'h1;
                        end
                        18'h10000: begin
                            top___byte_controller___bit_controller___c_state <= 18'h0;
                            top___byte_controller___core_ack <= 1'h1;
                            scl_padoen_o <= 1'h0;
                            sda_padoen_o <= top___byte_controller___core_txd;
                            top___byte_controller___bit_controller___sda_chk <= 1'h0;
                        end
                    endcase
                end
            end
        end else begin
            top___byte_controller___bit_controller___c_state <= 18'h0;
            top___byte_controller___core_ack <= 1'h0;
            scl_padoen_o <= 1'h1;
            sda_padoen_o <= 1'h1;
            top___byte_controller___bit_controller___sda_chk <= 1'h0;
        end
    end
    assign scl_pad_o = 1'h0;
    assign sda_pad_o = 1'h0;

endmodule