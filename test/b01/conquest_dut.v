//Following code is from line 1
module b01(reset, in, out, clock, __obs);

    input               clock;
    input               reset;
    input         [2:0] in;
    output              out;
    input               __obs;

    reg out = 1'b0;
    //Parameter Declaration
    reg  [7:0]  a = 8'b0;
    reg  [7:0]  b = 8'b0;
    reg  [1:0]  state = 2'b0;

    //Following code is from line 12
        always @(posedge clock) begin
            if (reset)
                begin
                    a <= 0;  $display(";A 2");  //assertion( a = 0) 2
                    b <= 0;  $display(";A 3");  //assertion( b = 0) 3
                    out <= 0;  $display(";A 4");  //assertion( out = 0) 4
                    state <= 0;  $display(";A 5");  //assertion( state = 0) 5
                end
            else
                begin
                    if ((in == 0))
                        begin
                          $display(";A 6");                          //assertion( in == ZeroExt(2, 0) = True) 6
                            a <= (a + 1);  $display(";A 8");  //assertion( a = a + ZeroExt(7, 1)) 8
                        end
                    else
                          $display(";A 7");                          //assertion( in == ZeroExt(2, 0) = False) 7
                    if ((a < 4))
                        begin
                          $display(";A 9");                          //assertion( ULT(a, ZeroExt(5, 4)) = True) 9
                            case (state)
                              0:
                                begin
                                  $display(";A 11");                                  //assertion( state == ZeroExt(1, 0) = True) 11
                                    if ((in == 1))
                                        begin
                                          $display(";A 12");                                          //assertion( in == ZeroExt(2, 1) = True) 12
                                            state <= 1;  $display(";A 14");  //assertion( state = 1) 14
                                        end
                                    else
                                          $display(";A 13");                                          //assertion( in == ZeroExt(2, 1) = False) 13
                                end
                              1:
                                begin
                                  $display(";A 15");                                  //assertion( state == ZeroExt(1, 1) = True) 15
                                    if ((in == 2))
                                        begin
                                          $display(";A 16");                                          //assertion( in == ZeroExt(1, 2) = True) 16
                                            b <= (b + 1);  $display(";A 18");  //assertion( b = b + ZeroExt(7, 1)) 18
                                            state <= 0;  $display(";A 19");  //assertion( state = 0) 19
                                        end
                                    else
                                          $display(";A 17");                                          //assertion( in == ZeroExt(1, 2) = False) 17
                                end
                            endcase
                        end
                    else
                          $display(";A 10");                          //assertion( ULT(a, ZeroExt(5, 4)) = False) 10
                    if (((a > 5) && (b > 6)))
                        begin
                          $display(";A 20");                          //assertion( And(If(UGT(a, ZeroExt(5, 5)) == True, 1, 0) == 1, If(UGT(b, ZeroExt(5, 6)) == True, 1, 0) == 1) = True) 20
                            out <= 1;  $display(";A 22");  //assertion( out = 1) 22
                        end
                    else
                          $display(";A 21");                          //assertion( And(If(UGT(a, ZeroExt(5, 5)) == True, 1, 0) == 1, If(UGT(b, ZeroExt(5, 6)) == True, 1, 0) == 1) = False) 21
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

endmodule
