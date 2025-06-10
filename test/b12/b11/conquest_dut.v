//Following code is from line 1
module b11(clock, stbi, x_in, x_out, reset, __obs);

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
    reg signed [8:0]  cont1_inv = 9'sb0;
    reg signed [8:0]  cont1 = 9'sb0;

    always @(*) begin
        cont1_inv = (-cont1);$display(";A 0");  //assertion( cont1_inv = 511*cont1) 0
    end

    //Following code is from line 20
        always @(posedge clock) begin
            if ((reset == 1'b1))
                    begin
                        stato = 4'b0000;$display(";A 3");  //assertion( stato = 0) 3
                        r_in = 6'b0;$display(";A 4");  //assertion( r_in = 0) 4
                        cont = 6'b0;$display(";A 5");  //assertion( cont = 0) 5
                        cont1 = 9'b0;$display(";A 6");  //assertion( cont1 = 0) 6
                        x_out = 6'b0;$display(";A 7");  //assertion( x_out = 0) 7
                    end
            else
                begin
                    case (stato)
                      4'b0000:
                            begin
                            $display(";A 8");  //assertion( stato == 0 = True) 8
                                cont = 6'b0;$display(";A 9");  //assertion( cont = 0) 9
                                r_in = x_in;$display(";A 10");  //assertion( r_in = x_in) 10
                                x_out <= 6'b0;$display(";A 11");  //assertion( x_out = 0) 11
                                stato = 4'b0001;$display(";A 12");  //assertion( stato = 1) 12
                            end
                      4'b0001:
                            begin
                            $display(";A 13");  //assertion( stato == 1 = True) 13
                                r_in = x_in;$display(";A 14");  //assertion( r_in = x_in) 14
                                if ((stbi == 1'b1))
                                    begin
                                    $display(";A 15");  //assertion( stbi == 1 = True) 15
                                        stato = 4'b0001;$display(";A 17");  //assertion( stato = 1) 17
                                    end
                                else
                                    begin
                                    $display(";A 16");  //assertion( stbi == 1 = False) 16
                                        stato = 4'b0010;$display(";A 18");  //assertion( stato = 2) 18
                                    end
                            end
                      4'b0010:
                        begin
                        $display(";A 19");  //assertion( stato == 2 = True) 19
                            if (((r_in == 6'b0) || (r_in == 6'b111111)))
                                    begin
                                    $display(";A 20");  //assertion( Or(r_in == 0, r_in == 63) = True) 20
                                        if ((cont < 6'b11001))
                                            begin
                                            $display(";A 22");  //assertion( Not(ULE(25, cont)) = True) 22
                                                cont = (cont + 1'b1);$display(";A 24");  //assertion( cont = 1 + cont) 24
                                            end
                                        else
                                            begin
                                            $display(";A 23");  //assertion( Not(ULE(25, cont)) = False) 23
                                                cont = 6'b0;$display(";A 25");  //assertion( cont = 0) 25
                                            end
                                        cont1 = {3'b0, r_in};$display(";A 26");  //assertion( cont1 = Concat(0, r_in)) 26
                                        stato = 4'b1000;$display(";A 27");  //assertion( stato = 8) 27
                                    end
                            else
                                begin
                                $display(";A 21");  //assertion( Or(r_in == 0, r_in == 63) = False) 21
                                    if ((r_in <= 6'b011010))
                                        begin
                                        $display(";A 28");  //assertion( And(Extract(5, 5, r_in) == 0, ULE(Extract(4, 0, r_in), 26)) = True) 28
                                            stato = 4'b0011;$display(";A 30");  //assertion( stato = 3) 30
                                        end
                                    else
                                        begin
                                        $display(";A 29");  //assertion( And(Extract(5, 5, r_in) == 0, ULE(Extract(4, 0, r_in), 26)) = False) 29
                                            stato = 4'b0001;$display(";A 31");  //assertion( stato = 1) 31
                                        end
                                end
                        end
                      4'b0011:
                            begin
                            $display(";A 32");  //assertion( stato == 3 = True) 32
                                if ((r_in[0] == 1'b1))
                                    begin
                                    $display(";A 33");  //assertion( Extract(0, 0, r_in) == 1 = True) 33
                                        cont1 = {2'b0, cont, 1'b0};$display(";A 35");  //assertion( cont1 = Concat(0, cont, 0)) 35
                                    end
                                else
                                    begin
                                    $display(";A 34");  //assertion( Extract(0, 0, r_in) == 1 = False) 34
                                        cont1 = {3'b0, cont};$display(";A 36");  //assertion( cont1 = Concat(0, cont)) 36
                                    end
                                stato = 4'b0100;$display(";A 37");  //assertion( stato = 4) 37
                            end
                      4'b0100:
                        begin
                        $display(";A 38");  //assertion( stato == 4 = True) 38
                            if ((r_in[1] == 1'b1))
                                    begin
                                    $display(";A 39");  //assertion( Extract(1, 1, r_in) == 1 = True) 39
                                        cont1 = ({3'b0, r_in} + cont1);$display(";A 41");  //assertion( cont1 = Concat(0, r_in) + cont1) 41
                                        stato = 4'b0101;$display(";A 42");  //assertion( stato = 5) 42
                                    end
                            else
                                    begin
                                    $display(";A 40");  //assertion( Extract(1, 1, r_in) == 1 = False) 40
                                        cont1 = ({3'b0, r_in} - cont1);$display(";A 43");  //assertion( cont1 = Concat(0, r_in) + 511*cont1) 43
                                        stato = 4'b0110;$display(";A 44");  //assertion( stato = 6) 44
                                    end
                        end
                      4'b0101:
                        begin
                        $display(";A 45");  //assertion( stato == 5 = True) 45
                            if ((cont1 > 9'sb011010))
                                    begin
                                    $display(";A 46");  //assertion( Not(cont1 <= 26) = True) 46
                                        cont1 = (cont1 - 9'b011010);$display(";A 48");  //assertion( cont1 = 486 + cont1) 48
                                        stato = 4'b0101;$display(";A 49");  //assertion( stato = 5) 49
                                    end
                            else
                                begin
                                $display(";A 47");  //assertion( Not(cont1 <= 26) = False) 47
                                    stato = 4'b0111;$display(";A 50");  //assertion( stato = 7) 50
                                end
                        end
                      4'b0110:
                        begin
                        $display(";A 51");  //assertion( stato == 6 = True) 51
                            if ((cont1 > 9'sb111111))
                                    begin
                                    $display(";A 52");  //assertion( Not(cont1 <= 63) = True) 52
                                        cont1 = (cont1 + 9'b011010);$display(";A 54");  //assertion( cont1 = 26 + cont1) 54
                                        stato = 4'b0110;$display(";A 55");  //assertion( stato = 6) 55
                                    end
                            else
                                begin
                                $display(";A 53");  //assertion( Not(cont1 <= 63) = False) 53
                                    stato = 4'b0111;$display(";A 56");  //assertion( stato = 7) 56
                                end
                        end
                      4'b0111:
                            begin
                            $display(";A 57");  //assertion( stato == 7 = True) 57
                                if ((r_in[3:2] == 2'b00))
                                    begin
                                    $display(";A 58");  //assertion( Extract(3, 2, r_in) == 0 = True) 58
                                        cont1 = (cont1 - 9'b010101);$display(";A 60");  //assertion( cont1 = 491 + cont1) 60
                                    end
                                else
                                    begin
                                    $display(";A 59");  //assertion( Extract(3, 2, r_in) == 0 = False) 59
                                        if ((r_in[3:2] == 2'b01))
                                            begin
                                            $display(";A 61");  //assertion( Extract(3, 2, r_in) == 1 = True) 61
                                                cont1 = (cont1 - 9'b101010);$display(";A 63");  //assertion( cont1 = 470 + cont1) 63
                                            end
                                        else
                                            begin
                                            $display(";A 62");  //assertion( Extract(3, 2, r_in) == 1 = False) 62
                                                if ((r_in[3:2] == 2'b10))
                                                    begin
                                                    $display(";A 64");  //assertion( Extract(3, 2, r_in) == 2 = True) 64
                                                        cont1 = (cont1 + 9'b111);$display(";A 66");  //assertion( cont1 = 7 + cont1) 66
                                                    end
                                                else
                                                    begin
                                                    $display(";A 65");  //assertion( Extract(3, 2, r_in) == 2 = False) 65
                                                        cont1 = (cont1 + 9'b011100);$display(";A 67");  //assertion( cont1 = 28 + cont1) 67
                                                    end
                                            end
                                    end
                                stato = 4'b1000;$display(";A 68");  //assertion( stato = 8) 68
                            end
                      4'b1000:
                            begin
                            $display(";A 69");  //assertion( stato == 8 = True) 69
                                if ((cont1 < 9'sb0))
                                    begin
                                    $display(";A 70");  //assertion( Not(0 <= cont1) = True) 70
                                        x_out <= cont1_inv[5:0];$display(";A 72");  //assertion( x_out = Extract(5, 0, cont1_inv)) 72
                                    end
                                else
                                    begin
                                    $display(";A 71");  //assertion( Not(0 <= cont1) = False) 71
                                        x_out <= cont1[5:0];$display(";A 73");  //assertion( x_out = Extract(5, 0, cont1)) 73
                                    end
                                stato = 4'b0001;$display(";A 74");  //assertion( stato = 1) 74
                            end
                    endcase
                end
            // Display the variables
            begin
            $display(";R x_out = %d", x_out);
            $display(";R r_in = %d", r_in);
            $display(";R stato = %d", stato);
            $display(";R cont = %d", cont);
            $display(";R cont1_inv = %d", cont1_inv);
            $display(";R cont1 = %d", cont1);
            end
        end

endmodule
