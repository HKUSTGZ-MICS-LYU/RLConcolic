module b17 #(
parameter P1__Pending=1'b1,
parameter P1__NotPending=1'b0,
parameter P1__WidthByte=0,
parameter P1__WidthWord=1,
parameter P1__WidthDword=2,
parameter P1__StateInit=0,
parameter P1__StateTi=1,
parameter P1__StateT1=2,
parameter P1__StateT2=3,
parameter P1__StateT1P=4,
parameter P1__StateTh=5,
parameter P1__StateT2P=6,
parameter P1__StateT2I=7,
parameter P1__REP=8'hF3,
parameter P1__REPNE=8'hF2,
parameter P1__LOCK=8'hF0,
parameter P1__CSsop=8'h2E,
parameter P1__SSsop=8'h36,
parameter P1__DSsop=8'h3E,
parameter P1__ESsop=8'h26,
parameter P1__FSsop=8'h64,
parameter P1__GSsop=8'h65,
parameter P1__OPsop=8'h66,
parameter P1__ADsop=8'h67,
parameter P1__MOV_al_b=8'hB0,
parameter P1__MOV_eax_dw=8'hB8,
parameter P1__MOV_ebx_dw=8'hBB,
parameter P1__MOV_ebx_eax=8'h89,
parameter P1__MOV_eax_ebx=8'h8B,
parameter P1__IN_al=8'hE4,
parameter P1__OUT_al=8'hE6,
parameter P1__ADD_al_b=8'h04,
parameter P1__ADD_ax_w=8'h05,
parameter P1__ROL_eax_b=8'hD1,
parameter P1__ROL_al_1=8'hD0,
parameter P1__ROL_al_n=8'hC0,
parameter P1__INC_eax=8'h40,
parameter P1__INC_ebx=8'h43,
parameter P1__JMP_rel_short=8'hEB,
parameter P1__JMP_rel_near=8'hE9,
parameter P1__JMP_intseg_immed=8'hEA,
parameter P1__HLT=8'hF4,
parameter P1__WAITx=8'h9B,
parameter P1__NOP=8'h90,
parameter P1__InstQueueLimit=15,
parameter P1__Si=0,
parameter P1__S1=1,
parameter P1__S2=2,
parameter P1__S3=3,
parameter P1__S4=4,
parameter P1__S5=5,
parameter P1__S6=6,
parameter P1__S7=7,
parameter P1__S8=8,
parameter P1__S9=9,
parameter P2__Pending=1'b1,
parameter P2__NotPending=1'b0,
parameter P2__WidthByte=0,
parameter P2__WidthWord=1,
parameter P2__WidthDword=2,
parameter P2__StateInit=0,
parameter P2__StateTi=1,
parameter P2__StateT1=2,
parameter P2__StateT2=3,
parameter P2__StateT1P=4,
parameter P2__StateTh=5,
parameter P2__StateT2P=6,
parameter P2__StateT2I=7,
parameter P2__REP=8'hF3,
parameter P2__REPNE=8'hF2,
parameter P2__LOCK=8'hF0,
parameter P2__CSsop=8'h2E,
parameter P2__SSsop=8'h36,
parameter P2__DSsop=8'h3E,
parameter P2__ESsop=8'h26,
parameter P2__FSsop=8'h64,
parameter P2__GSsop=8'h65,
parameter P2__OPsop=8'h66,
parameter P2__ADsop=8'h67,
parameter P2__MOV_al_b=8'hB0,
parameter P2__MOV_eax_dw=8'hB8,
parameter P2__MOV_ebx_dw=8'hBB,
parameter P2__MOV_ebx_eax=8'h89,
parameter P2__MOV_eax_ebx=8'h8B,
parameter P2__IN_al=8'hE4,
parameter P2__OUT_al=8'hE6,
parameter P2__ADD_al_b=8'h04,
parameter P2__ADD_ax_w=8'h05,
parameter P2__ROL_eax_b=8'hD1,
parameter P2__ROL_al_1=8'hD0,
parameter P2__ROL_al_n=8'hC0,
parameter P2__INC_eax=8'h40,
parameter P2__INC_ebx=8'h43,
parameter P2__JMP_rel_short=8'hEB,
parameter P2__JMP_rel_near=8'hE9,
parameter P2__JMP_intseg_immed=8'hEA,
parameter P2__HLT=8'hF4,
parameter P2__WAITx=8'h9B,
parameter P2__NOP=8'h90,
parameter P2__InstQueueLimit=15,
parameter P2__Si=0,
parameter P2__S1=1,
parameter P2__S2=2,
parameter P2__S3=3,
parameter P2__S4=4,
parameter P2__S5=5,
parameter P2__S6=6,
parameter P2__S7=7,
parameter P2__S8=8,
parameter P2__S9=9,
parameter P3__Pending=1'b1,
parameter P3__NotPending=1'b0,
parameter P3__WidthByte=0,
parameter P3__WidthWord=1,
parameter P3__WidthDword=2,
parameter P3__StateInit=0,
parameter P3__StateTi=1,
parameter P3__StateT1=2,
parameter P3__StateT2=3,
parameter P3__StateT1P=4,
parameter P3__StateTh=5,
parameter P3__StateT2P=6,
parameter P3__StateT2I=7,
parameter P3__REP=8'hF3,
parameter P3__REPNE=8'hF2,
parameter P3__LOCK=8'hF0,
parameter P3__CSsop=8'h2E,
parameter P3__SSsop=8'h36,
parameter P3__DSsop=8'h3E,
parameter P3__ESsop=8'h26,
parameter P3__FSsop=8'h64,
parameter P3__GSsop=8'h65,
parameter P3__OPsop=8'h66,
parameter P3__ADsop=8'h67,
parameter P3__MOV_al_b=8'hB0,
parameter P3__MOV_eax_dw=8'hB8,
parameter P3__MOV_ebx_dw=8'hBB,
parameter P3__MOV_ebx_eax=8'h89,
parameter P3__MOV_eax_ebx=8'h8B,
parameter P3__IN_al=8'hE4,
parameter P3__OUT_al=8'hE6,
parameter P3__ADD_al_b=8'h04,
parameter P3__ADD_ax_w=8'h05,
parameter P3__ROL_eax_b=8'hD1,
parameter P3__ROL_al_1=8'hD0,
parameter P3__ROL_al_n=8'hC0,
parameter P3__INC_eax=8'h40,
parameter P3__INC_ebx=8'h43,
parameter P3__JMP_rel_short=8'hEB,
parameter P3__JMP_rel_near=8'hE9,
parameter P3__JMP_intseg_immed=8'hEA,
parameter P3__HLT=8'hF4,
parameter P3__WAITx=8'h9B,
parameter P3__NOP=8'h90,
parameter P3__InstQueueLimit=15,
parameter P3__Si=0,
parameter P3__S1=1,
parameter P3__S2=2,
parameter P3__S3=3,
parameter P3__S4=4,
parameter P3__S5=5,
parameter P3__S6=6,
parameter P3__S7=7,
parameter P3__S8=8,
parameter P3__S9=9) (
  input clock,
  input reset,
  input [31:0] datai,
  output reg signed [31:0] datao,
  input hold,
  input na,
  input bs16,
  output reg  [29:0] address1,
  output reg  [29:0] address2,
  output reg  wr,
  output reg  dc,
  output reg  mio,
  output reg  ast1,
  output reg  ast2,
  input ready1,
  input ready2) ; 
   integer buf1 ;  
   integer buf2 ;  
   wire [3:0] be1 ;  
   wire [3:0] be2 ;  
   wire [3:0] be3 ;  
   wire [29:0] addr1 ;  
   wire [29:0] addr2 ;  
   wire [29:0] addr3 ;  
   wire wr1 ;  
   wire wr2 ;  
   wire wr3 ;  
   wire dc1 ;  
   wire dc2 ;  
   wire dc3 ;  
   wire mio1 ;  
   wire mio2 ;  
   wire mio3 ;  
   wire ads1 ;  
   wire ads2 ;  
   wire ads3 ;  
   integer di1 ;  
   integer di2 ;  
   integer di3 ;  
   wire [31:0] do1 ;  
   wire [31:0] do2 ;  
   wire [31:0] do3 ;  
   reg rdy1 ;  
   reg rdy2 ;  
   reg rdy3 ;  
   reg ready11 ;  
   reg ready12 ;  
   reg ready21 ;  
   reg ready22 ;  
  always @(  posedge clock or  posedge reset)
       if (reset==1'b1)
          begin 
            buf1 <=0;
            ready11 <=1'b0;
            ready12 <=1'b0;
          end 
        else 
          begin 
            if (addr1>2**29&ads1==1'b0&mio1==1'b1&dc1==1'b0&wr1==1'b1&be1==4'b0000)
               begin 
                 buf1 <=do1;
                 ready11 <=1'b0;
                 ready12 <=1'b1;
               end 
             else 
               if (addr2>2**29&ads2==1'b0&mio2==1'b1&dc2==1'b0&wr2==1'b1&be2==4'b0000)
                  begin 
                    buf1 <=do2;
                    ready11 <=1'b1;
                    ready12 <=1'b0;
                  end 
                else 
                  begin 
                    ready11 <=1'b1;
                    ready12 <=1'b1;
                  end 
          end
  
  always @(  posedge clock or  posedge reset)
       if (reset==1'b1)
          begin 
            buf2 <=0;
            ready21 <=1'b0;
            ready22 <=1'b0;
          end 
        else 
          begin 
            if (addr2<2**29&ads2==1'b0&mio2==1'b1&dc2==1'b0&wr2==1'b1&be2==4'b0000)
               begin 
                 buf2 <=do2;
                 ready21 <=1'b0;
                 ready22 <=1'b1;
               end 
             else 
               if (ads3==1'b0&mio3==1'b1&dc3==1'b0&wr3==1'b0&be3==4'b0000)
                  begin 
                    ready21 <=1'b1;
                    ready22 <=1'b0;
                  end 
                else 
                  begin 
                    ready21 <=1'b1;
                    ready22 <=1'b1;
                  end 
          end
  
  always @(   addr1 or  buf1 or  datai)
       if (addr1>2**29)
          di1 <=buf1;
        else 
          di1 <=datai;
 
  always @(   addr2 or  buf1 or  buf2)
       if (addr2>2**29)
          di2 <=buf1;
        else 
          di2 <=buf2;
 
  always @(     addr2 or  addr3 or  do1 or  do2 or  do3)
       if ((do1<2**30)&(do2<2**30)&(do3<2**30))
          address2 <=addr3;
        else 
          address2 <=addr2;
 
  always @(              buf2 or  do3 or  addr1 or  wr3 or  dc3 or  mio3 or  ads1 or  ads3 or  ready1 or  ready2 or  ready11 or  ready12 or  ready21 or  ready22)
       begin 
         di3 <=buf2;
         datao <=do3;
         address1 <=addr1;
         wr <=wr3;
         dc <=dc3;
         mio <=mio3;
         ast1 <=ads1;
         ast2 <=ads3;
         rdy1 <=ready11&ready1;
         rdy2 <=ready12&ready21;
         rdy3 <=ready22&ready2;
       end
  
  
reg [3:0] P1__BE_n;
reg [29:0] P1__Address;
reg  P1__W_R_n;
reg  P1__D_C_n;
reg  P1__M_IO_n;
reg  P1__ADS_n;
wire [31:0] P1__Datai;
integer P1__Datao;
wire  P1__CLOCK;
wire  P1__NA_n;
wire  P1__BS16_n;
wire  P1__READY_n;
wire  P1__HOLD;
wire  P1__RESET;
reg [3:0] P2__BE_n;
reg [29:0] P2__Address;
reg  P2__W_R_n;
reg  P2__D_C_n;
reg  P2__M_IO_n;
reg  P2__ADS_n;
wire [31:0] P2__Datai;
integer P2__Datao;
wire  P2__CLOCK;
wire  P2__NA_n;
wire  P2__BS16_n;
wire  P2__READY_n;
wire  P2__HOLD;
wire  P2__RESET;
reg [3:0] P3__BE_n;
reg [29:0] P3__Address;
reg  P3__W_R_n;
reg  P3__D_C_n;
reg  P3__M_IO_n;
reg  P3__ADS_n;
wire [31:0] P3__Datai;
integer P3__Datao;
wire  P3__CLOCK;
wire  P3__NA_n;
wire  P3__BS16_n;
wire  P3__READY_n;
wire  P3__HOLD;
wire  P3__RESET;
 
reg  P1__StateNA  ; 
reg  P1__StateBS16  ; 
reg  P1__RequestPending  ; 
reg  P1__NonAligned  ; 
reg  P1__ReadRequest  ; 
reg  P1__MemoryFetch  ; 
reg  P1__CodeFetch  ; 
reg[3:0]  P1__ByteEnable  ; 
integer  P1__DataWidth  ; 
reg[2:0]  P1__State  ; 
integer  P1__EAX  ; 
integer  P1__EBX  ; 
integer  P1__rEIP  ; 
  always @(  posedge    P1__CLOCK          or  posedge   P1__RESET  )
       begin :  P1__P0  
         if (  P1__RESET  ==1'b1)
            begin  
               P1__BE_n   <=4'b0000; 
               P1__Address   <=0; 
               P1__W_R_n   <=1'b0; 
               P1__D_C_n   <=1'b0; 
               P1__M_IO_n   <=1'b0; 
               P1__ADS_n   <=1'b0; 
               P1__State   <=  P1__StateInit  ; 
               P1__StateNA   <=1'b0; 
               P1__StateBS16   <=1'b0; 
               P1__DataWidth   <=0;
            end 
          else 
            case (  P1__State  ) 
              P1__StateInit   :
                begin  
                   P1__D_C_n   <=1'b1; 
                   P1__ADS_n   <=1'b1; 
                   P1__State   <=  P1__StateTi  ; 
                   P1__StateNA   <=1'b1; 
                   P1__StateBS16   <=1'b1; 
                   P1__DataWidth   <=2; 
                   P1__State   <=  P1__StateTi  ;
                end  
              P1__StateTi   :
                if (  P1__RequestPending  ==  P1__Pending  ) 
                    P1__State   <=  P1__StateT1  ;
                 else 
                   if (  P1__HOLD  ==1'b1) 
                       P1__State   <=  P1__StateTh  ;
                    else  
                       P1__State   <=  P1__StateTi  ; 
              P1__StateT1   :
                begin  
                   P1__Address   <=  P1__rEIP  /4%2**30; 
                   P1__BE_n   <=  P1__ByteEnable  ; 
                   P1__M_IO_n   <=  P1__MemoryFetch  ;
                  if (  P1__ReadRequest  ==  P1__Pending  ) 
                      P1__W_R_n   <=1'b0;
                   else  
                      P1__W_R_n   <=1'b1;
                  if (  P1__CodeFetch  ==  P1__Pending  ) 
                      P1__D_C_n   <=1'b0;
                   else  
                      P1__D_C_n   <=1'b1; 
                   P1__ADS_n   <=1'b0; 
                   P1__State   <=  P1__StateT2  ;
                end  
              P1__StateT2   :
                begin 
                  if (  P1__READY_n  ==1'b0&  P1__HOLD  ==1'b0&  P1__RequestPending  ==  P1__Pending  ) 
                      P1__State   <=  P1__StateT1  ;
                   else 
                     if (  P1__READY_n  ==1'b1&  P1__NA_n  ==1'b1);
                      else 
                        if ((  P1__RequestPending  ==  P1__Pending  |  P1__HOLD  ==1'b1)&(  P1__READY_n  ==1'b1&  P1__NA_n  ==1'b0)) 
                            P1__State   <=  P1__StateT2I  ;
                         else 
                           if (  P1__RequestPending  ==  P1__Pending  &  P1__HOLD  ==1'b0&  P1__READY_n  ==1'b1&  P1__NA_n  ==1'b0) 
                               P1__State   <=  P1__StateT2P  ;
                            else 
                              if (  P1__RequestPending  ==  P1__NotPending  &  P1__HOLD  ==1'b0&  P1__READY_n  ==1'b0) 
                                  P1__State   <=  P1__StateTi  ;
                               else 
                                 if (  P1__HOLD  ==1'b1&  P1__READY_n  ==1'b1) 
                                     P1__State   <=  P1__StateTh  ;
                                  else  
                                     P1__State   <=  P1__StateT2  ; 
                   P1__StateBS16   <=  P1__BS16_n  ;
                  if (  P1__BS16_n  ==1'b0) 
                      P1__DataWidth   <=  P1__WidthWord  ;
                   else  
                      P1__DataWidth   <=  P1__WidthDword  ; 
                   P1__StateNA   <=  P1__NA_n  ; 
                   P1__ADS_n   <=1'b1;
                end  
              P1__StateT1P   :
                begin 
                  if (  P1__NA_n  ==1'b0&  P1__HOLD  ==1'b0&  P1__RequestPending  ==  P1__Pending  ) 
                      P1__State   <=  P1__StateT2P  ;
                   else 
                     if (  P1__NA_n  ==1'b0&(  P1__HOLD  ==1'b1|  P1__RequestPending  ==  P1__NotPending  )) 
                         P1__State   <=  P1__StateT2I  ;
                      else 
                        if (  P1__NA_n  ==1'b1) 
                            P1__State   <=  P1__StateT2  ;
                         else  
                            P1__State   <=  P1__StateT1P  ; 
                   P1__StateBS16   <=  P1__BS16_n  ;
                  if (  P1__BS16_n  ==1'b0) 
                      P1__DataWidth   <=  P1__WidthWord  ;
                   else  
                      P1__DataWidth   <=  P1__WidthDword  ; 
                   P1__StateNA   <=  P1__NA_n  ; 
                   P1__ADS_n   <=1'b1;
                end  
              P1__StateTh   :
                if (  P1__HOLD  ==1'b0&  P1__RequestPending  ==  P1__Pending  ) 
                    P1__State   <=  P1__StateT1  ;
                 else 
                   if (  P1__HOLD  ==1'b0&  P1__RequestPending  ==  P1__NotPending  ) 
                       P1__State   <=  P1__StateTi  ;
                    else  
                       P1__State   <=  P1__StateTh  ; 
              P1__StateT2P   :
                begin  
                   P1__Address   <=  P1__rEIP  /2%2**30; 
                   P1__BE_n   <=  P1__ByteEnable  ; 
                   P1__M_IO_n   <=  P1__MemoryFetch  ;
                  if (  P1__ReadRequest  ==  P1__Pending  ) 
                      P1__W_R_n   <=1'b0;
                   else  
                      P1__W_R_n   <=1'b1;
                  if (  P1__CodeFetch  ==  P1__Pending  ) 
                      P1__D_C_n   <=1'b0;
                   else  
                      P1__D_C_n   <=1'b1; 
                   P1__ADS_n   <=1'b0;
                  if (  P1__READY_n  ==1'b0) 
                      P1__State   <=  P1__StateT1P  ;
                   else  
                      P1__State   <=  P1__StateT2P  ;
                end  
              P1__StateT2I   :
                if (  P1__READY_n  ==1'b1&  P1__RequestPending  ==  P1__Pending  &  P1__HOLD  ==1'b0) 
                    P1__State   <=  P1__StateT2P  ;
                 else 
                   if (  P1__READY_n  ==1'b0&  P1__HOLD  ==1'b1) 
                       P1__State   <=  P1__StateTh  ;
                    else 
                      if (  P1__READY_n  ==1'b0&  P1__HOLD  ==1'b0&  P1__RequestPending  ==  P1__Pending  ) 
                          P1__State   <=  P1__StateT1  ;
                       else 
                         if (  P1__READY_n  ==1'b0&  P1__HOLD  ==1'b0&  P1__RequestPending  ==  P1__NotPending  ) 
                             P1__State   <=  P1__StateTi  ;
                          else  
                             P1__State   <=  P1__StateT2I  ;
            endcase 
       end
  
   reg[7:0]  P1__InstQueue  [15:0]; 
   reg[4:0]  P1__InstQueueRd_Addr  ; 
   reg[4:0]  P1__InstQueueWr_Addr  ; 
   integer  P1__InstAddrPointer  ; 
   integer  P1__PhyAddrPointer  ; 
   reg  P1__Extended  ; 
   reg  P1__More  ; 
   reg  P1__Flush  ; 
   reg[15:0]  P1__lWord  ; 
   reg[14:0]  P1__uWord  ; 
   integer  P1__fWord  ; 
   reg[3:0]  P1__State2  ; 
  always @(  posedge    P1__CLOCK          or  posedge   P1__RESET  )
       begin :  P1__P1  
         if (  P1__RESET  ==1'b1)
            begin  
               P1__State2   =  P1__Si  ; 
               P1__InstQueue[0]   = 0;
               P1__InstQueue[1]   = 0;
               P1__InstQueue[2]   = 0;
               P1__InstQueue[3]   = 0;
               P1__InstQueue[4]   = 0;
               P1__InstQueue[5]   = 0;
               P1__InstQueue[6]   = 0;
               P1__InstQueue[7]   = 0;
               P1__InstQueue[8]   = 0;
               P1__InstQueue[9]   = 0;
               P1__InstQueue[10]   = 0;
               P1__InstQueue[11]   = 0;
               P1__InstQueue[12]   = 0;
               P1__InstQueue[13]   = 0;
               P1__InstQueue[14]   = 0;
               P1__InstQueue[15]   = 0;

            
               P1__InstQueueRd_Addr   =0; 
               P1__InstQueueWr_Addr   =0; 
               P1__InstAddrPointer   =0; 
               P1__PhyAddrPointer   =0; 
               P1__Extended   =1'b0; 
               P1__More   =1'b0; 
               P1__Flush   =1'b0; 
               P1__lWord   =0; 
               P1__uWord   =0; 
               P1__fWord   =0; 
               P1__CodeFetch   <=1'b0; 
               P1__Datao   <=0; 
               P1__EAX   <=0; 
               P1__EBX   <=0; 
               P1__rEIP   <=0; 
               P1__ReadRequest   <=1'b0; 
               P1__MemoryFetch   <=1'b0; 
               P1__RequestPending   <=1'b0;
            end 
          else 
            case (  P1__State2  ) 
              P1__Si   :
                begin  
                   P1__PhyAddrPointer   =  P1__rEIP  ; 
                   P1__InstAddrPointer   =  P1__PhyAddrPointer  ; 
                   P1__State2   =  P1__S1  ; 
                   P1__rEIP   <=20'hFFFF0; 
                   P1__ReadRequest   <=1'b1; 
                   P1__MemoryFetch   <=1'b1; 
                   P1__RequestPending   <=1'b1;
                end  
              P1__S1   :
                begin  
                   P1__RequestPending   <=  P1__Pending  ; 
                   P1__ReadRequest   <=  P1__Pending  ; 
                   P1__MemoryFetch   <=  P1__Pending  ; 
                   P1__CodeFetch   <=  P1__Pending  ;
                  if (  P1__READY_n  ==1'b0) 
                      P1__State2   =  P1__S2  ;
                   else  
                      P1__State2   =  P1__S1  ;
                end  
              P1__S2   :
                begin  
                   P1__RequestPending   <=  P1__NotPending  ; 
                   P1__InstQueue   [  P1__InstQueueWr_Addr  ]=  P1__Datai  %(2**8); 
                   P1__InstQueueWr_Addr   =(  P1__InstQueueWr_Addr  +1)%16; 
                   P1__InstQueue   [  P1__InstQueueWr_Addr  ]=  P1__Datai  %2**8; 
                   P1__InstQueueWr_Addr   =(  P1__InstQueueWr_Addr  +1)%16;
                  if (  P1__StateBS16  ==1'b1)
                     begin  
                        P1__InstQueue   [  P1__InstQueueWr_Addr  ]=(  P1__Datai  /(2**16))%(2**8); 
                        P1__InstQueueWr_Addr   =(  P1__InstQueueWr_Addr  +1)%16; 
                        P1__InstQueue   [  P1__InstQueueWr_Addr  ]=(  P1__Datai  /(2**24))%(2**8); 
                        P1__InstQueueWr_Addr   =(  P1__InstQueueWr_Addr  +1)%16; 
                        P1__PhyAddrPointer   =  P1__PhyAddrPointer  +4; 
                        P1__State2   =  P1__S5  ;
                     end 
                   else 
                     begin  
                        P1__PhyAddrPointer   =  P1__PhyAddrPointer  +2;
                       if (  P1__PhyAddrPointer  <0) 
                           P1__rEIP   <=-  P1__PhyAddrPointer  ;
                        else  
                           P1__rEIP   <=  P1__PhyAddrPointer  ; 
                        P1__State2   =  P1__S3  ;
                     end 
                end  
              P1__S3   :
                begin  
                   P1__RequestPending   <=  P1__Pending  ;
                  if (  P1__READY_n  ==1'b0) 
                      P1__State2   =  P1__S4  ;
                   else  
                      P1__State2   =  P1__S3  ;
                end  
              P1__S4   :
                begin  
                   P1__RequestPending   <=  P1__NotPending  ; 
                   P1__InstQueue   [  P1__InstQueueWr_Addr  ]=  P1__Datai  %(2**8); 
                   P1__InstQueueWr_Addr   =(  P1__InstQueueWr_Addr  +1)%16; 
                   P1__InstQueue   [  P1__InstQueueWr_Addr  ]=  P1__Datai  %(2**8); 
                   P1__InstQueueWr_Addr   =(  P1__InstQueueWr_Addr  +1)%16; 
                   P1__PhyAddrPointer   =  P1__PhyAddrPointer  +2; 
                   P1__State2   =  P1__S5  ;
                end  
              P1__S5   :
                begin 
                  case (  P1__InstQueue  [  P1__InstQueueRd_Addr  ]) 
                    P1__NOP   :
                      begin  
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +1; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +1)%16; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end  
                    P1__OPsop   :
                      begin  
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +1; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +1)%16; 
                         P1__Extended   =1'b1; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end  
                    P1__JMP_rel_short   :
                      if ((  P1__InstQueueWr_Addr  -  P1__InstQueueRd_Addr  )>=3)
                         begin 
                           if (  P1__InstQueue  [(  P1__InstQueueRd_Addr  +1)%16]>127)
                              begin  
                                 P1__PhyAddrPointer   =  P1__InstAddrPointer  +1-(8'hFF-  P1__InstQueue  [(  P1__InstQueueRd_Addr  +1)%16]); 
                                 P1__InstAddrPointer   =  P1__PhyAddrPointer  ;
                              end 
                            else 
                              begin  
                                 P1__PhyAddrPointer   =  P1__InstAddrPointer  +2+  P1__InstQueue  [(  P1__InstQueueRd_Addr  +1)%16]; 
                                 P1__InstAddrPointer   =  P1__PhyAddrPointer  ;
                              end  
                            P1__Flush   =1'b1; 
                            P1__More   =1'b0;
                         end 
                       else 
                         begin  
                            P1__Flush   =1'b0; 
                            P1__More   =1'b1;
                         end  
                    P1__JMP_rel_near   :
                      if ((  P1__InstQueueWr_Addr  -  P1__InstQueueRd_Addr  )>=5)
                         begin  
                            P1__PhyAddrPointer   =  P1__InstAddrPointer  +5+  P1__InstQueue  [(  P1__InstQueueRd_Addr  +1)%16]; 
                            P1__InstAddrPointer   =  P1__PhyAddrPointer  ; 
                            P1__Flush   =1'b1; 
                            P1__More   =1'b0;
                         end 
                       else 
                         begin  
                            P1__Flush   =1'b0; 
                            P1__More   =1'b1;
                         end  
                    P1__JMP_intseg_immed   :
                      begin  
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +1; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +1)%16; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end  
                    P1__MOV_al_b   :
                      begin  
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +1; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +1)%16; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end  
                    P1__MOV_eax_dw   :
                      if ((  P1__InstQueueWr_Addr  -  P1__InstQueueRd_Addr  )>=5)
                         begin  
                            P1__EAX   <=  P1__InstQueue  [(  P1__InstQueueRd_Addr  +4)%16]*(2**23)+  P1__InstQueue  [(  P1__InstQueueRd_Addr  +3)%16]*(2**16)+  P1__InstQueue  [(  P1__InstQueueRd_Addr  +2)%16]*(2**8)+  P1__InstQueue  [(  P1__InstQueueRd_Addr  +1)%16]; 
                            P1__More   =1'b0; 
                            P1__Flush   =1'b0; 
                            P1__InstAddrPointer   =  P1__InstAddrPointer  +5; 
                            P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +5)%16;
                         end 
                       else 
                         begin  
                            P1__Flush   =1'b0; 
                            P1__More   =1'b1;
                         end  
                    P1__MOV_ebx_dw   :
                      if ((  P1__InstQueueWr_Addr  -  P1__InstQueueRd_Addr  )>=5)
                         begin  
                            P1__EBX   <=  P1__InstQueue  [(  P1__InstQueueRd_Addr  +4)%16]*(2**23)+  P1__InstQueue  [(  P1__InstQueueRd_Addr  +3)%16]*(2**16)+  P1__InstQueue  [(  P1__InstQueueRd_Addr  +2)%16]*(2**8)+  P1__InstQueue  [(  P1__InstQueueRd_Addr  +1)%1]; 
                            P1__More   =1'b0; 
                            P1__Flush   =1'b0; 
                            P1__InstAddrPointer   =  P1__InstAddrPointer  +5; 
                            P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +5)%16;
                         end 
                       else 
                         begin  
                            P1__Flush   =1'b0; 
                            P1__More   =1'b1;
                         end  
                    P1__MOV_eax_ebx   :
                      if ((  P1__InstQueueWr_Addr  -  P1__InstQueueRd_Addr  )>=2)
                         begin 
                           if (  P1__EBX  <0) 
                               P1__rEIP   <=-  P1__EBX  ;
                            else  
                               P1__rEIP   <=  P1__EBX  ; 
                            P1__RequestPending   <=  P1__Pending  ; 
                            P1__ReadRequest   <=  P1__Pending  ; 
                            P1__MemoryFetch   <=  P1__Pending  ; 
                            P1__CodeFetch   <=  P1__NotPending  ;
                           if (  P1__READY_n  ==1'b0)
                              begin  
                                 P1__RequestPending   <=  P1__NotPending  ; 
                                 P1__uWord   =  P1__Datai  %(2**15);
                                if (  P1__StateBS16  ==1'b1) 
                                    P1__lWord   =  P1__Datai  %(2**16);
                                 else 
                                   begin  
                                      P1__rEIP   <=  P1__rEIP  +2; 
                                      P1__RequestPending   <=  P1__Pending  ;
                                     if (  P1__READY_n  ==1'b0)
                                        begin  
                                           P1__RequestPending   <=  P1__NotPending  ; 
                                           P1__lWord   =  P1__Datai  %(2**16);
                                        end 
                                   end 
                                if (  P1__READY_n  ==1'b0)
                                   begin  
                                      P1__EAX   <=  P1__uWord  *(2**16)+  P1__lWord  ; 
                                      P1__More   =1'b0; 
                                      P1__Flush   =1'b0; 
                                      P1__InstAddrPointer   =  P1__InstAddrPointer  +2; 
                                      P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin  
                            P1__Flush   =1'b0; 
                            P1__More   =1'b1;
                         end  
                    P1__MOV_ebx_eax   :
                      if ((  P1__InstQueueWr_Addr  -  P1__InstQueueRd_Addr  )>=2)
                         begin 
                           if (  P1__EBX  <0) 
                               P1__rEIP   <=  P1__EBX  ;
                            else  
                               P1__rEIP   <=  P1__EBX  ; 
                            P1__lWord   =  P1__EAX  %(2**16); 
                            P1__uWord   =(  P1__EAX  /(2**16))%(2**15); 
                            P1__RequestPending   <=  P1__Pending  ; 
                            P1__ReadRequest   <=  P1__NotPending  ; 
                            P1__MemoryFetch   <=  P1__Pending  ; 
                            P1__CodeFetch   <=  P1__NotPending  ;
                           if (  P1__State  ==  P1__StateT1  |  P1__State  ==  P1__StateT1P  )
                              begin  
                                 P1__Datao   <=(  P1__uWord  *(2**16)+  P1__lWord  );
                                if (  P1__READY_n  ==1'b0)
                                   begin  
                                      P1__RequestPending   <=  P1__NotPending  ;
                                     if (  P1__StateBS16  ==1'b0)
                                        begin  
                                           P1__rEIP   <=  P1__rEIP  +2; 
                                           P1__RequestPending   <=  P1__Pending  ; 
                                           P1__ReadRequest   <=  P1__NotPending  ; 
                                           P1__MemoryFetch   <=  P1__Pending  ; 
                                           P1__CodeFetch   <=  P1__NotPending  ; 
                                           P1__State2   =  P1__S6  ;
                                        end  
                                      P1__More   =1'b0; 
                                      P1__Flush   =1'b0; 
                                      P1__InstAddrPointer   =  P1__InstAddrPointer  +2; 
                                      P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin  
                            P1__Flush   =1'b0; 
                            P1__More   =1'b1;
                         end  
                    P1__IN_al   :
                      if ((  P1__InstQueueWr_Addr  -  P1__InstQueueRd_Addr  )>=2)
                         begin  
                            P1__rEIP   <=  P1__InstQueueRd_Addr  +1; 
                            P1__RequestPending   <=  P1__Pending  ; 
                            P1__ReadRequest   <=  P1__Pending  ; 
                            P1__MemoryFetch   <=  P1__NotPending  ; 
                            P1__CodeFetch   <=  P1__NotPending  ;
                           if (  P1__READY_n  ==1'b0)
                              begin  
                                 P1__RequestPending   <=  P1__NotPending  ; 
                                 P1__EAX   <=  P1__Datai  ; 
                                 P1__InstAddrPointer   =  P1__InstAddrPointer  +2; 
                                 P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +2); 
                                 P1__Flush   =1'b0; 
                                 P1__More   =1'b0;
                              end 
                         end 
                       else 
                         begin  
                            P1__Flush   =1'b0; 
                            P1__More   =1'b1;
                         end  
                    P1__OUT_al   :
                      if ((  P1__InstQueueWr_Addr  -  P1__InstQueueRd_Addr  )>=2)
                         begin  
                            P1__rEIP   <=  P1__InstQueueRd_Addr  +1; 
                            P1__RequestPending   <=  P1__Pending  ; 
                            P1__ReadRequest   <=  P1__NotPending  ; 
                            P1__MemoryFetch   <=  P1__NotPending  ; 
                            P1__CodeFetch   <=  P1__NotPending  ;
                           if (  P1__State  ==  P1__StateT1  |  P1__State  ==  P1__StateT1P  )
                              begin  
                                 P1__fWord   =  P1__EAX  %(2**16); 
                                 P1__Datao   <=  P1__fWord  ;
                                if (  P1__READY_n  ==1'b0)
                                   begin  
                                      P1__RequestPending   <=  P1__NotPending  ; 
                                      P1__InstAddrPointer   =  P1__InstAddrPointer  +2; 
                                      P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +2)%16; 
                                      P1__Flush   =1'b0; 
                                      P1__More   =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin  
                            P1__Flush   =1'b0; 
                            P1__More   =1'b1;
                         end  
                    P1__ADD_al_b   :
                      begin  
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +1; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +1)%16; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end  
                    P1__ADD_ax_w   :
                      begin  
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +1; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +1)%16; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end  
                    P1__ROL_al_1   :
                      begin  
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +2; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +2)%16; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end  
                    P1__ROL_al_n   :
                      begin  
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +2; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +2)%16; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end  
                    P1__INC_eax   :
                      begin  
                         P1__EAX   <=  P1__EAX  +1; 
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +1; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +1)%16; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end  
                    P1__INC_ebx   :
                      begin  
                         P1__EBX   <=  P1__EBX  +1; 
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +1; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +1)%16; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end 
                   default :
                      begin  
                         P1__InstAddrPointer   =  P1__InstAddrPointer  +1; 
                         P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +1)%16; 
                         P1__Flush   =1'b0; 
                         P1__More   =1'b0;
                      end 
                  endcase 
                  if ((~(  P1__InstQueueRd_Addr  <  P1__InstQueueWr_Addr  ))|(((  P1__InstQueueLimit  -  P1__InstQueueRd_Addr  )<4)|  P1__Flush  |  P1__More  )) 
                      P1__State2   =  P1__S7  ;
                end  
              P1__S6   :
                begin  
                   P1__Datao   <=(  P1__uWord  *(2**16)+  P1__lWord  );
                  if (  P1__READY_n  ==1'b0)
                     begin  
                        P1__RequestPending   <=  P1__NotPending  ; 
                        P1__State2   =  P1__S5  ;
                     end 
                end  
              P1__S7   :
                begin 
                  if (  P1__Flush  )
                     begin  
                        P1__InstQueueRd_Addr   =1; 
                        P1__InstQueueWr_Addr   =1;
                       if (  P1__InstAddrPointer  <0) 
                           P1__fWord   =-  P1__InstAddrPointer  ;
                        else  
                           P1__fWord   =  P1__InstAddrPointer  ;
                       if (  P1__fWord  %2==1) 
                           P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +  P1__fWord  %4)%16;
                     end 
                  if ((  P1__InstQueueLimit  -  P1__InstQueueRd_Addr  )<3)
                     begin  
                        P1__State2   =  P1__S8  ; 
                        P1__InstQueueWr_Addr   =0;
                     end 
                   else  
                      P1__State2   =  P1__S9  ;
                end  
              P1__S8   :
                if (  P1__InstQueueRd_Addr  <=  P1__InstQueueLimit  )
                   begin  
                      P1__InstQueue   [  P1__InstQueueWr_Addr  ]=  P1__InstQueue  [  P1__InstQueueRd_Addr  ]; 
                      P1__InstQueueRd_Addr   =(  P1__InstQueueRd_Addr  +1)%16; 
                      P1__InstQueueWr_Addr   =(  P1__InstQueueWr_Addr  +1)%16; 
                      P1__State2   =  P1__S8  ;
                   end 
                 else 
                   begin  
                      P1__InstQueueRd_Addr   =0; 
                      P1__State2   =  P1__S9  ;
                   end  
              P1__S9   :
                begin  
                   P1__rEIP   <=  P1__PhyAddrPointer  ; 
                   P1__State2   =  P1__S1  ;
                end 
            endcase 
       end
  
  always @(  posedge    P1__CLOCK          or  posedge   P1__RESET  )
       begin :  P1__P2  
         if (  P1__RESET  ==1'b1)
            begin  
               P1__ByteEnable   <=4'b0000; 
               P1__NonAligned   <=1'b0;
            end 
          else 
            case (  P1__DataWidth  ) 
              P1__WidthByte   :
                case (  P1__rEIP  %4)
                 0 : 
                     P1__ByteEnable   <=4'b1110;
                 1 : 
                     P1__ByteEnable   <=4'b1101;
                 2 : 
                     P1__ByteEnable   <=4'b1011;
                 3 : 
                     P1__ByteEnable   <=4'b0111;
                 default :;
                endcase  
              P1__WidthWord   :
                case (  P1__rEIP  %4)
                 0 :
                    begin  
                       P1__ByteEnable   <=4'b1100; 
                       P1__NonAligned   <=  P1__NotPending  ;
                    end 
                 1 :
                    begin  
                       P1__ByteEnable   <=4'b1001; 
                       P1__NonAligned   <=  P1__NotPending  ;
                    end 
                 2 :
                    begin  
                       P1__ByteEnable   <=4'b0011; 
                       P1__NonAligned   <=  P1__NotPending  ;
                    end 
                 3 :
                    begin  
                       P1__ByteEnable   <=4'b0111; 
                       P1__NonAligned   <=  P1__Pending  ;
                    end 
                 default :;
                endcase  
              P1__WidthDword   :
                case (  P1__rEIP  %4)
                 0 :
                    begin  
                       P1__ByteEnable   <=4'b0000; 
                       P1__NonAligned   <=  P1__NotPending  ;
                    end 
                 1 :
                    begin  
                       P1__ByteEnable   <=4'b0001; 
                       P1__NonAligned   <=  P1__Pending  ;
                    end 
                 2 :
                    begin  
                       P1__NonAligned   <=  P1__Pending  ; 
                       P1__ByteEnable   <=4'b0011;
                    end 
                 3 :
                    begin  
                       P1__NonAligned   <=  P1__Pending  ; 
                       P1__ByteEnable   <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
 
   reg  P2__StateNA  ; 
   reg  P2__StateBS16  ; 
   reg  P2__RequestPending  ; 
   reg  P2__NonAligned  ; 
   reg  P2__ReadRequest  ; 
   reg  P2__MemoryFetch  ; 
   reg  P2__CodeFetch  ; 
   reg[3:0]  P2__ByteEnable  ; 
   integer  P2__DataWidth  ; 
   reg[2:0]  P2__State  ; 
   integer  P2__EAX  ; 
   integer  P2__EBX  ; 
   integer  P2__rEIP  ; 
  always @(  posedge    P2__CLOCK          or  posedge   P2__RESET  )
       begin :  P2__P0  
         if (  P2__RESET  ==1'b1)
            begin  
               P2__BE_n   <=4'b0000; 
               P2__Address   <=0; 
               P2__W_R_n   <=1'b0; 
               P2__D_C_n   <=1'b0; 
               P2__M_IO_n   <=1'b0; 
               P2__ADS_n   <=1'b0; 
               P2__State   <=  P2__StateInit  ; 
               P2__StateNA   <=1'b0; 
               P2__StateBS16   <=1'b0; 
               P2__DataWidth   <=0;
            end 
          else 
            case (  P2__State  ) 
              P2__StateInit   :
                begin  
                   P2__D_C_n   <=1'b1; 
                   P2__ADS_n   <=1'b1; 
                   P2__State   <=  P2__StateTi  ; 
                   P2__StateNA   <=1'b1; 
                   P2__StateBS16   <=1'b1; 
                   P2__DataWidth   <=2; 
                   P2__State   <=  P2__StateTi  ;
                end  
              P2__StateTi   :
                if (  P2__RequestPending  ==  P2__Pending  ) 
                    P2__State   <=  P2__StateT1  ;
                 else 
                   if (  P2__HOLD  ==1'b1) 
                       P2__State   <=  P2__StateTh  ;
                    else  
                       P2__State   <=  P2__StateTi  ; 
              P2__StateT1   :
                begin  
                   P2__Address   <=  P2__rEIP  /4%2**30; 
                   P2__BE_n   <=  P2__ByteEnable  ; 
                   P2__M_IO_n   <=  P2__MemoryFetch  ;
                  if (  P2__ReadRequest  ==  P2__Pending  ) 
                      P2__W_R_n   <=1'b0;
                   else  
                      P2__W_R_n   <=1'b1;
                  if (  P2__CodeFetch  ==  P2__Pending  ) 
                      P2__D_C_n   <=1'b0;
                   else  
                      P2__D_C_n   <=1'b1; 
                   P2__ADS_n   <=1'b0; 
                   P2__State   <=  P2__StateT2  ;
                end  
              P2__StateT2   :
                begin 
                  if (  P2__READY_n  ==1'b0&  P2__HOLD  ==1'b0&  P2__RequestPending  ==  P2__Pending  ) 
                      P2__State   <=  P2__StateT1  ;
                   else 
                     if (  P2__READY_n  ==1'b1&  P2__NA_n  ==1'b1);
                      else 
                        if ((  P2__RequestPending  ==  P2__Pending  |  P2__HOLD  ==1'b1)&(  P2__READY_n  ==1'b1&  P2__NA_n  ==1'b0)) 
                            P2__State   <=  P2__StateT2I  ;
                         else 
                           if (  P2__RequestPending  ==  P2__Pending  &  P2__HOLD  ==1'b0&  P2__READY_n  ==1'b1&  P2__NA_n  ==1'b0) 
                               P2__State   <=  P2__StateT2P  ;
                            else 
                              if (  P2__RequestPending  ==  P2__NotPending  &  P2__HOLD  ==1'b0&  P2__READY_n  ==1'b0) 
                                  P2__State   <=  P2__StateTi  ;
                               else 
                                 if (  P2__HOLD  ==1'b1&  P2__READY_n  ==1'b1) 
                                     P2__State   <=  P2__StateTh  ;
                                  else  
                                     P2__State   <=  P2__StateT2  ; 
                   P2__StateBS16   <=  P2__BS16_n  ;
                  if (  P2__BS16_n  ==1'b0) 
                      P2__DataWidth   <=  P2__WidthWord  ;
                   else  
                      P2__DataWidth   <=  P2__WidthDword  ; 
                   P2__StateNA   <=  P2__NA_n  ; 
                   P2__ADS_n   <=1'b1;
                end  
              P2__StateT1P   :
                begin 
                  if (  P2__NA_n  ==1'b0&  P2__HOLD  ==1'b0&  P2__RequestPending  ==  P2__Pending  ) 
                      P2__State   <=  P2__StateT2P  ;
                   else 
                     if (  P2__NA_n  ==1'b0&(  P2__HOLD  ==1'b1|  P2__RequestPending  ==  P2__NotPending  )) 
                         P2__State   <=  P2__StateT2I  ;
                      else 
                        if (  P2__NA_n  ==1'b1) 
                            P2__State   <=  P2__StateT2  ;
                         else  
                            P2__State   <=  P2__StateT1P  ; 
                   P2__StateBS16   <=  P2__BS16_n  ;
                  if (  P2__BS16_n  ==1'b0) 
                      P2__DataWidth   <=  P2__WidthWord  ;
                   else  
                      P2__DataWidth   <=  P2__WidthDword  ; 
                   P2__StateNA   <=  P2__NA_n  ; 
                   P2__ADS_n   <=1'b1;
                end  
              P2__StateTh   :
                if (  P2__HOLD  ==1'b0&  P2__RequestPending  ==  P2__Pending  ) 
                    P2__State   <=  P2__StateT1  ;
                 else 
                   if (  P2__HOLD  ==1'b0&  P2__RequestPending  ==  P2__NotPending  ) 
                       P2__State   <=  P2__StateTi  ;
                    else  
                       P2__State   <=  P2__StateTh  ; 
              P2__StateT2P   :
                begin  
                   P2__Address   <=  P2__rEIP  /2%2**30; 
                   P2__BE_n   <=  P2__ByteEnable  ; 
                   P2__M_IO_n   <=  P2__MemoryFetch  ;
                  if (  P2__ReadRequest  ==  P2__Pending  ) 
                      P2__W_R_n   <=1'b0;
                   else  
                      P2__W_R_n   <=1'b1;
                  if (  P2__CodeFetch  ==  P2__Pending  ) 
                      P2__D_C_n   <=1'b0;
                   else  
                      P2__D_C_n   <=1'b1; 
                   P2__ADS_n   <=1'b0;
                  if (  P2__READY_n  ==1'b0) 
                      P2__State   <=  P2__StateT1P  ;
                   else  
                      P2__State   <=  P2__StateT2P  ;
                end  
              P2__StateT2I   :
                if (  P2__READY_n  ==1'b1&  P2__RequestPending  ==  P2__Pending  &  P2__HOLD  ==1'b0) 
                    P2__State   <=  P2__StateT2P  ;
                 else 
                   if (  P2__READY_n  ==1'b0&  P2__HOLD  ==1'b1) 
                       P2__State   <=  P2__StateTh  ;
                    else 
                      if (  P2__READY_n  ==1'b0&  P2__HOLD  ==1'b0&  P2__RequestPending  ==  P2__Pending  ) 
                          P2__State   <=  P2__StateT1  ;
                       else 
                         if (  P2__READY_n  ==1'b0&  P2__HOLD  ==1'b0&  P2__RequestPending  ==  P2__NotPending  ) 
                             P2__State   <=  P2__StateTi  ;
                          else  
                             P2__State   <=  P2__StateT2I  ;
            endcase 
       end
  
   reg[7:0]  P2__InstQueue  [15:0]; 
   reg[4:0]  P2__InstQueueRd_Addr  ; 
   reg[4:0]  P2__InstQueueWr_Addr  ; 
   integer  P2__InstAddrPointer  ; 
   integer  P2__PhyAddrPointer  ; 
   reg  P2__Extended  ; 
   reg  P2__More  ; 
   reg  P2__Flush  ; 
   reg[15:0]  P2__lWord  ; 
   reg[14:0]  P2__uWord  ; 
   integer  P2__fWord  ; 
   reg[3:0]  P2__State2  ; 
  always @(  posedge    P2__CLOCK          or  posedge   P2__RESET  )
       begin :  P2__P1  
         if (  P2__RESET  ==1'b1)
            begin  
               P2__State2   =  P2__Si  ; 
               P2__InstQueue[0]   = 0;
               P2__InstQueue[1]   = 0;
               P2__InstQueue[2]   = 0;
               P2__InstQueue[3]   = 0;
               P2__InstQueue[4]   = 0;
               P2__InstQueue[5]   = 0;
               P2__InstQueue[6]   = 0;
               P2__InstQueue[7]   = 0;
               P2__InstQueue[8]   = 0;
               P2__InstQueue[9]   = 0;
               P2__InstQueue[10]   = 0;
               P2__InstQueue[11]   = 0;
               P2__InstQueue[12]   = 0;
               P2__InstQueue[13]   = 0;
               P2__InstQueue[14]   = 0;
               P2__InstQueue[15]   = 0;
          
               P2__InstQueueRd_Addr   =0; 
               P2__InstQueueWr_Addr   =0; 
               P2__InstAddrPointer   =0; 
               P2__PhyAddrPointer   =0; 
               P2__Extended   =1'b0; 
               P2__More   =1'b0; 
               P2__Flush   =1'b0; 
               P2__lWord   =0; 
               P2__uWord   =0; 
               P2__fWord   =0; 
               P2__CodeFetch   <=1'b0; 
               P2__Datao   <=0; 
               P2__EAX   <=0; 
               P2__EBX   <=0; 
               P2__rEIP   <=0; 
               P2__ReadRequest   <=1'b0; 
               P2__MemoryFetch   <=1'b0; 
               P2__RequestPending   <=1'b0;
            end 
          else 
            case (  P2__State2  ) 
              P2__Si   :
                begin  
                   P2__PhyAddrPointer   =  P2__rEIP  ; 
                   P2__InstAddrPointer   =  P2__PhyAddrPointer  ; 
                   P2__State2   =  P2__S1  ; 
                   P2__rEIP   <=20'hFFFF0; 
                   P2__ReadRequest   <=1'b1; 
                   P2__MemoryFetch   <=1'b1; 
                   P2__RequestPending   <=1'b1;
                end  
              P2__S1   :
                begin  
                   P2__RequestPending   <=  P2__Pending  ; 
                   P2__ReadRequest   <=  P2__Pending  ; 
                   P2__MemoryFetch   <=  P2__Pending  ; 
                   P2__CodeFetch   <=  P2__Pending  ;
                  if (  P2__READY_n  ==1'b0) 
                      P2__State2   =  P2__S2  ;
                   else  
                      P2__State2   =  P2__S1  ;
                end  
              P2__S2   :
                begin  
                   P2__RequestPending   <=  P2__NotPending  ; 
                   P2__InstQueue   [  P2__InstQueueWr_Addr  ]=  P2__Datai  %(2**8); 
                   P2__InstQueueWr_Addr   =(  P2__InstQueueWr_Addr  +1)%16; 
                   P2__InstQueue   [  P2__InstQueueWr_Addr  ]=  P2__Datai  %2**8; 
                   P2__InstQueueWr_Addr   =(  P2__InstQueueWr_Addr  +1)%16;
                  if (  P2__StateBS16  ==1'b1)
                     begin  
                        P2__InstQueue   [  P2__InstQueueWr_Addr  ]=(  P2__Datai  /(2**16))%(2**8); 
                        P2__InstQueueWr_Addr   =(  P2__InstQueueWr_Addr  +1)%16; 
                        P2__InstQueue   [  P2__InstQueueWr_Addr  ]=(  P2__Datai  /(2**24))%(2**8); 
                        P2__InstQueueWr_Addr   =(  P2__InstQueueWr_Addr  +1)%16; 
                        P2__PhyAddrPointer   =  P2__PhyAddrPointer  +4; 
                        P2__State2   =  P2__S5  ;
                     end 
                   else 
                     begin  
                        P2__PhyAddrPointer   =  P2__PhyAddrPointer  +2;
                       if (  P2__PhyAddrPointer  <0) 
                           P2__rEIP   <=-  P2__PhyAddrPointer  ;
                        else  
                           P2__rEIP   <=  P2__PhyAddrPointer  ; 
                        P2__State2   =  P2__S3  ;
                     end 
                end  
              P2__S3   :
                begin  
                   P2__RequestPending   <=  P2__Pending  ;
                  if (  P2__READY_n  ==1'b0) 
                      P2__State2   =  P2__S4  ;
                   else  
                      P2__State2   =  P2__S3  ;
                end  
              P2__S4   :
                begin  
                   P2__RequestPending   <=  P2__NotPending  ; 
                   P2__InstQueue   [  P2__InstQueueWr_Addr  ]=  P2__Datai  %(2**8); 
                   P2__InstQueueWr_Addr   =(  P2__InstQueueWr_Addr  +1)%16; 
                   P2__InstQueue   [  P2__InstQueueWr_Addr  ]=  P2__Datai  %(2**8); 
                   P2__InstQueueWr_Addr   =(  P2__InstQueueWr_Addr  +1)%16; 
                   P2__PhyAddrPointer   =  P2__PhyAddrPointer  +2; 
                   P2__State2   =  P2__S5  ;
                end  
              P2__S5   :
                begin 
                  case (  P2__InstQueue  [  P2__InstQueueRd_Addr  ]) 
                    P2__NOP   :
                      begin  
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +1; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +1)%16; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end  
                    P2__OPsop   :
                      begin  
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +1; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +1)%16; 
                         P2__Extended   =1'b1; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end  
                    P2__JMP_rel_short   :
                      if ((  P2__InstQueueWr_Addr  -  P2__InstQueueRd_Addr  )>=3)
                         begin 
                           if (  P2__InstQueue  [(  P2__InstQueueRd_Addr  +1)%16]>127)
                              begin  
                                 P2__PhyAddrPointer   =  P2__InstAddrPointer  +1-(8'hFF-  P2__InstQueue  [(  P2__InstQueueRd_Addr  +1)%16]); 
                                 P2__InstAddrPointer   =  P2__PhyAddrPointer  ;
                              end 
                            else 
                              begin  
                                 P2__PhyAddrPointer   =  P2__InstAddrPointer  +2+  P2__InstQueue  [(  P2__InstQueueRd_Addr  +1)%16]; 
                                 P2__InstAddrPointer   =  P2__PhyAddrPointer  ;
                              end  
                            P2__Flush   =1'b1; 
                            P2__More   =1'b0;
                         end 
                       else 
                         begin  
                            P2__Flush   =1'b0; 
                            P2__More   =1'b1;
                         end  
                    P2__JMP_rel_near   :
                      if ((  P2__InstQueueWr_Addr  -  P2__InstQueueRd_Addr  )>=5)
                         begin  
                            P2__PhyAddrPointer   =  P2__InstAddrPointer  +5+  P2__InstQueue  [(  P2__InstQueueRd_Addr  +1)%16]; 
                            P2__InstAddrPointer   =  P2__PhyAddrPointer  ; 
                            P2__Flush   =1'b1; 
                            P2__More   =1'b0;
                         end 
                       else 
                         begin  
                            P2__Flush   =1'b0; 
                            P2__More   =1'b1;
                         end  
                    P2__JMP_intseg_immed   :
                      begin  
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +1; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +1)%16; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end  
                    P2__MOV_al_b   :
                      begin  
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +1; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +1)%16; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end  
                    P2__MOV_eax_dw   :
                      if ((  P2__InstQueueWr_Addr  -  P2__InstQueueRd_Addr  )>=5)
                         begin  
                            P2__EAX   <=  P2__InstQueue  [(  P2__InstQueueRd_Addr  +4)%16]*(2**23)+  P2__InstQueue  [(  P2__InstQueueRd_Addr  +3)%16]*(2**16)+  P2__InstQueue  [(  P2__InstQueueRd_Addr  +2)%16]*(2**8)+  P2__InstQueue  [(  P2__InstQueueRd_Addr  +1)%16]; 
                            P2__More   =1'b0; 
                            P2__Flush   =1'b0; 
                            P2__InstAddrPointer   =  P2__InstAddrPointer  +5; 
                            P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +5)%16;
                         end 
                       else 
                         begin  
                            P2__Flush   =1'b0; 
                            P2__More   =1'b1;
                         end  
                    P2__MOV_ebx_dw   :
                      if ((  P2__InstQueueWr_Addr  -  P2__InstQueueRd_Addr  )>=5)
                         begin  
                            P2__EBX   <=  P2__InstQueue  [(  P2__InstQueueRd_Addr  +4)%16]*(2**23)+  P2__InstQueue  [(  P2__InstQueueRd_Addr  +3)%16]*(2**16)+  P2__InstQueue  [(  P2__InstQueueRd_Addr  +2)%16]*(2**8)+  P2__InstQueue  [(  P2__InstQueueRd_Addr  +1)%1]; 
                            P2__More   =1'b0; 
                            P2__Flush   =1'b0; 
                            P2__InstAddrPointer   =  P2__InstAddrPointer  +5; 
                            P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +5)%16;
                         end 
                       else 
                         begin  
                            P2__Flush   =1'b0; 
                            P2__More   =1'b1;
                         end  
                    P2__MOV_eax_ebx   :
                      if ((  P2__InstQueueWr_Addr  -  P2__InstQueueRd_Addr  )>=2)
                         begin 
                           if (  P2__EBX  <0) 
                               P2__rEIP   <=-  P2__EBX  ;
                            else  
                               P2__rEIP   <=  P2__EBX  ; 
                            P2__RequestPending   <=  P2__Pending  ; 
                            P2__ReadRequest   <=  P2__Pending  ; 
                            P2__MemoryFetch   <=  P2__Pending  ; 
                            P2__CodeFetch   <=  P2__NotPending  ;
                           if (  P2__READY_n  ==1'b0)
                              begin  
                                 P2__RequestPending   <=  P2__NotPending  ; 
                                 P2__uWord   =  P2__Datai  %(2**15);
                                if (  P2__StateBS16  ==1'b1) 
                                    P2__lWord   =  P2__Datai  %(2**16);
                                 else 
                                   begin  
                                      P2__rEIP   <=  P2__rEIP  +2; 
                                      P2__RequestPending   <=  P2__Pending  ;
                                     if (  P2__READY_n  ==1'b0)
                                        begin  
                                           P2__RequestPending   <=  P2__NotPending  ; 
                                           P2__lWord   =  P2__Datai  %(2**16);
                                        end 
                                   end 
                                if (  P2__READY_n  ==1'b0)
                                   begin  
                                      P2__EAX   <=  P2__uWord  *(2**16)+  P2__lWord  ; 
                                      P2__More   =1'b0; 
                                      P2__Flush   =1'b0; 
                                      P2__InstAddrPointer   =  P2__InstAddrPointer  +2; 
                                      P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin  
                            P2__Flush   =1'b0; 
                            P2__More   =1'b1;
                         end  
                    P2__MOV_ebx_eax   :
                      if ((  P2__InstQueueWr_Addr  -  P2__InstQueueRd_Addr  )>=2)
                         begin 
                           if (  P2__EBX  <0) 
                               P2__rEIP   <=  P2__EBX  ;
                            else  
                               P2__rEIP   <=  P2__EBX  ; 
                            P2__lWord   =  P2__EAX  %(2**16); 
                            P2__uWord   =(  P2__EAX  /(2**16))%(2**15); 
                            P2__RequestPending   <=  P2__Pending  ; 
                            P2__ReadRequest   <=  P2__NotPending  ; 
                            P2__MemoryFetch   <=  P2__Pending  ; 
                            P2__CodeFetch   <=  P2__NotPending  ;
                           if (  P2__State  ==  P2__StateT1  |  P2__State  ==  P2__StateT1P  )
                              begin  
                                 P2__Datao   <=(  P2__uWord  *(2**16)+  P2__lWord  );
                                if (  P2__READY_n  ==1'b0)
                                   begin  
                                      P2__RequestPending   <=  P2__NotPending  ;
                                     if (  P2__StateBS16  ==1'b0)
                                        begin  
                                           P2__rEIP   <=  P2__rEIP  +2; 
                                           P2__RequestPending   <=  P2__Pending  ; 
                                           P2__ReadRequest   <=  P2__NotPending  ; 
                                           P2__MemoryFetch   <=  P2__Pending  ; 
                                           P2__CodeFetch   <=  P2__NotPending  ; 
                                           P2__State2   =  P2__S6  ;
                                        end  
                                      P2__More   =1'b0; 
                                      P2__Flush   =1'b0; 
                                      P2__InstAddrPointer   =  P2__InstAddrPointer  +2; 
                                      P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin  
                            P2__Flush   =1'b0; 
                            P2__More   =1'b1;
                         end  
                    P2__IN_al   :
                      if ((  P2__InstQueueWr_Addr  -  P2__InstQueueRd_Addr  )>=2)
                         begin  
                            P2__rEIP   <=  P2__InstQueueRd_Addr  +1; 
                            P2__RequestPending   <=  P2__Pending  ; 
                            P2__ReadRequest   <=  P2__Pending  ; 
                            P2__MemoryFetch   <=  P2__NotPending  ; 
                            P2__CodeFetch   <=  P2__NotPending  ;
                           if (  P2__READY_n  ==1'b0)
                              begin  
                                 P2__RequestPending   <=  P2__NotPending  ; 
                                 P2__EAX   <=  P2__Datai  ; 
                                 P2__InstAddrPointer   =  P2__InstAddrPointer  +2; 
                                 P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +2); 
                                 P2__Flush   =1'b0; 
                                 P2__More   =1'b0;
                              end 
                         end 
                       else 
                         begin  
                            P2__Flush   =1'b0; 
                            P2__More   =1'b1;
                         end  
                    P2__OUT_al   :
                      if ((  P2__InstQueueWr_Addr  -  P2__InstQueueRd_Addr  )>=2)
                         begin  
                            P2__rEIP   <=  P2__InstQueueRd_Addr  +1; 
                            P2__RequestPending   <=  P2__Pending  ; 
                            P2__ReadRequest   <=  P2__NotPending  ; 
                            P2__MemoryFetch   <=  P2__NotPending  ; 
                            P2__CodeFetch   <=  P2__NotPending  ;
                           if (  P2__State  ==  P2__StateT1  |  P2__State  ==  P2__StateT1P  )
                              begin  
                                 P2__fWord   =  P2__EAX  %(2**16); 
                                 P2__Datao   <=  P2__fWord  ;
                                if (  P2__READY_n  ==1'b0)
                                   begin  
                                      P2__RequestPending   <=  P2__NotPending  ; 
                                      P2__InstAddrPointer   =  P2__InstAddrPointer  +2; 
                                      P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +2)%16; 
                                      P2__Flush   =1'b0; 
                                      P2__More   =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin  
                            P2__Flush   =1'b0; 
                            P2__More   =1'b1;
                         end  
                    P2__ADD_al_b   :
                      begin  
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +1; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +1)%16; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end  
                    P2__ADD_ax_w   :
                      begin  
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +1; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +1)%16; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end  
                    P2__ROL_al_1   :
                      begin  
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +2; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +2)%16; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end  
                    P2__ROL_al_n   :
                      begin  
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +2; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +2)%16; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end  
                    P2__INC_eax   :
                      begin  
                         P2__EAX   <=  P2__EAX  +1; 
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +1; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +1)%16; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end  
                    P2__INC_ebx   :
                      begin  
                         P2__EBX   <=  P2__EBX  +1; 
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +1; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +1)%16; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end 
                   default :
                      begin  
                         P2__InstAddrPointer   =  P2__InstAddrPointer  +1; 
                         P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +1)%16; 
                         P2__Flush   =1'b0; 
                         P2__More   =1'b0;
                      end 
                  endcase 
                  if ((~(  P2__InstQueueRd_Addr  <  P2__InstQueueWr_Addr  ))|(((  P2__InstQueueLimit  -  P2__InstQueueRd_Addr  )<4)|  P2__Flush  |  P2__More  )) 
                      P2__State2   =  P2__S7  ;
                end  
              P2__S6   :
                begin  
                   P2__Datao   <=(  P2__uWord  *(2**16)+  P2__lWord  );
                  if (  P2__READY_n  ==1'b0)
                     begin  
                        P2__RequestPending   <=  P2__NotPending  ; 
                        P2__State2   =  P2__S5  ;
                     end 
                end  
              P2__S7   :
                begin 
                  if (  P2__Flush  )
                     begin  
                        P2__InstQueueRd_Addr   =1; 
                        P2__InstQueueWr_Addr   =1;
                       if (  P2__InstAddrPointer  <0) 
                           P2__fWord   =-  P2__InstAddrPointer  ;
                        else  
                           P2__fWord   =  P2__InstAddrPointer  ;
                       if (  P2__fWord  %2==1) 
                           P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +  P2__fWord  %4)%16;
                     end 
                  if ((  P2__InstQueueLimit  -  P2__InstQueueRd_Addr  )<3)
                     begin  
                        P2__State2   =  P2__S8  ; 
                        P2__InstQueueWr_Addr   =0;
                     end 
                   else  
                      P2__State2   =  P2__S9  ;
                end  
              P2__S8   :
                if (  P2__InstQueueRd_Addr  <=  P2__InstQueueLimit  )
                   begin  
                      P2__InstQueue   [  P2__InstQueueWr_Addr  ]=  P2__InstQueue  [  P2__InstQueueRd_Addr  ]; 
                      P2__InstQueueRd_Addr   =(  P2__InstQueueRd_Addr  +1)%16; 
                      P2__InstQueueWr_Addr   =(  P2__InstQueueWr_Addr  +1)%16; 
                      P2__State2   =  P2__S8  ;
                   end 
                 else 
                   begin  
                      P2__InstQueueRd_Addr   =0; 
                      P2__State2   =  P2__S9  ;
                   end  
              P2__S9   :
                begin  
                   P2__rEIP   <=  P2__PhyAddrPointer  ; 
                   P2__State2   =  P2__S1  ;
                end 
            endcase 
       end
  
  always @(  posedge    P2__CLOCK          or  posedge   P2__RESET  )
       begin :  P2__P2  
         if (  P2__RESET  ==1'b1)
            begin  
               P2__ByteEnable   <=4'b0000; 
               P2__NonAligned   <=1'b0;
            end 
          else 
            case (  P2__DataWidth  ) 
              P2__WidthByte   :
                case (  P2__rEIP  %4)
                 0 : 
                     P2__ByteEnable   <=4'b1110;
                 1 : 
                     P2__ByteEnable   <=4'b1101;
                 2 : 
                     P2__ByteEnable   <=4'b1011;
                 3 : 
                     P2__ByteEnable   <=4'b0111;
                 default :;
                endcase  
              P2__WidthWord   :
                case (  P2__rEIP  %4)
                 0 :
                    begin  
                       P2__ByteEnable   <=4'b1100; 
                       P2__NonAligned   <=  P2__NotPending  ;
                    end 
                 1 :
                    begin  
                       P2__ByteEnable   <=4'b1001; 
                       P2__NonAligned   <=  P2__NotPending  ;
                    end 
                 2 :
                    begin  
                       P2__ByteEnable   <=4'b0011; 
                       P2__NonAligned   <=  P2__NotPending  ;
                    end 
                 3 :
                    begin  
                       P2__ByteEnable   <=4'b0111; 
                       P2__NonAligned   <=  P2__Pending  ;
                    end 
                 default :;
                endcase  
              P2__WidthDword   :
                case (  P2__rEIP  %4)
                 0 :
                    begin  
                       P2__ByteEnable   <=4'b0000; 
                       P2__NonAligned   <=  P2__NotPending  ;
                    end 
                 1 :
                    begin  
                       P2__ByteEnable   <=4'b0001; 
                       P2__NonAligned   <=  P2__Pending  ;
                    end 
                 2 :
                    begin  
                       P2__NonAligned   <=  P2__Pending  ; 
                       P2__ByteEnable   <=4'b0011;
                    end 
                 3 :
                    begin  
                       P2__NonAligned   <=  P2__Pending  ; 
                       P2__ByteEnable   <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
 
  
 
   reg  P3__StateNA  ; 
   reg  P3__StateBS16  ; 
   reg  P3__RequestPending  ; 
   reg  P3__NonAligned  ; 
   reg  P3__ReadRequest  ; 
   reg  P3__MemoryFetch  ; 
   reg  P3__CodeFetch  ; 
   reg[3:0]  P3__ByteEnable  ; 
   integer  P3__DataWidth  ; 
   reg[2:0]  P3__State  ; 
   integer  P3__EAX  ; 
   integer  P3__EBX  ; 
   integer  P3__rEIP  ; 
  always @(  posedge    P3__CLOCK          or  posedge   P3__RESET  )
       begin :  P3__P0  
         if (  P3__RESET  ==1'b1)
            begin  
               P3__BE_n   <=4'b0000; 
               P3__Address   <=0; 
               P3__W_R_n   <=1'b0; 
               P3__D_C_n   <=1'b0; 
               P3__M_IO_n   <=1'b0; 
               P3__ADS_n   <=1'b0; 
               P3__State   <=  P3__StateInit  ; 
               P3__StateNA   <=1'b0; 
               P3__StateBS16   <=1'b0; 
               P3__DataWidth   <=0;
            end 
          else 
            case (  P3__State  ) 
              P3__StateInit   :
                begin  
                   P3__D_C_n   <=1'b1; 
                   P3__ADS_n   <=1'b1; 
                   P3__State   <=  P3__StateTi  ; 
                   P3__StateNA   <=1'b1; 
                   P3__StateBS16   <=1'b1; 
                   P3__DataWidth   <=2; 
                   P3__State   <=  P3__StateTi  ;
                end  
              P3__StateTi   :
                if (  P3__RequestPending  ==  P3__Pending  ) 
                    P3__State   <=  P3__StateT1  ;
                 else 
                   if (  P3__HOLD  ==1'b1) 
                       P3__State   <=  P3__StateTh  ;
                    else  
                       P3__State   <=  P3__StateTi  ; 
              P3__StateT1   :
                begin  
                   P3__Address   <=  P3__rEIP  /4%2**30; 
                   P3__BE_n   <=  P3__ByteEnable  ; 
                   P3__M_IO_n   <=  P3__MemoryFetch  ;
                  if (  P3__ReadRequest  ==  P3__Pending  ) 
                      P3__W_R_n   <=1'b0;
                   else  
                      P3__W_R_n   <=1'b1;
                  if (  P3__CodeFetch  ==  P3__Pending  ) 
                      P3__D_C_n   <=1'b0;
                   else  
                      P3__D_C_n   <=1'b1; 
                   P3__ADS_n   <=1'b0; 
                   P3__State   <=  P3__StateT2  ;
                end  
              P3__StateT2   :
                begin 
                  if (  P3__READY_n  ==1'b0&  P3__HOLD  ==1'b0&  P3__RequestPending  ==  P3__Pending  ) 
                      P3__State   <=  P3__StateT1  ;
                   else 
                     if (  P3__READY_n  ==1'b1&  P3__NA_n  ==1'b1);
                      else 
                        if ((  P3__RequestPending  ==  P3__Pending  |  P3__HOLD  ==1'b1)&(  P3__READY_n  ==1'b1&  P3__NA_n  ==1'b0)) 
                            P3__State   <=  P3__StateT2I  ;
                         else 
                           if (  P3__RequestPending  ==  P3__Pending  &  P3__HOLD  ==1'b0&  P3__READY_n  ==1'b1&  P3__NA_n  ==1'b0) 
                               P3__State   <=  P3__StateT2P  ;
                            else 
                              if (  P3__RequestPending  ==  P3__NotPending  &  P3__HOLD  ==1'b0&  P3__READY_n  ==1'b0) 
                                  P3__State   <=  P3__StateTi  ;
                               else 
                                 if (  P3__HOLD  ==1'b1&  P3__READY_n  ==1'b1) 
                                     P3__State   <=  P3__StateTh  ;
                                  else  
                                     P3__State   <=  P3__StateT2  ; 
                   P3__StateBS16   <=  P3__BS16_n  ;
                  if (  P3__BS16_n  ==1'b0) 
                      P3__DataWidth   <=  P3__WidthWord  ;
                   else  
                      P3__DataWidth   <=  P3__WidthDword  ; 
                   P3__StateNA   <=  P3__NA_n  ; 
                   P3__ADS_n   <=1'b1;
                end  
              P3__StateT1P   :
                begin 
                  if (  P3__NA_n  ==1'b0&  P3__HOLD  ==1'b0&  P3__RequestPending  ==  P3__Pending  ) 
                      P3__State   <=  P3__StateT2P  ;
                   else 
                     if (  P3__NA_n  ==1'b0&(  P3__HOLD  ==1'b1|  P3__RequestPending  ==  P3__NotPending  )) 
                         P3__State   <=  P3__StateT2I  ;
                      else 
                        if (  P3__NA_n  ==1'b1) 
                            P3__State   <=  P3__StateT2  ;
                         else  
                            P3__State   <=  P3__StateT1P  ; 
                   P3__StateBS16   <=  P3__BS16_n  ;
                  if (  P3__BS16_n  ==1'b0) 
                      P3__DataWidth   <=  P3__WidthWord  ;
                   else  
                      P3__DataWidth   <=  P3__WidthDword  ; 
                   P3__StateNA   <=  P3__NA_n  ; 
                   P3__ADS_n   <=1'b1;
                end  
              P3__StateTh   :
                if (  P3__HOLD  ==1'b0&  P3__RequestPending  ==  P3__Pending  ) 
                    P3__State   <=  P3__StateT1  ;
                 else 
                   if (  P3__HOLD  ==1'b0&  P3__RequestPending  ==  P3__NotPending  ) 
                       P3__State   <=  P3__StateTi  ;
                    else  
                       P3__State   <=  P3__StateTh  ; 
              P3__StateT2P   :
                begin  
                   P3__Address   <=  P3__rEIP  /2%2**30; 
                   P3__BE_n   <=  P3__ByteEnable  ; 
                   P3__M_IO_n   <=  P3__MemoryFetch  ;
                  if (  P3__ReadRequest  ==  P3__Pending  ) 
                      P3__W_R_n   <=1'b0;
                   else  
                      P3__W_R_n   <=1'b1;
                  if (  P3__CodeFetch  ==  P3__Pending  ) 
                      P3__D_C_n   <=1'b0;
                   else  
                      P3__D_C_n   <=1'b1; 
                   P3__ADS_n   <=1'b0;
                  if (  P3__READY_n  ==1'b0) 
                      P3__State   <=  P3__StateT1P  ;
                   else  
                      P3__State   <=  P3__StateT2P  ;
                end  
              P3__StateT2I   :
                if (  P3__READY_n  ==1'b1&  P3__RequestPending  ==  P3__Pending  &  P3__HOLD  ==1'b0) 
                    P3__State   <=  P3__StateT2P  ;
                 else 
                   if (  P3__READY_n  ==1'b0&  P3__HOLD  ==1'b1) 
                       P3__State   <=  P3__StateTh  ;
                    else 
                      if (  P3__READY_n  ==1'b0&  P3__HOLD  ==1'b0&  P3__RequestPending  ==  P3__Pending  ) 
                          P3__State   <=  P3__StateT1  ;
                       else 
                         if (  P3__READY_n  ==1'b0&  P3__HOLD  ==1'b0&  P3__RequestPending  ==  P3__NotPending  ) 
                             P3__State   <=  P3__StateTi  ;
                          else  
                             P3__State   <=  P3__StateT2I  ;
            endcase 
       end
  
   reg[7:0]  P3__InstQueue  [15:0]; 
   reg[4:0]  P3__InstQueueRd_Addr  ; 
   reg[4:0]  P3__InstQueueWr_Addr  ; 
   integer  P3__InstAddrPointer  ; 
   integer  P3__PhyAddrPointer  ; 
   reg  P3__Extended  ; 
   reg  P3__More  ; 
   reg  P3__Flush  ; 
   reg[15:0]  P3__lWord  ; 
   reg[14:0]  P3__uWord  ; 
   integer  P3__fWord  ; 
   reg[3:0]  P3__State2  ; 
  always @(  posedge    P3__CLOCK          or  posedge   P3__RESET  )
       begin :  P3__P1  
         if (  P3__RESET  ==1'b1)
            begin  
               P3__State2   =  P3__Si  ; 
               P3__InstQueue[0]   = 0;
               P3__InstQueue[1]   = 0;
               P3__InstQueue[2]   = 0;
               P3__InstQueue[3]   = 0;
               P3__InstQueue[4]   = 0;
               P3__InstQueue[5]   = 0;
               P3__InstQueue[6]   = 0;
               P3__InstQueue[7]   = 0;
               P3__InstQueue[8]   = 0;
               P3__InstQueue[9]   = 0;
               P3__InstQueue[10]   = 0;
               P3__InstQueue[11]   = 0;
               P3__InstQueue[12]   = 0;
               P3__InstQueue[13]   = 0;
               P3__InstQueue[14]   = 0;
               P3__InstQueue[15]   = 0;
        
               P3__InstQueueRd_Addr   =0; 
               P3__InstQueueWr_Addr   =0; 
               P3__InstAddrPointer   =0; 
               P3__PhyAddrPointer   =0; 
               P3__Extended   =1'b0; 
               P3__More   =1'b0; 
               P3__Flush   =1'b0; 
               P3__lWord   =0; 
               P3__uWord   =0; 
               P3__fWord   =0; 
               P3__CodeFetch   <=1'b0; 
               P3__Datao   <=0; 
               P3__EAX   <=0; 
               P3__EBX   <=0; 
               P3__rEIP   <=0; 
               P3__ReadRequest   <=1'b0; 
               P3__MemoryFetch   <=1'b0; 
               P3__RequestPending   <=1'b0;
            end 
          else 
            case (  P3__State2  ) 
              P3__Si   :
                begin  
                   P3__PhyAddrPointer   =  P3__rEIP  ; 
                   P3__InstAddrPointer   =  P3__PhyAddrPointer  ; 
                   P3__State2   =  P3__S1  ; 
                   P3__rEIP   <=20'hFFFF0; 
                   P3__ReadRequest   <=1'b1; 
                   P3__MemoryFetch   <=1'b1; 
                   P3__RequestPending   <=1'b1;
                end  
              P3__S1   :
                begin  
                   P3__RequestPending   <=  P3__Pending  ; 
                   P3__ReadRequest   <=  P3__Pending  ; 
                   P3__MemoryFetch   <=  P3__Pending  ; 
                   P3__CodeFetch   <=  P3__Pending  ;
                  if (  P3__READY_n  ==1'b0) 
                      P3__State2   =  P3__S2  ;
                   else  
                      P3__State2   =  P3__S1  ;
                end  
              P3__S2   :
                begin  
                   P3__RequestPending   <=  P3__NotPending  ; 
                   P3__InstQueue   [  P3__InstQueueWr_Addr  ]=  P3__Datai  %(2**8); 
                   P3__InstQueueWr_Addr   =(  P3__InstQueueWr_Addr  +1)%16; 
                   P3__InstQueue   [  P3__InstQueueWr_Addr  ]=  P3__Datai  %2**8; 
                   P3__InstQueueWr_Addr   =(  P3__InstQueueWr_Addr  +1)%16;
                  if (  P3__StateBS16  ==1'b1)
                     begin  
                        P3__InstQueue   [  P3__InstQueueWr_Addr  ]=(  P3__Datai  /(2**16))%(2**8); 
                        P3__InstQueueWr_Addr   =(  P3__InstQueueWr_Addr  +1)%16; 
                        P3__InstQueue   [  P3__InstQueueWr_Addr  ]=(  P3__Datai  /(2**24))%(2**8); 
                        P3__InstQueueWr_Addr   =(  P3__InstQueueWr_Addr  +1)%16; 
                        P3__PhyAddrPointer   =  P3__PhyAddrPointer  +4; 
                        P3__State2   =  P3__S5  ;
                     end 
                   else 
                     begin  
                        P3__PhyAddrPointer   =  P3__PhyAddrPointer  +2;
                       if (  P3__PhyAddrPointer  <0) 
                           P3__rEIP   <=-  P3__PhyAddrPointer  ;
                        else  
                           P3__rEIP   <=  P3__PhyAddrPointer  ; 
                        P3__State2   =  P3__S3  ;
                     end 
                end  
              P3__S3   :
                begin  
                   P3__RequestPending   <=  P3__Pending  ;
                  if (  P3__READY_n  ==1'b0) 
                      P3__State2   =  P3__S4  ;
                   else  
                      P3__State2   =  P3__S3  ;
                end  
              P3__S4   :
                begin  
                   P3__RequestPending   <=  P3__NotPending  ; 
                   P3__InstQueue   [  P3__InstQueueWr_Addr  ]=  P3__Datai  %(2**8); 
                   P3__InstQueueWr_Addr   =(  P3__InstQueueWr_Addr  +1)%16; 
                   P3__InstQueue   [  P3__InstQueueWr_Addr  ]=  P3__Datai  %(2**8); 
                   P3__InstQueueWr_Addr   =(  P3__InstQueueWr_Addr  +1)%16; 
                   P3__PhyAddrPointer   =  P3__PhyAddrPointer  +2; 
                   P3__State2   =  P3__S5  ;
                end  
              P3__S5   :
                begin 
                  case (  P3__InstQueue  [  P3__InstQueueRd_Addr  ]) 
                    P3__NOP   :
                      begin  
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +1; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +1)%16; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end  
                    P3__OPsop   :
                      begin  
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +1; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +1)%16; 
                         P3__Extended   =1'b1; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end  
                    P3__JMP_rel_short   :
                      if ((  P3__InstQueueWr_Addr  -  P3__InstQueueRd_Addr  )>=3)
                         begin 
                           if (  P3__InstQueue  [(  P3__InstQueueRd_Addr  +1)%16]>127)
                              begin  
                                 P3__PhyAddrPointer   =  P3__InstAddrPointer  +1-(8'hFF-  P3__InstQueue  [(  P3__InstQueueRd_Addr  +1)%16]); 
                                 P3__InstAddrPointer   =  P3__PhyAddrPointer  ;
                              end 
                            else 
                              begin  
                                 P3__PhyAddrPointer   =  P3__InstAddrPointer  +2+  P3__InstQueue  [(  P3__InstQueueRd_Addr  +1)%16]; 
                                 P3__InstAddrPointer   =  P3__PhyAddrPointer  ;
                              end  
                            P3__Flush   =1'b1; 
                            P3__More   =1'b0;
                         end 
                       else 
                         begin  
                            P3__Flush   =1'b0; 
                            P3__More   =1'b1;
                         end  
                    P3__JMP_rel_near   :
                      if ((  P3__InstQueueWr_Addr  -  P3__InstQueueRd_Addr  )>=5)
                         begin  
                            P3__PhyAddrPointer   =  P3__InstAddrPointer  +5+  P3__InstQueue  [(  P3__InstQueueRd_Addr  +1)%16]; 
                            P3__InstAddrPointer   =  P3__PhyAddrPointer  ; 
                            P3__Flush   =1'b1; 
                            P3__More   =1'b0;
                         end 
                       else 
                         begin  
                            P3__Flush   =1'b0; 
                            P3__More   =1'b1;
                         end  
                    P3__JMP_intseg_immed   :
                      begin  
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +1; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +1)%16; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end  
                    P3__MOV_al_b   :
                      begin  
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +1; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +1)%16; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end  
                    P3__MOV_eax_dw   :
                      if ((  P3__InstQueueWr_Addr  -  P3__InstQueueRd_Addr  )>=5)
                         begin  
                            P3__EAX   <=  P3__InstQueue  [(  P3__InstQueueRd_Addr  +4)%16]*(2**23)+  P3__InstQueue  [(  P3__InstQueueRd_Addr  +3)%16]*(2**16)+  P3__InstQueue  [(  P3__InstQueueRd_Addr  +2)%16]*(2**8)+  P3__InstQueue  [(  P3__InstQueueRd_Addr  +1)%16]; 
                            P3__More   =1'b0; 
                            P3__Flush   =1'b0; 
                            P3__InstAddrPointer   =  P3__InstAddrPointer  +5; 
                            P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +5)%16;
                         end 
                       else 
                         begin  
                            P3__Flush   =1'b0; 
                            P3__More   =1'b1;
                         end  
                    P3__MOV_ebx_dw   :
                      if ((  P3__InstQueueWr_Addr  -  P3__InstQueueRd_Addr  )>=5)
                         begin  
                            P3__EBX   <=  P3__InstQueue  [(  P3__InstQueueRd_Addr  +4)%16]*(2**23)+  P3__InstQueue  [(  P3__InstQueueRd_Addr  +3)%16]*(2**16)+  P3__InstQueue  [(  P3__InstQueueRd_Addr  +2)%16]*(2**8)+  P3__InstQueue  [(  P3__InstQueueRd_Addr  +1)%1]; 
                            P3__More   =1'b0; 
                            P3__Flush   =1'b0; 
                            P3__InstAddrPointer   =  P3__InstAddrPointer  +5; 
                            P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +5)%16;
                         end 
                       else 
                         begin  
                            P3__Flush   =1'b0; 
                            P3__More   =1'b1;
                         end  
                    P3__MOV_eax_ebx   :
                      if ((  P3__InstQueueWr_Addr  -  P3__InstQueueRd_Addr  )>=2)
                         begin 
                           if (  P3__EBX  <0) 
                               P3__rEIP   <=-  P3__EBX  ;
                            else  
                               P3__rEIP   <=  P3__EBX  ; 
                            P3__RequestPending   <=  P3__Pending  ; 
                            P3__ReadRequest   <=  P3__Pending  ; 
                            P3__MemoryFetch   <=  P3__Pending  ; 
                            P3__CodeFetch   <=  P3__NotPending  ;
                           if (  P3__READY_n  ==1'b0)
                              begin  
                                 P3__RequestPending   <=  P3__NotPending  ; 
                                 P3__uWord   =  P3__Datai  %(2**15);
                                if (  P3__StateBS16  ==1'b1) 
                                    P3__lWord   =  P3__Datai  %(2**16);
                                 else 
                                   begin  
                                      P3__rEIP   <=  P3__rEIP  +2; 
                                      P3__RequestPending   <=  P3__Pending  ;
                                     if (  P3__READY_n  ==1'b0)
                                        begin  
                                           P3__RequestPending   <=  P3__NotPending  ; 
                                           P3__lWord   =  P3__Datai  %(2**16);
                                        end 
                                   end 
                                if (  P3__READY_n  ==1'b0)
                                   begin  
                                      P3__EAX   <=  P3__uWord  *(2**16)+  P3__lWord  ; 
                                      P3__More   =1'b0; 
                                      P3__Flush   =1'b0; 
                                      P3__InstAddrPointer   =  P3__InstAddrPointer  +2; 
                                      P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin  
                            P3__Flush   =1'b0; 
                            P3__More   =1'b1;
                         end  
                    P3__MOV_ebx_eax   :
                      if ((  P3__InstQueueWr_Addr  -  P3__InstQueueRd_Addr  )>=2)
                         begin 
                           if (  P3__EBX  <0) 
                               P3__rEIP   <=  P3__EBX  ;
                            else  
                               P3__rEIP   <=  P3__EBX  ; 
                            P3__lWord   =  P3__EAX  %(2**16); 
                            P3__uWord   =(  P3__EAX  /(2**16))%(2**15); 
                            P3__RequestPending   <=  P3__Pending  ; 
                            P3__ReadRequest   <=  P3__NotPending  ; 
                            P3__MemoryFetch   <=  P3__Pending  ; 
                            P3__CodeFetch   <=  P3__NotPending  ;
                           if (  P3__State  ==  P3__StateT1  |  P3__State  ==  P3__StateT1P  )
                              begin  
                                 P3__Datao   <=(  P3__uWord  *(2**16)+  P3__lWord  );
                                if (  P3__READY_n  ==1'b0)
                                   begin  
                                      P3__RequestPending   <=  P3__NotPending  ;
                                     if (  P3__StateBS16  ==1'b0)
                                        begin  
                                           P3__rEIP   <=  P3__rEIP  +2; 
                                           P3__RequestPending   <=  P3__Pending  ; 
                                           P3__ReadRequest   <=  P3__NotPending  ; 
                                           P3__MemoryFetch   <=  P3__Pending  ; 
                                           P3__CodeFetch   <=  P3__NotPending  ; 
                                           P3__State2   =  P3__S6  ;
                                        end  
                                      P3__More   =1'b0; 
                                      P3__Flush   =1'b0; 
                                      P3__InstAddrPointer   =  P3__InstAddrPointer  +2; 
                                      P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +2)%16;
                                   end 
                              end 
                         end 
                       else 
                         begin  
                            P3__Flush   =1'b0; 
                            P3__More   =1'b1;
                         end  
                    P3__IN_al   :
                      if ((  P3__InstQueueWr_Addr  -  P3__InstQueueRd_Addr  )>=2)
                         begin  
                            P3__rEIP   <=  P3__InstQueueRd_Addr  +1; 
                            P3__RequestPending   <=  P3__Pending  ; 
                            P3__ReadRequest   <=  P3__Pending  ; 
                            P3__MemoryFetch   <=  P3__NotPending  ; 
                            P3__CodeFetch   <=  P3__NotPending  ;
                           if (  P3__READY_n  ==1'b0)
                              begin  
                                 P3__RequestPending   <=  P3__NotPending  ; 
                                 P3__EAX   <=  P3__Datai  ; 
                                 P3__InstAddrPointer   =  P3__InstAddrPointer  +2; 
                                 P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +2); 
                                 P3__Flush   =1'b0; 
                                 P3__More   =1'b0;
                              end 
                         end 
                       else 
                         begin  
                            P3__Flush   =1'b0; 
                            P3__More   =1'b1;
                         end  
                    P3__OUT_al   :
                      if ((  P3__InstQueueWr_Addr  -  P3__InstQueueRd_Addr  )>=2)
                         begin  
                            P3__rEIP   <=  P3__InstQueueRd_Addr  +1; 
                            P3__RequestPending   <=  P3__Pending  ; 
                            P3__ReadRequest   <=  P3__NotPending  ; 
                            P3__MemoryFetch   <=  P3__NotPending  ; 
                            P3__CodeFetch   <=  P3__NotPending  ;
                           if (  P3__State  ==  P3__StateT1  |  P3__State  ==  P3__StateT1P  )
                              begin  
                                 P3__fWord   =  P3__EAX  %(2**16); 
                                 P3__Datao   <=  P3__fWord  ;
                                if (  P3__READY_n  ==1'b0)
                                   begin  
                                      P3__RequestPending   <=  P3__NotPending  ; 
                                      P3__InstAddrPointer   =  P3__InstAddrPointer  +2; 
                                      P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +2)%16; 
                                      P3__Flush   =1'b0; 
                                      P3__More   =1'b0;
                                   end 
                              end 
                         end 
                       else 
                         begin  
                            P3__Flush   =1'b0; 
                            P3__More   =1'b1;
                         end  
                    P3__ADD_al_b   :
                      begin  
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +1; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +1)%16; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end  
                    P3__ADD_ax_w   :
                      begin  
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +1; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +1)%16; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end  
                    P3__ROL_al_1   :
                      begin  
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +2; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +2)%16; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end  
                    P3__ROL_al_n   :
                      begin  
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +2; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +2)%16; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end  
                    P3__INC_eax   :
                      begin  
                         P3__EAX   <=  P3__EAX  +1; 
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +1; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +1)%16; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end  
                    P3__INC_ebx   :
                      begin  
                         P3__EBX   <=  P3__EBX  +1; 
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +1; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +1)%16; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end 
                   default :
                      begin  
                         P3__InstAddrPointer   =  P3__InstAddrPointer  +1; 
                         P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +1)%16; 
                         P3__Flush   =1'b0; 
                         P3__More   =1'b0;
                      end 
                  endcase 
                  if ((~(  P3__InstQueueRd_Addr  <  P3__InstQueueWr_Addr  ))|(((  P3__InstQueueLimit  -  P3__InstQueueRd_Addr  )<4)|  P3__Flush  |  P3__More  )) 
                      P3__State2   =  P3__S7  ;
                end  
              P3__S6   :
                begin  
                   P3__Datao   <=(  P3__uWord  *(2**16)+  P3__lWord  );
                  if (  P3__READY_n  ==1'b0)
                     begin  
                        P3__RequestPending   <=  P3__NotPending  ; 
                        P3__State2   =  P3__S5  ;
                     end 
                end  
              P3__S7   :
                begin 
                  if (  P3__Flush  )
                     begin  
                        P3__InstQueueRd_Addr   =1; 
                        P3__InstQueueWr_Addr   =1;
                       if (  P3__InstAddrPointer  <0) 
                           P3__fWord   =-  P3__InstAddrPointer  ;
                        else  
                           P3__fWord   =  P3__InstAddrPointer  ;
                       if (  P3__fWord  %2==1) 
                           P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +  P3__fWord  %4)%16;
                     end 
                  if ((  P3__InstQueueLimit  -  P3__InstQueueRd_Addr  )<3)
                     begin  
                        P3__State2   =  P3__S8  ; 
                        P3__InstQueueWr_Addr   =0;
                     end 
                   else  
                      P3__State2   =  P3__S9  ;
                end  
              P3__S8   :
                if (  P3__InstQueueRd_Addr  <=  P3__InstQueueLimit  )
                   begin  
                      P3__InstQueue   [  P3__InstQueueWr_Addr  ]=  P3__InstQueue  [  P3__InstQueueRd_Addr  ]; 
                      P3__InstQueueRd_Addr   =(  P3__InstQueueRd_Addr  +1)%16; 
                      P3__InstQueueWr_Addr   =(  P3__InstQueueWr_Addr  +1)%16; 
                      P3__State2   =  P3__S8  ;
                   end 
                 else 
                   begin  
                      P3__InstQueueRd_Addr   =0; 
                      P3__State2   =  P3__S9  ;
                   end  
              P3__S9   :
                begin  
                   P3__rEIP   <=  P3__PhyAddrPointer  ; 
                   P3__State2   =  P3__S1  ;
                end 
            endcase 
       end
  
  always @(  posedge    P3__CLOCK          or  posedge   P3__RESET  )
       begin :  P3__P2  
         if (  P3__RESET  ==1'b1)
            begin  
               P3__ByteEnable   <=4'b0000; 
               P3__NonAligned   <=1'b0;
            end 
          else 
            case (  P3__DataWidth  ) 
              P3__WidthByte   :
                case (  P3__rEIP  %4)
                 0 : 
                     P3__ByteEnable   <=4'b1110;
                 1 : 
                     P3__ByteEnable   <=4'b1101;
                 2 : 
                     P3__ByteEnable   <=4'b1011;
                 3 : 
                     P3__ByteEnable   <=4'b0111;
                 default :;
                endcase  
              P3__WidthWord   :
                case (  P3__rEIP  %4)
                 0 :
                    begin  
                       P3__ByteEnable   <=4'b1100; 
                       P3__NonAligned   <=  P3__NotPending  ;
                    end 
                 1 :
                    begin  
                       P3__ByteEnable   <=4'b1001; 
                       P3__NonAligned   <=  P3__NotPending  ;
                    end 
                 2 :
                    begin  
                       P3__ByteEnable   <=4'b0011; 
                       P3__NonAligned   <=  P3__NotPending  ;
                    end 
                 3 :
                    begin  
                       P3__ByteEnable   <=4'b0111; 
                       P3__NonAligned   <=  P3__Pending  ;
                    end 
                 default :;
                endcase  
              P3__WidthDword   :
                case (  P3__rEIP  %4)
                 0 :
                    begin  
                       P3__ByteEnable   <=4'b0000; 
                       P3__NonAligned   <=  P3__NotPending  ;
                    end 
                 1 :
                    begin  
                       P3__ByteEnable   <=4'b0001; 
                       P3__NonAligned   <=  P3__Pending  ;
                    end 
                 2 :
                    begin  
                       P3__NonAligned   <=  P3__Pending  ; 
                       P3__ByteEnable   <=4'b0011;
                    end 
                 3 :
                    begin  
                       P3__NonAligned   <=  P3__Pending  ; 
                       P3__ByteEnable   <=4'b0111;
                    end 
                 default :;
                endcase 
             default :;
            endcase 
       end
 
assign be1 = P1__BE_n;
assign addr1 = P1__Address;
assign wr1 = P1__W_R_n;
assign dc1 = P1__D_C_n;
assign mio1 = P1__M_IO_n;
assign ads1 = P1__ADS_n;
assign P1__Datai = di1;
assign do1 = P1__Datao;
assign P1__CLOCK = clock;
assign P1__NA_n = na;
assign P1__BS16_n = bs16;
assign P1__READY_n = rdy1;
assign P1__HOLD = hold;
assign P1__RESET = reset;
assign be2 = P2__BE_n;
assign addr2 = P2__Address;
assign wr2 = P2__W_R_n;
assign dc2 = P2__D_C_n;
assign mio2 = P2__M_IO_n;
assign ads2 = P2__ADS_n;
assign P2__Datai = di2;
assign do2 = P2__Datao;
assign P2__CLOCK = clock;
assign P2__NA_n = na;
assign P2__BS16_n = bs16;
assign P2__READY_n = rdy2;
assign P2__HOLD = hold;
assign P2__RESET = reset;
assign be3 = P3__BE_n;
assign addr3 = P3__Address;
assign wr3 = P3__W_R_n;
assign dc3 = P3__D_C_n;
assign mio3 = P3__M_IO_n;
assign ads3 = P3__ADS_n;
assign P3__Datai = di3;
assign do3 = P3__Datao;
assign P3__CLOCK = clock;
assign P3__NA_n = na;
assign P3__BS16_n = bs16;
assign P3__READY_n = rdy3;
assign P3__HOLD = hold;
assign P3__RESET = reset;
 
endmodule