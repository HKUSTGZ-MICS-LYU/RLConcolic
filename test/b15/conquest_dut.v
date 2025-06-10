//Following code is from line 9
module b15(hold, bs16_n, be_n, m_io_n, clock, address, datai, ready_n, na_n, ads_n, reset, datao, d_c_n, w_r_n, __obs);

    input                clock;
    input                reset;
    input                ready_n;
    input                hold;
    input                na_n;
    input                bs16_n;
    input         [31:0] datai;
    output        [3:0]  be_n;
    output        [29:0] address;
    output               w_r_n;
    output               d_c_n;
    output               m_io_n;
    output               ads_n;
    output        [31:0] datao;
    input                __obs;

    //Parameter Declaration
    reg signed [31:0] EAX = 32'sb0;
    reg signed [31:0] EBX = 32'sb0;
    reg  [29:0] address = 30'b0;
    reg  ads_n = 1'b0;
    reg  [3:0]  be_n = 4'b0;
    reg  [3:0]  byteEnable = 4'b0;
    reg  codeFetch = 1'b0;
    reg  d_c_n = 1'b0;
    reg signed [31:0] dataWidth = 32'sb0;
    reg  [31:0] datao = 32'b0;
    reg signed [31:0] eax_temp0 = 32'sb0;
    reg signed [31:0] eax_temp1 = 32'sb0;
    reg signed [31:0] eax_temp2 = 32'sb0;
    reg signed [31:0] ebx_temp0 = 32'sb0;
    reg signed [31:0] ebx_temp1 = 32'sb0;
    reg signed [31:0] ebx_temp2 = 32'sb0;
    reg  extended = 1'b0;
    reg signed [31:0] fWord = 32'sb0;
    reg  flush = 1'b0;
    reg  i = 1'b0;
    reg signed [31:0] instAddrPointer = 32'sb0;
    reg  [4:0]  instQueueRd_Addr = 5'b0;
    reg  [4:0]  instQueueWr_Addr = 5'b0;
    reg  [15:0] lWord = 16'b0;
    reg  m_io_n = 1'b0;
    reg  memoryFetch = 1'b0;
    reg  more = 1'b0;
    reg  nonAligned = 1'b0;
    reg signed [31:0] phyAddrPointer = 32'sb0;
    reg  [7:0]  queue [0:15];
    reg signed [31:0] rEIP = 32'sb0;
    reg  readRequest = 1'b0;
    reg  requestPending = 1'b0;
    reg  [2:0]  state = 3'b0;
    reg  [3:0]  state2 = 4'b0;
    reg  stateBS16 = 1'b0;
    reg  stateNA = 1'b0;
    reg  [7:0]  temp8 = 8'b0;
    reg  [7:0]  temp_q_rd = 8'b0;
    reg  [14:0] uWord = 15'b0;
    reg  w_r_n = 1'b0;

    //Following code is from line 70
        always @(posedge clock) begin
            if (reset)
                    begin
                        be_n <= 4'h0;$display(";A 2");  //assertion( be_n = 0) 2
                        address <= 0;$display(";A 3");  //assertion( address = 0) 3
                        w_r_n <= 0;$display(";A 4");  //assertion( w_r_n = 0) 4
                        d_c_n <= 0;$display(";A 5");  //assertion( d_c_n = 0) 5
                        m_io_n <= 0;$display(";A 6");  //assertion( m_io_n = 0) 6
                        ads_n <= 0;$display(";A 7");  //assertion( ads_n = 0) 7
                        state <= 3'h0;$display(";A 8");  //assertion( state = 0) 8
                        stateNA <= 0;$display(";A 9");  //assertion( stateNA = 0) 9
                        stateBS16 <= 0;$display(";A 10");  //assertion( stateBS16 = 0) 10
                        dataWidth <= 0;$display(";A 11");  //assertion( dataWidth = 0) 11
                    end
            else
                begin
                    case (state)
                      3'h0:
                            begin
                            $display(";A 12");  //assertion( state == 0 = True) 12
                                d_c_n <= (-1);$display(";A 13");  //assertion( d_c_n = 1) 13
                                ads_n <= (-1);$display(";A 14");  //assertion( ads_n = 1) 14
                                state <= 3'h1;$display(";A 15");  //assertion( state = 1) 15
                                stateNA <= (-1);$display(";A 16");  //assertion( stateNA = 1) 16
                                stateBS16 <= (-1);$display(";A 17");  //assertion( stateBS16 = 1) 17
                                dataWidth <= 2;$display(";A 18");  //assertion( dataWidth = 2) 18
                                state <= 3'h1;$display(";A 19");  //assertion( state = 1) 19
                            end
                      3'h1:
                        begin
                        $display(";A 20");  //assertion( state == 1 = True) 20
                            if ((requestPending == 1))
                                begin
                                $display(";A 21");  //assertion( requestPending == 1 = True) 21
                                    state <= 3'h2;$display(";A 23");  //assertion( state = 2) 23
                                end
                            else
                                begin
                                $display(";A 22");  //assertion( requestPending == 1 = False) 22
                                    if (hold)
                                        begin
                                        $display(";A 24");  //assertion( Not(hold == 0) = True) 24
                                            state <= 3'h5;$display(";A 26");  //assertion( state = 5) 26
                                        end
                                    else
                                        begin
                                        $display(";A 25");  //assertion( Not(hold == 0) = False) 25
                                            state <= 3'h1;$display(";A 27");  //assertion( state = 1) 27
                                        end
                                end
                        end
                      3'h2:
                            begin
                            $display(";A 28");  //assertion( state == 2 = True) 28
                                address <= ((rEIP >> 32'h00000002) & 1073741823);$display(";A 29");  //assertion( address = Concat(0, Extract(29, 0, rEIP >> 2))) 29
                                be_n <= byteEnable;$display(";A 30");  //assertion( be_n = byteEnable) 30
                                m_io_n <= memoryFetch;$display(";A 31");  //assertion( m_io_n = memoryFetch) 31
                                if ((readRequest == 1))
                                    begin
                                    $display(";A 32");  //assertion( readRequest == 1 = True) 32
                                        w_r_n <= 0;$display(";A 34");  //assertion( w_r_n = 0) 34
                                    end
                                else
                                    begin
                                    $display(";A 33");  //assertion( readRequest == 1 = False) 33
                                        w_r_n <= (-1);$display(";A 35");  //assertion( w_r_n = 1) 35
                                    end
                                if ((codeFetch == 1))
                                    begin
                                    $display(";A 36");  //assertion( codeFetch == 1 = True) 36
                                        d_c_n <= 0;$display(";A 38");  //assertion( d_c_n = 0) 38
                                    end
                                else
                                    begin
                                    $display(";A 37");  //assertion( codeFetch == 1 = False) 37
                                        d_c_n <= (-1);$display(";A 39");  //assertion( d_c_n = 1) 39
                                    end
                                ads_n <= 0;$display(";A 40");  //assertion( ads_n = 0) 40
                                state <= 3'h3;$display(";A 41");  //assertion( state = 3) 41
                            end
                      3'h3:
                            begin
                            $display(";A 42");  //assertion( state == 3 = True) 42
                                if ((((~ready_n) && (~hold)) && (requestPending == 1)))
                                    begin
                                    $display(";A 43");  //assertion( And(ready_n == 0, hold == 0, requestPending == 1) = True) 43
                                        state <= 3'h2;$display(";A 45");  //assertion( state = 2) 45
                                    end
                                else
                                    begin
                                    $display(";A 44");  //assertion( And(ready_n == 0, hold == 0, requestPending == 1) = False) 44
                                        if ((ready_n && na_n))
                                            begin
                                            $display(";A 46");  //assertion( And(ready_n == 1, na_n == 1) = True) 46
                                                state <= state;$display(";A 48");  //assertion( state = state) 48
                                            end
                                        else
                                            begin
                                            $display(";A 47");  //assertion( And(ready_n == 1, na_n == 1) = False) 47
                                                if ((((requestPending == 1) || hold) && (ready_n && (~na_n))))
                                                    begin
                                                    $display(";A 49");  //assertion( And(Or(hold == 1, requestPending == 1), ready_n == 1, na_n == 0) = True) 49
                                                        state <= 3'h7;$display(";A 51");  //assertion( state = 7) 51
                                                    end
                                                else
                                                    begin
                                                    $display(";A 50");  //assertion( And(Or(hold == 1, requestPending == 1), ready_n == 1, na_n == 0) = False) 50
                                                        if (((((requestPending == 1) && (~hold)) && ready_n) && (~na_n)))
                                                            begin
                                                            $display(";A 52");  //assertion( And(requestPending == 1, hold == 0, ready_n == 1, na_n == 0) = True) 52
                                                                state <= 3'h6;$display(";A 54");  //assertion( state = 6) 54
                                                            end
                                                        else
                                                            begin
                                                            $display(";A 53");  //assertion( And(requestPending == 1, hold == 0, ready_n == 1, na_n == 0) = False) 53
                                                                if ((((requestPending == 0) && (~hold)) && (~ready_n)))
                                                                    begin
                                                                    $display(";A 55");  //assertion( And(requestPending == 0, hold == 0, ready_n == 0) = True) 55
                                                                        state <= 3'h1;$display(";A 57");  //assertion( state = 1) 57
                                                                    end
                                                                else
                                                                    begin
                                                                    $display(";A 56");  //assertion( And(requestPending == 0, hold == 0, ready_n == 0) = False) 56
                                                                        if ((hold && ready_n))
                                                                            begin
                                                                            $display(";A 58");  //assertion( And(hold == 1, ready_n == 1) = True) 58
                                                                                state <= 3'h5;$display(";A 60");  //assertion( state = 5) 60
                                                                            end
                                                                        else
                                                                            begin
                                                                            $display(";A 59");  //assertion( And(hold == 1, ready_n == 1) = False) 59
                                                                                state <= 3'h3;$display(";A 61");  //assertion( state = 3) 61
                                                                            end
                                                                    end
                                                            end
                                                    end
                                            end
                                    end
                                stateBS16 <= bs16_n;$display(";A 62");  //assertion( stateBS16 = bs16_n) 62
                                if ((~bs16_n))
                                    begin
                                    $display(";A 63");  //assertion( ~bs16_n = True) 63
                                        dataWidth <= 1;$display(";A 65");  //assertion( dataWidth = 1) 65
                                    end
                                else
                                    begin
                                    $display(";A 64");  //assertion( ~bs16_n = False) 64
                                        dataWidth <= 2;$display(";A 66");  //assertion( dataWidth = 2) 66
                                    end
                                stateNA <= na_n;$display(";A 67");  //assertion( stateNA = na_n) 67
                                ads_n <= (-1);$display(";A 68");  //assertion( ads_n = 1) 68
                            end
                      3'h4:
                            begin
                            $display(";A 69");  //assertion( state == 4 = True) 69
                                if ((((~na_n) && (~hold)) && (requestPending == 1)))
                                    begin
                                    $display(";A 70");  //assertion( And(na_n == 0, hold == 0, requestPending == 1) = True) 70
                                        state <= 3'h6;$display(";A 72");  //assertion( state = 6) 72
                                    end
                                else
                                    begin
                                    $display(";A 71");  //assertion( And(na_n == 0, hold == 0, requestPending == 1) = False) 71
                                        if (((~na_n) && (hold || (requestPending == 0))))
                                            begin
                                            $display(";A 73");  //assertion( And(na_n == 0, Or(hold == 1, requestPending == 0)) = True) 73
                                                state <= 3'h7;$display(";A 75");  //assertion( state = 7) 75
                                            end
                                        else
                                            begin
                                            $display(";A 74");  //assertion( And(na_n == 0, Or(hold == 1, requestPending == 0)) = False) 74
                                                if (na_n)
                                                    begin
                                                    $display(";A 76");  //assertion( Not(na_n == 0) = True) 76
                                                        state <= 3'h3;$display(";A 78");  //assertion( state = 3) 78
                                                    end
                                                else
                                                    begin
                                                    $display(";A 77");  //assertion( Not(na_n == 0) = False) 77
                                                        state <= 3'h4;$display(";A 79");  //assertion( state = 4) 79
                                                    end
                                            end
                                    end
                                stateBS16 <= bs16_n;$display(";A 80");  //assertion( stateBS16 = bs16_n) 80
                                if ((~bs16_n))
                                    begin
                                    $display(";A 81");  //assertion( ~bs16_n = True) 81
                                        dataWidth <= 1;$display(";A 83");  //assertion( dataWidth = 1) 83
                                    end
                                else
                                    begin
                                    $display(";A 82");  //assertion( ~bs16_n = False) 82
                                        dataWidth <= 2;$display(";A 84");  //assertion( dataWidth = 2) 84
                                    end
                                stateNA <= na_n;$display(";A 85");  //assertion( stateNA = na_n) 85
                                ads_n <= (-1);$display(";A 86");  //assertion( ads_n = 1) 86
                            end
                      3'h5:
                        begin
                        $display(";A 87");  //assertion( state == 5 = True) 87
                            if (((~hold) && (requestPending == 1)))
                                begin
                                $display(";A 88");  //assertion( And(hold == 0, requestPending == 1) = True) 88
                                    state <= 3'h2;$display(";A 90");  //assertion( state = 2) 90
                                end
                            else
                                begin
                                $display(";A 89");  //assertion( And(hold == 0, requestPending == 1) = False) 89
                                    if (((~hold) && (requestPending == 0)))
                                        begin
                                        $display(";A 91");  //assertion( And(hold == 0, requestPending == 0) = True) 91
                                            state <= 3'h1;$display(";A 93");  //assertion( state = 1) 93
                                        end
                                    else
                                        begin
                                        $display(";A 92");  //assertion( And(hold == 0, requestPending == 0) = False) 92
                                            state <= 3'h5;$display(";A 94");  //assertion( state = 5) 94
                                        end
                                end
                        end
                      3'h6:
                            begin
                            $display(";A 95");  //assertion( state == 6 = True) 95
                                address <= ((rEIP >> 32'h00000001) & 1073741823);$display(";A 96");  //assertion( address = Concat(0, Extract(29, 0, rEIP >> 1))) 96
                                be_n <= byteEnable;$display(";A 97");  //assertion( be_n = byteEnable) 97
                                m_io_n <= memoryFetch;$display(";A 98");  //assertion( m_io_n = memoryFetch) 98
                                if ((readRequest == 1))
                                    begin
                                    $display(";A 99");  //assertion( readRequest == 1 = True) 99
                                        w_r_n <= 0;$display(";A 101");  //assertion( w_r_n = 0) 101
                                    end
                                else
                                    begin
                                    $display(";A 100");  //assertion( readRequest == 1 = False) 100
                                        w_r_n <= (-1);$display(";A 102");  //assertion( w_r_n = 1) 102
                                    end
                                if ((codeFetch == 1))
                                    begin
                                    $display(";A 103");  //assertion( codeFetch == 1 = True) 103
                                        d_c_n <= 0;$display(";A 105");  //assertion( d_c_n = 0) 105
                                    end
                                else
                                    begin
                                    $display(";A 104");  //assertion( codeFetch == 1 = False) 104
                                        d_c_n <= (-1);$display(";A 106");  //assertion( d_c_n = 1) 106
                                    end
                                ads_n <= 0;$display(";A 107");  //assertion( ads_n = 0) 107
                                if ((~ready_n))
                                    begin
                                    $display(";A 108");  //assertion( ~ready_n = True) 108
                                        state <= 3'h4;$display(";A 110");  //assertion( state = 4) 110
                                    end
                                else
                                    begin
                                    $display(";A 109");  //assertion( ~ready_n = False) 109
                                        state <= 3'h6;$display(";A 111");  //assertion( state = 6) 111
                                    end
                            end
                      3'h7:
                        begin
                        $display(";A 112");  //assertion( state == 7 = True) 112
                            if (((ready_n && (requestPending == 1)) && (~hold)))
                                begin
                                $display(";A 113");  //assertion( And(ready_n == 1, requestPending == 1, hold == 0) = True) 113
                                    state <= 3'h6;$display(";A 115");  //assertion( state = 6) 115
                                end
                            else
                                begin
                                $display(";A 114");  //assertion( And(ready_n == 1, requestPending == 1, hold == 0) = False) 114
                                    if (((~ready_n) && hold))
                                        begin
                                        $display(";A 116");  //assertion( And(ready_n == 0, hold == 1) = True) 116
                                            state <= 3'h5;$display(";A 118");  //assertion( state = 5) 118
                                        end
                                    else
                                        begin
                                        $display(";A 117");  //assertion( And(ready_n == 0, hold == 1) = False) 117
                                            if ((((~ready_n) && (~hold)) && (requestPending == 1)))
                                                begin
                                                $display(";A 119");  //assertion( And(ready_n == 0, hold == 0, requestPending == 1) = True) 119
                                                    state <= 3'h2;$display(";A 121");  //assertion( state = 2) 121
                                                end
                                            else
                                                begin
                                                $display(";A 120");  //assertion( And(ready_n == 0, hold == 0, requestPending == 1) = False) 120
                                                    if ((((~ready_n) && (~hold)) && (requestPending == 0)))
                                                        begin
                                                        $display(";A 122");  //assertion( And(ready_n == 0, hold == 0, requestPending == 0) = True) 122
                                                            state <= 3'h1;$display(";A 124");  //assertion( state = 1) 124
                                                        end
                                                    else
                                                        begin
                                                        $display(";A 123");  //assertion( And(ready_n == 0, hold == 0, requestPending == 0) = False) 123
                                                            state <= 3'h7;$display(";A 125");  //assertion( state = 7) 125
                                                        end
                                                end
                                        end
                                end
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R be_n = %d", be_n);
            $display(";R address = %d", address);
            $display(";R w_r_n = %d", w_r_n);
            $display(";R d_c_n = %d", d_c_n);
            $display(";R m_io_n = %d", m_io_n);
            $display(";R ads_n = %d", ads_n);
            $display(";R datao = %d", datao);
            $display(";R EAX = %d", EAX);
            $display(";R EBX = %d", EBX);
            $display(";R byteEnable = %d", byteEnable);
            $display(";R codeFetch = %d", codeFetch);
            $display(";R dataWidth = %d", dataWidth);
            $display(";R eax_temp0 = %d", eax_temp0);
            $display(";R eax_temp1 = %d", eax_temp1);
            $display(";R eax_temp2 = %d", eax_temp2);
            $display(";R ebx_temp0 = %d", ebx_temp0);
            $display(";R ebx_temp1 = %d", ebx_temp1);
            $display(";R ebx_temp2 = %d", ebx_temp2);
            $display(";R extended = %d", extended);
            $display(";R fWord = %d", fWord);
            $display(";R flush = %d", flush);
            $display(";R i = %d", i);
            $display(";R instAddrPointer = %d", instAddrPointer);
            $display(";R instQueueRd_Addr = %d", instQueueRd_Addr);
            $display(";R instQueueWr_Addr = %d", instQueueWr_Addr);
            $display(";R lWord = %d", lWord);
            $display(";R memoryFetch = %d", memoryFetch);
            $display(";R more = %d", more);
            $display(";R nonAligned = %d", nonAligned);
            $display(";R phyAddrPointer = %d", phyAddrPointer);
            $display(";R queue[0] = %d", queue[0]);
            $display(";R queue[1] = %d", queue[1]);
            $display(";R queue[2] = %d", queue[2]);
            $display(";R queue[3] = %d", queue[3]);
            $display(";R queue[4] = %d", queue[4]);
            $display(";R queue[5] = %d", queue[5]);
            $display(";R queue[6] = %d", queue[6]);
            $display(";R queue[7] = %d", queue[7]);
            $display(";R queue[8] = %d", queue[8]);
            $display(";R queue[9] = %d", queue[9]);
            $display(";R queue[10] = %d", queue[10]);
            $display(";R queue[11] = %d", queue[11]);
            $display(";R queue[12] = %d", queue[12]);
            $display(";R queue[13] = %d", queue[13]);
            $display(";R queue[14] = %d", queue[14]);
            $display(";R queue[15] = %d", queue[15]);
            $display(";R rEIP = %d", rEIP);
            $display(";R readRequest = %d", readRequest);
            $display(";R requestPending = %d", requestPending);
            $display(";R state = %d", state);
            $display(";R state2 = %d", state2);
            $display(";R stateBS16 = %d", stateBS16);
            $display(";R stateNA = %d", stateNA);
            $display(";R temp8 = %d", temp8);
            $display(";R temp_q_rd = %d", temp_q_rd);
            $display(";R uWord = %d", uWord);
            end
        end

    //Following code is from line 153
        always @(posedge clock) begin
            if (reset)
                    begin
                        state2 = 4'h0;$display(";A 128");  //assertion( state2 = 0) 128
                        instQueueRd_Addr = 0;$display(";A 129");  //assertion( instQueueRd_Addr = 0) 129
                        instQueueWr_Addr = 0;$display(";A 130");  //assertion( instQueueWr_Addr = 0) 130
                        instAddrPointer = 0;$display(";A 131");  //assertion( instAddrPointer = 0) 131
                        phyAddrPointer = 0;$display(";A 132");  //assertion( phyAddrPointer = 0) 132
                        extended = 0;$display(";A 133");  //assertion( extended = 0) 133
                        more = 0;$display(";A 134");  //assertion( more = 0) 134
                        flush = 0;$display(";A 135");  //assertion( flush = 0) 135
                        lWord = 0;$display(";A 136");  //assertion( lWord = 0) 136
                        uWord = 0;$display(";A 137");  //assertion( uWord = 0) 137
                        fWord = 0;$display(";A 138");  //assertion( fWord = 0) 138
                        codeFetch <= 0;$display(";A 139");  //assertion( codeFetch = 0) 139
                        datao <= 0;$display(";A 140");  //assertion( datao = 0) 140
                        EAX <= 0;$display(";A 141");  //assertion( EAX = 0) 141
                        EBX <= 0;$display(";A 142");  //assertion( EBX = 0) 142
                        rEIP <= 0;$display(";A 143");  //assertion( rEIP = 0) 143
                        readRequest <= 0;$display(";A 144");  //assertion( readRequest = 0) 144
                        memoryFetch <= 0;$display(";A 145");  //assertion( memoryFetch = 0) 145
                        requestPending <= 0;$display(";A 146");  //assertion( requestPending = 0) 146
                    end
            else
                begin
                    case (state2)
                      4'h0:
                            begin
                            $display(";A 147");  //assertion( state2 == 0 = True) 147
                                phyAddrPointer = rEIP;$display(";A 148");  //assertion( phyAddrPointer = rEIP) 148
                                instAddrPointer = phyAddrPointer;$display(";A 149");  //assertion( instAddrPointer = phyAddrPointer) 149
                                state2 = 4'h1;$display(";A 150");  //assertion( state2 = 1) 150
                                rEIP <= 32'h000ffff0;$display(";A 151");  //assertion( rEIP = 1048560) 151
                                readRequest <= (-1);$display(";A 152");  //assertion( readRequest = 1) 152
                                memoryFetch <= (-1);$display(";A 153");  //assertion( memoryFetch = 1) 153
                                requestPending <= (-1);$display(";A 154");  //assertion( requestPending = 1) 154
                            end
                      4'h1:
                            begin
                            $display(";A 155");  //assertion( state2 == 1 = True) 155
                                requestPending <= (-1);$display(";A 156");  //assertion( requestPending = 1) 156
                                readRequest <= (-1);$display(";A 157");  //assertion( readRequest = 1) 157
                                memoryFetch <= (-1);$display(";A 158");  //assertion( memoryFetch = 1) 158
                                codeFetch <= (-1);$display(";A 159");  //assertion( codeFetch = 1) 159
                                if ((~ready_n))
                                    begin
                                    $display(";A 160");  //assertion( ~ready_n = True) 160
                                        state2 = 4'h2;$display(";A 162");  //assertion( state2 = 2) 162
                                    end
                                else
                                    begin
                                    $display(";A 161");  //assertion( ~ready_n = False) 161
                                        state2 = 4'h1;$display(";A 163");  //assertion( state2 = 1) 163
                                    end
                            end
                      4'h2:
                            begin
                            $display(";A 164");  //assertion( state2 == 2 = True) 164
                                requestPending <= 0;$display(";A 165");  //assertion( requestPending = 0) 165
                                queue[(instQueueWr_Addr & 32'h0000000f)] = (datai & 32'h000000ff);$display(";A 166");  //assertion( queue[Extract(3, 0, instQueueWr_Addr)] = Concat(0, Extract(7, 0, datai))) 166
                                queue[((instQueueWr_Addr + 32'h00000001) & 32'h0000000f)] = (datai & 32'h000000ff);$display(";A 167");  //assertion( queue[1 + Extract(3, 0, instQueueWr_Addr)] = Concat(0, Extract(7, 0, datai))) 167
                                if (stateBS16)
                                        begin
                                        $display(";A 168");  //assertion( Not(stateBS16 == 0) = True) 168
                                            queue[((instQueueWr_Addr + 32'h00000002) & 32'h0000000f)] = ((datai >> 32'h00000010) & 32'h000000ff);$display(";A 170");  //assertion( queue[2 + Extract(3, 0, instQueueWr_Addr)] = Concat(0, Extract(23, 16, datai))) 170
                                            queue[((instQueueWr_Addr + 32'h00000003) & 32'h0000000f)] = ((datai >> 32'h00000018) & 32'h000000ff);$display(";A 171");  //assertion( queue[3 + Extract(3, 0, instQueueWr_Addr)] = Concat(0, Extract(31, 24, datai))) 171
                                            instQueueWr_Addr = ((instQueueWr_Addr + 5'h02) & 5'h0f);$display(";A 172");  //assertion( instQueueWr_Addr = Concat(0, 2 + Extract(3, 0, instQueueWr_Addr))) 172
                                            phyAddrPointer = (phyAddrPointer + 4);$display(";A 173");  //assertion( phyAddrPointer = 4 + phyAddrPointer) 173
                                            state2 = 4'h5;$display(";A 174");  //assertion( state2 = 5) 174
                                        end
                                else
                                        begin
                                        $display(";A 169");  //assertion( Not(stateBS16 == 0) = False) 169
                                            phyAddrPointer = (phyAddrPointer + 2);$display(";A 175");  //assertion( phyAddrPointer = 2 + phyAddrPointer) 175
                                            if ((phyAddrPointer < 0))
                                                begin
                                                $display(";A 176");  //assertion( Not(0 <= phyAddrPointer) = True) 176
                                                    rEIP <= (-phyAddrPointer);$display(";A 178");  //assertion( rEIP = 4294967295*phyAddrPointer) 178
                                                end
                                            else
                                                begin
                                                $display(";A 177");  //assertion( Not(0 <= phyAddrPointer) = False) 177
                                                    rEIP <= phyAddrPointer;$display(";A 179");  //assertion( rEIP = phyAddrPointer) 179
                                                end
                                            state2 = 4'h3;$display(";A 180");  //assertion( state2 = 3) 180
                                        end
                                instQueueWr_Addr = ((instQueueWr_Addr + 5'h02) & 5'h0f);$display(";A 181");  //assertion( instQueueWr_Addr = Concat(0, 2 + Extract(3, 0, instQueueWr_Addr))) 181
                            end
                      4'h3:
                            begin
                            $display(";A 182");  //assertion( state2 == 3 = True) 182
                                requestPending <= (-1);$display(";A 183");  //assertion( requestPending = 1) 183
                                if ((~ready_n))
                                    begin
                                    $display(";A 184");  //assertion( ~ready_n = True) 184
                                        state2 = 4'h4;$display(";A 186");  //assertion( state2 = 4) 186
                                    end
                                else
                                    begin
                                    $display(";A 185");  //assertion( ~ready_n = False) 185
                                        state2 = 4'h3;$display(";A 187");  //assertion( state2 = 3) 187
                                    end
                            end
                      4'h4:
                            begin
                            $display(";A 188");  //assertion( state2 == 4 = True) 188
                                requestPending <= 0;$display(";A 189");  //assertion( requestPending = 0) 189
                                queue[(instQueueWr_Addr & 32'h0000000f)] = (datai & 32'h000000ff);$display(";A 190");  //assertion( queue[Extract(3, 0, instQueueWr_Addr)] = Concat(0, Extract(7, 0, datai))) 190
                                queue[((instQueueWr_Addr + 32'h00000001) & 32'h0000000f)] = (datai & 32'h000000ff);$display(";A 191");  //assertion( queue[1 + Extract(3, 0, instQueueWr_Addr)] = Concat(0, Extract(7, 0, datai))) 191
                                instQueueWr_Addr = ((instQueueWr_Addr + 5'h02) & 5'h0f);$display(";A 192");  //assertion( instQueueWr_Addr = Concat(0, 2 + Extract(3, 0, instQueueWr_Addr))) 192
                                phyAddrPointer = (phyAddrPointer + 2);$display(";A 193");  //assertion( phyAddrPointer = 2 + phyAddrPointer) 193
                                state2 = 4'h5;$display(";A 194");  //assertion( state2 = 5) 194
                            end
                      4'h5:
                            begin
                            $display(";A 195");  //assertion( state2 == 5 = True) 195
                                temp_q_rd = (queue[(instQueueRd_Addr & 32'h0000000f)] & 9'h0ff);$display(";A 196");  //assertion( temp_q_rd = Concat(0, queue[Extract(3, 0, instQueueRd_Addr)])) 196
                                if ((temp_q_rd == 8'h90))
                                        begin
                                        $display(";A 197");  //assertion( temp_q_rd == 144 = True) 197
                                            instAddrPointer = (instAddrPointer + 1);$display(";A 199");  //assertion( instAddrPointer = 1 + instAddrPointer) 199
                                            instQueueRd_Addr = ((instQueueRd_Addr + 5'h01) & 5'h0f);$display(";A 200");  //assertion( instQueueRd_Addr = Concat(0, 1 + Extract(3, 0, instQueueRd_Addr))) 200
                                            flush = 0;$display(";A 201");  //assertion( flush = 0) 201
                                            more = 0;$display(";A 202");  //assertion( more = 0) 202
                                        end
                                else
                                    begin
                                    $display(";A 198");  //assertion( temp_q_rd == 144 = False) 198
                                        if ((temp_q_rd == 8'h66))
                                                begin
                                                $display(";A 203");  //assertion( temp_q_rd == 102 = True) 203
                                                    instAddrPointer = (instAddrPointer + 1);$display(";A 205");  //assertion( instAddrPointer = 1 + instAddrPointer) 205
                                                    instQueueRd_Addr = ((instQueueRd_Addr + 5'h01) & 5'h0f);$display(";A 206");  //assertion( instQueueRd_Addr = Concat(0, 1 + Extract(3, 0, instQueueRd_Addr))) 206
                                                    extended = (-1);$display(";A 207");  //assertion( extended = 1) 207
                                                    flush = 0;$display(";A 208");  //assertion( flush = 0) 208
                                                    more = 0;$display(";A 209");  //assertion( more = 0) 209
                                                end
                                        else
                                            begin
                                            $display(";A 204");  //assertion( temp_q_rd == 102 = False) 204
                                                if ((temp_q_rd == 8'heb))
                                                    begin
                                                    $display(";A 210");  //assertion( temp_q_rd == 235 = True) 210
                                                        if (((instQueueWr_Addr - instQueueRd_Addr) >= 32'h00000003))
                                                                begin
                                                                $display(";A 212");  //assertion( 3 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = True) 212
                                                                    if ((queue[((instQueueRd_Addr + 32'h00000001) & 32'h0000000f)] > 32'h0000007f))
                                                                            begin
                                                                            $display(";A 214");  //assertion( Not(Extract(7, 7, queue[1 + Extract(3, 0, instQueueRd_Addr)]) == 0) = True) 214
                                                                                phyAddrPointer = ((instAddrPointer + 32'h00000001) - (32'h000000ff - queue[((instQueueRd_Addr + 32'h00000001) & 32'h0000000f)]));$display(";A 216");  //assertion( phyAddrPointer = 4294967042 + instAddrPointer + Concat(0, queue[1 + Extract(3, 0, instQueueRd_Addr)])) 216
                                                                                instAddrPointer = phyAddrPointer;$display(";A 217");  //assertion( instAddrPointer = phyAddrPointer) 217
                                                                            end
                                                                    else
                                                                            begin
                                                                            $display(";A 215");  //assertion( Not(Extract(7, 7, queue[1 + Extract(3, 0, instQueueRd_Addr)]) == 0) = False) 215
                                                                                phyAddrPointer = ((instAddrPointer + 32'h00000002) + queue[((instQueueRd_Addr + 32'h00000001) & 32'h0000000f)]);$display(";A 218");  //assertion( phyAddrPointer = 2 + instAddrPointer + Concat(0, queue[1 + Extract(3, 0, instQueueRd_Addr)])) 218
                                                                                instAddrPointer = phyAddrPointer;$display(";A 219");  //assertion( instAddrPointer = phyAddrPointer) 219
                                                                            end
                                                                    flush = (-1);$display(";A 220");  //assertion( flush = 1) 220
                                                                    more = (-1);$display(";A 221");  //assertion( more = 1) 221
                                                                end
                                                        else
                                                                begin
                                                                $display(";A 213");  //assertion( 3 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = False) 213
                                                                    flush = 0;$display(";A 222");  //assertion( flush = 0) 222
                                                                    more = (-1);$display(";A 223");  //assertion( more = 1) 223
                                                                end
                                                    end
                                                else
                                                    begin
                                                    $display(";A 211");  //assertion( temp_q_rd == 235 = False) 211
                                                        if ((temp_q_rd == 8'he9))
                                                            begin
                                                            $display(";A 224");  //assertion( temp_q_rd == 233 = True) 224
                                                                if (((instQueueWr_Addr - instQueueRd_Addr) >= 32'h00000005))
                                                                        begin
                                                                        $display(";A 226");  //assertion( 5 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = True) 226
                                                                            phyAddrPointer = ((instAddrPointer + 32'h00000005) + queue[((instQueueRd_Addr + 32'h00000001) & 32'h0000000f)]);$display(";A 228");  //assertion( phyAddrPointer = 5 + instAddrPointer + Concat(0, queue[1 + Extract(3, 0, instQueueRd_Addr)])) 228
                                                                            instAddrPointer = phyAddrPointer;$display(";A 229");  //assertion( instAddrPointer = phyAddrPointer) 229
                                                                            flush = (-1);$display(";A 230");  //assertion( flush = 1) 230
                                                                            more = 0;$display(";A 231");  //assertion( more = 0) 231
                                                                        end
                                                                else
                                                                        begin
                                                                        $display(";A 227");  //assertion( 5 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = False) 227
                                                                            flush = 0;$display(";A 232");  //assertion( flush = 0) 232
                                                                            more = (-1);$display(";A 233");  //assertion( more = 1) 233
                                                                        end
                                                            end
                                                        else
                                                            begin
                                                            $display(";A 225");  //assertion( temp_q_rd == 233 = False) 225
                                                                if ((temp_q_rd == 8'hea))
                                                                        begin
                                                                        $display(";A 234");  //assertion( temp_q_rd == 234 = True) 234
                                                                            instAddrPointer = (instAddrPointer + 1);$display(";A 236");  //assertion( instAddrPointer = 1 + instAddrPointer) 236
                                                                            instQueueRd_Addr = ((instQueueRd_Addr + 5'h01) & 5'h0f);$display(";A 237");  //assertion( instQueueRd_Addr = Concat(0, 1 + Extract(3, 0, instQueueRd_Addr))) 237
                                                                            flush = 0;$display(";A 238");  //assertion( flush = 0) 238
                                                                            more = 0;$display(";A 239");  //assertion( more = 0) 239
                                                                        end
                                                                else
                                                                    begin
                                                                    $display(";A 235");  //assertion( temp_q_rd == 234 = False) 235
                                                                        if ((temp_q_rd == 8'hb0))
                                                                                begin
                                                                                $display(";A 240");  //assertion( temp_q_rd == 176 = True) 240
                                                                                    instAddrPointer = (instAddrPointer + 1);$display(";A 242");  //assertion( instAddrPointer = 1 + instAddrPointer) 242
                                                                                    instQueueRd_Addr = ((instQueueRd_Addr + 5'h01) & 5'h0f);$display(";A 243");  //assertion( instQueueRd_Addr = Concat(0, 1 + Extract(3, 0, instQueueRd_Addr))) 243
                                                                                    flush = 0;$display(";A 244");  //assertion( flush = 0) 244
                                                                                    more = 0;$display(";A 245");  //assertion( more = 0) 245
                                                                                end
                                                                        else
                                                                            begin
                                                                            $display(";A 241");  //assertion( temp_q_rd == 176 = False) 241
                                                                                if ((temp_q_rd == 8'hb8))
                                                                                    begin
                                                                                    $display(";A 246");  //assertion( temp_q_rd == 184 = True) 246
                                                                                        if (((instQueueWr_Addr - instQueueRd_Addr) >= 32'h00000005))
                                                                                                begin
                                                                                                $display(";A 248");  //assertion( 5 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = True) 248
                                                                                                    eax_temp0 = (queue[((instQueueRd_Addr + 32'h00000004) & 32'h0000000f)] << 32'h00000017);$display(";A 250");  //assertion( eax_temp0 = Concat(0, queue[4 + Extract(3, 0, instQueueRd_Addr)], 0)) 250
                                                                                                    eax_temp1 = ((eax_temp0 + queue[((instQueueRd_Addr + 32'h00000003) & 32'h0000000f)]) << 32'h00000010);$display(";A 251");  //assertion( eax_temp1 = Concat(Extract(15, 0, eax_temp0) + Concat(0, queue[3 + Extract(3, 0, instQueueRd_Addr)]), 0)) 251
                                                                                                    eax_temp2 = ((eax_temp1 + queue[((instQueueRd_Addr + 32'h00000002) & 32'h0000000f)]) << 32'h00000008);$display(";A 252");  //assertion( eax_temp2 = Concat(Extract(23, 0, eax_temp1) + Concat(0, queue[2 + Extract(3, 0, instQueueRd_Addr)]), 0)) 252
                                                                                                    EAX <= (eax_temp2 + queue[((instQueueRd_Addr + 32'h00000001) & 32'h0000000f)]);$display(";A 253");  //assertion( EAX = eax_temp2 + Concat(0, queue[1 + Extract(3, 0, instQueueRd_Addr)])) 253
                                                                                                    more = 0;$display(";A 254");  //assertion( more = 0) 254
                                                                                                    flush = 0;$display(";A 255");  //assertion( flush = 0) 255
                                                                                                    instAddrPointer = (instAddrPointer + 5);$display(";A 256");  //assertion( instAddrPointer = 5 + instAddrPointer) 256
                                                                                                    instQueueRd_Addr = ((instQueueRd_Addr + 5'h05) & 5'h0f);$display(";A 257");  //assertion( instQueueRd_Addr = Concat(0, 5 + Extract(3, 0, instQueueRd_Addr))) 257
                                                                                                end
                                                                                        else
                                                                                                begin
                                                                                                $display(";A 249");  //assertion( 5 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = False) 249
                                                                                                    flush = 0;$display(";A 258");  //assertion( flush = 0) 258
                                                                                                    more = (-1);$display(";A 259");  //assertion( more = 1) 259
                                                                                                end
                                                                                    end
                                                                                else
                                                                                    begin
                                                                                    $display(";A 247");  //assertion( temp_q_rd == 184 = False) 247
                                                                                        if ((temp_q_rd == 8'hbb))
                                                                                            begin
                                                                                            $display(";A 260");  //assertion( temp_q_rd == 187 = True) 260
                                                                                                if (((instQueueWr_Addr - instQueueRd_Addr) >= 32'h00000005))
                                                                                                        begin
                                                                                                        $display(";A 262");  //assertion( 5 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = True) 262
                                                                                                            ebx_temp0 = (queue[((instQueueRd_Addr + 32'h00000004) & 32'h0000000f)] << 32'h00000017);$display(";A 264");  //assertion( ebx_temp0 = Concat(0, queue[4 + Extract(3, 0, instQueueRd_Addr)], 0)) 264
                                                                                                            ebx_temp1 = ((ebx_temp0 + queue[((instQueueRd_Addr + 32'h00000003) & 32'h0000000f)]) << 32'h00000010);$display(";A 265");  //assertion( ebx_temp1 = Concat(Extract(15, 0, ebx_temp0) + Concat(0, queue[3 + Extract(3, 0, instQueueRd_Addr)]), 0)) 265
                                                                                                            ebx_temp2 = ((ebx_temp1 + queue[((instQueueRd_Addr + 32'h00000002) & 32'h0000000f)]) << 32'h00000008);$display(";A 266");  //assertion( ebx_temp2 = Concat(Extract(23, 0, ebx_temp1) + Concat(0, queue[2 + Extract(3, 0, instQueueRd_Addr)]), 0)) 266
                                                                                                            EBX <= (ebx_temp2 + queue[((instQueueRd_Addr + 32'h00000001) & 32'h0000000f)]);$display(";A 267");  //assertion( EBX = ebx_temp2 + Concat(0, queue[1 + Extract(3, 0, instQueueRd_Addr)])) 267
                                                                                                            more = 0;$display(";A 268");  //assertion( more = 0) 268
                                                                                                            flush = 0;$display(";A 269");  //assertion( flush = 0) 269
                                                                                                            instAddrPointer = (instAddrPointer + 5);$display(";A 270");  //assertion( instAddrPointer = 5 + instAddrPointer) 270
                                                                                                            instQueueRd_Addr = ((instQueueRd_Addr + 5'h05) & 5'h0f);$display(";A 271");  //assertion( instQueueRd_Addr = Concat(0, 5 + Extract(3, 0, instQueueRd_Addr))) 271
                                                                                                        end
                                                                                                else
                                                                                                        begin
                                                                                                        $display(";A 263");  //assertion( 5 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = False) 263
                                                                                                            flush = 0;$display(";A 272");  //assertion( flush = 0) 272
                                                                                                            more = (-1);$display(";A 273");  //assertion( more = 1) 273
                                                                                                        end
                                                                                            end
                                                                                        else
                                                                                            begin
                                                                                            $display(";A 261");  //assertion( temp_q_rd == 187 = False) 261
                                                                                                if ((temp_q_rd == 8'h8b))
                                                                                                    begin
                                                                                                    $display(";A 274");  //assertion( temp_q_rd == 139 = True) 274
                                                                                                        if (((instQueueWr_Addr - instQueueRd_Addr) >= 32'h00000002))
                                                                                                                begin
                                                                                                                $display(";A 276");  //assertion( 2 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = True) 276
                                                                                                                    if ((EBX < 0))
                                                                                                                        begin
                                                                                                                        $display(";A 278");  //assertion( Not(0 <= EBX) = True) 278
                                                                                                                            rEIP <= (-EBX);$display(";A 280");  //assertion( rEIP = 4294967295*EBX) 280
                                                                                                                        end
                                                                                                                    else
                                                                                                                        begin
                                                                                                                        $display(";A 279");  //assertion( Not(0 <= EBX) = False) 279
                                                                                                                            rEIP <= EBX;$display(";A 281");  //assertion( rEIP = EBX) 281
                                                                                                                        end
                                                                                                                    requestPending <= (-1);$display(";A 282");  //assertion( requestPending = 1) 282
                                                                                                                    readRequest <= (-1);$display(";A 283");  //assertion( readRequest = 1) 283
                                                                                                                    memoryFetch <= (-1);$display(";A 284");  //assertion( memoryFetch = 1) 284
                                                                                                                    codeFetch <= 0;$display(";A 285");  //assertion( codeFetch = 0) 285
                                                                                                                    if ((~ready_n))
                                                                                                                            begin
                                                                                                                            $display(";A 286");  //assertion( ~ready_n = True) 286
                                                                                                                                requestPending <= 0;$display(";A 288");  //assertion( requestPending = 0) 288
                                                                                                                                uWord = (datai & 32'h00007fff);$display(";A 289");  //assertion( uWord = Concat(0, Extract(14, 0, datai))) 289
                                                                                                                                if (stateBS16)
                                                                                                                                    begin
                                                                                                                                    $display(";A 290");  //assertion( Not(stateBS16 == 0) = True) 290
                                                                                                                                        lWord = (datai & 32'h0000ffff);$display(";A 292");  //assertion( lWord = Concat(0, Extract(15, 0, datai))) 292
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                        begin
                                                                                                                                        $display(";A 291");  //assertion( Not(stateBS16 == 0) = False) 291
                                                                                                                                            rEIP <= (rEIP + 2);$display(";A 293");  //assertion( rEIP = 2 + rEIP) 293
                                                                                                                                            requestPending <= (-1);$display(";A 294");  //assertion( requestPending = 1) 294
                                                                                                                                            if ((~ready_n))
                                                                                                                                                    begin
                                                                                                                                                    $display(";A 295");  //assertion( ~ready_n = True) 295
                                                                                                                                                        requestPending <= 0;$display(";A 297");  //assertion( requestPending = 0) 297
                                                                                                                                                        lWord = (datai & 32'h0000ffff);$display(";A 298");  //assertion( lWord = Concat(0, Extract(15, 0, datai))) 298
                                                                                                                                                    end
                                                                                                                                            else
                                                                                                                                                $display(";A 296");  //assertion( ~ready_n = False) 296
                                                                                                                                        end
                                                                                                                                if ((~ready_n))
                                                                                                                                        begin
                                                                                                                                        $display(";A 299");  //assertion( ~ready_n = True) 299
                                                                                                                                            EAX <= ((uWord << 32'h00000010) + lWord);$display(";A 301");  //assertion( EAX = Concat(0, uWord, lWord)) 301
                                                                                                                                            more = 0;$display(";A 302");  //assertion( more = 0) 302
                                                                                                                                            flush = 0;$display(";A 303");  //assertion( flush = 0) 303
                                                                                                                                            instAddrPointer = (instAddrPointer + 2);$display(";A 304");  //assertion( instAddrPointer = 2 + instAddrPointer) 304
                                                                                                                                            instQueueRd_Addr = ((instQueueRd_Addr + 5'h02) & 5'h0f);$display(";A 305");  //assertion( instQueueRd_Addr = Concat(0, 2 + Extract(3, 0, instQueueRd_Addr))) 305
                                                                                                                                        end
                                                                                                                                else
                                                                                                                                    $display(";A 300");  //assertion( ~ready_n = False) 300
                                                                                                                            end
                                                                                                                    else
                                                                                                                        $display(";A 287");  //assertion( ~ready_n = False) 287
                                                                                                                end
                                                                                                        else
                                                                                                                begin
                                                                                                                $display(";A 277");  //assertion( 2 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = False) 277
                                                                                                                    flush = 0;$display(";A 306");  //assertion( flush = 0) 306
                                                                                                                    more = (-1);$display(";A 307");  //assertion( more = 1) 307
                                                                                                                end
                                                                                                    end
                                                                                                else
                                                                                                    begin
                                                                                                    $display(";A 275");  //assertion( temp_q_rd == 139 = False) 275
                                                                                                        if ((temp_q_rd == 8'h89))
                                                                                                            begin
                                                                                                            $display(";A 308");  //assertion( temp_q_rd == 137 = True) 308
                                                                                                                if (((instQueueWr_Addr - instQueueRd_Addr) >= 32'h00000002))
                                                                                                                        begin
                                                                                                                        $display(";A 310");  //assertion( 2 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = True) 310
                                                                                                                            if ((EBX < 0))
                                                                                                                                begin
                                                                                                                                $display(";A 312");  //assertion( Not(0 <= EBX) = True) 312
                                                                                                                                    rEIP <= EBX;$display(";A 314");  //assertion( rEIP = EBX) 314
                                                                                                                                end
                                                                                                                            else
                                                                                                                                begin
                                                                                                                                $display(";A 313");  //assertion( Not(0 <= EBX) = False) 313
                                                                                                                                    rEIP <= EBX;$display(";A 315");  //assertion( rEIP = EBX) 315
                                                                                                                                end
                                                                                                                            lWord = (EAX & 65535);$display(";A 316");  //assertion( lWord = Concat(0, Extract(15, 0, EAX))) 316
                                                                                                                            uWord = ((EAX >> 32'h00000010) & 32'h00003fff);$display(";A 317");  //assertion( uWord = Concat(0, Extract(13, 0, EAX >> 16))) 317
                                                                                                                            requestPending <= (-1);$display(";A 318");  //assertion( requestPending = 1) 318
                                                                                                                            readRequest <= 0;$display(";A 319");  //assertion( readRequest = 0) 319
                                                                                                                            memoryFetch <= (-1);$display(";A 320");  //assertion( memoryFetch = 1) 320
                                                                                                                            codeFetch <= 0;$display(";A 321");  //assertion( codeFetch = 0) 321
                                                                                                                            if (((state == 3'h2) || (state == 3'h4)))
                                                                                                                                    begin
                                                                                                                                    $display(";A 322");  //assertion( Or(state == 2, state == 4) = True) 322
                                                                                                                                        datao <= ((uWord << 32'h00000010) + lWord);$display(";A 324");  //assertion( datao = Concat(0, uWord, lWord)) 324
                                                                                                                                        if ((~ready_n))
                                                                                                                                                begin
                                                                                                                                                $display(";A 325");  //assertion( ~ready_n = True) 325
                                                                                                                                                    requestPending <= 0;$display(";A 327");  //assertion( requestPending = 0) 327
                                                                                                                                                    if ((~stateBS16))
                                                                                                                                                            begin
                                                                                                                                                            $display(";A 328");  //assertion( ~stateBS16 = True) 328
                                                                                                                                                                rEIP <= (rEIP + 2);$display(";A 330");  //assertion( rEIP = 2 + rEIP) 330
                                                                                                                                                                requestPending <= (-1);$display(";A 331");  //assertion( requestPending = 1) 331
                                                                                                                                                                readRequest <= 0;$display(";A 332");  //assertion( readRequest = 0) 332
                                                                                                                                                                memoryFetch <= (-1);$display(";A 333");  //assertion( memoryFetch = 1) 333
                                                                                                                                                                codeFetch <= 0;$display(";A 334");  //assertion( codeFetch = 0) 334
                                                                                                                                                                state2 = 4'h6;$display(";A 335");  //assertion( state2 = 6) 335
                                                                                                                                                            end
                                                                                                                                                    else
                                                                                                                                                        $display(";A 329");  //assertion( ~stateBS16 = False) 329
                                                                                                                                                    more = 0;$display(";A 336");  //assertion( more = 0) 336
                                                                                                                                                    flush = 0;$display(";A 337");  //assertion( flush = 0) 337
                                                                                                                                                    instAddrPointer = (instAddrPointer + 2);$display(";A 338");  //assertion( instAddrPointer = 2 + instAddrPointer) 338
                                                                                                                                                    instQueueRd_Addr = ((instQueueRd_Addr + 5'h02) & 5'h0f);$display(";A 339");  //assertion( instQueueRd_Addr = Concat(0, 2 + Extract(3, 0, instQueueRd_Addr))) 339
                                                                                                                                                end
                                                                                                                                        else
                                                                                                                                            $display(";A 326");  //assertion( ~ready_n = False) 326
                                                                                                                                    end
                                                                                                                            else
                                                                                                                                $display(";A 323");  //assertion( Or(state == 2, state == 4) = False) 323
                                                                                                                        end
                                                                                                                else
                                                                                                                        begin
                                                                                                                        $display(";A 311");  //assertion( 2 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = False) 311
                                                                                                                            flush = 0;$display(";A 340");  //assertion( flush = 0) 340
                                                                                                                            more = (-1);$display(";A 341");  //assertion( more = 1) 341
                                                                                                                        end
                                                                                                            end
                                                                                                        else
                                                                                                            begin
                                                                                                            $display(";A 309");  //assertion( temp_q_rd == 137 = False) 309
                                                                                                                if ((temp_q_rd == 8'he4))
                                                                                                                    begin
                                                                                                                    $display(";A 342");  //assertion( temp_q_rd == 228 = True) 342
                                                                                                                        if (((instQueueWr_Addr - instQueueRd_Addr) >= 32'h00000002))
                                                                                                                                begin
                                                                                                                                $display(";A 344");  //assertion( 2 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = True) 344
                                                                                                                                    rEIP <= (instQueueRd_Addr + 32'h00000001);$display(";A 346");  //assertion( rEIP = 1 + Concat(0, instQueueRd_Addr)) 346
                                                                                                                                    requestPending <= (-1);$display(";A 347");  //assertion( requestPending = 1) 347
                                                                                                                                    readRequest <= (-1);$display(";A 348");  //assertion( readRequest = 1) 348
                                                                                                                                    memoryFetch <= 0;$display(";A 349");  //assertion( memoryFetch = 0) 349
                                                                                                                                    codeFetch <= 0;$display(";A 350");  //assertion( codeFetch = 0) 350
                                                                                                                                    if ((~ready_n))
                                                                                                                                            begin
                                                                                                                                            $display(";A 351");  //assertion( ~ready_n = True) 351
                                                                                                                                                requestPending <= 0;$display(";A 353");  //assertion( requestPending = 0) 353
                                                                                                                                                EAX <= datai;$display(";A 354");  //assertion( EAX = datai) 354
                                                                                                                                                instAddrPointer = (instAddrPointer + 2);$display(";A 355");  //assertion( instAddrPointer = 2 + instAddrPointer) 355
                                                                                                                                                instQueueRd_Addr = (instQueueRd_Addr + 5'h02);$display(";A 356");  //assertion( instQueueRd_Addr = 2 + instQueueRd_Addr) 356
                                                                                                                                                flush = 0;$display(";A 357");  //assertion( flush = 0) 357
                                                                                                                                                more = 0;$display(";A 358");  //assertion( more = 0) 358
                                                                                                                                            end
                                                                                                                                    else
                                                                                                                                        $display(";A 352");  //assertion( ~ready_n = False) 352
                                                                                                                                end
                                                                                                                        else
                                                                                                                                begin
                                                                                                                                $display(";A 345");  //assertion( 2 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = False) 345
                                                                                                                                    flush = 0;$display(";A 359");  //assertion( flush = 0) 359
                                                                                                                                    more = (-1);$display(";A 360");  //assertion( more = 1) 360
                                                                                                                                end
                                                                                                                    end
                                                                                                                else
                                                                                                                    begin
                                                                                                                    $display(";A 343");  //assertion( temp_q_rd == 228 = False) 343
                                                                                                                        if ((temp_q_rd == 8'he6))
                                                                                                                            begin
                                                                                                                            $display(";A 361");  //assertion( temp_q_rd == 230 = True) 361
                                                                                                                                if (((instQueueWr_Addr - instQueueRd_Addr) >= 32'h00000002))
                                                                                                                                        begin
                                                                                                                                        $display(";A 363");  //assertion( 2 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = True) 363
                                                                                                                                            rEIP <= (instQueueRd_Addr + 32'h00000001);$display(";A 365");  //assertion( rEIP = 1 + Concat(0, instQueueRd_Addr)) 365
                                                                                                                                            requestPending <= (-1);$display(";A 366");  //assertion( requestPending = 1) 366
                                                                                                                                            readRequest <= 0;$display(";A 367");  //assertion( readRequest = 0) 367
                                                                                                                                            memoryFetch <= 0;$display(";A 368");  //assertion( memoryFetch = 0) 368
                                                                                                                                            codeFetch <= 0;$display(";A 369");  //assertion( codeFetch = 0) 369
                                                                                                                                            if (((state == 3'h2) || (state == 3'h4)))
                                                                                                                                                    begin
                                                                                                                                                    $display(";A 370");  //assertion( Or(state == 2, state == 4) = True) 370
                                                                                                                                                        fWord = (EAX & 65535);$display(";A 372");  //assertion( fWord = Concat(0, Extract(15, 0, EAX))) 372
                                                                                                                                                        datao <= fWord;$display(";A 373");  //assertion( datao = fWord) 373
                                                                                                                                                        if ((~ready_n))
                                                                                                                                                                begin
                                                                                                                                                                $display(";A 374");  //assertion( ~ready_n = True) 374
                                                                                                                                                                    requestPending <= 0;$display(";A 376");  //assertion( requestPending = 0) 376
                                                                                                                                                                    instAddrPointer = (instAddrPointer + 2);$display(";A 377");  //assertion( instAddrPointer = 2 + instAddrPointer) 377
                                                                                                                                                                    instQueueRd_Addr = ((instQueueRd_Addr + 5'h02) & 5'h0f);$display(";A 378");  //assertion( instQueueRd_Addr = Concat(0, 2 + Extract(3, 0, instQueueRd_Addr))) 378
                                                                                                                                                                    flush = 0;$display(";A 379");  //assertion( flush = 0) 379
                                                                                                                                                                    more = 0;$display(";A 380");  //assertion( more = 0) 380
                                                                                                                                                                end
                                                                                                                                                        else
                                                                                                                                                            $display(";A 375");  //assertion( ~ready_n = False) 375
                                                                                                                                                    end
                                                                                                                                            else
                                                                                                                                                $display(";A 371");  //assertion( Or(state == 2, state == 4) = False) 371
                                                                                                                                        end
                                                                                                                                else
                                                                                                                                        begin
                                                                                                                                        $display(";A 364");  //assertion( 2 <= Concat(0, instQueueWr_Addr + 31*instQueueRd_Addr) = False) 364
                                                                                                                                            flush = 0;$display(";A 381");  //assertion( flush = 0) 381
                                                                                                                                            more = (-1);$display(";A 382");  //assertion( more = 1) 382
                                                                                                                                        end
                                                                                                                            end
                                                                                                                        else
                                                                                                                            begin
                                                                                                                            $display(";A 362");  //assertion( temp_q_rd == 230 = False) 362
                                                                                                                                if ((temp_q_rd == 8'h04))
                                                                                                                                        begin
                                                                                                                                        $display(";A 383");  //assertion( temp_q_rd == 4 = True) 383
                                                                                                                                            instAddrPointer = (instAddrPointer + 1);$display(";A 385");  //assertion( instAddrPointer = 1 + instAddrPointer) 385
                                                                                                                                            instQueueRd_Addr = ((instQueueRd_Addr + 5'h01) & 5'h0f);$display(";A 386");  //assertion( instQueueRd_Addr = Concat(0, 1 + Extract(3, 0, instQueueRd_Addr))) 386
                                                                                                                                            flush = 0;$display(";A 387");  //assertion( flush = 0) 387
                                                                                                                                            more = 0;$display(";A 388");  //assertion( more = 0) 388
                                                                                                                                        end
                                                                                                                                else
                                                                                                                                    begin
                                                                                                                                    $display(";A 384");  //assertion( temp_q_rd == 4 = False) 384
                                                                                                                                        if ((temp_q_rd == 8'h05))
                                                                                                                                                begin
                                                                                                                                                $display(";A 389");  //assertion( temp_q_rd == 5 = True) 389
                                                                                                                                                    instAddrPointer = (instAddrPointer + 1);$display(";A 391");  //assertion( instAddrPointer = 1 + instAddrPointer) 391
                                                                                                                                                    instQueueRd_Addr = ((instQueueRd_Addr + 5'h01) & 5'h0f);$display(";A 392");  //assertion( instQueueRd_Addr = Concat(0, 1 + Extract(3, 0, instQueueRd_Addr))) 392
                                                                                                                                                    flush = 0;$display(";A 393");  //assertion( flush = 0) 393
                                                                                                                                                    more = 0;$display(";A 394");  //assertion( more = 0) 394
                                                                                                                                                end
                                                                                                                                        else
                                                                                                                                            begin
                                                                                                                                            $display(";A 390");  //assertion( temp_q_rd == 5 = False) 390
                                                                                                                                                if ((temp_q_rd == 8'hd0))
                                                                                                                                                        begin
                                                                                                                                                        $display(";A 395");  //assertion( temp_q_rd == 208 = True) 395
                                                                                                                                                            instAddrPointer = (instAddrPointer + 2);$display(";A 397");  //assertion( instAddrPointer = 2 + instAddrPointer) 397
                                                                                                                                                            instQueueRd_Addr = ((instQueueRd_Addr + 5'h02) & 5'h0f);$display(";A 398");  //assertion( instQueueRd_Addr = Concat(0, 2 + Extract(3, 0, instQueueRd_Addr))) 398
                                                                                                                                                            flush = 0;$display(";A 399");  //assertion( flush = 0) 399
                                                                                                                                                            more = 0;$display(";A 400");  //assertion( more = 0) 400
                                                                                                                                                        end
                                                                                                                                                else
                                                                                                                                                    begin
                                                                                                                                                    $display(";A 396");  //assertion( temp_q_rd == 208 = False) 396
                                                                                                                                                        if ((temp_q_rd == 8'hc0))
                                                                                                                                                                begin
                                                                                                                                                                $display(";A 401");  //assertion( temp_q_rd == 192 = True) 401
                                                                                                                                                                    instAddrPointer = (instAddrPointer + 2);$display(";A 403");  //assertion( instAddrPointer = 2 + instAddrPointer) 403
                                                                                                                                                                    instQueueRd_Addr = ((instQueueRd_Addr + 5'h02) & 5'h0f);$display(";A 404");  //assertion( instQueueRd_Addr = Concat(0, 2 + Extract(3, 0, instQueueRd_Addr))) 404
                                                                                                                                                                    flush = 0;$display(";A 405");  //assertion( flush = 0) 405
                                                                                                                                                                    more = 0;$display(";A 406");  //assertion( more = 0) 406
                                                                                                                                                                end
                                                                                                                                                        else
                                                                                                                                                            begin
                                                                                                                                                            $display(";A 402");  //assertion( temp_q_rd == 192 = False) 402
                                                                                                                                                                if ((temp_q_rd == 8'h40))
                                                                                                                                                                        begin
                                                                                                                                                                        $display(";A 407");  //assertion( temp_q_rd == 64 = True) 407
                                                                                                                                                                            instAddrPointer = (instAddrPointer + 1);$display(";A 409");  //assertion( instAddrPointer = 1 + instAddrPointer) 409
                                                                                                                                                                            instQueueRd_Addr = ((instQueueRd_Addr + 5'h01) & 5'h0f);$display(";A 410");  //assertion( instQueueRd_Addr = Concat(0, 1 + Extract(3, 0, instQueueRd_Addr))) 410
                                                                                                                                                                            flush = 0;$display(";A 411");  //assertion( flush = 0) 411
                                                                                                                                                                            more = 0;$display(";A 412");  //assertion( more = 0) 412
                                                                                                                                                                        end
                                                                                                                                                                else
                                                                                                                                                                    begin
                                                                                                                                                                    $display(";A 408");  //assertion( temp_q_rd == 64 = False) 408
                                                                                                                                                                        if ((temp_q_rd == 8'h43))
                                                                                                                                                                                begin
                                                                                                                                                                                $display(";A 413");  //assertion( temp_q_rd == 67 = True) 413
                                                                                                                                                                                    instAddrPointer = (instAddrPointer + 1);$display(";A 415");  //assertion( instAddrPointer = 1 + instAddrPointer) 415
                                                                                                                                                                                    instQueueRd_Addr = ((instQueueRd_Addr + 5'h01) & 5'h0f);$display(";A 416");  //assertion( instQueueRd_Addr = Concat(0, 1 + Extract(3, 0, instQueueRd_Addr))) 416
                                                                                                                                                                                    flush = 0;$display(";A 417");  //assertion( flush = 0) 417
                                                                                                                                                                                    more = 0;$display(";A 418");  //assertion( more = 0) 418
                                                                                                                                                                                end
                                                                                                                                                                        else
                                                                                                                                                                                begin
                                                                                                                                                                                $display(";A 414");  //assertion( temp_q_rd == 67 = False) 414
                                                                                                                                                                                    instAddrPointer = (instAddrPointer + 1);$display(";A 419");  //assertion( instAddrPointer = 1 + instAddrPointer) 419
                                                                                                                                                                                    instQueueRd_Addr = ((instQueueRd_Addr + 5'h01) & 5'h0f);$display(";A 420");  //assertion( instQueueRd_Addr = Concat(0, 1 + Extract(3, 0, instQueueRd_Addr))) 420
                                                                                                                                                                                    flush = 0;$display(";A 421");  //assertion( flush = 0) 421
                                                                                                                                                                                    more = 0;$display(";A 422");  //assertion( more = 0) 422
                                                                                                                                                                                end
                                                                                                                                                                    end
                                                                                                                                                            end
                                                                                                                                                    end
                                                                                                                                            end
                                                                                                                                    end
                                                                                                                            end
                                                                                                                    end
                                                                                                            end
                                                                                                    end
                                                                                            end
                                                                                    end
                                                                            end
                                                                    end
                                                            end
                                                    end
                                            end
                                    end
                                if (((~(instQueueRd_Addr < instQueueWr_Addr)) || ((((15 - instQueueRd_Addr) < 32'h00000004) || flush) || more)))
                                    begin
                                    $display(";A 423");  //assertion( Or(flush == 1, more == 1, ULE(instQueueWr_Addr, instQueueRd_Addr), Not(4 <= Concat(0, 15 + 31*instQueueRd_Addr))) = True) 423
                                        state2 = 4'h7;$display(";A 425");  //assertion( state2 = 7) 425
                                    end
                                else
                                    $display(";A 424");  //assertion( Or(flush == 1, more == 1, Not(4 <= Concat(0, 15 + 31*instQueueRd_Addr)), ULE(instQueueWr_Addr, instQueueRd_Addr)) = False) 424
                            end
                      4'h6:
                            begin
                            $display(";A 426");  //assertion( state2 == 6 = True) 426
                                datao <= ((uWord << 32'h00000010) + lWord);$display(";A 427");  //assertion( datao = Concat(0, uWord, lWord)) 427
                                if ((~ready_n))
                                        begin
                                        $display(";A 428");  //assertion( ~ready_n = True) 428
                                            requestPending <= 0;$display(";A 430");  //assertion( requestPending = 0) 430
                                            state2 = 4'h5;$display(";A 431");  //assertion( state2 = 5) 431
                                        end
                                else
                                    $display(";A 429");  //assertion( ~ready_n = False) 429
                            end
                      4'h7:
                            begin
                            $display(";A 432");  //assertion( state2 == 7 = True) 432
                                if (flush)
                                        begin
                                        $display(";A 433");  //assertion( Not(flush == 0) = True) 433
                                            instQueueRd_Addr = 1;$display(";A 435");  //assertion( instQueueRd_Addr = 1) 435
                                            instQueueWr_Addr = 1;$display(";A 436");  //assertion( instQueueWr_Addr = 1) 436
                                            if ((instAddrPointer < 0))
                                                begin
                                                $display(";A 437");  //assertion( Not(0 <= instAddrPointer) = True) 437
                                                    fWord = (-instAddrPointer);$display(";A 439");  //assertion( fWord = 4294967295*instAddrPointer) 439
                                                end
                                            else
                                                begin
                                                $display(";A 438");  //assertion( Not(0 <= instAddrPointer) = False) 438
                                                    fWord = instAddrPointer;$display(";A 440");  //assertion( fWord = instAddrPointer) 440
                                                end
                                            if (((fWord & 32'h00000001) != 32'h00000000))
                                                begin
                                                $display(";A 441");  //assertion( Not(Extract(0, 0, fWord) == 0) = True) 441
                                                    instQueueRd_Addr = ((1 + (fWord & 3)) & 15);$display(";A 443");  //assertion( instQueueRd_Addr = Concat(0, 1 + Concat(0, Extract(1, 0, fWord)))) 443
                                                end
                                            else
                                                $display(";A 442");  //assertion( Not(Extract(0, 0, fWord) == 0) = False) 442
                                        end
                                else
                                    $display(";A 434");  //assertion( Not(flush == 0) = False) 434
                                if (((15 - instQueueRd_Addr) < 32'h00000003))
                                        begin
                                        $display(";A 444");  //assertion( Not(3 <= Concat(0, 15 + 31*instQueueRd_Addr)) = True) 444
                                            state2 = 4'h8;$display(";A 446");  //assertion( state2 = 8) 446
                                            instQueueWr_Addr = 0;$display(";A 447");  //assertion( instQueueWr_Addr = 0) 447
                                        end
                                else
                                    begin
                                    $display(";A 445");  //assertion( Not(3 <= Concat(0, 15 + 31*instQueueRd_Addr)) = False) 445
                                        state2 = 4'h9;$display(";A 448");  //assertion( state2 = 9) 448
                                    end
                            end
                      4'h8:
                        begin
                        $display(";A 449");  //assertion( state2 == 8 = True) 449
                            if ((instQueueRd_Addr <= 15))
                                    begin
                                    $display(";A 450");  //assertion( Extract(4, 4, instQueueRd_Addr) == 0 = True) 450
                                        temp8 = queue[instQueueRd_Addr];$display(";A 452");  //assertion( temp8 = queue[Extract(3, 0, instQueueRd_Addr)]) 452
                                        queue[instQueueWr_Addr] = temp8;$display(";A 453");  //assertion( queue[Extract(3, 0, instQueueWr_Addr)] = temp8) 453
                                        instQueueRd_Addr = ((instQueueRd_Addr + 5'h01) & 5'h0f);$display(";A 454");  //assertion( instQueueRd_Addr = Concat(0, 1 + Extract(3, 0, instQueueRd_Addr))) 454
                                        instQueueWr_Addr = ((instQueueWr_Addr + 5'h01) & 5'h0f);$display(";A 455");  //assertion( instQueueWr_Addr = Concat(0, 1 + Extract(3, 0, instQueueWr_Addr))) 455
                                        state2 = 4'h8;$display(";A 456");  //assertion( state2 = 8) 456
                                    end
                            else
                                    begin
                                    $display(";A 451");  //assertion( Extract(4, 4, instQueueRd_Addr) == 0 = False) 451
                                        instQueueRd_Addr = 0;$display(";A 457");  //assertion( instQueueRd_Addr = 0) 457
                                        state2 = 4'h9;$display(";A 458");  //assertion( state2 = 9) 458
                                    end
                        end
                      4'h9:
                            begin
                            $display(";A 459");  //assertion( state2 == 9 = True) 459
                                rEIP <= phyAddrPointer;$display(";A 460");  //assertion( rEIP = phyAddrPointer) 460
                                state2 = 4'h1;$display(";A 461");  //assertion( state2 = 1) 461
                            end
                    endcase
                end
            // Display the variables
            begin
            $display(";R be_n = %d", be_n);
            $display(";R address = %d", address);
            $display(";R w_r_n = %d", w_r_n);
            $display(";R d_c_n = %d", d_c_n);
            $display(";R m_io_n = %d", m_io_n);
            $display(";R ads_n = %d", ads_n);
            $display(";R datao = %d", datao);
            $display(";R EAX = %d", EAX);
            $display(";R EBX = %d", EBX);
            $display(";R byteEnable = %d", byteEnable);
            $display(";R codeFetch = %d", codeFetch);
            $display(";R dataWidth = %d", dataWidth);
            $display(";R eax_temp0 = %d", eax_temp0);
            $display(";R eax_temp1 = %d", eax_temp1);
            $display(";R eax_temp2 = %d", eax_temp2);
            $display(";R ebx_temp0 = %d", ebx_temp0);
            $display(";R ebx_temp1 = %d", ebx_temp1);
            $display(";R ebx_temp2 = %d", ebx_temp2);
            $display(";R extended = %d", extended);
            $display(";R fWord = %d", fWord);
            $display(";R flush = %d", flush);
            $display(";R i = %d", i);
            $display(";R instAddrPointer = %d", instAddrPointer);
            $display(";R instQueueRd_Addr = %d", instQueueRd_Addr);
            $display(";R instQueueWr_Addr = %d", instQueueWr_Addr);
            $display(";R lWord = %d", lWord);
            $display(";R memoryFetch = %d", memoryFetch);
            $display(";R more = %d", more);
            $display(";R nonAligned = %d", nonAligned);
            $display(";R phyAddrPointer = %d", phyAddrPointer);
            $display(";R queue[0] = %d", queue[0]);
            $display(";R queue[1] = %d", queue[1]);
            $display(";R queue[2] = %d", queue[2]);
            $display(";R queue[3] = %d", queue[3]);
            $display(";R queue[4] = %d", queue[4]);
            $display(";R queue[5] = %d", queue[5]);
            $display(";R queue[6] = %d", queue[6]);
            $display(";R queue[7] = %d", queue[7]);
            $display(";R queue[8] = %d", queue[8]);
            $display(";R queue[9] = %d", queue[9]);
            $display(";R queue[10] = %d", queue[10]);
            $display(";R queue[11] = %d", queue[11]);
            $display(";R queue[12] = %d", queue[12]);
            $display(";R queue[13] = %d", queue[13]);
            $display(";R queue[14] = %d", queue[14]);
            $display(";R queue[15] = %d", queue[15]);
            $display(";R rEIP = %d", rEIP);
            $display(";R readRequest = %d", readRequest);
            $display(";R requestPending = %d", requestPending);
            $display(";R state = %d", state);
            $display(";R state2 = %d", state2);
            $display(";R stateBS16 = %d", stateBS16);
            $display(";R stateNA = %d", stateNA);
            $display(";R temp8 = %d", temp8);
            $display(";R temp_q_rd = %d", temp_q_rd);
            $display(";R uWord = %d", uWord);
            end
        end

    //Following code is from line 492
        always @(posedge clock) begin
            if (reset)
                    begin
                        byteEnable <= 4'h0;$display(";A 464");  //assertion( byteEnable = 0) 464
                        nonAligned <= 0;$display(";A 465");  //assertion( nonAligned = 0) 465
                    end
            else
                begin
                    case (dataWidth)
                      0:
                        begin
                        $display(";A 466");  //assertion( dataWidth == 0 = True) 466
                            case ((rEIP & 3))
                              0:
                                begin
                                $display(";A 467");  //assertion( Extract(1, 0, rEIP) == 0 = True) 467
                                    byteEnable <= 4'he;$display(";A 468");  //assertion( byteEnable = 14) 468
                                end
                              1:
                                begin
                                $display(";A 469");  //assertion( Extract(1, 0, rEIP) == 1 = True) 469
                                    byteEnable <= 4'hd;$display(";A 470");  //assertion( byteEnable = 13) 470
                                end
                              2:
                                begin
                                $display(";A 471");  //assertion( Extract(1, 0, rEIP) == 2 = True) 471
                                    byteEnable <= 4'hb;$display(";A 472");  //assertion( byteEnable = 11) 472
                                end
                              3:
                                begin
                                $display(";A 473");  //assertion( Extract(1, 0, rEIP) == 3 = True) 473
                                    byteEnable <= 4'h7;$display(";A 474");  //assertion( byteEnable = 7) 474
                                end
                              default:
                                begin
                                $display(";A 475");  //assertion( ~(If(Extract(1, 0, rEIP) == 0, 1, 0) | If(Extract(1, 0, rEIP) == 1, 1, 0) | If(Extract(1, 0, rEIP) == 2, 1, 0) | If(Extract(1, 0, rEIP) == 3, 1, 0)) = True) 475
                                    byteEnable <= byteEnable;$display(";A 476");  //assertion( byteEnable = byteEnable) 476
                                end
                            endcase
                        end
                      1:
                        begin
                        $display(";A 477");  //assertion( dataWidth == 1 = True) 477
                            case ((rEIP & 3))
                              0:
                                    begin
                                    $display(";A 478");  //assertion( Extract(1, 0, rEIP) == 0 = True) 478
                                        byteEnable <= 4'hc;$display(";A 479");  //assertion( byteEnable = 12) 479
                                        nonAligned <= 0;$display(";A 480");  //assertion( nonAligned = 0) 480
                                    end
                              1:
                                    begin
                                    $display(";A 481");  //assertion( Extract(1, 0, rEIP) == 1 = True) 481
                                        byteEnable <= 4'h9;$display(";A 482");  //assertion( byteEnable = 9) 482
                                        nonAligned <= 0;$display(";A 483");  //assertion( nonAligned = 0) 483
                                    end
                              2:
                                    begin
                                    $display(";A 484");  //assertion( Extract(1, 0, rEIP) == 2 = True) 484
                                        byteEnable <= 4'h3;$display(";A 485");  //assertion( byteEnable = 3) 485
                                        nonAligned <= 0;$display(";A 486");  //assertion( nonAligned = 0) 486
                                    end
                              3:
                                    begin
                                    $display(";A 487");  //assertion( Extract(1, 0, rEIP) == 3 = True) 487
                                        byteEnable <= 4'h7;$display(";A 488");  //assertion( byteEnable = 7) 488
                                        nonAligned <= (-1);$display(";A 489");  //assertion( nonAligned = 1) 489
                                    end
                              default:
                                    begin
                                    $display(";A 490");  //assertion( ~(If(Extract(1, 0, rEIP) == 0, 1, 0) | If(Extract(1, 0, rEIP) == 1, 1, 0) | If(Extract(1, 0, rEIP) == 2, 1, 0) | If(Extract(1, 0, rEIP) == 3, 1, 0)) = True) 490
                                        byteEnable <= byteEnable;$display(";A 491");  //assertion( byteEnable = byteEnable) 491
                                        nonAligned <= nonAligned;$display(";A 492");  //assertion( nonAligned = nonAligned) 492
                                    end
                            endcase
                        end
                      2:
                        begin
                        $display(";A 493");  //assertion( dataWidth == 2 = True) 493
                            case ((rEIP & 3))
                              0:
                                    begin
                                    $display(";A 494");  //assertion( Extract(1, 0, rEIP) == 0 = True) 494
                                        byteEnable <= 4'h0;$display(";A 495");  //assertion( byteEnable = 0) 495
                                        nonAligned <= 0;$display(";A 496");  //assertion( nonAligned = 0) 496
                                    end
                              1:
                                    begin
                                    $display(";A 497");  //assertion( Extract(1, 0, rEIP) == 1 = True) 497
                                        byteEnable <= 4'h1;$display(";A 498");  //assertion( byteEnable = 1) 498
                                        nonAligned <= (-1);$display(";A 499");  //assertion( nonAligned = 1) 499
                                    end
                              2:
                                    begin
                                    $display(";A 500");  //assertion( Extract(1, 0, rEIP) == 2 = True) 500
                                        nonAligned <= (-1);$display(";A 501");  //assertion( nonAligned = 1) 501
                                        byteEnable <= 4'h3;$display(";A 502");  //assertion( byteEnable = 3) 502
                                    end
                              3:
                                    begin
                                    $display(";A 503");  //assertion( Extract(1, 0, rEIP) == 3 = True) 503
                                        nonAligned <= (-1);$display(";A 504");  //assertion( nonAligned = 1) 504
                                        byteEnable <= 4'h7;$display(";A 505");  //assertion( byteEnable = 7) 505
                                    end
                              default:
                                    begin
                                    $display(";A 506");  //assertion( ~(If(Extract(1, 0, rEIP) == 0, 1, 0) | If(Extract(1, 0, rEIP) == 1, 1, 0) | If(Extract(1, 0, rEIP) == 2, 1, 0) | If(Extract(1, 0, rEIP) == 3, 1, 0)) = True) 506
                                        nonAligned <= nonAligned;$display(";A 507");  //assertion( nonAligned = nonAligned) 507
                                        byteEnable <= byteEnable;$display(";A 508");  //assertion( byteEnable = byteEnable) 508
                                    end
                            endcase
                        end
                      default:
                            begin
                            $display(";A 509");  //assertion( ~(If(dataWidth == 0, 1, 0) | If(dataWidth == 1, 1, 0) | If(dataWidth == 2, 1, 0)) = True) 509
                                nonAligned <= nonAligned;$display(";A 510");  //assertion( nonAligned = nonAligned) 510
                                byteEnable <= byteEnable;$display(";A 511");  //assertion( byteEnable = byteEnable) 511
                            end
                    endcase
                end
            // Display the variables
            begin
            $display(";R be_n = %d", be_n);
            $display(";R address = %d", address);
            $display(";R w_r_n = %d", w_r_n);
            $display(";R d_c_n = %d", d_c_n);
            $display(";R m_io_n = %d", m_io_n);
            $display(";R ads_n = %d", ads_n);
            $display(";R datao = %d", datao);
            $display(";R EAX = %d", EAX);
            $display(";R EBX = %d", EBX);
            $display(";R byteEnable = %d", byteEnable);
            $display(";R codeFetch = %d", codeFetch);
            $display(";R dataWidth = %d", dataWidth);
            $display(";R eax_temp0 = %d", eax_temp0);
            $display(";R eax_temp1 = %d", eax_temp1);
            $display(";R eax_temp2 = %d", eax_temp2);
            $display(";R ebx_temp0 = %d", ebx_temp0);
            $display(";R ebx_temp1 = %d", ebx_temp1);
            $display(";R ebx_temp2 = %d", ebx_temp2);
            $display(";R extended = %d", extended);
            $display(";R fWord = %d", fWord);
            $display(";R flush = %d", flush);
            $display(";R i = %d", i);
            $display(";R instAddrPointer = %d", instAddrPointer);
            $display(";R instQueueRd_Addr = %d", instQueueRd_Addr);
            $display(";R instQueueWr_Addr = %d", instQueueWr_Addr);
            $display(";R lWord = %d", lWord);
            $display(";R memoryFetch = %d", memoryFetch);
            $display(";R more = %d", more);
            $display(";R nonAligned = %d", nonAligned);
            $display(";R phyAddrPointer = %d", phyAddrPointer);
            $display(";R queue[0] = %d", queue[0]);
            $display(";R queue[1] = %d", queue[1]);
            $display(";R queue[2] = %d", queue[2]);
            $display(";R queue[3] = %d", queue[3]);
            $display(";R queue[4] = %d", queue[4]);
            $display(";R queue[5] = %d", queue[5]);
            $display(";R queue[6] = %d", queue[6]);
            $display(";R queue[7] = %d", queue[7]);
            $display(";R queue[8] = %d", queue[8]);
            $display(";R queue[9] = %d", queue[9]);
            $display(";R queue[10] = %d", queue[10]);
            $display(";R queue[11] = %d", queue[11]);
            $display(";R queue[12] = %d", queue[12]);
            $display(";R queue[13] = %d", queue[13]);
            $display(";R queue[14] = %d", queue[14]);
            $display(";R queue[15] = %d", queue[15]);
            $display(";R rEIP = %d", rEIP);
            $display(";R readRequest = %d", readRequest);
            $display(";R requestPending = %d", requestPending);
            $display(";R state = %d", state);
            $display(";R state2 = %d", state2);
            $display(";R stateBS16 = %d", stateBS16);
            $display(";R stateNA = %d", stateNA);
            $display(";R temp8 = %d", temp8);
            $display(";R temp_q_rd = %d", temp_q_rd);
            $display(";R uWord = %d", uWord);
            end
        end

endmodule
