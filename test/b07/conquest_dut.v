//Following code is from line 34
module b07(reset, start, clock, punti_retta, __obs);

    input               clock;
    input               reset;
    input               start;
    output        [7:0] punti_retta;
    input               __obs;

    reg [7:0] punti_retta = 8'b0;
    //Parameter Declaration
    reg  [2:0]  stato = 3'b0;
    reg  [7:0]  cont = 8'b0;
    reg  [3:0]  mar = 4'b0;
    reg  [7:0]  x = 8'b0;
    reg  [7:0]  y = 8'b0;
    reg  [7:0]  t = 8'b0;
    reg  [7:0]  mem [0:15];

    //Following code is from line 54
        always @(posedge clock) begin
            if ((reset == 1'b1))
                    begin
                        punti_retta <= 0;$display(";A 2");  //assertion( punti_retta = 0) 2
                        cont <= 0;$display(";A 3");  //assertion( cont = 0) 3
                        mar <= 0;$display(";A 4");  //assertion( mar = 0) 4
                        x <= 0;$display(";A 5");  //assertion( x = 0) 5
                        y <= 0;$display(";A 6");  //assertion( y = 0) 6
                        t <= 0;$display(";A 7");  //assertion( t = 0) 7
                        mem[0] <= 8'b00000001;$display(";A 8");  //assertion( mem[0] = 1) 8
                        mem[1] <= 8'b11111111;$display(";A 9");  //assertion( mem[1] = 255) 9
                        mem[2] <= 8'b00000000;$display(";A 10");  //assertion( mem[2] = 0) 10
                        mem[3] <= 8'b00000000;$display(";A 11");  //assertion( mem[3] = 0) 11
                        mem[4] <= 8'b00000000;$display(";A 12");  //assertion( mem[4] = 0) 12
                        mem[5] <= 8'b00000010;$display(";A 13");  //assertion( mem[5] = 2) 13
                        mem[6] <= 8'b00000000;$display(";A 14");  //assertion( mem[6] = 0) 14
                        mem[7] <= 8'b00000000;$display(";A 15");  //assertion( mem[7] = 0) 15
                        mem[8] <= 8'b00000000;$display(";A 16");  //assertion( mem[8] = 0) 16
                        mem[9] <= 8'b00000010;$display(";A 17");  //assertion( mem[9] = 2) 17
                        mem[10] <= 8'b11111111;$display(";A 18");  //assertion( mem[10] = 255) 18
                        mem[11] <= 8'b00000101;$display(";A 19");  //assertion( mem[11] = 5) 19
                        mem[12] <= 8'b00000000;$display(";A 20");  //assertion( mem[12] = 0) 20
                        mem[13] <= 8'b00000010;$display(";A 21");  //assertion( mem[13] = 2) 21
                        mem[14] <= 8'b00000001;$display(";A 22");  //assertion( mem[14] = 1) 22
                        mem[14] <= 8'b00000000;$display(";A 23");  //assertion( mem[14] = 0) 23
                        mem[15] <= 8'b00000010;$display(";A 24");  //assertion( mem[15] = 2) 24
                        stato <= 3'b000;$display(";A 25");  //assertion( stato = 0) 25
                    end
            else
                    begin
                        case (stato)
                          3'b000:
                                begin
                                $display(";A 26");  //assertion( stato == 0 = True) 26
                                    stato <= 3'b001;$display(";A 27");  //assertion( stato = 1) 27
                                end
                          3'b001:
                                begin
                                $display(";A 28");  //assertion( stato == 1 = True) 28
                                    if ((start == 1))
                                            begin
                                            $display(";A 29");  //assertion( start == 1 = True) 29
                                                cont <= 0;$display(";A 31");  //assertion( cont = 0) 31
                                                mar <= 0;$display(";A 32");  //assertion( mar = 0) 32
                                                stato <= 3'b010;$display(";A 33");  //assertion( stato = 2) 33
                                            end
                                    else
                                            begin
                                            $display(";A 30");  //assertion( start == 1 = False) 30
                                                punti_retta <= 0;$display(";A 34");  //assertion( punti_retta = 0) 34
                                                stato <= 3'b001;$display(";A 35");  //assertion( stato = 1) 35
                                            end
                                end
                          3'b010:
                                begin
                                $display(";A 36");  //assertion( stato == 2 = True) 36
                                    x <= mem[mar];$display(";A 37");  //assertion( x = mem[mar]) 37
                                    stato <= 3'b011;$display(";A 38");  //assertion( stato = 3) 38
                                end
                          3'b011:
                                begin
                                $display(";A 39");  //assertion( stato == 3 = True) 39
                                    mar <= (mar + 1);$display(";A 40");  //assertion( mar = 1 + mar) 40
                                    t <= (x + x);$display(";A 41");  //assertion( t = 2*x) 41
                                    stato <= 3'b100;$display(";A 42");  //assertion( stato = 4) 42
                                end
                          3'b100:
                                begin
                                $display(";A 43");  //assertion( stato == 4 = True) 43
                                    y <= mem[mar];$display(";A 44");  //assertion( y = mem[mar]) 44
                                    x <= (x + t);$display(";A 45");  //assertion( x = x + t) 45
                                    stato <= 3'b101;$display(";A 46");  //assertion( stato = 5) 46
                                end
                          3'b101:
                                begin
                                $display(";A 47");  //assertion( stato == 5 = True) 47
                                    x <= (x + y);$display(";A 48");  //assertion( x = x + y) 48
                                    stato <= 3'b110;$display(";A 49");  //assertion( stato = 6) 49
                                end
                          3'b110:
                                begin
                                $display(";A 50");  //assertion( stato == 6 = True) 50
                                    if ((mar != 4'b1111))
                                            begin
                                            $display(";A 51");  //assertion( Not(mar == 15) = True) 51
                                                if ((x == 4'b0010))
                                                        begin
                                                        $display(";A 53");  //assertion( x == 2 = True) 53
                                                            cont <= (cont + 1);$display(";A 55");  //assertion( cont = 1 + cont) 55
                                                            mar <= (mar + 1);$display(";A 56");  //assertion( mar = 1 + mar) 56
                                                            stato <= 3'b010;$display(";A 57");  //assertion( stato = 2) 57
                                                        end
                                                else
                                                        begin
                                                        $display(";A 54");  //assertion( x == 2 = False) 54
                                                            mar <= (mar + 1);$display(";A 58");  //assertion( mar = 1 + mar) 58
                                                            stato <= 3'b010;$display(";A 59");  //assertion( stato = 2) 59
                                                        end
                                            end
                                    else
                                            begin
                                            $display(";A 52");  //assertion( Not(mar == 15) = False) 52
                                                if ((start == 0))
                                                        begin
                                                        $display(";A 60");  //assertion( start == 0 = True) 60
                                                            if ((x == 8'b00000010))
                                                                    begin
                                                                    $display(";A 62");  //assertion( x == 2 = True) 62
                                                                        punti_retta <= (cont + 1);$display(";A 64");  //assertion( punti_retta = 1 + cont) 64
                                                                        stato <= 3'b001;$display(";A 65");  //assertion( stato = 1) 65
                                                                    end
                                                            else
                                                                    begin
                                                                    $display(";A 63");  //assertion( x == 2 = False) 63
                                                                        punti_retta <= cont;$display(";A 66");  //assertion( punti_retta = cont) 66
                                                                        stato <= 3'b001;$display(";A 67");  //assertion( stato = 1) 67
                                                                    end
                                                        end
                                                else
                                                        begin
                                                        $display(";A 61");  //assertion( start == 0 = False) 61
                                                            stato <= 3'b110;$display(";A 68");  //assertion( stato = 6) 68
                                                        end
                                            end
                                end
                          default:
                            begin
                            $display(";A 69");  //assertion( ~(If(stato == 0, 1, 0) | If(stato == 1, 1, 0) | If(stato == 2, 1, 0) | If(stato == 3, 1, 0) | If(stato == 4, 1, 0) | If(stato == 5, 1, 0) | If(stato == 6, 1, 0)) = True) 69
                                stato <= 3'b001;$display(";A 70");  //assertion( stato = 1) 70
                            end
                        endcase
                    end
            // Display the variables
            begin
            $display(";R punti_retta = %d", punti_retta);
            $display(";R stato = %d", stato);
            $display(";R cont = %d", cont);
            $display(";R mar = %d", mar);
            $display(";R x = %d", x);
            $display(";R y = %d", y);
            $display(";R t = %d", t);
            $display(";R mem[0] = %d", mem[0]);
            $display(";R mem[1] = %d", mem[1]);
            $display(";R mem[2] = %d", mem[2]);
            $display(";R mem[3] = %d", mem[3]);
            $display(";R mem[4] = %d", mem[4]);
            $display(";R mem[5] = %d", mem[5]);
            $display(";R mem[6] = %d", mem[6]);
            $display(";R mem[7] = %d", mem[7]);
            $display(";R mem[8] = %d", mem[8]);
            $display(";R mem[9] = %d", mem[9]);
            $display(";R mem[10] = %d", mem[10]);
            $display(";R mem[11] = %d", mem[11]);
            $display(";R mem[12] = %d", mem[12]);
            $display(";R mem[13] = %d", mem[13]);
            $display(";R mem[14] = %d", mem[14]);
            $display(";R mem[15] = %d", mem[15]);
            end
        end

endmodule
