//Following code is from line 1
module b01(reset, clock, line1, outp, overflw, line2, __obs);

    input               clock;
    input               line1;
    input               line2;
    input               reset;
    output              outp;
    output              overflw;
    input               __obs;

    reg outp = 1'b0;
    reg overflw = 1'b0;
    //Parameter Declaration
    reg  [2:0]  stato = 3'b0;

    //Following code is from line 15
        always @(posedge clock) begin
            if ((reset == 1'b1))
                begin
                    stato <= 3'b0;  $display(";A 2");  //assertion( stato = 0) 2
                    outp <= 1'b0;  $display(";A 3");  //assertion( outp = 0) 3
                    overflw <= 1'b0;  $display(";A 4");  //assertion( overflw = 0) 4
                end
            else
                begin
                    case (stato)
                      3'b0:
                        begin
                          $display(";A 5");                          //assertion( 0 == stato = True) 5
                            if (((line1 == 1'b1) && (line2 == 1'b1)))
                                begin
                                  $display(";A 6");                                  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 6
                                    stato <= 3'b100;  $display(";A 8");  //assertion( stato = 4) 8
                                end
                            else
                                begin
                                  $display(";A 7");                                  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 7
                                    stato <= 3'b001;  $display(";A 9");  //assertion( stato = 1) 9
                                end
                            outp <= (line1 | line2);  $display(";A 10");  //assertion( outp = line1 | line2) 10
                            overflw <= 1'b0;  $display(";A 11");  //assertion( overflw = 0) 11
                        end
                      3'b011:
                        begin
                          $display(";A 12");                          //assertion( 3 == stato = True) 12
                            if (((line1 == 1'b1) && (line2 == 1'b1)))
                                begin
                                  $display(";A 13");                                  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 13
                                    stato <= 3'b100;  $display(";A 15");  //assertion( stato = 4) 15
                                end
                            else
                                begin
                                  $display(";A 14");                                  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 14
                                    stato <= 3'b001;  $display(";A 16");  //assertion( stato = 1) 16
                                end
                            outp <= (line1 | line2);  $display(";A 17");  //assertion( outp = line1 | line2) 17
                            overflw <= 1'b1;  $display(";A 18");  //assertion( overflw = 1) 18
                        end
                      3'b001:
                        begin
                          $display(";A 19");                          //assertion( 1 == stato = True) 19
                            if (((line1 == 1'b1) && (line2 == 1'b1)))
                                begin
                                  $display(";A 20");                                  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 20
                                    stato <= 3'b101;  $display(";A 22");  //assertion( stato = 5) 22
                                end
                            else
                                begin
                                  $display(";A 21");                                  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 21
                                    stato <= 3'b010;  $display(";A 23");  //assertion( stato = 2) 23
                                end
                            outp <= (line1 | line2);  $display(";A 24");  //assertion( outp = line1 | line2) 24
                            overflw <= 1'b0;  $display(";A 25");  //assertion( overflw = 0) 25
                        end
                      3'b100:
                        begin
                          $display(";A 26");                          //assertion( 4 == stato = True) 26
                            if (((line1 == 1'b1) || (line2 == 1'b1)))
                                begin
                                  $display(";A 27");                                  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 27
                                    stato <= 3'b101;  $display(";A 29");  //assertion( stato = 5) 29
                                end
                            else
                                begin
                                  $display(";A 28");                                  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 28
                                    stato <= 3'b010;  $display(";A 30");  //assertion( stato = 2) 30
                                end
                            outp <= (~(line1 ^ line2));  $display(";A 31");  //assertion( outp = ~(line1 ^ line2)) 31
                            overflw <= 1'b0;  $display(";A 32");  //assertion( overflw = 0) 32
                        end
                      3'b010:
                        begin
                          $display(";A 33");                          //assertion( 2 == stato = True) 33
                            if (((line1 == 1'b1) && (line2 == 1'b1)))
                                begin
                                  $display(";A 34");                                  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 34
                                    stato <= 3'b111;  $display(";A 36");  //assertion( stato = 7) 36
                                end
                            else
                                begin
                                  $display(";A 35");                                  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 35
                                    stato <= 3'b110;  $display(";A 37");  //assertion( stato = 6) 37
                                end
                            outp <= (line1 | line2);  $display(";A 38");  //assertion( outp = line1 | line2) 38
                            overflw <= 1'b0;  $display(";A 39");  //assertion( overflw = 0) 39
                        end
                      3'b101:
                        begin
                          $display(";A 40");                          //assertion( 5 == stato = True) 40
                            if (((line1 == 1'b1) || (line2 == 1'b1)))
                                begin
                                  $display(";A 41");                                  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 41
                                    stato <= 3'b111;  $display(";A 43");  //assertion( stato = 7) 43
                                end
                            else
                                begin
                                  $display(";A 42");                                  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 42
                                    stato <= 3'b110;  $display(";A 44");  //assertion( stato = 6) 44
                                end
                            outp <= (~(line1 | line2));  $display(";A 45");  //assertion( outp = ~(line1 | line2)) 45
                            overflw <= 1'b0;  $display(";A 46");  //assertion( overflw = 0) 46
                        end
                      3'b110:
                        begin
                          $display(";A 47");                          //assertion( 6 == stato = True) 47
                            if (((line1 == 1'b1) && (line2 == 1'b1)))
                                begin
                                  $display(";A 48");                                  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 48
                                    stato <= 3'b011;  $display(";A 50");  //assertion( stato = 3) 50
                                end
                            else
                                begin
                                  $display(";A 49");                                  //assertion( And(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 49
                                    stato <= 3'b0;  $display(";A 51");  //assertion( stato = 0) 51
                                end
                            outp <= (line1 | line2);  $display(";A 52");  //assertion( outp = line1 | line2) 52
                            overflw <= 1'b0;  $display(";A 53");  //assertion( overflw = 0) 53
                        end
                      3'b111:
                        begin
                          $display(";A 54");                          //assertion( 7 == stato = True) 54
                            if (((line1 == 1'b1) || (line2 == 1'b1)))
                                begin
                                  $display(";A 55");                                  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = True) 55
                                    stato <= 3'b011;  $display(";A 57");  //assertion( stato = 3) 57
                                end
                            else
                                begin
                                  $display(";A 56");                                  //assertion( Or(If((1 == line1) == True, 1, 0) == 1, If((1 == line2) == True, 1, 0) == 1) = False) 56
                                    stato <= 3'b000;  $display(";A 58");  //assertion( stato = 0) 58
                                end
                            outp <= (~(line1 | line2));  $display(";A 59");  //assertion( outp = ~(line1 | line2)) 59
                            overflw <= 1'b0;  $display(";A 60");  //assertion( overflw = 0) 60
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

endmodule
