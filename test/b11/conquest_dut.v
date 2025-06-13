//Following code is from line 1
module b11(x_in, reset, stbi, x_out, clock, __obs);

    input         [5:0] x_in;
    input               stbi;
    input               clock;
    input               reset;
    output        [5:0] x_out;
    input               __obs;

    reg [5:0] x_out = 6'b0;
    //Parameter Declaration
    reg  [5:0]  r_in = 6'b0;
    reg  [3:0]  stato = 4'b0;
    reg  [5:0]  cont = 6'b0;
    wire signed [8:0] cont1_inv;
    reg signed [8:0]  cont1 = 9'sb0;

    assign cont1_inv = -cont1;

  //assertion( cont1_inv = -cont1) 0
    //Following code is from line 20
        always @(posedge clock) begin
            if ((reset == 1'b1))
                begin
                    stato = 4'b0000;  $display(";A 3");  //assertion( stato = 0) 3
                    r_in = 6'b0;  $display(";A 4");  //assertion( r_in = 0) 4
                    cont = 6'b0;  $display(";A 5");  //assertion( cont = 0) 5
                    cont1 = 9'b0;  $display(";A 6");  //assertion( cont1 = 0) 6
                    x_out = 6'b0;  $display(";A 7");  //assertion( x_out = 0) 7
                end
            else
                begin
                    case (stato)
                      4'b0000:
                        begin
                          $display(";A 8");                          //assertion( 0 == stato = True) 8
                            cont = 6'b0;  $display(";A 9");  //assertion( cont = 0) 9
                            r_in = x_in;  $display(";A 10");  //assertion( r_in = x_in) 10
                            x_out <= 6'b0;  $display(";A 11");  //assertion( x_out = 0) 11
                            stato = 4'b0001;  $display(";A 12");  //assertion( stato = 1) 12
                        end
                      4'b0001:
                        begin
                          $display(";A 13");                          //assertion( 1 == stato = True) 13
                            r_in = x_in;  $display(";A 14");  //assertion( r_in = x_in) 14
                            if ((stbi == 1'b1))
                                begin
                                  $display(";A 15");                                  //assertion( 1 == stbi = True) 15
                                    stato = 4'b0001;  $display(";A 17");  //assertion( stato = 1) 17
                                end
                            else
                                begin
                                  $display(";A 16");                                  //assertion( 1 == stbi = False) 16
                                    stato = 4'b0010;  $display(";A 18");  //assertion( stato = 2) 18
                                end
                        end
                      4'b0010:
                        begin
                          $display(";A 19");                          //assertion( 2 == stato = True) 19
                            if (((r_in == 6'b0) || (r_in == 6'b111111)))
                                begin
                                  $display(";A 20");                                  //assertion( Or(If((0 == r_in) == True, 1, 0) == 1, If((63 == r_in) == True, 1, 0) == 1) = True) 20
                                    if ((cont < 6'b11001))
                                        begin
                                          $display(";A 22");                                          //assertion( ULT(cont, 25) = True) 22
                                            cont = (cont + 1'b1);  $display(";A 24");  //assertion( cont = cont + ZeroExt(5, 1)) 24
                                        end
                                    else
                                        begin
                                          $display(";A 23");                                          //assertion( ULT(cont, 25) = False) 23
                                            cont = 6'b0;  $display(";A 25");  //assertion( cont = 0) 25
                                        end
                                    cont1 = {3'b0, r_in};  $display(";A 26");  //assertion( cont1 = Concat(0, r_in)) 26
                                    stato = 4'b1000;  $display(";A 27");  //assertion( stato = 8) 27
                                end
                            else
                                begin
                                  $display(";A 21");                                  //assertion( Or(If((0 == r_in) == True, 1, 0) == 1, If((63 == r_in) == True, 1, 0) == 1) = False) 21
                                    if ((r_in <= 6'b011010))
                                        begin
                                          $display(";A 28");                                          //assertion( ULE(r_in, 26) = True) 28
                                            stato = 4'b0011;  $display(";A 30");  //assertion( stato = 3) 30
                                        end
                                    else
                                        begin
                                          $display(";A 29");                                          //assertion( ULE(r_in, 26) = False) 29
                                            stato = 4'b0001;  $display(";A 31");  //assertion( stato = 1) 31
                                        end
                                end
                        end
                      4'b0011:
                        begin
                          $display(";A 32");                          //assertion( 3 == stato = True) 32
                            if ((r_in[0] == 1'b1))
                                begin
                                  $display(";A 33");                                  //assertion( 1 == Extract(0, 0, r_in) = True) 33
                                    cont1 = {2'b0, cont, 1'b0};  $display(";A 35");  //assertion( cont1 = Concat(Concat(0, cont), 0)) 35
                                end
                            else
                                begin
                                  $display(";A 34");                                  //assertion( 1 == Extract(0, 0, r_in) = False) 34
                                    cont1 = {3'b0, cont};  $display(";A 36");  //assertion( cont1 = Concat(0, cont)) 36
                                end
                            stato = 4'b0100;  $display(";A 37");  //assertion( stato = 4) 37
                        end
                      4'b0100:
                        begin
                          $display(";A 38");                          //assertion( 4 == stato = True) 38
                            if ((r_in[1] == 1'b1))
                                begin
                                  $display(";A 39");                                  //assertion( 1 == Extract(1, 1, r_in) = True) 39
                                    cont1 = ({3'b0, r_in} + cont1);  $display(";A 41");  //assertion( cont1 = Concat(0, r_in) + cont1) 41
                                    stato = 4'b0101;  $display(";A 42");  //assertion( stato = 5) 42
                                end
                            else
                                begin
                                  $display(";A 40");                                  //assertion( 1 == Extract(1, 1, r_in) = False) 40
                                    cont1 = ({3'b0, r_in} - cont1);  $display(";A 43");  //assertion( cont1 = Concat(0, r_in) - cont1) 43
                                    stato = 4'b0110;  $display(";A 44");  //assertion( stato = 6) 44
                                end
                        end
                      4'b0101:
                        begin
                          $display(";A 45");                          //assertion( 5 == stato = True) 45
                            if ((cont1 > 9'b000011010))
                                begin
                                  $display(";A 46");                                  //assertion( 26 < cont1 = True) 46
                                    cont1 = (cont1 - 9'b011010);  $display(";A 48");  //assertion( cont1 = cont1 - 26) 48
                                    stato = 4'b0101;  $display(";A 49");  //assertion( stato = 5) 49
                                end
                            else
                                begin
                                  $display(";A 47");                                  //assertion( 26 < cont1 = False) 47
                                    stato = 4'b0111;  $display(";A 50");  //assertion( stato = 7) 50
                                end
                        end
                      4'b0110:
                        begin
                          $display(";A 51");                          //assertion( 6 == stato = True) 51
                            if ((cont1 > 9'b000111111))
                                begin
                                  $display(";A 52");                                  //assertion( 63 < cont1 = True) 52
                                    cont1 = (cont1 + 9'b011010);  $display(";A 54");  //assertion( cont1 = cont1 + 26) 54
                                    stato = 4'b0110;  $display(";A 55");  //assertion( stato = 6) 55
                                end
                            else
                                begin
                                  $display(";A 53");                                  //assertion( 63 < cont1 = False) 53
                                    stato = 4'b0111;  $display(";A 56");  //assertion( stato = 7) 56
                                end
                        end
                      4'b0111:
                        begin
                          $display(";A 57");                          //assertion( 7 == stato = True) 57
                            if ((r_in[3:2] == 2'b00))
                                begin
                                  $display(";A 58");                                  //assertion( 0 == Extract(3, 2, r_in) = True) 58
                                    cont1 = (cont1 - 9'b000010101);  $display(";A 60");  //assertion( cont1 = cont1 - 21) 60
                                end
                            else
                                begin
                                  $display(";A 59");                                  //assertion( 0 == Extract(3, 2, r_in) = False) 59
                                    if ((r_in[3:2] == 2'b01))
                                        begin
                                          $display(";A 61");                                          //assertion( 1 == Extract(3, 2, r_in) = True) 61
                                            cont1 = (cont1 - 9'b000101010);  $display(";A 63");  //assertion( cont1 = cont1 - 42) 63
                                        end
                                    else
                                        begin
                                          $display(";A 62");                                          //assertion( 1 == Extract(3, 2, r_in) = False) 62
                                            if ((r_in[3:2] == 2'b10))
                                                begin
                                                  $display(";A 64");                                                  //assertion( 2 == Extract(3, 2, r_in) = True) 64
                                                    cont1 = (cont1 + 9'b000000111);  $display(";A 66");  //assertion( cont1 = cont1 + 7) 66
                                                end
                                            else
                                                begin
                                                  $display(";A 65");                                                  //assertion( 2 == Extract(3, 2, r_in) = False) 65
                                                    cont1 = (cont1 + 9'b000011100);  $display(";A 67");  //assertion( cont1 = cont1 + 28) 67
                                                end
                                        end
                                end
                            stato = 4'b1000;  $display(";A 68");  //assertion( stato = 8) 68
                        end
                      4'b1000:
                        begin
                          $display(";A 69");                          //assertion( 8 == stato = True) 69
                            if ((cont1 < 9'sb0))
                                begin
                                  $display(";A 70");                                  //assertion( 0 > cont1 = True) 70
                                    x_out <= cont1_inv[5:0];  $display(";A 72");  //assertion( x_out = Extract(5, 0, cont1_inv)) 72
                                end
                            else
                                begin
                                  $display(";A 71");                                  //assertion( 0 > cont1 = False) 71
                                    x_out <= cont1[5:0];  $display(";A 73");  //assertion( x_out = Extract(5, 0, cont1)) 73
                                end
                            stato = 4'b0001;  $display(";A 74");  //assertion( stato = 1) 74
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

endmodule
