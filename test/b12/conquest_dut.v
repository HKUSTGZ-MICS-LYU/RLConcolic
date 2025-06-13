//Following code is from line 1
module b12(speaker, clock, k, nloss, reset, start, nl, __obs);

    input               clock;
    input               reset;
    input               start;
    input         [3:0] k;
    output              nloss;
    output        [3:0] nl;
    output              speaker;
    input               __obs;

    reg nloss = 1'b0;
    reg [3:0] nl = 4'b0;
    reg speaker = 1'b0;
    //Parameter Declaration
    reg  [1:0]  memory [0:31];
    reg  wr = 1'b0;
    reg  [4:0]  address = 5'b0;
    reg  [1:0]  data_in = 2'b0;
    reg  [1:0]  data_out = 2'b0;
    reg  [1:0]  num = 2'b0;
    reg  [2:0]  sound = 3'b0;
    reg  play = 1'b0;
    reg  s = 1'b0;
    reg  [2:0]  counter = 3'b0;
    reg  [1:0]  count = 2'b0;
    reg  [4:0]  gamma = 5'b0;
    reg  [1:0]  ind = 2'b0;
    reg  [4:0]  scan = 5'b0;
    reg  [4:0]  max = 5'b0;
    reg  [5:0]  timebase = 6'b0;
    reg  [5:0]  count2 = 6'b0;

    //Following code is from line 34
        always @(posedge clock) begin
            if (reset)
                begin
                    s = 0;  $display(";A 2");  //assertion( s = 0) 2
                    speaker <= 0;  $display(";A 3");  //assertion( speaker = 0) 3
                    counter = 0;  $display(";A 4");  //assertion( counter = 0) 4
                end
            else
                begin
                    if (play)
                        begin
                          $display(";A 5");                          //assertion( 0 != play = True) 5
                            case (sound)
                              0:
                                begin
                                  $display(";A 7");                                  //assertion( sound == ZeroExt(2, 0) = True) 7
                                    if ((counter > 2))
                                        begin
                                          $display(";A 8");                                          //assertion( UGT(counter, ZeroExt(1, 2)) = True) 8
                                            s = (~s);  $display(";A 10");  //assertion( s = ~s) 10
                                            counter = 0;  $display(";A 11");  //assertion( counter = 0) 11
                                            speaker <= s;  $display(";A 12");  //assertion( speaker = s) 12
                                        end
                                    else
                                        begin
                                          $display(";A 9");                                          //assertion( UGT(counter, ZeroExt(1, 2)) = False) 9
                                            counter = (counter + 1);  $display(";A 13");  //assertion( counter = counter + ZeroExt(2, 1)) 13
                                        end
                                end
                              1:
                                begin
                                  $display(";A 14");                                  //assertion( sound == ZeroExt(2, 1) = True) 14
                                    if ((counter > 3))
                                        begin
                                          $display(";A 15");                                          //assertion( UGT(counter, ZeroExt(1, 3)) = True) 15
                                            s = (~s);  $display(";A 17");  //assertion( s = ~s) 17
                                            speaker <= s;  $display(";A 18");  //assertion( speaker = s) 18
                                            counter = 0;  $display(";A 19");  //assertion( counter = 0) 19
                                        end
                                    else
                                        begin
                                          $display(";A 16");                                          //assertion( UGT(counter, ZeroExt(1, 3)) = False) 16
                                            counter = (counter + 1);  $display(";A 20");  //assertion( counter = counter + ZeroExt(2, 1)) 20
                                        end
                                end
                              2:
                                begin
                                  $display(";A 21");                                  //assertion( sound == ZeroExt(1, 2) = True) 21
                                    if ((counter > 4))
                                        begin
                                          $display(";A 22");                                          //assertion( UGT(counter, 4) = True) 22
                                            s = (~s);  $display(";A 24");  //assertion( s = ~s) 24
                                            speaker <= s;  $display(";A 25");  //assertion( speaker = s) 25
                                            counter = 0;  $display(";A 26");  //assertion( counter = 0) 26
                                        end
                                    else
                                        begin
                                          $display(";A 23");                                          //assertion( UGT(counter, 4) = False) 23
                                            counter = (counter + 1);  $display(";A 27");  //assertion( counter = counter + ZeroExt(2, 1)) 27
                                        end
                                end
                              3:
                                begin
                                  $display(";A 28");                                  //assertion( sound == ZeroExt(1, 3) = True) 28
                                    if ((counter > 5))
                                        begin
                                          $display(";A 29");                                          //assertion( UGT(counter, 5) = True) 29
                                            s = (~s);  $display(";A 31");  //assertion( s = ~s) 31
                                            speaker <= s;  $display(";A 32");  //assertion( speaker = s) 32
                                            counter = 0;  $display(";A 33");  //assertion( counter = 0) 33
                                        end
                                    else
                                        begin
                                          $display(";A 30");                                          //assertion( UGT(counter, 5) = False) 30
                                            counter = (counter + 1);  $display(";A 34");  //assertion( counter = counter + ZeroExt(2, 1)) 34
                                        end
                                end
                              4:
                                begin
                                  $display(";A 35");                                  //assertion( 4 == sound = True) 35
                                    if ((counter > 6))
                                        begin
                                          $display(";A 36");                                          //assertion( UGT(counter, 6) = True) 36
                                            s = (~s);  $display(";A 38");  //assertion( s = ~s) 38
                                            speaker <= s;  $display(";A 39");  //assertion( speaker = s) 39
                                            counter = 0;  $display(";A 40");  //assertion( counter = 0) 40
                                        end
                                    else
                                        begin
                                          $display(";A 37");                                          //assertion( UGT(counter, 6) = False) 37
                                            counter = (counter + 1);  $display(";A 41");  //assertion( counter = counter + ZeroExt(2, 1)) 41
                                        end
                                end
                              5:
                                begin
                                  $display(";A 42");                                  //assertion( 5 == sound = True) 42
                                    if ((counter > 1))
                                        begin
                                          $display(";A 43");                                          //assertion( UGT(counter, ZeroExt(2, 1)) = True) 43
                                            s = (~s);  $display(";A 45");  //assertion( s = ~s) 45
                                            speaker <= s;  $display(";A 46");  //assertion( speaker = s) 46
                                            counter = 0;  $display(";A 47");  //assertion( counter = 0) 47
                                        end
                                    else
                                        begin
                                          $display(";A 44");                                          //assertion( UGT(counter, ZeroExt(2, 1)) = False) 44
                                            counter = (counter + 1);  $display(";A 48");  //assertion( counter = counter + ZeroExt(2, 1)) 48
                                        end
                                end
                              default:
                                begin
                                  $display(";A 49");                                  //assertion( If(sound != ZeroExt(2, 0) == True, 1, 0) & If(sound != ZeroExt(2, 1) == True, 1, 0) & If(sound != ZeroExt(1, 2) == True, 1, 0) & If(sound != ZeroExt(1, 3) == True, 1, 0) & If(4 != sound == True, 1, 0) & If(5 != sound == True, 1, 0) = True) 49
                                    counter = 0;  $display(";A 50");  //assertion( counter = 0) 50
                                end
                            endcase
                        end
                    else
                        begin
                          $display(";A 6");                          //assertion( 0 != play = False) 6
                            counter = 0;  $display(";A 51");  //assertion( counter = 0) 51
                            speaker <= 0;  $display(";A 52");  //assertion( speaker = 0) 52
                        end
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 133
        always @(posedge clock) begin
            if (reset)
                begin
                    count = 0;  $display(";A 55");  //assertion( count = 0) 55
                    num <= 0;  $display(";A 56");  //assertion( num = 0) 56
                end
            else
                begin
                    if ((count == 2'b11))
                        begin
                          $display(";A 57");                          //assertion( 3 == count = True) 57
                            count = 0;  $display(";A 59");  //assertion( count = 0) 59
                        end
                    else
                        begin
                          $display(";A 58");                          //assertion( 3 == count = False) 58
                            count = (count + 1);  $display(";A 60");  //assertion( count = count + ZeroExt(1, 1)) 60
                        end
                    num <= count;  $display(";A 61");  //assertion( num = count) 61
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 155
        always @(posedge clock) begin
            if (reset)
                begin
                    data_out <= 0;  $display(";A 64");  //assertion( data_out = 0) 64
                    memory[0] = 0;  $display(";A 65");  //assertion( memory[0] = 0) 65
                    memory[1] = 0;  $display(";A 66");  //assertion( memory[1] = 0) 66
                    memory[2] = 0;  $display(";A 67");  //assertion( memory[2] = 0) 67
                    memory[3] = 0;  $display(";A 68");  //assertion( memory[3] = 0) 68
                    memory[4] = 0;  $display(";A 69");  //assertion( memory[4] = 0) 69
                    memory[5] = 0;  $display(";A 70");  //assertion( memory[5] = 0) 70
                    memory[6] = 0;  $display(";A 71");  //assertion( memory[6] = 0) 71
                    memory[7] = 0;  $display(";A 72");  //assertion( memory[7] = 0) 72
                    memory[8] = 0;  $display(";A 73");  //assertion( memory[8] = 0) 73
                    memory[9] = 0;  $display(";A 74");  //assertion( memory[9] = 0) 74
                    memory[10] = 0;  $display(";A 75");  //assertion( memory[10] = 0) 75
                    memory[11] = 0;  $display(";A 76");  //assertion( memory[11] = 0) 76
                    memory[12] = 0;  $display(";A 77");  //assertion( memory[12] = 0) 77
                    memory[13] = 0;  $display(";A 78");  //assertion( memory[13] = 0) 78
                    memory[14] = 0;  $display(";A 79");  //assertion( memory[14] = 0) 79
                    memory[15] = 0;  $display(";A 80");  //assertion( memory[15] = 0) 80
                    memory[16] = 0;  $display(";A 81");  //assertion( memory[16] = 0) 81
                    memory[17] = 0;  $display(";A 82");  //assertion( memory[17] = 0) 82
                    memory[18] = 0;  $display(";A 83");  //assertion( memory[18] = 0) 83
                    memory[19] = 0;  $display(";A 84");  //assertion( memory[19] = 0) 84
                    memory[20] = 0;  $display(";A 85");  //assertion( memory[20] = 0) 85
                    memory[21] = 0;  $display(";A 86");  //assertion( memory[21] = 0) 86
                    memory[22] = 0;  $display(";A 87");  //assertion( memory[22] = 0) 87
                    memory[23] = 0;  $display(";A 88");  //assertion( memory[23] = 0) 88
                    memory[24] = 0;  $display(";A 89");  //assertion( memory[24] = 0) 89
                    memory[25] = 0;  $display(";A 90");  //assertion( memory[25] = 0) 90
                    memory[26] = 0;  $display(";A 91");  //assertion( memory[26] = 0) 91
                    memory[27] = 0;  $display(";A 92");  //assertion( memory[27] = 0) 92
                    memory[28] = 0;  $display(";A 93");  //assertion( memory[28] = 0) 93
                    memory[29] = 0;  $display(";A 94");  //assertion( memory[29] = 0) 94
                    memory[30] = 0;  $display(";A 95");  //assertion( memory[30] = 0) 95
                    memory[31] = 0;  $display(";A 96");  //assertion( memory[31] = 0) 96
                end
            else
                begin
                    data_out <= memory[address];  $display(";A 97");  //assertion( data_out = memory[address]) 97
                    if (wr)
                        begin
                          $display(";A 98");                          //assertion( 0 != wr = True) 98
                            memory[address] = data_in;  $display(";A 100");  //assertion( memory[address] = data_in) 100
                        end
                    else
                          $display(";A 99");                          //assertion( 0 != wr = False) 99
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 217
        always @(posedge clock) begin
            if (reset)
                begin
                    nloss <= 'b0;  $display(";A 103");  //assertion( nloss = 0) 103
                    nl <= 'b0;  $display(";A 104");  //assertion( nl = 0) 104
                    play <= 'b0;  $display(";A 105");  //assertion( play = 0) 105
                    wr <= 'b0;  $display(";A 106");  //assertion( wr = 0) 106
                    scan = 'b0;  $display(";A 107");  //assertion( scan = 0) 107
                    max = 'b0;  $display(";A 108");  //assertion( max = 0) 108
                    ind = 'b0;  $display(";A 109");  //assertion( ind = 0) 109
                    timebase = 'b0;  $display(";A 110");  //assertion( timebase = 0) 110
                    count2 = 'b0;  $display(";A 111");  //assertion( count2 = 0) 111
                    sound <= 'b0;  $display(";A 112");  //assertion( sound = 0) 112
                    address <= 'b0;  $display(";A 113");  //assertion( address = 0) 113
                    data_in <= 'b0;  $display(";A 114");  //assertion( data_in = 0) 114
                    gamma = 'b0;  $display(";A 115");  //assertion( gamma = 0) 115
                end
            else
                begin
                    if ((start == 1'b1))
                        begin
                          $display(";A 116");                          //assertion( 1 == start = True) 116
                            gamma = 1;  $display(";A 118");  //assertion( gamma = 1) 118
                        end
                    else
                        begin
                          $display(";A 117");                          //assertion( 1 == start = False) 117
                            gamma = gamma;  $display(";A 119");  //assertion( gamma = gamma) 119
                        end
                    case (gamma)
                      0:
                        begin
                          $display(";A 120");                          //assertion( gamma == ZeroExt(4, 0) = True) 120
                            gamma = 'b0;  $display(";A 121");  //assertion( gamma = 0) 121
                        end
                      1:
                        begin
                          $display(";A 122");                          //assertion( gamma == ZeroExt(4, 1) = True) 122
                            nloss <= 'b0;  $display(";A 123");  //assertion( nloss = 0) 123
                            nl <= 'b0;  $display(";A 124");  //assertion( nl = 0) 124
                            play <= 'b0;  $display(";A 125");  //assertion( play = 0) 125
                            wr <= 'b0;  $display(";A 126");  //assertion( wr = 0) 126
                            max = 'b0;  $display(";A 127");  //assertion( max = 0) 127
                            timebase = 33;  $display(";A 128");  //assertion( timebase = 33) 128
                            gamma = 2;  $display(";A 129");  //assertion( gamma = 2) 129
                        end
                      2:
                        begin
                          $display(";A 130");                          //assertion( gamma == ZeroExt(3, 2) = True) 130
                            scan = 'b0;  $display(";A 131");  //assertion( scan = 0) 131
                            wr <= 1;  $display(";A 132");  //assertion( wr = 1) 132
                            address <= max;  $display(";A 133");  //assertion( address = max) 133
                            data_in <= num;  $display(";A 134");  //assertion( data_in = num) 134
                            gamma = 3;  $display(";A 135");  //assertion( gamma = 3) 135
                        end
                      3:
                        begin
                          $display(";A 136");                          //assertion( gamma == ZeroExt(3, 3) = True) 136
                            wr <= 'b0;  $display(";A 137");  //assertion( wr = 0) 137
                            address <= scan;  $display(";A 138");  //assertion( address = scan) 138
                            gamma = 4;  $display(";A 139");  //assertion( gamma = 4) 139
                        end
                      4:
                        begin
                          $display(";A 140");                          //assertion( gamma == ZeroExt(2, 4) = True) 140
                            gamma = 5;  $display(";A 141");  //assertion( gamma = 5) 141
                        end
                      5:
                        begin
                          $display(";A 142");                          //assertion( gamma == ZeroExt(2, 5) = True) 142
                            nl[data_out] <= 1;  $display(";A 143");  //assertion( arr_nl_79[data_out] = 1) 143
                            count2 = timebase;  $display(";A 144");  //assertion( count2 = timebase) 144
                            play <= 1;  $display(";A 145");  //assertion( play = 1) 145
                            sound <= {1'b0, data_out};  $display(";A 146");  //assertion( sound = Concat(0, data_out)) 146
                            gamma = 6;  $display(";A 147");  //assertion( gamma = 6) 147
                        end
                      6:
                        begin
                          $display(";A 148");                          //assertion( gamma == ZeroExt(2, 6) = True) 148
                            if ((count2 == 'b0))
                                begin
                                  $display(";A 149");                                  //assertion( count2 == ZeroExt(5, 0) = True) 149
                                    nl <= 0;  $display(";A 151");  //assertion( nl = 0) 151
                                    play <= 0;  $display(";A 152");  //assertion( play = 0) 152
                                    count2 = timebase;  $display(";A 153");  //assertion( count2 = timebase) 153
                                    gamma = 7;  $display(";A 154");  //assertion( gamma = 7) 154
                                end
                            else
                                begin
                                  $display(";A 150");                                  //assertion( count2 == ZeroExt(5, 0) = False) 150
                                    count2 = (count2 - 1);  $display(";A 155");  //assertion( count2 = count2 - ZeroExt(5, 1)) 155
                                    gamma = 6;  $display(";A 156");  //assertion( gamma = 6) 156
                                end
                        end
                      7:
                        begin
                          $display(";A 157");                          //assertion( gamma == ZeroExt(2, 7) = True) 157
                            if ((count2 == 0))
                                begin
                                  $display(";A 158");                                  //assertion( count2 == ZeroExt(5, 0) = True) 158
                                    if ((scan != max))
                                        begin
                                          $display(";A 160");                                          //assertion( scan != max = True) 160
                                            scan = (scan + 1);  $display(";A 162");  //assertion( scan = scan + ZeroExt(4, 1)) 162
                                            gamma = 3;  $display(";A 163");  //assertion( gamma = 3) 163
                                        end
                                    else
                                        begin
                                          $display(";A 161");                                          //assertion( scan != max = False) 161
                                            scan = 0;  $display(";A 164");  //assertion( scan = 0) 164
                                            gamma = 8;  $display(";A 165");  //assertion( gamma = 8) 165
                                        end
                                end
                            else
                                begin
                                  $display(";A 159");                                  //assertion( count2 == ZeroExt(5, 0) = False) 159
                                    count2 = (count2 - 1);  $display(";A 166");  //assertion( count2 = count2 - ZeroExt(5, 1)) 166
                                    gamma = 7;  $display(";A 167");  //assertion( gamma = 7) 167
                                end
                        end
                      8:
                        begin
                          $display(";A 168");                          //assertion( gamma == ZeroExt(1, 8) = True) 168
                            count2 = 33;  $display(";A 169");  //assertion( count2 = 33) 169
                            address <= scan;  $display(";A 170");  //assertion( address = scan) 170
                            gamma = 9;  $display(";A 171");  //assertion( gamma = 9) 171
                        end
                      9:
                        begin
                          $display(";A 172");                          //assertion( gamma == ZeroExt(1, 9) = True) 172
                            gamma = 10;  $display(";A 173");  //assertion( gamma = 10) 173
                        end
                      10:
                        begin
                          $display(";A 174");                          //assertion( gamma == ZeroExt(1, 10) = True) 174
                            if ((count2 == 0))
                                begin
                                  $display(";A 175");                                  //assertion( count2 == ZeroExt(5, 0) = True) 175
                                    nloss <= 1;  $display(";A 177");  //assertion( nloss = 1) 177
                                    max = 0;  $display(";A 178");  //assertion( max = 0) 178
                                    gamma = 17;  $display(";A 179");  //assertion( gamma = 17) 179
                                end
                            else
                                begin
                                  $display(";A 176");                                  //assertion( count2 == ZeroExt(5, 0) = False) 176
                                    count2 = (count2 - 1);  $display(";A 180");  //assertion( count2 = count2 - ZeroExt(5, 1)) 180
                                    if ((k[0] == 1'b1))
                                        begin
                                          $display(";A 181");                                          //assertion( 1 == Extract(0, 0, k) = True) 181
                                            ind = 0;  $display(";A 183");  //assertion( ind = 0) 183
                                            sound <= 0;  $display(";A 184");  //assertion( sound = 0) 184
                                            play <= 1;  $display(";A 185");  //assertion( play = 1) 185
                                            count2 = timebase;  $display(";A 186");  //assertion( count2 = timebase) 186
                                            if ((data_out == 0))
                                                begin
                                                  $display(";A 187");                                                  //assertion( data_out == ZeroExt(1, 0) = True) 187
                                                    gamma = 11;  $display(";A 189");  //assertion( gamma = 11) 189
                                                end
                                            else
                                                begin
                                                  $display(";A 188");                                                  //assertion( data_out == ZeroExt(1, 0) = False) 188
                                                    nloss <= 1;  $display(";A 190");  //assertion( nloss = 1) 190
                                                    gamma = 14;  $display(";A 191");  //assertion( gamma = 14) 191
                                                end
                                        end
                                    else
                                        begin
                                          $display(";A 182");                                          //assertion( 1 == Extract(0, 0, k) = False) 182
                                            if ((k[1] == 1'b1))
                                                begin
                                                  $display(";A 192");                                                  //assertion( 1 == Extract(1, 1, k) = True) 192
                                                    ind = 1;  $display(";A 194");  //assertion( ind = 1) 194
                                                    sound <= 1;  $display(";A 195");  //assertion( sound = 1) 195
                                                    play <= 1;  $display(";A 196");  //assertion( play = 1) 196
                                                    count2 = timebase;  $display(";A 197");  //assertion( count2 = timebase) 197
                                                    if ((data_out == 1))
                                                        begin
                                                          $display(";A 198");                                                          //assertion( data_out == ZeroExt(1, 1) = True) 198
                                                            gamma = 11;  $display(";A 200");  //assertion( gamma = 11) 200
                                                        end
                                                    else
                                                        begin
                                                          $display(";A 199");                                                          //assertion( data_out == ZeroExt(1, 1) = False) 199
                                                            nloss <= 1;  $display(";A 201");  //assertion( nloss = 1) 201
                                                            gamma = 14;  $display(";A 202");  //assertion( gamma = 14) 202
                                                        end
                                                end
                                            else
                                                begin
                                                  $display(";A 193");                                                  //assertion( 1 == Extract(1, 1, k) = False) 193
                                                    if ((k[2] == 1'b1))
                                                        begin
                                                          $display(";A 203");                                                          //assertion( 1 == Extract(2, 2, k) = True) 203
                                                            ind = 2;  $display(";A 205");  //assertion( ind = 2) 205
                                                            sound <= 2;  $display(";A 206");  //assertion( sound = 2) 206
                                                            play <= 1;  $display(";A 207");  //assertion( play = 1) 207
                                                            count2 = timebase;  $display(";A 208");  //assertion( count2 = timebase) 208
                                                            if ((data_out == 2))
                                                                begin
                                                                  $display(";A 209");                                                                  //assertion( 2 == data_out = True) 209
                                                                    gamma = 11;  $display(";A 211");  //assertion( gamma = 11) 211
                                                                end
                                                            else
                                                                begin
                                                                  $display(";A 210");                                                                  //assertion( 2 == data_out = False) 210
                                                                    nloss <= 1;  $display(";A 212");  //assertion( nloss = 1) 212
                                                                    gamma = 14;  $display(";A 213");  //assertion( gamma = 14) 213
                                                                end
                                                        end
                                                    else
                                                        begin
                                                          $display(";A 204");                                                          //assertion( 1 == Extract(2, 2, k) = False) 204
                                                            if ((k[3] == 1'b1))
                                                                begin
                                                                  $display(";A 214");                                                                  //assertion( 1 == Extract(3, 3, k) = True) 214
                                                                    ind = 3;  $display(";A 216");  //assertion( ind = 3) 216
                                                                    sound <= 3;  $display(";A 217");  //assertion( sound = 3) 217
                                                                    play <= 1;  $display(";A 218");  //assertion( play = 1) 218
                                                                    count2 = timebase;  $display(";A 219");  //assertion( count2 = timebase) 219
                                                                    if ((data_out == 3))
                                                                        begin
                                                                          $display(";A 220");                                                                          //assertion( 3 == data_out = True) 220
                                                                            gamma = 11;  $display(";A 222");  //assertion( gamma = 11) 222
                                                                        end
                                                                    else
                                                                        begin
                                                                          $display(";A 221");                                                                          //assertion( 3 == data_out = False) 221
                                                                            nloss <= 1;  $display(";A 223");  //assertion( nloss = 1) 223
                                                                            gamma = 14;  $display(";A 224");  //assertion( gamma = 14) 224
                                                                        end
                                                                end
                                                            else
                                                                begin
                                                                  $display(";A 215");                                                                  //assertion( 1 == Extract(3, 3, k) = False) 215
                                                                    gamma = 10;  $display(";A 225");  //assertion( gamma = 10) 225
                                                                end
                                                        end
                                                end
                                        end
                                end
                        end
                      11:
                        begin
                          $display(";A 226");                          //assertion( gamma == ZeroExt(1, 11) = True) 226
                            nl[ind] <= 1;  $display(";A 227");  //assertion( arr_nl_79[ind] = 1) 227
                            gamma = 12;  $display(";A 228");  //assertion( gamma = 12) 228
                        end
                      12:
                        begin
                          $display(";A 229");                          //assertion( gamma == ZeroExt(1, 12) = True) 229
                            if ((count2 == 0))
                                begin
                                  $display(";A 230");                                  //assertion( count2 == ZeroExt(5, 0) = True) 230
                                    nl <= 0;  $display(";A 232");  //assertion( nl = 0) 232
                                    play <= 0;  $display(";A 233");  //assertion( play = 0) 233
                                    count2 = timebase;  $display(";A 234");  //assertion( count2 = timebase) 234
                                    gamma = 13;  $display(";A 235");  //assertion( gamma = 13) 235
                                end
                            else
                                begin
                                  $display(";A 231");                                  //assertion( count2 == ZeroExt(5, 0) = False) 231
                                    count2 = (count2 - 1);  $display(";A 236");  //assertion( count2 = count2 - ZeroExt(5, 1)) 236
                                    gamma = 12;  $display(";A 237");  //assertion( gamma = 12) 237
                                end
                        end
                      13:
                        begin
                          $display(";A 238");                          //assertion( gamma == ZeroExt(1, 13) = True) 238
                            if ((count2 == 0))
                                begin
                                  $display(";A 239");                                  //assertion( count2 == ZeroExt(5, 0) = True) 239
                                    if ((scan != max))
                                        begin
                                          $display(";A 241");                                          //assertion( scan != max = True) 241
                                            scan = (scan + 1);  $display(";A 243");  //assertion( scan = scan + ZeroExt(4, 1)) 243
                                            gamma = 8;  $display(";A 244");  //assertion( gamma = 8) 244
                                        end
                                    else
                                        begin
                                          $display(";A 242");                                          //assertion( scan != max = False) 242
                                            if ((max != (32 - 1)))
                                                begin
                                                  $display(";A 245");                                                  //assertion( ZeroExt(1, max) != 32 - ZeroExt(5, 1) = True) 245
                                                    max = (max + 1);  $display(";A 247");  //assertion( max = max + ZeroExt(4, 1)) 247
                                                    timebase = (timebase - 1);  $display(";A 248");  //assertion( timebase = timebase - ZeroExt(5, 1)) 248
                                                    gamma = 2;  $display(";A 249");  //assertion( gamma = 2) 249
                                                end
                                            else
                                                begin
                                                  $display(";A 246");                                                  //assertion( ZeroExt(1, max) != 32 - ZeroExt(5, 1) = False) 246
                                                    play <= 1;  $display(";A 250");  //assertion( play = 1) 250
                                                    sound <= 4;  $display(";A 251");  //assertion( sound = 4) 251
                                                    count2 = 8;  $display(";A 252");  //assertion( count2 = 8) 252
                                                    gamma = 24;  $display(";A 253");  //assertion( gamma = 24) 253
                                                end
                                        end
                                end
                            else
                                begin
                                  $display(";A 240");                                  //assertion( count2 == ZeroExt(5, 0) = False) 240
                                    count2 = (count2 - 1);  $display(";A 254");  //assertion( count2 = count2 - ZeroExt(5, 1)) 254
                                    gamma = 13;  $display(";A 255");  //assertion( gamma = 13) 255
                                end
                        end
                      14:
                        begin
                          $display(";A 256");                          //assertion( gamma == ZeroExt(1, 14) = True) 256
                            nl[ind] <= 1;  $display(";A 257");  //assertion( arr_nl_79[ind] = 1) 257
                            gamma = 15;  $display(";A 258");  //assertion( gamma = 15) 258
                        end
                      15:
                        begin
                          $display(";A 259");                          //assertion( gamma == ZeroExt(1, 15) = True) 259
                            if ((count2 == 0))
                                begin
                                  $display(";A 260");                                  //assertion( count2 == ZeroExt(5, 0) = True) 260
                                    nl <= 0;  $display(";A 262");  //assertion( nl = 0) 262
                                    play <= 0;  $display(";A 263");  //assertion( play = 0) 263
                                    count2 = timebase;  $display(";A 264");  //assertion( count2 = timebase) 264
                                    gamma = 16;  $display(";A 265");  //assertion( gamma = 16) 265
                                end
                            else
                                begin
                                  $display(";A 261");                                  //assertion( count2 == ZeroExt(5, 0) = False) 261
                                    count2 = (count2 - 1);  $display(";A 266");  //assertion( count2 = count2 - ZeroExt(5, 1)) 266
                                    gamma = 15;  $display(";A 267");  //assertion( gamma = 15) 267
                                end
                        end
                      16:
                        begin
                          $display(";A 268");                          //assertion( 16 == gamma = True) 268
                            if ((count2 == 0))
                                begin
                                  $display(";A 269");                                  //assertion( count2 == ZeroExt(5, 0) = True) 269
                                    max = 0;  $display(";A 271");  //assertion( max = 0) 271
                                    gamma = 17;  $display(";A 272");  //assertion( gamma = 17) 272
                                end
                            else
                                begin
                                  $display(";A 270");                                  //assertion( count2 == ZeroExt(5, 0) = False) 270
                                    count2 = (count2 - 1);  $display(";A 273");  //assertion( count2 = count2 - ZeroExt(5, 1)) 273
                                    gamma = 16;  $display(";A 274");  //assertion( gamma = 16) 274
                                end
                        end
                      17:
                        begin
                          $display(";A 275");                          //assertion( 17 == gamma = True) 275
                            address <= max;  $display(";A 276");  //assertion( address = max) 276
                            gamma = 18;  $display(";A 277");  //assertion( gamma = 18) 277
                        end
                      18:
                        begin
                          $display(";A 278");                          //assertion( 18 == gamma = True) 278
                            gamma = 19;  $display(";A 279");  //assertion( gamma = 19) 279
                        end
                      19:
                        begin
                          $display(";A 280");                          //assertion( 19 == gamma = True) 280
                            nl[data_out] <= 1;  $display(";A 281");  //assertion( arr_nl_79[data_out] = 1) 281
                            play <= 1;  $display(";A 282");  //assertion( play = 1) 282
                            sound <= {1'b0, data_out};  $display(";A 283");  //assertion( sound = Concat(0, data_out)) 283
                            count2 = timebase;  $display(";A 284");  //assertion( count2 = timebase) 284
                            gamma = 20;  $display(";A 285");  //assertion( gamma = 20) 285
                        end
                      20:
                        begin
                          $display(";A 286");                          //assertion( 20 == gamma = True) 286
                            if ((count2 == 0))
                                begin
                                  $display(";A 287");                                  //assertion( count2 == ZeroExt(5, 0) = True) 287
                                    nl <= 0;  $display(";A 289");  //assertion( nl = 0) 289
                                    play <= 0;  $display(";A 290");  //assertion( play = 0) 290
                                    count2 = timebase;  $display(";A 291");  //assertion( count2 = timebase) 291
                                    gamma = 21;  $display(";A 292");  //assertion( gamma = 21) 292
                                end
                            else
                                begin
                                  $display(";A 288");                                  //assertion( count2 == ZeroExt(5, 0) = False) 288
                                    count2 = (count2 - 1);  $display(";A 293");  //assertion( count2 = count2 - ZeroExt(5, 1)) 293
                                    gamma = 20;  $display(";A 294");  //assertion( gamma = 20) 294
                                end
                        end
                      21:
                        begin
                          $display(";A 295");                          //assertion( 21 == gamma = True) 295
                            if ((count2 == 0))
                                begin
                                  $display(";A 296");                                  //assertion( count2 == ZeroExt(5, 0) = True) 296
                                    if ((max != scan))
                                        begin
                                          $display(";A 298");                                          //assertion( max != scan = True) 298
                                            max = (max + 1);  $display(";A 300");  //assertion( max = max + ZeroExt(4, 1)) 300
                                            gamma = 17;  $display(";A 301");  //assertion( gamma = 17) 301
                                        end
                                    else
                                        begin
                                          $display(";A 299");                                          //assertion( max != scan = False) 299
                                            nl[data_out] <= 1;  $display(";A 302");  //assertion( arr_nl_79[data_out] = 1) 302
                                            play <= 1;  $display(";A 303");  //assertion( play = 1) 303
                                            sound <= 5;  $display(";A 304");  //assertion( sound = 5) 304
                                            count2 = 8;  $display(";A 305");  //assertion( count2 = 8) 305
                                            gamma = 22;  $display(";A 306");  //assertion( gamma = 22) 306
                                        end
                                end
                            else
                                begin
                                  $display(";A 297");                                  //assertion( count2 == ZeroExt(5, 0) = False) 297
                                    count2 = (count2 - 1);  $display(";A 307");  //assertion( count2 = count2 - ZeroExt(5, 1)) 307
                                    gamma = 21;  $display(";A 308");  //assertion( gamma = 21) 308
                                end
                        end
                      22:
                        begin
                          $display(";A 309");                          //assertion( 22 == gamma = True) 309
                            if ((count2 == 0))
                                begin
                                  $display(";A 310");                                  //assertion( count2 == ZeroExt(5, 0) = True) 310
                                    nl <= 0;  $display(";A 312");  //assertion( nl = 0) 312
                                    play <= 0;  $display(";A 313");  //assertion( play = 0) 313
                                    count2 = 8;  $display(";A 314");  //assertion( count2 = 8) 314
                                    gamma = 23;  $display(";A 315");  //assertion( gamma = 23) 315
                                end
                            else
                                begin
                                  $display(";A 311");                                  //assertion( count2 == ZeroExt(5, 0) = False) 311
                                    count2 = (count2 - 1);  $display(";A 316");  //assertion( count2 = count2 - ZeroExt(5, 1)) 316
                                    gamma = 22;  $display(";A 317");  //assertion( gamma = 22) 317
                                end
                        end
                      23:
                        begin
                          $display(";A 318");                          //assertion( 23 == gamma = True) 318
                            if ((count2 == 0))
                                begin
                                  $display(";A 319");                                  //assertion( count2 == ZeroExt(5, 0) = True) 319
                                    nl[data_out] <= 1;  $display(";A 321");  //assertion( arr_nl_79[data_out] = 1) 321
                                    play <= 1;  $display(";A 322");  //assertion( play = 1) 322
                                    sound <= 5;  $display(";A 323");  //assertion( sound = 5) 323
                                    count2 = 8;  $display(";A 324");  //assertion( count2 = 8) 324
                                    gamma = 22;  $display(";A 325");  //assertion( gamma = 22) 325
                                end
                            else
                                begin
                                  $display(";A 320");                                  //assertion( count2 == ZeroExt(5, 0) = False) 320
                                    count2 = (count2 - 1);  $display(";A 326");  //assertion( count2 = count2 - ZeroExt(5, 1)) 326
                                    gamma = 23;  $display(";A 327");  //assertion( gamma = 23) 327
                                end
                        end
                      24:
                        begin
                          $display(";A 328");                          //assertion( 24 == gamma = True) 328
                            if ((count2 == 0))
                                begin
                                  $display(";A 329");                                  //assertion( count2 == ZeroExt(5, 0) = True) 329
                                    nl <= 1;  $display(";A 331");  //assertion( nl = 1) 331
                                    play <= 0;  $display(";A 332");  //assertion( play = 0) 332
                                    count2 = 8;  $display(";A 333");  //assertion( count2 = 8) 333
                                    gamma = 25;  $display(";A 334");  //assertion( gamma = 25) 334
                                end
                            else
                                begin
                                  $display(";A 330");                                  //assertion( count2 == ZeroExt(5, 0) = False) 330
                                    count2 = (count2 - 1);  $display(";A 335");  //assertion( count2 = count2 - ZeroExt(5, 1)) 335
                                    gamma = 24;  $display(";A 336");  //assertion( gamma = 24) 336
                                end
                        end
                      25:
                        begin
                          $display(";A 337");                          //assertion( 25 == gamma = True) 337
                            if ((count2 == 0))
                                begin
                                  $display(";A 338");                                  //assertion( count2 == ZeroExt(5, 0) = True) 338
                                    nl <= 0;  $display(";A 340");  //assertion( nl = 0) 340
                                    play <= 1;  $display(";A 341");  //assertion( play = 1) 341
                                    sound <= 4;  $display(";A 342");  //assertion( sound = 4) 342
                                    count2 = 8;  $display(";A 343");  //assertion( count2 = 8) 343
                                    gamma = 24;  $display(";A 344");  //assertion( gamma = 24) 344
                                end
                            else
                                begin
                                  $display(";A 339");                                  //assertion( count2 == ZeroExt(5, 0) = False) 339
                                    count2 = (count2 - 1);  $display(";A 345");  //assertion( count2 = count2 - ZeroExt(5, 1)) 345
                                    gamma = 25;  $display(";A 346");  //assertion( gamma = 25) 346
                                end
                        end
                      default:
                        begin
                          $display(";A 347");                          //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 347
                            gamma = 1;  $display(";A 348");  //assertion( gamma = 1) 348
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

endmodule
