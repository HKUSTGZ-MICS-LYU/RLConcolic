//Following code is from line 1
module b06(uscite, enable_count, ackout, clock, cc_mux, reset, cont_eql, eql, __obs);

    input               eql;
    input               clock;
    input               reset;
    input               cont_eql;
    output        [1:0] cc_mux;
    output        [1:0] uscite;
    output              enable_count;
    output              ackout;
    input               __obs;

    reg [1:0] cc_mux = 2'b0;
    reg [1:0] uscite = 2'b0;
    reg enable_count = 1'b0;
    reg ackout = 1'b0;
    //Parameter Declaration
    reg  [2:0]  state = 3'b0;

    //Following code is from line 15
        always @(posedge clock) begin
            if ((reset == 1'b1))
                begin
                    state <= 3'b000;  $display(";A 2");  //assertion( state = 0) 2
                    cc_mux <= 2'b00;  $display(";A 3");  //assertion( cc_mux = 0) 3
                    enable_count <= 1'b0;  $display(";A 4");  //assertion( enable_count = 0) 4
                    ackout <= 1'b0;  $display(";A 5");  //assertion( ackout = 0) 5
                    uscite <= 2'b00;  $display(";A 6");  //assertion( uscite = 0) 6
                end
            else
                begin
                    if ((cont_eql == 1'b1))
                        begin
                          $display(";A 7");                          //assertion( 1 == cont_eql = True) 7
                            ackout <= 1'b0;  $display(";A 9");  //assertion( ackout = 0) 9
                            enable_count <= 1'b0;  $display(";A 10");  //assertion( enable_count = 0) 10
                        end
                    else
                        begin
                          $display(";A 8");                          //assertion( 1 == cont_eql = False) 8
                            ackout <= 1'b1;  $display(";A 11");  //assertion( ackout = 1) 11
                            enable_count <= 1'b1;  $display(";A 12");  //assertion( enable_count = 1) 12
                        end
                    case (state)
                      3'b000:
                        begin
                          $display(";A 13");                          //assertion( 0 == state = True) 13
                            cc_mux <= 2'b01;  $display(";A 14");  //assertion( cc_mux = 1) 14
                            uscite <= 2'b01;  $display(";A 15");  //assertion( uscite = 1) 15
                            state <= 3'b001;  $display(";A 16");  //assertion( state = 1) 16
                        end
                      3'b001:
                        begin
                          $display(";A 17");                          //assertion( 1 == state = True) 17
                            if ((eql == 1'b1))
                                begin
                                  $display(";A 18");                                  //assertion( 1 == eql = True) 18
                                    uscite <= 2'b00;  $display(";A 20");  //assertion( uscite = 0) 20
                                    cc_mux <= 2'b01;  $display(";A 21");  //assertion( cc_mux = 1) 21
                                    state <= 3'b010;  $display(";A 22");  //assertion( state = 2) 22
                                end
                            else
                                begin
                                  $display(";A 19");                                  //assertion( 1 == eql = False) 19
                                    uscite <= 2'b01;  $display(";A 23");  //assertion( uscite = 1) 23
                                    cc_mux <= 2'b01;  $display(";A 24");  //assertion( cc_mux = 1) 24
                                    state <= 3'b101;  $display(";A 25");  //assertion( state = 5) 25
                                end
                        end
                      3'b101:
                        begin
                          $display(";A 26");                          //assertion( 5 == state = True) 26
                            if ((eql == 1'b1))
                                begin
                                  $display(";A 27");                                  //assertion( 1 == eql = True) 27
                                    uscite <= 2'b00;  $display(";A 29");  //assertion( uscite = 0) 29
                                    cc_mux <= 2'b01;  $display(";A 30");  //assertion( cc_mux = 1) 30
                                    state <= 3'b100;  $display(";A 31");  //assertion( state = 4) 31
                                end
                            else
                                begin
                                  $display(";A 28");                                  //assertion( 1 == eql = False) 28
                                    uscite <= 2'b01;  $display(";A 32");  //assertion( uscite = 1) 32
                                    cc_mux <= 2'b01;  $display(";A 33");  //assertion( cc_mux = 1) 33
                                    state <= 3'b001;  $display(";A 34");  //assertion( state = 1) 34
                                end
                        end
                      3'b010:
                        begin
                          $display(";A 35");                          //assertion( 2 == state = True) 35
                            if ((eql == 1'b1))
                                begin
                                  $display(";A 36");                                  //assertion( 1 == eql = True) 36
                                    uscite <= 2'b00;  $display(";A 38");  //assertion( uscite = 0) 38
                                    cc_mux <= 2'b01;  $display(";A 39");  //assertion( cc_mux = 1) 39
                                    state <= 3'b010;  $display(";A 40");  //assertion( state = 2) 40
                                end
                            else
                                begin
                                  $display(";A 37");                                  //assertion( 1 == eql = False) 37
                                    uscite <= 2'b01;  $display(";A 41");  //assertion( uscite = 1) 41
                                    ackout <= 1'b1;  $display(";A 42");  //assertion( ackout = 1) 42
                                    enable_count <= 1'b1;  $display(";A 43");  //assertion( enable_count = 1) 43
                                    cc_mux <= 2'b01;  $display(";A 44");  //assertion( cc_mux = 1) 44
                                    state <= 3'b011;  $display(";A 45");  //assertion( state = 3) 45
                                end
                        end
                      3'b011:
                        begin
                          $display(";A 46");                          //assertion( 3 == state = True) 46
                            if ((eql == 1'b1))
                                begin
                                  $display(";A 47");                                  //assertion( 1 == eql = True) 47
                                    uscite <= 2'b01;  $display(";A 49");  //assertion( uscite = 1) 49
                                    cc_mux <= 2'b01;  $display(";A 50");  //assertion( cc_mux = 1) 50
                                    state <= 3'b011;  $display(";A 51");  //assertion( state = 3) 51
                                end
                            else
                                begin
                                  $display(";A 48");                                  //assertion( 1 == eql = False) 48
                                    uscite <= 2'b01;  $display(";A 52");  //assertion( uscite = 1) 52
                                    cc_mux <= 2'b01;  $display(";A 53");  //assertion( cc_mux = 1) 53
                                    state <= 3'b001;  $display(";A 54");  //assertion( state = 1) 54
                                end
                        end
                      3'b100:
                        begin
                          $display(";A 55");                          //assertion( 4 == state = True) 55
                            if ((eql == 1'b1))
                                begin
                                  $display(";A 56");                                  //assertion( 1 == eql = True) 56
                                    uscite <= 2'b00;  $display(";A 58");  //assertion( uscite = 0) 58
                                    cc_mux <= 2'b01;  $display(";A 59");  //assertion( cc_mux = 1) 59
                                    state <= 3'b100;  $display(";A 60");  //assertion( state = 4) 60
                                end
                            else
                                begin
                                  $display(";A 57");                                  //assertion( 1 == eql = False) 57
                                    uscite <= 2'b11;  $display(";A 61");  //assertion( uscite = 3) 61
                                    cc_mux <= 2'b01;  $display(";A 62");  //assertion( cc_mux = 1) 62
                                    state <= 3'b110;  $display(";A 63");  //assertion( state = 6) 63
                                end
                        end
                      3'b110:
                        begin
                          $display(";A 64");                          //assertion( 6 == state = True) 64
                            if ((eql == 1'b1))
                                begin
                                  $display(";A 65");                                  //assertion( 1 == eql = True) 65
                                    uscite <= 2'b11;  $display(";A 67");  //assertion( uscite = 3) 67
                                    cc_mux <= 2'b01;  $display(";A 68");  //assertion( cc_mux = 1) 68
                                    state <= 3'b110;  $display(";A 69");  //assertion( state = 6) 69
                                end
                            else
                                begin
                                  $display(";A 66");                                  //assertion( 1 == eql = False) 66
                                    uscite <= 2'b01;  $display(";A 70");  //assertion( uscite = 1) 70
                                    cc_mux <= 2'b01;  $display(";A 71");  //assertion( cc_mux = 1) 71
                                    state <= 3'b001;  $display(";A 72");  //assertion( state = 1) 72
                                end
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

endmodule
