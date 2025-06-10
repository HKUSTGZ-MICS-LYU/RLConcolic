module b22 (
  input clock,
  input reset,
  input [31:0] si,
  output reg  [19:0] so,
  output reg  rd,
  output reg  wr) ; 
   wire [19:0] addr_1 ;  
   wire [19:0] addr_2 ;  
   wire [19:0] addr_3 ;  
   integer datai_1 ;  
   integer datai_2 ;  
   integer datai_3 ;  
   wire [31:0] datao_1 ;  
   wire [31:0] datao_2 ;  
   wire [31:0] datao_3 ;  
   wire rd_1 ;  
   wire rd_2 ;  
   wire rd_3 ;  
   wire wr_1 ;  
   wire wr_2 ;  
   wire wr_3 ;  
  
wire  P1__clock;
wire  P1__reset;
reg [19:0] P1__addr;
wire [31:0] P1__datai;
integer P1__datao;
reg  P1__rd;
reg  P1__wr;
integer  P1__reg0  ;
integer  P1__reg1  ;
integer  P1__reg2  ;
integer  P1__reg3  ;
reg  P1__B  ;
reg[19:0]  P1__MAR  ;
integer  P1__MBR  ;
reg[1:0]  P1__mf  ;
reg[2:0]  P1__df  ;
reg[0:0]  P1__cf  ;
reg[3:0]  P1__ff  ;
reg[19:0]  P1__tail  ;
integer  P1__IR  ;
reg[0:0]  P1__state  ;
integer  P1__r  ;
integer  P1__m  ;
integer  P1__t  ;
integer  P1__d  ;
integer  P1__temp  ;
reg[1:0]  P1__s  ;
  always @(  posedge    P1__clock          or  posedge   P1__reset  )
       begin :  P1__xhdl0  
       
         if (  P1__reset  ==1'b1)
            begin  
               P1__MAR   =0; 
               P1__MBR   =0; 
               P1__IR   =0; 
               P1__d   =0; 
               P1__r   =0; 
               P1__m   =0; 
               P1__s   =0; 
               P1__temp   =0; 
               P1__mf   =0; 
               P1__df   =0; 
               P1__ff   =0; 
               P1__cf   =0; 
               P1__tail   =0; 
               P1__B   =1'b0; 
               P1__reg0   =0; 
               P1__reg1   =0; 
               P1__reg2   =0; 
               P1__reg3   =0; 
               P1__addr   <=0; 
               P1__rd   <=1'b0; 
               P1__wr   <=1'b0; 
               P1__datao   <=0; 
               P1__state   =  0  ;
            end 
          else 
            begin  
               P1__rd   <=1'b0; 
               P1__wr   <=1'b0;
              case (  P1__state  ) 
                0   :
                  begin  
                     P1__MAR   =  P1__reg3  %1048576; 
                     P1__addr   <=  P1__MAR  ; 
                     P1__rd   <=1'b1; 
                     P1__MBR   =  P1__datai  ; 
                     P1__IR   =  P1__MBR  ; 
                     P1__state   =  1  ;
                  end  
                1   :
                  begin 
                    if (  P1__IR  <0) 
                        P1__IR   =-  P1__IR  ; 
                     P1__mf   =(  P1__IR  /2**27)%4; 
                     P1__df   =(  P1__IR  /2**24)%2**3; 
                     P1__ff   =(  P1__IR  /524288)%2**4; 
                     P1__cf   =(  P1__IR  /2**23)%2; 
                     P1__tail   =  P1__IR  %1048576; 
                     P1__reg3   =((  P1__reg3  %536870912)+8); 
                     P1__s   =(  P1__IR  /536870912)%4;
                    case (  P1__s  )
                     0 : 
                         P1__r   =  P1__reg0  ;
                     1 : 
                         P1__r   =  P1__reg1  ;
                     2 : 
                         P1__r   =  P1__reg2  ;
                     3 : 
                         P1__r   =  P1__reg3  ;
                    endcase 
                    case (  P1__cf  )
                     1 :
                        begin 
                          case (  P1__mf  )
                           0 : 
                               P1__m   =  P1__tail  ;
                           1 :
                              begin  
                                 P1__m   =  P1__datai  ; 
                                 P1__addr   <=  P1__tail  ; 
                                 P1__rd   <=1'b1;
                              end 
                           2 :
                              begin  
                                 P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                 P1__rd   <=1'b1; 
                                 P1__m   =  P1__datai  ;
                              end 
                           3 :
                              begin  
                                 P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                 P1__rd   <=1'b1; 
                                 P1__m   =  P1__datai  ;
                              end 
                          endcase 
                          case (  P1__ff  )
                           0 :
                              if (  P1__r  <  P1__m  ) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           1 :
                              if (~(  P1__r  <  P1__m  )) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           2 :
                              if (  P1__r  ==  P1__m  ) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           3 :
                              if (~(  P1__r  ==  P1__m  )) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           4 :
                              if (~(  P1__r  >  P1__m  )) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           5 :
                              if (  P1__r  >  P1__m  ) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           6 :
                              begin 
                                if (  P1__r  >1073741823) 
                                    P1__r   =  P1__r  -1073741824;
                                if (  P1__r  <  P1__m  ) 
                                    P1__B   =1'b1;
                                 else  
                                    P1__B   =1'b0;
                              end 
                           7 :
                              begin 
                                if (  P1__r  >1073741823) 
                                    P1__r   =  P1__r  -1073741824;
                                if (~(  P1__r  <  P1__m  )) 
                                    P1__B   =1'b1;
                                 else  
                                    P1__B   =1'b0;
                              end 
                           8 :
                              if ((  P1__r  <  P1__m  )|(  P1__B  ==1'b1)) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           9 :
                              if ((~(  P1__r  <  P1__m  ))|(  P1__B  ==1'b1)) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           10 :
                              if ((  P1__r  ==  P1__m  )|(  P1__B  ==1'b1)) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           11 :
                              if ((~(  P1__r  ==  P1__m  ))|(  P1__B  ==1'b1)) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           12 :
                              if ((~(  P1__r  >  P1__m  ))|(  P1__B  ==1'b1)) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           13 :
                              if ((  P1__r  >  P1__m  )|(  P1__B  ==1'b1)) 
                                  P1__B   =1'b1;
                               else  
                                  P1__B   =1'b0;
                           14 :
                              begin 
                                if (  P1__r  >1073741823) 
                                    P1__r   =  P1__r  -1073741824;
                                if ((  P1__r  <  P1__m  )|(  P1__B  ==1'b1)) 
                                    P1__B   =1'b1;
                                 else  
                                    P1__B   =1'b0;
                              end 
                           15 :
                              begin 
                                if (  P1__r  >1073741823) 
                                    P1__r   =  P1__r  -1073741824;
                                if ((~(  P1__r  <  P1__m  ))|(  P1__B  ==1'b1)) 
                                    P1__B   =1'b1;
                                 else  
                                    P1__B   =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~(  P1__df  ==7))
                           begin 
                             if (  P1__df  ==5)
                                begin 
                                  if ((~(  P1__B  ))==1'b1) 
                                      P1__d   =3;
                                end 
                              else 
                                if (  P1__df  ==4)
                                   begin 
                                     if (  P1__B  ==1'b1) 
                                         P1__d   =3;
                                   end 
                                 else 
                                   if (  P1__df  ==3) 
                                       P1__d   =3;
                                    else 
                                      if (  P1__df  ==2) 
                                          P1__d   =2;
                                       else 
                                         if (  P1__df  ==1) 
                                             P1__d   =1;
                                          else 
                                            if (  P1__df  ==0) 
                                                P1__d   =0;
                             case (  P1__ff  )
                              0 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase  
                                    P1__t   =0;
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =  P1__t  -  P1__m  ;
                                    1 : 
                                        P1__reg1   =  P1__t  -  P1__m  ;
                                    2 : 
                                        P1__reg2   =  P1__t  -  P1__m  ;
                                    3 : 
                                        P1__reg3   =  P1__t  -  P1__m  ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase  
                                    P1__reg2   =  P1__reg3  ; 
                                    P1__reg3   =  P1__m  ;
                                 end 
                              2 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =  P1__m  ;
                                    1 : 
                                        P1__reg1   =  P1__m  ;
                                    2 : 
                                        P1__reg2   =  P1__m  ;
                                    3 : 
                                        P1__reg3   =  P1__m  ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =  P1__m  ;
                                    1 : 
                                        P1__reg1   =  P1__m  ;
                                    2 : 
                                        P1__reg2   =  P1__m  ;
                                    3 : 
                                        P1__reg3   =  P1__m  ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =(  P1__r  +  P1__m  )%1073741824;
                                    1 : 
                                        P1__reg1   =(  P1__r  +  P1__m  )%1073741824;
                                    2 : 
                                        P1__reg2   =(  P1__r  +  P1__m  )%1073741824;
                                    3 : 
                                        P1__reg3   =(  P1__r  +  P1__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =(  P1__r  +  P1__m  )%1073741824;
                                    1 : 
                                        P1__reg1   =(  P1__r  +  P1__m  )%1073741824;
                                    2 : 
                                        P1__reg2   =(  P1__r  +  P1__m  )%1073741824;
                                    3 : 
                                        P1__reg3   =(  P1__r  +  P1__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =(  P1__r  -  P1__m  )%1073741824;
                                    1 : 
                                        P1__reg1   =(  P1__r  -  P1__m  )%1073741824;
                                    2 : 
                                        P1__reg2   =(  P1__r  -  P1__m  )%1073741824;
                                    3 : 
                                        P1__reg3   =(  P1__r  -  P1__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =(  P1__r  -  P1__m  )%1073741824;
                                    1 : 
                                        P1__reg1   =(  P1__r  -  P1__m  )%1073741824;
                                    2 : 
                                        P1__reg2   =(  P1__r  -  P1__m  )%1073741824;
                                    3 : 
                                        P1__reg3   =(  P1__r  -  P1__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =(  P1__r  +  P1__m  )%1073741824;
                                    1 : 
                                        P1__reg1   =(  P1__r  +  P1__m  )%1073741824;
                                    2 : 
                                        P1__reg2   =(  P1__r  +  P1__m  )%1073741824;
                                    3 : 
                                        P1__reg3   =(  P1__r  +  P1__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =(  P1__r  -  P1__m  )%1073741824;
                                    1 : 
                                        P1__reg1   =(  P1__r  -  P1__m  )%1073741824;
                                    2 : 
                                        P1__reg2   =(  P1__r  -  P1__m  )%1073741824;
                                    3 : 
                                        P1__reg3   =(  P1__r  -  P1__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =(  P1__r  +  P1__m  )%1073741824;
                                    1 : 
                                        P1__reg1   =(  P1__r  +  P1__m  )%1073741824;
                                    2 : 
                                        P1__reg2   =(  P1__r  +  P1__m  )%1073741824;
                                    3 : 
                                        P1__reg3   =(  P1__r  +  P1__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__m   =  P1__tail  ;
                                    1 :
                                       begin  
                                          P1__m   =  P1__datai  ; 
                                          P1__addr   <=  P1__tail  ; 
                                          P1__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg1  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P1__addr   <=(  P1__tail  +  P1__reg2  )%1048576; 
                                          P1__rd   <=1'b1; 
                                          P1__m   =  P1__datai  ;
                                       end 
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =(  P1__r  -  P1__m  )%1073741824;
                                    1 : 
                                        P1__reg1   =(  P1__r  -  P1__m  )%1073741824;
                                    2 : 
                                        P1__reg2   =(  P1__r  -  P1__m  )%1073741824;
                                    3 : 
                                        P1__reg3   =(  P1__r  -  P1__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case (  P1__mf  )
                                    0 : 
                                        P1__t   =  P1__r  /2;
                                    1 :
                                       begin  
                                          P1__t   =  P1__r  /2;
                                         if (  P1__B  ==1'b1) 
                                             P1__t   =  P1__t  %536870912;
                                       end 
                                    2 : 
                                        P1__t   =(  P1__r  %536870912)*2;
                                    3 :
                                       begin  
                                          P1__t   =(  P1__r  %536870912)*2;
                                         if (  P1__t  >1073741823) 
                                             P1__B   =1'b1;
                                          else  
                                             P1__B   =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case (  P1__d  )
                                    0 : 
                                        P1__reg0   =  P1__t  ;
                                    1 : 
                                        P1__reg1   =  P1__t  ;
                                    2 : 
                                        P1__reg2   =  P1__t  ;
                                    3 : 
                                        P1__reg3   =  P1__t  ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if (  P1__df  ==7)
                              begin 
                                case (  P1__mf  )
                                 0 : 
                                     P1__m   =  P1__tail  ;
                                 1 : 
                                     P1__m   =  P1__tail  ;
                                 2 : 
                                     P1__m   =(  P1__reg1  %1048576)+(  P1__tail  %1048576);
                                 3 : 
                                     P1__m   =(  P1__reg2  %1048576)+(  P1__tail  %1048576);
                                endcase  
                                 P1__addr   <=  P1__m  %2*20; 
                                 P1__wr   <=1'b1; 
                                 P1__datao   <=  P1__r  ;
                              end 
                    endcase  
                     P1__state   =  0  ;
                  end 
              endcase 
            end 
       end
 
assign P1__clock = clock;
assign P1__reset = reset;
assign addr_1 = P1__addr;
assign P1__datai = datai_1;
assign datao_1 = P1__datao;
assign rd_1 = P1__rd;
assign wr_1 = P1__wr;
 
  
wire  P2__clock;
wire  P2__reset;
reg [19:0] P2__addr;
wire [31:0] P2__datai;
integer P2__datao;
reg  P2__rd;
reg  P2__wr;
integer  P2__reg0  ;
integer  P2__reg1  ;
integer  P2__reg2  ;
integer  P2__reg3  ;
reg  P2__B  ;
reg[19:0]  P2__MAR  ;
integer  P2__MBR  ;
reg[1:0]  P2__mf  ;
reg[2:0]  P2__df  ;
reg[0:0]  P2__cf  ;
reg[3:0]  P2__ff  ;
reg[19:0]  P2__tail  ;
integer  P2__IR  ;
reg[0:0]  P2__state  ;
integer  P2__r  ;
integer  P2__m  ;
integer  P2__t  ;
integer  P2__d  ;
integer  P2__temp  ;
reg[1:0]  P2__s  ;
  always @(  posedge    P2__clock          or  posedge   P2__reset  )
       begin :  P2__xhdl1  
       
         if (  P2__reset  ==1'b1)
            begin  
               P2__MAR   =0; 
               P2__MBR   =0; 
               P2__IR   =0; 
               P2__d   =0; 
               P2__r   =0; 
               P2__m   =0; 
               P2__s   =0; 
               P2__temp   =0; 
               P2__mf   =0; 
               P2__df   =0; 
               P2__ff   =0; 
               P2__cf   =0; 
               P2__tail   =0; 
               P2__B   =1'b0; 
               P2__reg0   =0; 
               P2__reg1   =0; 
               P2__reg2   =0; 
               P2__reg3   =0; 
               P2__addr   <=0; 
               P2__rd   <=1'b0; 
               P2__wr   <=1'b0; 
               P2__datao   <=0; 
               P2__state   =  0  ;
            end 
          else 
            begin  
               P2__rd   <=1'b0; 
               P2__wr   <=1'b0;
              case (  P2__state  ) 
                0   :
                  begin  
                     P2__MAR   =  P2__reg3  %1048576; 
                     P2__addr   <=  P2__MAR  ; 
                     P2__rd   <=1'b1; 
                     P2__MBR   =  P2__datai  ; 
                     P2__IR   =  P2__MBR  ; 
                     P2__state   =  0  ;
                  end  
                0   :
                  begin 
                    if (  P2__IR  <0) 
                        P2__IR   =-  P2__IR  ; 
                     P2__mf   =(  P2__IR  /2**27)%4; 
                     P2__df   =(  P2__IR  /2**24)%2**3; 
                     P2__ff   =(  P2__IR  /524288)%2**4; 
                     P2__cf   =(  P2__IR  /2**23)%2; 
                     P2__tail   =  P2__IR  %1048576; 
                     P2__reg3   =((  P2__reg3  %536870912)+8); 
                     P2__s   =(  P2__IR  /536870912)%4;
                    case (  P2__s  )
                     0 : 
                         P2__r   =  P2__reg0  ;
                     1 : 
                         P2__r   =  P2__reg1  ;
                     2 : 
                         P2__r   =  P2__reg2  ;
                     3 : 
                         P2__r   =  P2__reg3  ;
                    endcase 
                    case (  P2__cf  )
                     1 :
                        begin 
                          case (  P2__mf  )
                           0 : 
                               P2__m   =  P2__tail  ;
                           1 :
                              begin  
                                 P2__m   =  P2__datai  ; 
                                 P2__addr   <=  P2__tail  ; 
                                 P2__rd   <=1'b1;
                              end 
                           2 :
                              begin  
                                 P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                 P2__rd   <=1'b1; 
                                 P2__m   =  P2__datai  ;
                              end 
                           3 :
                              begin  
                                 P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                 P2__rd   <=1'b1; 
                                 P2__m   =  P2__datai  ;
                              end 
                          endcase 
                          case (  P2__ff  )
                           0 :
                              if (  P2__r  <  P2__m  ) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           1 :
                              if (~(  P2__r  <  P2__m  )) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           2 :
                              if (  P2__r  ==  P2__m  ) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           3 :
                              if (~(  P2__r  ==  P2__m  )) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           4 :
                              if (~(  P2__r  >  P2__m  )) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           5 :
                              if (  P2__r  >  P2__m  ) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           6 :
                              begin 
                                if (  P2__r  >1073741823) 
                                    P2__r   =  P2__r  -1073741824;
                                if (  P2__r  <  P2__m  ) 
                                    P2__B   =1'b1;
                                 else  
                                    P2__B   =1'b0;
                              end 
                           7 :
                              begin 
                                if (  P2__r  >1073741823) 
                                    P2__r   =  P2__r  -1073741824;
                                if (~(  P2__r  <  P2__m  )) 
                                    P2__B   =1'b1;
                                 else  
                                    P2__B   =1'b0;
                              end 
                           8 :
                              if ((  P2__r  <  P2__m  )|(  P2__B  ==1'b1)) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           9 :
                              if ((~(  P2__r  <  P2__m  ))|(  P2__B  ==1'b1)) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           10 :
                              if ((  P2__r  ==  P2__m  )|(  P2__B  ==1'b1)) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           11 :
                              if ((~(  P2__r  ==  P2__m  ))|(  P2__B  ==1'b1)) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           12 :
                              if ((~(  P2__r  >  P2__m  ))|(  P2__B  ==1'b1)) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           13 :
                              if ((  P2__r  >  P2__m  )|(  P2__B  ==1'b1)) 
                                  P2__B   =1'b1;
                               else  
                                  P2__B   =1'b0;
                           14 :
                              begin 
                                if (  P2__r  >1073741823) 
                                    P2__r   =  P2__r  -1073741824;
                                if ((  P2__r  <  P2__m  )|(  P2__B  ==1'b1)) 
                                    P2__B   =1'b1;
                                 else  
                                    P2__B   =1'b0;
                              end 
                           15 :
                              begin 
                                if (  P2__r  >1073741823) 
                                    P2__r   =  P2__r  -1073741824;
                                if ((~(  P2__r  <  P2__m  ))|(  P2__B  ==1'b1)) 
                                    P2__B   =1'b1;
                                 else  
                                    P2__B   =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~(  P2__df  ==7))
                           begin 
                             if (  P2__df  ==5)
                                begin 
                                  if ((~(  P2__B  ))==1'b1) 
                                      P2__d   =3;
                                end 
                              else 
                                if (  P2__df  ==4)
                                   begin 
                                     if (  P2__B  ==1'b1) 
                                         P2__d   =3;
                                   end 
                                 else 
                                   if (  P2__df  ==3) 
                                       P2__d   =3;
                                    else 
                                      if (  P2__df  ==2) 
                                          P2__d   =2;
                                       else 
                                         if (  P2__df  ==1) 
                                             P2__d   =1;
                                          else 
                                            if (  P2__df  ==0) 
                                                P2__d   =0;
                             case (  P2__ff  )
                              0 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase  
                                    P2__t   =0;
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =  P2__t  -  P2__m  ;
                                    1 : 
                                        P2__reg1   =  P2__t  -  P2__m  ;
                                    2 : 
                                        P2__reg2   =  P2__t  -  P2__m  ;
                                    3 : 
                                        P2__reg3   =  P2__t  -  P2__m  ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase  
                                    P2__reg2   =  P2__reg3  ; 
                                    P2__reg3   =  P2__m  ;
                                 end 
                              2 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =  P2__m  ;
                                    1 : 
                                        P2__reg1   =  P2__m  ;
                                    2 : 
                                        P2__reg2   =  P2__m  ;
                                    3 : 
                                        P2__reg3   =  P2__m  ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =  P2__m  ;
                                    1 : 
                                        P2__reg1   =  P2__m  ;
                                    2 : 
                                        P2__reg2   =  P2__m  ;
                                    3 : 
                                        P2__reg3   =  P2__m  ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =(  P2__r  +  P2__m  )%1073741824;
                                    1 : 
                                        P2__reg1   =(  P2__r  +  P2__m  )%1073741824;
                                    2 : 
                                        P2__reg2   =(  P2__r  +  P2__m  )%1073741824;
                                    3 : 
                                        P2__reg3   =(  P2__r  +  P2__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =(  P2__r  +  P2__m  )%1073741824;
                                    1 : 
                                        P2__reg1   =(  P2__r  +  P2__m  )%1073741824;
                                    2 : 
                                        P2__reg2   =(  P2__r  +  P2__m  )%1073741824;
                                    3 : 
                                        P2__reg3   =(  P2__r  +  P2__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =(  P2__r  -  P2__m  )%1073741824;
                                    1 : 
                                        P2__reg1   =(  P2__r  -  P2__m  )%1073741824;
                                    2 : 
                                        P2__reg2   =(  P2__r  -  P2__m  )%1073741824;
                                    3 : 
                                        P2__reg3   =(  P2__r  -  P2__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =(  P2__r  -  P2__m  )%1073741824;
                                    1 : 
                                        P2__reg1   =(  P2__r  -  P2__m  )%1073741824;
                                    2 : 
                                        P2__reg2   =(  P2__r  -  P2__m  )%1073741824;
                                    3 : 
                                        P2__reg3   =(  P2__r  -  P2__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =(  P2__r  +  P2__m  )%1073741824;
                                    1 : 
                                        P2__reg1   =(  P2__r  +  P2__m  )%1073741824;
                                    2 : 
                                        P2__reg2   =(  P2__r  +  P2__m  )%1073741824;
                                    3 : 
                                        P2__reg3   =(  P2__r  +  P2__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =(  P2__r  -  P2__m  )%1073741824;
                                    1 : 
                                        P2__reg1   =(  P2__r  -  P2__m  )%1073741824;
                                    2 : 
                                        P2__reg2   =(  P2__r  -  P2__m  )%1073741824;
                                    3 : 
                                        P2__reg3   =(  P2__r  -  P2__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =(  P2__r  +  P2__m  )%1073741824;
                                    1 : 
                                        P2__reg1   =(  P2__r  +  P2__m  )%1073741824;
                                    2 : 
                                        P2__reg2   =(  P2__r  +  P2__m  )%1073741824;
                                    3 : 
                                        P2__reg3   =(  P2__r  +  P2__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__m   =  P2__tail  ;
                                    1 :
                                       begin  
                                          P2__m   =  P2__datai  ; 
                                          P2__addr   <=  P2__tail  ; 
                                          P2__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg1  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P2__addr   <=(  P2__tail  +  P2__reg2  )%1048576; 
                                          P2__rd   <=1'b1; 
                                          P2__m   =  P2__datai  ;
                                       end 
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =(  P2__r  -  P2__m  )%1073741824;
                                    1 : 
                                        P2__reg1   =(  P2__r  -  P2__m  )%1073741824;
                                    2 : 
                                        P2__reg2   =(  P2__r  -  P2__m  )%1073741824;
                                    3 : 
                                        P2__reg3   =(  P2__r  -  P2__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case (  P2__mf  )
                                    0 : 
                                        P2__t   =  P2__r  /2;
                                    1 :
                                       begin  
                                          P2__t   =  P2__r  /2;
                                         if (  P2__B  ==1'b1) 
                                             P2__t   =  P2__t  %536870912;
                                       end 
                                    2 : 
                                        P2__t   =(  P2__r  %536870912)*2;
                                    3 :
                                       begin  
                                          P2__t   =(  P2__r  %536870912)*2;
                                         if (  P2__t  >1073741823) 
                                             P2__B   =1'b1;
                                          else  
                                             P2__B   =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case (  P2__d  )
                                    0 : 
                                        P2__reg0   =  P2__t  ;
                                    1 : 
                                        P2__reg1   =  P2__t  ;
                                    2 : 
                                        P2__reg2   =  P2__t  ;
                                    3 : 
                                        P2__reg3   =  P2__t  ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if (  P2__df  ==7)
                              begin 
                                case (  P2__mf  )
                                 0 : 
                                     P2__m   =  P2__tail  ;
                                 1 : 
                                     P2__m   =  P2__tail  ;
                                 2 : 
                                     P2__m   =(  P2__reg1  %1048576)+(  P2__tail  %1048576);
                                 3 : 
                                     P2__m   =(  P2__reg2  %1048576)+(  P2__tail  %1048576);
                                endcase  
                                 P2__addr   <=  P2__m  %1048576; 
                                 P2__wr   <=1'b1; 
                                 P2__datao   <=  P2__r  ;
                              end 
                    endcase  
                     P2__state   =  0  ;
                  end 
              endcase 
            end 
       end
 
assign P2__clock = clock;
assign P2__reset = reset;
assign addr_2 = P2__addr;
assign P2__datai = datai_2;
assign datao_2 = P2__datao;
assign rd_2 = P2__rd;
assign wr_2 = P2__wr;
 
  
wire  P3__clock;
wire  P3__reset;
reg [19:0] P3__addr;
wire [31:0] P3__datai;
integer P3__datao;
reg  P3__rd;
reg  P3__wr;
integer  P3__reg0  ;
integer  P3__reg1  ;
integer  P3__reg2  ;
integer  P3__reg3  ;
reg  P3__B  ;
reg[19:0]  P3__MAR  ;
integer  P3__MBR  ;
reg[1:0]  P3__mf  ;
reg[2:0]  P3__df  ;
reg[0:0]  P3__cf  ;
reg[3:0]  P3__ff  ;
reg[19:0]  P3__tail  ;
integer  P3__IR  ;
reg[0:0]  P3__state  ;
integer  P3__r  ;
integer  P3__m  ;
integer  P3__t  ;
integer  P3__d  ;
integer  P3__temp  ;
reg[1:0]  P3__s  ;
  always @(  posedge    P3__clock          or  posedge   P3__reset  )
       begin :  P3__xhdl2  
       
         if (  P3__reset  ==1'b1)
            begin  
               P3__MAR   =0; 
               P3__MBR   =0; 
               P3__IR   =0; 
               P3__d   =0; 
               P3__r   =0; 
               P3__m   =0; 
               P3__s   =0; 
               P3__temp   =0; 
               P3__mf   =0; 
               P3__df   =0; 
               P3__ff   =0; 
               P3__cf   =0; 
               P3__tail   =0; 
               P3__B   =1'b0; 
               P3__reg0   =0; 
               P3__reg1   =0; 
               P3__reg2   =0; 
               P3__reg3   =0; 
               P3__addr   <=0; 
               P3__rd   <=1'b0; 
               P3__wr   <=1'b0; 
               P3__datao   <=0; 
               P3__state   =  0  ;
            end 
          else 
            begin  
               P3__rd   <=1'b0; 
               P3__wr   <=1'b0;
              case (  P3__state  ) 
                0   :
                  begin  
                     P3__MAR   =  P3__reg3  %1048576; 
                     P3__addr   <=  P3__MAR  ; 
                     P3__rd   <=1'b1; 
                     P3__MBR   =  P3__datai  ; 
                     P3__IR   =  P3__MBR  ; 
                     P3__state   =  1  ;
                  end  
                1   :
                  begin 
                    if (  P3__IR  <0) 
                        P3__IR   =-  P3__IR  ; 
                     P3__mf   =(  P3__IR  /2**27)%4; 
                     P3__df   =(  P3__IR  /2**24)%2**3; 
                     P3__ff   =(  P3__IR  /524288)%2**4; 
                     P3__cf   =(  P3__IR  /2**23)%2; 
                     P3__tail   =  P3__IR  %1048576; 
                     P3__reg3   =((  P3__reg3  %536870912)-8); 
                     P3__s   =(  P3__IR  /536870912)%4;
                    case (  P3__s  )
                     0 : 
                         P3__r   =  P3__reg0  ;
                     1 : 
                         P3__r   =  P3__reg1  ;
                     2 : 
                         P3__r   =  P3__reg2  ;
                     3 : 
                         P3__r   =  P3__reg3  ;
                    endcase 
                    case (  P3__cf  )
                     1 :
                        begin 
                          case (  P3__mf  )
                           0 : 
                               P3__m   =  P3__tail  ;
                           1 :
                              begin  
                                 P3__m   =  P3__datai  ; 
                                 P3__addr   <=  P3__tail  ; 
                                 P3__rd   <=1'b1;
                              end 
                           2 :
                              begin  
                                 P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                 P3__rd   <=1'b1; 
                                 P3__m   =  P3__datai  ;
                              end 
                           3 :
                              begin  
                                 P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                 P3__rd   <=1'b1; 
                                 P3__m   =  P3__datai  ;
                              end 
                          endcase 
                          case (  P3__ff  )
                           0 :
                              if (  P3__r  <  P3__m  ) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           1 :
                              if (~(  P3__r  <  P3__m  )) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           2 :
                              if (  P3__r  ==  P3__m  ) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           3 :
                              if (~(  P3__r  ==  P3__m  )) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           4 :
                              if (~(  P3__r  >  P3__m  )) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           5 :
                              if (  P3__r  >  P3__m  ) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           6 :
                              begin 
                                if (  P3__r  >1073741823) 
                                    P3__r   =  P3__r  -1073741824;
                                if (  P3__r  <  P3__m  ) 
                                    P3__B   =1'b1;
                                 else  
                                    P3__B   =1'b0;
                              end 
                           7 :
                              begin 
                                if (  P3__r  >1073741823) 
                                    P3__r   =  P3__r  -1073741824;
                                if (~(  P3__r  <  P3__m  )) 
                                    P3__B   =1'b1;
                                 else  
                                    P3__B   =1'b0;
                              end 
                           8 :
                              if ((  P3__r  <  P3__m  )|(  P3__B  ==1'b1)) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           9 :
                              if ((~(  P3__r  <  P3__m  ))|(  P3__B  ==1'b1)) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           10 :
                              if ((  P3__r  ==  P3__m  )|(  P3__B  ==1'b1)) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           11 :
                              if ((~(  P3__r  ==  P3__m  ))|(  P3__B  ==1'b1)) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           12 :
                              if ((~(  P3__r  >  P3__m  ))|(  P3__B  ==1'b1)) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           13 :
                              if ((  P3__r  >  P3__m  )|(  P3__B  ==1'b1)) 
                                  P3__B   =1'b1;
                               else  
                                  P3__B   =1'b0;
                           14 :
                              begin 
                                if (  P3__r  >1073741823) 
                                    P3__r   =  P3__r  -1073741824;
                                if ((  P3__r  <  P3__m  )|(  P3__B  ==1'b1)) 
                                    P3__B   =1'b1;
                                 else  
                                    P3__B   =1'b0;
                              end 
                           15 :
                              begin 
                                if (  P3__r  >1073741823) 
                                    P3__r   =  P3__r  -1073741824;
                                if ((~(  P3__r  <  P3__m  ))|(  P3__B  ==1'b1)) 
                                    P3__B   =1'b1;
                                 else  
                                    P3__B   =1'b0;
                              end 
                          endcase 
                        end 
                     0 :
                        if (~(  P3__df  ==7))
                           begin 
                             if (  P3__df  ==5)
                                begin 
                                  if ((~(  P3__B  ))==1'b1) 
                                      P3__d   =3;
                                end 
                              else 
                                if (  P3__df  ==4)
                                   begin 
                                     if (  P3__B  ==1'b1) 
                                         P3__d   =3;
                                   end 
                                 else 
                                   if (  P3__df  ==3) 
                                       P3__d   =3;
                                    else 
                                      if (  P3__df  ==2) 
                                          P3__d   =2;
                                       else 
                                         if (  P3__df  ==1) 
                                             P3__d   =1;
                                          else 
                                            if (  P3__df  ==0) 
                                                P3__d   =0;
                             case (  P3__ff  )
                              0 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase  
                                    P3__t   =0;
                                   case (  P3__d  )
                                    0 : 
                                        P3__reg0   =  P3__t  +  P3__m  ;
                                    1 : 
                                        P3__reg1   =  P3__t  +  P3__m  ;
                                    2 : 
                                        P3__reg2   =  P3__t  +  P3__m  ;
                                    3 : 
                                        P3__reg3   =  P3__t  +  P3__m  ;
                                    default :;
                                   endcase 
                                 end 
                              1 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase  
                                    P3__reg2   =  P3__reg3  ; 
                                    P3__reg3   =  P3__m  ;
                                 end 
                              2 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase 
                                   case (  P3__d  )
                                    0 : 
                                        P3__reg0   =  P3__m  ;
                                    1 : 
                                        P3__reg1   =  P3__m  ;
                                    2 : 
                                        P3__reg2   =  P3__m  ;
                                    3 : 
                                        P3__reg3   =  P3__m  ;
                                    default :;
                                   endcase 
                                 end 
                              3 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase 
                                   case (  P3__d  )
                                    0 : 
                                        P3__reg0   =  P3__m  ;
                                    1 : 
                                        P3__reg1   =  P3__m  ;
                                    2 : 
                                        P3__reg2   =  P3__m  ;
                                    3 : 
                                        P3__reg3   =  P3__m  ;
                                    default :;
                                   endcase 
                                 end 
                              4 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase 
                                   case (  P3__d  )
                                    0 : 
                                        P3__reg0   =(  P3__r  -  P3__m  )%1073741824;
                                    1 : 
                                        P3__reg1   =(  P3__r  -  P3__m  )%1073741824;
                                    2 : 
                                        P3__reg2   =(  P3__r  -  P3__m  )%1073741824;
                                    3 : 
                                        P3__reg3   =(  P3__r  -  P3__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              5 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase 
                                   case (  P3__d  )
                                    0 : 
                                        P3__reg0   =(  P3__r  -  P3__m  )%1073741824;
                                    1 : 
                                        P3__reg1   =(  P3__r  -  P3__m  )%1073741824;
                                    2 : 
                                        P3__reg2   =(  P3__r  -  P3__m  )%1073741824;
                                    3 : 
                                        P3__reg3   =(  P3__r  -  P3__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              6 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase 
                                   case (  P3__d  )
                                    0 : 
                                        P3__reg0   =(  P3__r  +  P3__m  )%1073741824;
                                    1 : 
                                        P3__reg1   =(  P3__r  +  P3__m  )%1073741824;
                                    2 : 
                                        P3__reg2   =(  P3__r  +  P3__m  )%1073741824;
                                    3 : 
                                        P3__reg3   =(  P3__r  +  P3__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              7 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase 
                                   case (  P3__d  )
                                    0 : 
                                        P3__reg0   =(  P3__r  +  P3__m  )%1073741824;
                                    1 : 
                                        P3__reg1   =(  P3__r  +  P3__m  )%1073741824;
                                    2 : 
                                        P3__reg2   =(  P3__r  +  P3__m  )%1073741824;
                                    3 : 
                                        P3__reg3   =(  P3__r  +  P3__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              8 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase 
                                   case (  P3__d  )
                                    0 : 
                                        P3__reg0   =(  P3__r  -  P3__m  )%1073741824;
                                    1 : 
                                        P3__reg1   =(  P3__r  -  P3__m  )%1073741824;
                                    2 : 
                                        P3__reg2   =(  P3__r  -  P3__m  )%1073741824;
                                    3 : 
                                        P3__reg3   =(  P3__r  -  P3__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              9 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase 
                                   case (  P3__d  )
                                    0 : 
                                        P3__reg0   =(  P3__r  +  P3__m  )%1073741824;
                                    1 : 
                                        P3__reg1   =(  P3__r  +  P3__m  )%1073741824;
                                    2 : 
                                        P3__reg2   =(  P3__r  +  P3__m  )%1073741824;
                                    3 : 
                                        P3__reg3   =(  P3__r  +  P3__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              10 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase 
                                   case (  P3__d  )
                                    0 : 
                                        P3__reg0   =(  P3__r  -  P3__m  )%1073741824;
                                    2 : 
                                        P3__reg1   =(  P3__r  -  P3__m  )%1073741824;
                                    1 : 
                                        P3__reg2   =(  P3__r  -  P3__m  )%1073741824;
                                    3 : 
                                        P3__reg3   =(  P3__r  -  P3__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              11 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__m   =  P3__tail  ;
                                    1 :
                                       begin  
                                          P3__m   =  P3__datai  ; 
                                          P3__addr   <=  P3__tail  ; 
                                          P3__rd   <=1'b1;
                                       end 
                                    2 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg1  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                    3 :
                                       begin  
                                          P3__addr   <=(  P3__tail  -  P3__reg2  )%1048576; 
                                          P3__rd   <=1'b1; 
                                          P3__m   =  P3__datai  ;
                                       end 
                                   endcase 
                                   case (  P3__d  )
                                    3 : 
                                        P3__reg0   =(  P3__r  +  P3__m  )%1073741824;
                                    1 : 
                                        P3__reg1   =(  P3__r  +  P3__m  )%1073741824;
                                    2 : 
                                        P3__reg2   =(  P3__r  +  P3__m  )%1073741824;
                                    0 : 
                                        P3__reg3   =(  P3__r  +  P3__m  )%1073741824;
                                    default :;
                                   endcase 
                                 end 
                              12 :
                                 begin 
                                   case (  P3__mf  )
                                    0 : 
                                        P3__t   =  P3__r  /2;
                                    3 :
                                       begin  
                                          P3__t   =  P3__r  /2;
                                         if (  P3__B  ==1'b1) 
                                             P3__t   =  P3__t  %536870912;
                                       end 
                                    1 : 
                                        P3__t   =(  P3__r  %536870912)*2;
                                    2 :
                                       begin  
                                          P3__t   =(  P3__r  %536870912)*2;
                                         if (  P3__t  >1073741823) 
                                             P3__B   =1'b1;
                                          else  
                                             P3__B   =1'b0;
                                       end 
                                    default :;
                                   endcase 
                                   case (  P3__d  )
                                    3 : 
                                        P3__reg0   =  P3__t  ;
                                    2 : 
                                        P3__reg1   =  P3__t  ;
                                    1 : 
                                        P3__reg2   =  P3__t  ;
                                    0 : 
                                        P3__reg3   =  P3__t  ;
                                    default :;
                                   endcase 
                                 end 
                              13 ,14,15:;
                             endcase 
                           end 
                         else 
                           if (  P3__df  ==7)
                              begin 
                                case (  P3__mf  )
                                 3 : 
                                     P3__m   =  P3__tail  ;
                                 2 : 
                                     P3__m   =  P3__tail  ;
                                 0 : 
                                     P3__m   =(  P3__reg1  %1048576)-(  P3__tail  %1048576);
                                 1 : 
                                     P3__m   =(  P3__reg2  %1048576)-(  P3__tail  %1048576);
                                endcase  
                                 P3__addr   <=  P3__m  %1048576; 
                                 P3__wr   <=1'b1; 
                                 P3__datao   <=  P3__r  ;
                              end 
                    endcase  
                     P3__state   =  0  ;
                  end 
              endcase 
            end 
       end
 
assign P3__clock = clock;
assign P3__reset = reset;
assign addr_3 = P3__addr;
assign P3__datai = datai_3;
assign datao_3 = P3__datao;
assign rd_3 = P3__rd;
assign wr_3 = P3__wr;
 
  always @(             addr_1 or  addr_2 or  addr_3 or  rd_1 or  rd_2 or  rd_3 or  wr_1 or  wr_2 or  wr_3 or  datao_1 or  datao_2 or  datao_3 or  si)
       begin 
         so <=(addr_1+addr_2-addr_3)%1048576;
         rd <=(rd_1^(~rd_2))|rd_3;
         wr <=(wr_1^(~wr_2))|wr_3;
         if ((addr_1<524288&addr_2<524288&addr_3>524287&rd_1==1'b0)|(addr_1>524287&addr_2>524287&addr_3<524288&rd_2==1'b0))
            begin 
              datai_1 <=datao_2+si;
              datai_2 <=datao_1;
              datai_3 <=datao_1-datao_2;
            end 
          else 
            begin 
              datai_1 <=datao_2;
              datai_2 <=datao_1+si;
              datai_3 <=si;
            end 
       end
  
endmodule