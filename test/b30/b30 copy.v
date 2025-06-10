module b30 (
  input [6-1:0] a_bus,
  input clock,
  input cs,
  input [21-1:0] digital_input,
  input ds,
  input [3-1:0] fbk_pwm,
  input [6-1:0] inj_cmd,
  input in_speed,
  input [2-1:0] i_fbk,
  input [7-1:0] nssm_in,
  input reset,
  input rpm_in,
  input r_w,
  input seg_speed_hall,
  input seg_speed_pickup,
  input trg_knock1,
  input trg_knock2,
  input turbo_speed,
  input vehicle_speed,
  input [6-1:0] v_fbk,
  output cam_smot,
  output [7:0] digital_output,
  output [2-1:0] hlo,
  output in_speed_lev,
  output irq,
  output [2-1:0] knock1,
  output knock1u,
  output [2-1:0] knock2,
  output knock2u,
  output relpot,
  output rpm_out,
  output seg_speed_lev,
  output smot60,
  output [6-1:0] t1,
  output [6-1:0] t2,
  output [2-1:0] t3,
  output turbo,
  output turbo_speed_lev,
  output vehicle,
  output [16-1:0] d_bus_ext) ; 
  
wire [6-1:0] instance_inj_ctrl__a_bus;
wire  instance_inj_ctrl__clock;
wire  instance_inj_ctrl__cs;
wire [21-1:0] instance_inj_ctrl__digital_input;
wire  instance_inj_ctrl__ds;
wire [3-1:0] instance_inj_ctrl__fbk_pwm;
wire [6-1:0] instance_inj_ctrl__inj_cmd;
wire  instance_inj_ctrl__in_speed;
wire [2-1:0] instance_inj_ctrl__i_fbk;
wire [7-1:0] instance_inj_ctrl__nssm_in;
wire  instance_inj_ctrl__rpm_in;
wire  instance_inj_ctrl__rst;
wire  instance_inj_ctrl__r_w;
wire  instance_inj_ctrl__seg_speed_hall;
wire  instance_inj_ctrl__seg_speed_pickup;
wire  instance_inj_ctrl__trg_knock1;
wire  instance_inj_ctrl__trg_knock2;
wire  instance_inj_ctrl__turbo_speed;
wire  instance_inj_ctrl__vehicle_speed;
wire [6-1:0] instance_inj_ctrl__v_fbk;
wire  instance_inj_ctrl__cam_smot;
wire [7:0] instance_inj_ctrl__digital_output;
wire [2-1:0] instance_inj_ctrl__hlo;
wire  instance_inj_ctrl__in_speed_lev;
wire  instance_inj_ctrl__irq;
wire [2-1:0] instance_inj_ctrl__knock1;
wire  instance_inj_ctrl__knock1u;
wire [2-1:0] instance_inj_ctrl__knock2;
wire  instance_inj_ctrl__knock2u;
wire  instance_inj_ctrl__relpot;
wire  instance_inj_ctrl__rpm_out;
wire  instance_inj_ctrl__seg_speed_lev;
wire  instance_inj_ctrl__smot60;
wire [6-1:0] instance_inj_ctrl__t1;
wire [6-1:0] instance_inj_ctrl__t2;
wire [2-1:0] instance_inj_ctrl__t3;
wire  instance_inj_ctrl__turbo;
wire  instance_inj_ctrl__turbo_speed_lev;
wire  instance_inj_ctrl__vehicle;
wire [16-1:0] instance_inj_ctrl__d_bus_ext;
 
   wire[3-1:0]  instance_inj_ctrl__inj_cmd_034  ; 
   wire  instance_inj_ctrl__i_fbk_034  ; 
   wire[8-1:0]  instance_inj_ctrl__r_t1  ; 
   wire[7-1:0]  instance_inj_ctrl__r_t2  ; 
   wire[8-1:0]  instance_inj_ctrl__r_t3_034  ; 
   wire[7-1:0]  instance_inj_ctrl__r_t4_034  ; 
   wire[10-1:0]  instance_inj_ctrl__r_tb_034  ; 
   wire[12-1:0]  instance_inj_ctrl__r_th_034  ; 
   wire[7-1:0]  instance_inj_ctrl__r_tonh  ; 
   wire[7-1:0]  instance_inj_ctrl__r_tonl  ; 
   wire[7-1:0]  instance_inj_ctrl__r_tp  ; 
   wire[11-1:0]  instance_inj_ctrl__status_reg_034  ; 
   wire[3-1:0]  instance_inj_ctrl__test_en_034  ; 
   wire[3-1:0]  instance_inj_ctrl__v_fbk_034  ; 
   wire  instance_inj_ctrl__en_fbk_store_034  ; 
   wire  instance_inj_ctrl__en_state_store_034  ; 
   wire  instance_inj_ctrl__error1  ; 
   wire[7-1:0]  instance_inj_ctrl__global_state_034  ; 
   wire  instance_inj_ctrl__hl_034  ; 
   wire  instance_inj_ctrl__relpot1  ; 
   wire  instance_inj_ctrl__t1_0  ; 
   wire  instance_inj_ctrl__t1_3  ; 
   wire  instance_inj_ctrl__t1_4  ; 
   wire  instance_inj_ctrl__t2_0  ; 
   wire  instance_inj_ctrl__t2_3  ; 
   wire  instance_inj_ctrl__t2_4  ; 
   wire  instance_inj_ctrl__t3_034  ; 
   wire[3-1:0]  instance_inj_ctrl__inj_cmd_125  ; 
   wire  instance_inj_ctrl__i_fbk_125  ; 
   wire[8-1:0]  instance_inj_ctrl__r_t3_125  ; 
   wire[7-1:0]  instance_inj_ctrl__r_t4_125  ; 
   wire[10-1:0]  instance_inj_ctrl__r_tb_125  ; 
   wire[12-1:0]  instance_inj_ctrl__r_th_125  ; 
   wire[11-1:0]  instance_inj_ctrl__status_reg_125  ; 
   wire[3-1:0]  instance_inj_ctrl__test_en_125  ; 
   wire[3-1:0]  instance_inj_ctrl__v_fbk_125  ; 
   wire  instance_inj_ctrl__en_fbk_store_125  ; 
   wire  instance_inj_ctrl__en_state_store_125  ; 
   wire  instance_inj_ctrl__error2  ; 
   wire[7-1:0]  instance_inj_ctrl__global_state_125  ; 
   wire  instance_inj_ctrl__hl_125  ; 
   wire  instance_inj_ctrl__relpot2  ; 
   wire  instance_inj_ctrl__t1_1  ; 
   wire  instance_inj_ctrl__t1_2  ; 
   wire  instance_inj_ctrl__t1_5  ; 
   wire  instance_inj_ctrl__t2_1  ; 
   wire  instance_inj_ctrl__t2_2  ; 
   wire  instance_inj_ctrl__t2_5  ; 
   wire  instance_inj_ctrl__t3_125  ; 
   wire  instance_inj_ctrl__rd_en  ; 
   wire  instance_inj_ctrl__wr_en  ; 
   wire[16-1:0]  instance_inj_ctrl__d_bus  ; 
   wire[2-1:0]  instance_inj_ctrl__i_fbk_f  ; 
   wire[6-1:0]  instance_inj_ctrl__v_fbk_f  ; 
   wire  instance_inj_ctrl__rel_pot_en  ; 
   wire  instance_inj_ctrl__pickup_hall  ; 
   wire  instance_inj_ctrl__smot_camme_en  ; 
   wire  instance_inj_ctrl__trg_knock_en  ; 
   wire  instance_inj_ctrl__clock_internal  ;  
  
wire  instance_inj_ctrl__instance_block_034__clock;
wire [3-1:0] instance_inj_ctrl__instance_block_034__inj_cmd;
wire  instance_inj_ctrl__instance_block_034__i_fbk;
wire  instance_inj_ctrl__instance_block_034__rst;
wire [8-1:0] instance_inj_ctrl__instance_block_034__r_t1;
wire [7-1:0] instance_inj_ctrl__instance_block_034__r_t2;
wire [8-1:0] instance_inj_ctrl__instance_block_034__r_t3;
wire [7-1:0] instance_inj_ctrl__instance_block_034__r_t4;
wire [10-1:0] instance_inj_ctrl__instance_block_034__r_tb;
wire [12-1:0] instance_inj_ctrl__instance_block_034__r_th;
wire [7-1:0] instance_inj_ctrl__instance_block_034__r_tonh;
wire [7-1:0] instance_inj_ctrl__instance_block_034__r_tonl;
wire [7-1:0] instance_inj_ctrl__instance_block_034__r_tp;
wire [11-1:0] instance_inj_ctrl__instance_block_034__status_reg;
wire [3-1:0] instance_inj_ctrl__instance_block_034__test_en;
wire [3-1:0] instance_inj_ctrl__instance_block_034__v_fbk;
wire  instance_inj_ctrl__instance_block_034__en_fbk_store;
wire  instance_inj_ctrl__instance_block_034__en_state_store;
wire  instance_inj_ctrl__instance_block_034__error;
wire [7-1:0] instance_inj_ctrl__instance_block_034__global_state_store;
wire  instance_inj_ctrl__instance_block_034__hl;
wire  instance_inj_ctrl__instance_block_034__relpot;
wire  instance_inj_ctrl__instance_block_034__t1a;
wire  instance_inj_ctrl__instance_block_034__t1b;
wire  instance_inj_ctrl__instance_block_034__t1c;
wire  instance_inj_ctrl__instance_block_034__t2a;
wire  instance_inj_ctrl__instance_block_034__t2b;
wire  instance_inj_ctrl__instance_block_034__t2c;
wire  instance_inj_ctrl__instance_block_034__t3;
wire  instance_inj_ctrl__instance_block_125__clock;
wire [3-1:0] instance_inj_ctrl__instance_block_125__inj_cmd;
wire  instance_inj_ctrl__instance_block_125__i_fbk;
wire  instance_inj_ctrl__instance_block_125__rst;
wire [8-1:0] instance_inj_ctrl__instance_block_125__r_t1;
wire [7-1:0] instance_inj_ctrl__instance_block_125__r_t2;
wire [8-1:0] instance_inj_ctrl__instance_block_125__r_t3;
wire [7-1:0] instance_inj_ctrl__instance_block_125__r_t4;
wire [10-1:0] instance_inj_ctrl__instance_block_125__r_tb;
wire [12-1:0] instance_inj_ctrl__instance_block_125__r_th;
wire [7-1:0] instance_inj_ctrl__instance_block_125__r_tonh;
wire [7-1:0] instance_inj_ctrl__instance_block_125__r_tonl;
wire [7-1:0] instance_inj_ctrl__instance_block_125__r_tp;
wire [11-1:0] instance_inj_ctrl__instance_block_125__status_reg;
wire [3-1:0] instance_inj_ctrl__instance_block_125__test_en;
wire [3-1:0] instance_inj_ctrl__instance_block_125__v_fbk;
wire  instance_inj_ctrl__instance_block_125__en_fbk_store;
wire  instance_inj_ctrl__instance_block_125__en_state_store;
wire  instance_inj_ctrl__instance_block_125__error;
wire [7-1:0] instance_inj_ctrl__instance_block_125__global_state_store;
wire  instance_inj_ctrl__instance_block_125__hl;
wire  instance_inj_ctrl__instance_block_125__relpot;
wire  instance_inj_ctrl__instance_block_125__t1a;
wire  instance_inj_ctrl__instance_block_125__t1b;
wire  instance_inj_ctrl__instance_block_125__t1c;
wire  instance_inj_ctrl__instance_block_125__t2a;
wire  instance_inj_ctrl__instance_block_125__t2b;
wire  instance_inj_ctrl__instance_block_125__t2c;
wire  instance_inj_ctrl__instance_block_125__t3;
 
   wire  instance_inj_ctrl__instance_block_034__cs8  ; 
   wire  instance_inj_ctrl__instance_block_034__end_t0  ; 
   wire  instance_inj_ctrl__instance_block_034__cs4  ; 
   wire[7-1:0]  instance_inj_ctrl__instance_block_034__chop_count  ; 
   wire[12-1:0]  instance_inj_ctrl__instance_block_034__count  ; 
   wire[12-1:0]  instance_inj_ctrl__instance_block_034__stop_count_bus  ; 
   wire  instance_inj_ctrl__instance_block_034__comp  ; 
   wire  instance_inj_ctrl__instance_block_034__cs1  ; 
   wire[3-1:0]  instance_inj_ctrl__instance_block_034__cmd_stored  ; 
   wire  instance_inj_ctrl__instance_block_034__end_on  ; 
   wire  instance_inj_ctrl__instance_block_034__end_period  ; 
   wire  instance_inj_ctrl__instance_block_034__sh_mode  ; 
   wire  instance_inj_ctrl__instance_block_034__t4_0  ; 
   wire  instance_inj_ctrl__instance_block_034__test_en_cur  ; 
   wire  instance_inj_ctrl__instance_block_034__th_0  ; 
   wire  instance_inj_ctrl__instance_block_034__v_fbk_cur  ; 
   wire[3-1:0]  instance_inj_ctrl__instance_block_034__v_fbk_mask  ; 
   wire[4-1:0]  instance_inj_ctrl__instance_block_034__cs0  ; 
   wire  instance_inj_ctrl__instance_block_034__cs2  ; 
   wire  instance_inj_ctrl__instance_block_034__t1  ; 
   wire  instance_inj_ctrl__instance_block_034__t2  ; 
   wire[7-1:0]  instance_inj_ctrl__instance_block_034__ton_reg  ; 
   wire[7-1:0]  instance_inj_ctrl__instance_block_034__tp_reg  ;  
  
wire  instance_inj_ctrl__instance_block_034__instance_anti_glitch__clock;
wire  instance_inj_ctrl__instance_block_034__instance_anti_glitch__cs8;
wire  instance_inj_ctrl__instance_block_034__instance_anti_glitch__rst;
wire  instance_inj_ctrl__instance_block_034__instance_anti_glitch__end_t0;
wire  instance_inj_ctrl__instance_block_125__instance_anti_glitch__clock;
wire  instance_inj_ctrl__instance_block_125__instance_anti_glitch__cs8;
wire  instance_inj_ctrl__instance_block_125__instance_anti_glitch__rst;
wire  instance_inj_ctrl__instance_block_125__instance_anti_glitch__end_t0;
 
   reg[2:0]  instance_inj_ctrl__instance_block_034__instance_anti_glitch__counter  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_anti_glitch__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_anti_glitch__rst  )
       begin :  instance_inj_ctrl__instance_block_034__instance_anti_glitch__vhdl_count  
         if (  instance_inj_ctrl__instance_block_034__instance_anti_glitch__rst  ==1'b0) 
             instance_inj_ctrl__instance_block_034__instance_anti_glitch__counter   <=3'b000;
          else 
            begin 
              if (  instance_inj_ctrl__instance_block_034__instance_anti_glitch__cs8  ==1'b1) 
                  instance_inj_ctrl__instance_block_034__instance_anti_glitch__counter   <=3'b000;
               else  
                  instance_inj_ctrl__instance_block_034__instance_anti_glitch__counter   <=  instance_inj_ctrl__instance_block_034__instance_anti_glitch__counter  +3'b001;
            end 
       end
  
  assign   instance_inj_ctrl__instance_block_034__instance_anti_glitch__end_t0  =  instance_inj_ctrl__instance_block_034__instance_anti_glitch__counter  [0]&  instance_inj_ctrl__instance_block_034__instance_anti_glitch__counter  [1]&  instance_inj_ctrl__instance_block_034__instance_anti_glitch__counter  [2];
  
  
wire  instance_inj_ctrl__instance_block_034__instance_chopper_count__clock;
wire  instance_inj_ctrl__instance_block_034__instance_chopper_count__cs4;
wire  instance_inj_ctrl__instance_block_034__instance_chopper_count__rst;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_chopper_count__chop_count;
wire  instance_inj_ctrl__instance_block_125__instance_chopper_count__clock;
wire  instance_inj_ctrl__instance_block_125__instance_chopper_count__cs4;
wire  instance_inj_ctrl__instance_block_125__instance_chopper_count__rst;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_chopper_count__chop_count;
 
   reg[7-1:0]  instance_inj_ctrl__instance_block_034__instance_chopper_count__int_counter  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_chopper_count__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_chopper_count__rst  )
       begin :  instance_inj_ctrl__instance_block_034__instance_chopper_count__vhdl_chopper_count  
         if (  instance_inj_ctrl__instance_block_034__instance_chopper_count__rst  ==1'b0) 
             instance_inj_ctrl__instance_block_034__instance_chopper_count__int_counter   <={7{1'b0}};
          else 
            begin 
              if (  instance_inj_ctrl__instance_block_034__instance_chopper_count__cs4  ==1'b1) 
                  instance_inj_ctrl__instance_block_034__instance_chopper_count__int_counter   <={7{1'b0}};
               else  
                  instance_inj_ctrl__instance_block_034__instance_chopper_count__int_counter   <=  instance_inj_ctrl__instance_block_034__instance_chopper_count__int_counter  +7'b0000001;
            end 
       end
  
  assign   instance_inj_ctrl__instance_block_034__instance_chopper_count__chop_count  =  instance_inj_ctrl__instance_block_034__instance_chopper_count__int_counter  ;
  
  
wire [12-1:0] instance_inj_ctrl__instance_block_034__instance_comparator__count;
wire [12-1:0] instance_inj_ctrl__instance_block_034__instance_comparator__stop_count_bus;
reg  instance_inj_ctrl__instance_block_034__instance_comparator__comp;
wire [12-1:0] instance_inj_ctrl__instance_block_125__instance_comparator__count;
wire [12-1:0] instance_inj_ctrl__instance_block_125__instance_comparator__stop_count_bus;
reg  instance_inj_ctrl__instance_block_125__instance_comparator__comp;
 
  always @(    instance_inj_ctrl__instance_block_034__instance_comparator__count            or    instance_inj_ctrl__instance_block_034__instance_comparator__stop_count_bus   )
       begin :  instance_inj_ctrl__instance_block_034__instance_comparator__vhdl_comparator  
         if (  instance_inj_ctrl__instance_block_034__instance_comparator__count  ==  instance_inj_ctrl__instance_block_034__instance_comparator__stop_count_bus  ) 
             instance_inj_ctrl__instance_block_034__instance_comparator__comp   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_034__instance_comparator__comp   <=1'b0;
       end
 
  
  
wire  instance_inj_ctrl__instance_block_034__instance_counter__clock;
wire  instance_inj_ctrl__instance_block_034__instance_counter__cs1;
wire  instance_inj_ctrl__instance_block_034__instance_counter__rst;
wire [12-1:0] instance_inj_ctrl__instance_block_034__instance_counter__count;
wire  instance_inj_ctrl__instance_block_125__instance_counter__clock;
wire  instance_inj_ctrl__instance_block_125__instance_counter__cs1;
wire  instance_inj_ctrl__instance_block_125__instance_counter__rst;
wire [12-1:0] instance_inj_ctrl__instance_block_125__instance_counter__count;
 
   reg[12-1:0]  instance_inj_ctrl__instance_block_034__instance_counter__int_counter  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_counter__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_counter__rst  )
       begin :  instance_inj_ctrl__instance_block_034__instance_counter__vhdl_counter  
         if (  instance_inj_ctrl__instance_block_034__instance_counter__rst  ==1'b0) 
             instance_inj_ctrl__instance_block_034__instance_counter__int_counter   <={12{1'b0}};
          else 
            begin 
              if (  instance_inj_ctrl__instance_block_034__instance_counter__cs1  ==1'b1) 
                  instance_inj_ctrl__instance_block_034__instance_counter__int_counter   <={12{1'b0}};
               else  
                  instance_inj_ctrl__instance_block_034__instance_counter__int_counter   <=  instance_inj_ctrl__instance_block_034__instance_counter__int_counter  +11'b00000000001;
            end 
       end
  
  assign   instance_inj_ctrl__instance_block_034__instance_counter__count  =  instance_inj_ctrl__instance_block_034__instance_counter__int_counter  ;
  
  
wire  instance_inj_ctrl__instance_block_034__instance_fsm__clock;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__cmd_stored;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__comp;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__end_on;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__end_period;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__end_t0;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__inj_cmd;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__i_fbk;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__rst;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__sh_mode;
wire [11-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__status_reg;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__t4_0;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__test_en_cur;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__th_0;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__v_fbk_cur;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__v_fbk_mask;
wire [4-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__cs0;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__cs1;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__cs2;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__cs4;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__cs8;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__en_fbk_store;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__en_state_store;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__error;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__global_state_store;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__hl;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__relpot;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__t1;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__t2;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__t3;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__clock;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__cmd_stored;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__comp;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__end_on;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__end_period;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__end_t0;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__inj_cmd;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__i_fbk;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__rst;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__sh_mode;
wire [11-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__status_reg;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__t4_0;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__test_en_cur;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__th_0;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__v_fbk_cur;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__v_fbk_mask;
wire [4-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__cs0;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__cs1;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__cs2;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__cs4;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__cs8;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__en_fbk_store;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__en_state_store;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__error;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__global_state_store;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__hl;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__relpot;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__t1;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__t2;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__t3;
 
   wire[7-1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__global_state  ; 
   wire  instance_inj_ctrl__instance_block_034__instance_fsm__enable_check  ; 
   wire[5-1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__cur_state  ; 
   wire  instance_inj_ctrl__instance_block_034__instance_fsm__cs11  ; 
   wire  instance_inj_ctrl__instance_block_034__instance_fsm__global1_state  ; 
   wire  instance_inj_ctrl__instance_block_034__instance_fsm__cs111  ; 
   wire  instance_inj_ctrl__instance_block_034__instance_fsm__t31  ; 
   wire[2-1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__global2_state  ; 
   wire  instance_inj_ctrl__instance_block_034__instance_fsm__cs42  ; 
   wire  instance_inj_ctrl__instance_block_034__instance_fsm__t12  ; 
   wire[2-1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__global4_state  ; 
   wire  instance_inj_ctrl__instance_block_034__instance_fsm__cs44  ; 
   wire  instance_inj_ctrl__instance_block_034__instance_fsm__t14  ; 
   wire  instance_inj_ctrl__instance_block_034__instance_fsm__en_fbk_store_internal  ;  
  
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__clock;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__rst;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__test_en_cur;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__enable_check;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__en_fbk_store;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__en_state_store;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state_store;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__clock;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__rst;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__test_en_cur;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__enable_check;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__en_fbk_store;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__en_state_store;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state_store;
 
   reg[6:0]  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state_store_int  ; 
   reg[3-1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__delay_counter  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__rst  )
       if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__rst  ==1'b0) 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state_store_int   <=7'b0000000;
        else  
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state_store_int   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state  ;
 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__rst  )
       if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__rst  ==1'b0) 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__delay_counter   <=3'b000;
        else 
          begin 
            if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state_store_int  !=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state  ) 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__delay_counter   <=3'b000;
             else 
               if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__delay_counter  [2]==1'b0) 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__delay_counter   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__delay_counter  +3'b001;
          end
  
  always @(      instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__delay_counter      [2]          or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__test_en_cur            or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state           or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state_store_int   )
       begin 
         if ((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__delay_counter  [2]==1'b1)&(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__test_en_cur  ==1'b1)&(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state  ==  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state_store_int  )) 
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__enable_check   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__enable_check   <=1'b0;
         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state_store_int  !=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state  )
            begin 
              if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state  [6:5]!=2'b11)
                 begin  
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__en_state_store   <=1'b1; 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__en_fbk_store   <=1'b1;
                 end 
               else 
                 begin  
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__en_state_store   <=1'b0; 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__en_fbk_store   <=1'b1;
                 end 
            end 
          else 
            begin  
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__en_state_store   <=1'b0; 
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__en_fbk_store   <=1'b0;
            end 
       end
  
  assign   instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state_store  =  instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state  ;
  
  
wire [5-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__en_fbk_store;
wire [4-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs0;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__error;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__relpot;
wire [5-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__en_fbk_store;
wire [4-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs0;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__error;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__relpot;
 
  assign   instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__relpot  =  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state  [4]&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state  [3]&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state  [2]&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state  [0]; 
  assign   instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs0  =  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state  [4:1]; 
  assign   instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__error  =  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state  [4]&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state  [3]&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state  [2]&(~(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__en_fbk_store  )); 
  always @(   instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state   )
       case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state  )
        5'b00000: 
            instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b00010: 
            instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b00100: 
            instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b00110: 
            instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b01000: 
            instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b01010: 
            instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b01100: 
            instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b01110: 
            instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b11000: 
            instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        default : 
            instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11   <=1'b0;
       endcase
 
  
  
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__clock;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__cmd_stored;
wire [5-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__cur_state;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__end_t0;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__inj_cmd;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__rst;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__global1_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__clock;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__cmd_stored;
wire [5-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__cur_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__end_t0;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__inj_cmd;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__rst;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__global1_state;
 
   reg[1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__current_state  ; 
   reg[1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__rst  )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__clocked  
         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__current_state   <=  0  ; 
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__global1_state   <=1'b0;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__current_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__next_state  ;
              case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__next_state  ) 
                0   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__global1_state   <=1'b0; 
                0   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__global1_state   <=1'b1;
               default :;
              endcase 
            end 
       end
  
  always @(         instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__current_state                      or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__clock               or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__cmd_stored              or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__cur_state             or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__end_t0            or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__inj_cmd           or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__rst   )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__set_next_state   
          instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__current_state  ;
         case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__current_state  ) 
           0   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__end_t0  ==1'b1&(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__inj_cmd  ==  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__cmd_stored  )&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__cur_state  ==5'b00001) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__next_state   <=  0  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__cur_state  !=5'b00001) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__next_state   <=  0  ; 
           0   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__cur_state  !=5'b00001) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__next_state   <=  0  ;
          default :;
         endcase 
       end
 
  
  
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__global1_state;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__cs111;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__t31;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__global1_state;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__cs111;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__t31;
 
  always @(   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__global1_state   )
       if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__global1_state  ==1'b1)
          begin  
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__t31   <=1'b1; 
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__cs111   <=1'b0;
          end 
        else 
          begin  
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__t31   <=1'b0; 
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__cs111   <=1'b1;
          end
 
  
  
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__clock;
wire [5-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__cur_state;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__end_on;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__end_period;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__i_fbk;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__rst;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__sh_mode;
reg [2-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__global2_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__clock;
wire [5-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__cur_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__end_on;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__end_period;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__i_fbk;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__rst;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__sh_mode;
reg [2-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__global2_state;
 
   reg[1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__current_state  ; 
   reg[1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__rst  )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__clocked  
         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__current_state   <=  0  ; 
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__global2_state   <=2'b01;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__current_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state  ;
              case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state  ) 
                0   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__global2_state   <=2'b01; 
                1   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__global2_state   <=2'b10; 
                2   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__global2_state   <=2'b11; 
                3   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__global2_state   <=2'b00;
               default :;
              endcase 
            end 
       end
  
  always @(          instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__current_state                        or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__clock                or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__cur_state               or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__end_on              or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__end_period             or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__i_fbk            or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__rst           or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__sh_mode   )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__set_next_state   
          instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__current_state  ;
         case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__current_state  ) 
           1   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__cur_state  ==5'b00101&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__i_fbk  ==1'b1)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__end_on  ==1'b1))) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state   <=  1  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__cur_state  !=5'b00101) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state   <=  1  ; 
           1   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__cur_state  ==5'b00101) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state   <=  2  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__cur_state  !=5'b00101) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state   <=  1  ; 
           2   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__cur_state  ==5'b00101&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__i_fbk  ==1'b0)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__end_period  ==1'b1))) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state   <=  3  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__cur_state  !=5'b00101) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state   <=  1  ; 
           3   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__next_state   <=  1  ;
          default :;
         endcase 
       end
 
  
  
wire [2-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__global2_state;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__cs42;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__t12;
wire [2-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__global2_state;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__cs42;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__t12;
 
  always @(   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__global2_state   )
       begin 
         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__global2_state  ==2'b00) 
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__cs42   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__cs42   <=1'b0;
         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__global2_state  [1]==1'b1) 
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__t12   <=1'b0;
          else  
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__t12   <=1'b1;
       end
 
  
  
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__clock;
wire [5-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__end_on;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__end_period;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__i_fbk;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__rst;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode;
reg [2-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__global4_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__clock;
wire [5-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__end_on;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__end_period;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__i_fbk;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__rst;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode;
reg [2-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__global4_state;
 
   reg[1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__current_state  ; 
   reg[1:0]  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__rst  )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__clocked  
         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__current_state   <=  0  ; 
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__global4_state   <=2'b01;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__current_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state  ;
              case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state  ) 
                0   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__global4_state   <=2'b01; 
                1   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__global4_state   <=2'b10; 
                2   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__global4_state   <=2'b11; 
                3   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__global4_state   <=2'b00;
               default :;
              endcase 
            end 
       end
  
  always @(          instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__current_state                        or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__clock                or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state               or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__end_on              or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__end_period             or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__i_fbk            or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__rst           or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode   )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__set_next_state   
          instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__current_state  ;
         case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__current_state  ) 
           0   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  ==5'b01001&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__i_fbk  ==1'b1)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__end_on  ==1'b1))) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state   <=  1  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  !=5'b01001&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  !=5'b11001) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state   <=  0  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  ==5'b11001&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__i_fbk  ==1'b1)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__end_on  ==1'b1))) 
                       instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state   <=  1  ; 
           1   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  ==5'b01001|  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  ==5'b11001) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state   <=  2  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  !=5'b01001&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  !=5'b11001) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state   <=  0  ; 
           2   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  ==5'b01001&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__i_fbk  ==1'b0)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__end_period  ==1'b1))) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state   <=  3  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  !=5'b01001&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  !=5'b11001) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state   <=  0  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state  ==5'b11001&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__i_fbk  ==1'b0)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__end_period  ==1'b1))) 
                       instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state   <=  3  ; 
           3   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__next_state   <=  0  ;
          default :;
         endcase 
       end
 
  
  
wire [2-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__global4_state;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__cs44;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__t14;
wire [2-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__global4_state;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__cs44;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__t14;
 
  always @(   instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__global4_state   )
       begin 
         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__global4_state  ==2'b00) 
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__cs44   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__cs44   <=1'b0;
         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__global4_state  [1]==1'b1) 
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__t14   <=1'b0;
          else  
             instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__t14   <=1'b1;
       end
 
  
  
wire [5-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__cur_state;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t12;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t14;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t31;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3;
wire [5-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__cur_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t12;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t14;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t31;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3;
 
  always @(      instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t31                or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t12            or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t14           or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__cur_state   )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__vhdl_sel_actuator  
         case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__cur_state  )
          5'b00000:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b00001:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t31  ;
             end 
          5'b00010:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b1;
             end 
          5'b00011:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b1;
             end 
          5'b00100:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b00101:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t12  ; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b00110:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b00111:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01000:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01001:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t14  ; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01010:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01011:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01100:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01101:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01110:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01111:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b11000:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b11001:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t14  ; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b11100:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b11101:
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          default :
             begin  
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
         endcase 
       end
 
  
  
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs42;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs44;
wire [5-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cur_state;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs4;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs42;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs44;
wire [5-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cur_state;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs4;
 
  always @(     instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs42              or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs44           or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cur_state   )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__vhdl_sel_chop_control  
         case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cur_state  )
          5'b00101: 
              instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs4   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs42  ;
          5'b01001: 
              instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs4   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs44  ;
          5'b11001: 
              instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs4   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs44  ;
          default : 
              instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs4   <=1'b1;
         endcase 
       end
 
  
  
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs11;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs111;
wire [5-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cur_state;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__global1_state;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs1;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs2;
reg  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs8;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs11;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs111;
wire [5-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cur_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__global1_state;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs1;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs2;
reg  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs8;
 
  always @(      instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs11                or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs111            or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cur_state           or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__global1_state   )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__vhdl_sel_glob_count_cs  
         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cur_state  ==5'b00001)
            begin  
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs1   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs111  ;
              if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__global1_state  ==1'b0) 
                  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs2   <=1'b1;
               else  
                  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs2   <=1'b0; 
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs8   <=1'b0;
            end 
          else 
            if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cur_state  ==5'b00000)
               begin  
                  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs1   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs11  ; 
                  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs2   <=1'b1; 
                  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs8   <=1'b1;
               end 
             else 
               begin  
                  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs1   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs11  ; 
                  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs2   <=1'b0; 
                  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs8   <=1'b1;
               end 
       end
 
  
  
wire [5-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__cur_state;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global1_state;
wire [2-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global2_state;
wire [2-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global4_state;
reg [7-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global_state;
wire [5-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__cur_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global1_state;
wire [2-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global2_state;
wire [2-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global4_state;
reg [7-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global_state;
 
  always @(      instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__cur_state                or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global1_state            or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global2_state           or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global4_state   )
       begin  
          instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global_state   [6:2]<=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__cur_state  ;
         case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__cur_state  )
          5'b00001: 
              instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global_state   [1:0]<={1'b0,  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global1_state  };
          5'b00101: 
              instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global_state   [1:0]<=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global2_state  ;
          5'b01001: 
              instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global_state   [1:0]<=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global4_state  ;
          5'b11001: 
              instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global_state   [1:0]<=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global4_state  ;
          default : 
              instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global_state   [1:0]<=2'b00;
         endcase 
       end
 
  
  
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__clock;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cmd_stored;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__end_t0;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__inj_cmd;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__i_fbk;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__rst;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__sh_mode;
wire [11-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__status_reg;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__t4_0;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__th_0;
wire  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_mask;
reg [5-1:0] instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__clock;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cmd_stored;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__end_t0;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__inj_cmd;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__i_fbk;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__rst;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__sh_mode;
wire [11-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__status_reg;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__t4_0;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__th_0;
wire  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_mask;
reg [5-1:0] instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state;
 
   reg[4:0]  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__current_state  ; 
   reg[4:0]  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__rst  )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__clocked  
         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__current_state   <=  0  ; 
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b00000;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__current_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state  ;
              case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state  ) 
                0   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b00000; 
                1   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b00011; 
                2   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b00101; 
                3   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b00111; 
                4   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b01001; 
                5   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b01011; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph1_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b00001; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b11100; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b11101; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int1_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b00010; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int_2_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b00100; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int3_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b00110; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int4_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b01000; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int5_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b01010; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int6_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b01100; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph6_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b01101; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int7_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b01110; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph7_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b01111; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int8_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b11000; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph8_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b11001; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int9_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b01010; 
                instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph9_state   : 
                   instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state   <=5'b01011;
               default :;
              endcase 
            end 
       end
  
  always @(                  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__current_state                                        or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__clock                        or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cmd_stored                       or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp                      or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check                     or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__end_t0                    or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state                   or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__inj_cmd                  or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__i_fbk                 or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__rst                or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__sh_mode               or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__status_reg              or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__t4_0             or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__th_0            or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur           or    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_mask   )
       begin :  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__set_next_state   
          instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__current_state  ;
         case (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__current_state  ) 
           0   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__inj_cmd  !=3'b000&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_mask  ==3'b000) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph1_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__inj_cmd  !=3'b000&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_mask  !=3'b000&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph1_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__inj_cmd  !=3'b000&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_mask  !=3'b000&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ; 
           1   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int_2_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                       instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int_2_state  ; 
           2   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int3_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state  ;
                    else 
                      if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                          instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int3_state  ; 
           3   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__th_0  ==1'b0) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int4_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__th_0  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1) 
                       instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int5_state  ;
                    else 
                      if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__th_0  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                          instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int4_state  ;
                       else 
                         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__th_0  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                             instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int5_state  ; 
           4   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int5_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ;
                    else 
                      if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                          instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int5_state  ; 
           5   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__t4_0  ==1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  0  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__t4_0  ==1'b0) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int6_state  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph1_state   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__i_fbk  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__sh_mode  ==1'b1)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__sh_mode  ==1'b0))) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int1_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [0]==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__i_fbk  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ;
                    else 
                      if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__inj_cmd  !=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cmd_stored  &  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [0]==1'b0) 
                          instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  0  ;
                       else 
                         if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0|((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__i_fbk  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__sh_mode  ==1'b1)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__sh_mode  ==1'b0)))&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                             instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int1_state  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__status_reg  ==11'b00000000000) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  0  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__status_reg  ==11'b00000000000) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  0  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int1_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  1  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int_2_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  2  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int3_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  3  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int4_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  4  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int5_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  5  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int6_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph6_state  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph6_state   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int7_state  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int7_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph7_state  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph7_state   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int8_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int8_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int8_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph8_state  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph8_state   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int9_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1)|(  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))) 
                    instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int9_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state  ;
                    else 
                      if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                          instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_int9_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph9_state  ; 
           instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__state_progression_state_type_ph9_state   :
             if (  instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp  ==1'b1) 
                 instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__next_state   <=  0  ;
          default :;
         endcase 
       end
 
 
  assign   instance_inj_ctrl__instance_block_034__instance_fsm__en_fbk_store  =  instance_inj_ctrl__instance_block_034__instance_fsm__en_fbk_store_internal  ;
  
  
wire  instance_inj_ctrl__instance_block_034__instance_internal_register__clock;
wire [4-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__cs0;
wire  instance_inj_ctrl__instance_block_034__instance_internal_register__cs2;
wire  instance_inj_ctrl__instance_block_034__instance_internal_register__rst;
wire [8-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__r_t1;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__r_t2;
wire [8-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__r_t3;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__r_t4;
wire [10-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__r_tb;
wire [12-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__r_th;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__r_tonh;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__r_tonl;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__r_tp;
wire  instance_inj_ctrl__instance_block_034__instance_internal_register__sh_mode;
wire [12-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus;
wire  instance_inj_ctrl__instance_block_034__instance_internal_register__t4_0;
wire  instance_inj_ctrl__instance_block_034__instance_internal_register__th_0;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_internal_register__tp_reg;
wire  instance_inj_ctrl__instance_block_125__instance_internal_register__clock;
wire [4-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__cs0;
wire  instance_inj_ctrl__instance_block_125__instance_internal_register__cs2;
wire  instance_inj_ctrl__instance_block_125__instance_internal_register__rst;
wire [8-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__r_t1;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__r_t2;
wire [8-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__r_t3;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__r_t4;
wire [10-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__r_tb;
wire [12-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__r_th;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__r_tonh;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__r_tonl;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__r_tp;
wire  instance_inj_ctrl__instance_block_125__instance_internal_register__sh_mode;
wire [12-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus;
wire  instance_inj_ctrl__instance_block_125__instance_internal_register__t4_0;
wire  instance_inj_ctrl__instance_block_125__instance_internal_register__th_0;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_internal_register__tp_reg;
 
   reg[12-1:0]  instance_inj_ctrl__instance_block_034__instance_internal_register__th  ; 
   reg[10-1:0]  instance_inj_ctrl__instance_block_034__instance_internal_register__tb  ; 
   reg[7-1:0]  instance_inj_ctrl__instance_block_034__instance_internal_register__tonh  ; 
   reg[7-1:0]  instance_inj_ctrl__instance_block_034__instance_internal_register__tonl  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_internal_register__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_internal_register__rst  )
       begin :  instance_inj_ctrl__instance_block_034__instance_internal_register__vhdl_internal_register  
         if (  instance_inj_ctrl__instance_block_034__instance_internal_register__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_block_034__instance_internal_register__tb   <={10{1'b0}}; 
               instance_inj_ctrl__instance_block_034__instance_internal_register__th   <={12{1'b0}}; 
               instance_inj_ctrl__instance_block_034__instance_internal_register__tonh   <={7{1'b0}}; 
               instance_inj_ctrl__instance_block_034__instance_internal_register__tonl   <={7{1'b0}};
            end 
          else 
            begin 
              if (  instance_inj_ctrl__instance_block_034__instance_internal_register__cs2  ==1'b1)
                 begin  
                    instance_inj_ctrl__instance_block_034__instance_internal_register__tb   <=  instance_inj_ctrl__instance_block_034__instance_internal_register__r_tb  ; 
                    instance_inj_ctrl__instance_block_034__instance_internal_register__th   <=  instance_inj_ctrl__instance_block_034__instance_internal_register__r_th  ; 
                    instance_inj_ctrl__instance_block_034__instance_internal_register__tonh   <=  instance_inj_ctrl__instance_block_034__instance_internal_register__r_tonh  ; 
                    instance_inj_ctrl__instance_block_034__instance_internal_register__tonl   <=  instance_inj_ctrl__instance_block_034__instance_internal_register__r_tonl  ;
                 end 
            end 
       end
  
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__tp_reg  =  instance_inj_ctrl__instance_block_034__instance_internal_register__r_tp  ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__sh_mode  =  instance_inj_ctrl__instance_block_034__instance_internal_register__tb  [9]; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__th_0  =(~(  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [0]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [1]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [2]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [3]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [4]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [5]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [6]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [7]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [8]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [9]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [10]|  instance_inj_ctrl__instance_block_034__instance_internal_register__th  [11])); 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__t4_0  =(~(  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t4  [6]|  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t4  [5]|  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t4  [4]|  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t4  [3])); 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0000) ? {5'b00000,  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t1  [7:1]}:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0000) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__tonh  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0001) ? {5'b00000,  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t1  [7:1]}:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0001) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__tonh  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0010) ? {3'b000,  instance_inj_ctrl__instance_block_034__instance_internal_register__tb  [8:0]}:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0010) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__tonh  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0011) ? {5'b00000,  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t2  }:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0011) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0100) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__th  :12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0100) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0101) ? {5'b00000,  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t1  [7:1]}:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0101) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0110) ? {4'b0000,  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t3  }:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0110) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0111) ? {3'b000,  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t1  ,1'b0}:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b0111) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b1100) ? {5'b00000,  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t4  }:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  ==4'b1100) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  [3:1]==3'b111) ? {4'b0000,  instance_inj_ctrl__instance_block_034__instance_internal_register__r_t1  }:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_034__instance_internal_register__cs0  [3:1]==3'b111) ?   instance_inj_ctrl__instance_block_034__instance_internal_register__tonl  :7'bZZZZZZZ;
  
  
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_on_comp__chop_count;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_on_comp__ton_reg;
reg  instance_inj_ctrl__instance_block_034__instance_on_comp__end_on;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_on_comp__chop_count;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_on_comp__ton_reg;
reg  instance_inj_ctrl__instance_block_125__instance_on_comp__end_on;
 
  always @(    instance_inj_ctrl__instance_block_034__instance_on_comp__chop_count            or    instance_inj_ctrl__instance_block_034__instance_on_comp__ton_reg   )
       begin :  instance_inj_ctrl__instance_block_034__instance_on_comp__vhdl_on_comp  
         if (  instance_inj_ctrl__instance_block_034__instance_on_comp__chop_count  ==  instance_inj_ctrl__instance_block_034__instance_on_comp__ton_reg  ) 
             instance_inj_ctrl__instance_block_034__instance_on_comp__end_on   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_034__instance_on_comp__end_on   <=1'b0;
       end
 
  
  
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_output_decoder__cmd_stored;
wire  instance_inj_ctrl__instance_block_034__instance_output_decoder__t1;
wire  instance_inj_ctrl__instance_block_034__instance_output_decoder__t2;
reg  instance_inj_ctrl__instance_block_034__instance_output_decoder__t1a;
reg  instance_inj_ctrl__instance_block_034__instance_output_decoder__t1b;
reg  instance_inj_ctrl__instance_block_034__instance_output_decoder__t1c;
reg  instance_inj_ctrl__instance_block_034__instance_output_decoder__t2a;
reg  instance_inj_ctrl__instance_block_034__instance_output_decoder__t2b;
reg  instance_inj_ctrl__instance_block_034__instance_output_decoder__t2c;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_output_decoder__cmd_stored;
wire  instance_inj_ctrl__instance_block_125__instance_output_decoder__t1;
wire  instance_inj_ctrl__instance_block_125__instance_output_decoder__t2;
reg  instance_inj_ctrl__instance_block_125__instance_output_decoder__t1a;
reg  instance_inj_ctrl__instance_block_125__instance_output_decoder__t1b;
reg  instance_inj_ctrl__instance_block_125__instance_output_decoder__t1c;
reg  instance_inj_ctrl__instance_block_125__instance_output_decoder__t2a;
reg  instance_inj_ctrl__instance_block_125__instance_output_decoder__t2b;
reg  instance_inj_ctrl__instance_block_125__instance_output_decoder__t2c;
 
  always @(     instance_inj_ctrl__instance_block_034__instance_output_decoder__cmd_stored              or    instance_inj_ctrl__instance_block_034__instance_output_decoder__t1           or    instance_inj_ctrl__instance_block_034__instance_output_decoder__t2   )
       begin :  instance_inj_ctrl__instance_block_034__instance_output_decoder__vhdl_output_decoder  
         case (  instance_inj_ctrl__instance_block_034__instance_output_decoder__cmd_stored  )
          3'b001:
             begin  
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1a   <=  instance_inj_ctrl__instance_block_034__instance_output_decoder__t1  ; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2a   <=  instance_inj_ctrl__instance_block_034__instance_output_decoder__t2  ; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1b   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2b   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1c   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2c   <=1'b0;
             end 
          3'b010:
             begin  
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1b   <=  instance_inj_ctrl__instance_block_034__instance_output_decoder__t1  ; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2b   <=  instance_inj_ctrl__instance_block_034__instance_output_decoder__t2  ; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1a   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2a   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1c   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2c   <=1'b0;
             end 
          3'b100:
             begin  
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1c   <=  instance_inj_ctrl__instance_block_034__instance_output_decoder__t1  ; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2c   <=  instance_inj_ctrl__instance_block_034__instance_output_decoder__t2  ; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1b   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2b   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1a   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2a   <=1'b0;
             end 
          default :
             begin  
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1a   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2a   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1b   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2b   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t1c   <=1'b0; 
                instance_inj_ctrl__instance_block_034__instance_output_decoder__t2c   <=1'b0;
             end 
         endcase 
       end
 
  
  
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_period_comp__chop_count;
wire [7-1:0] instance_inj_ctrl__instance_block_034__instance_period_comp__tp_reg;
reg  instance_inj_ctrl__instance_block_034__instance_period_comp__end_period;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_period_comp__chop_count;
wire [7-1:0] instance_inj_ctrl__instance_block_125__instance_period_comp__tp_reg;
reg  instance_inj_ctrl__instance_block_125__instance_period_comp__end_period;
 
  always @(    instance_inj_ctrl__instance_block_034__instance_period_comp__chop_count            or    instance_inj_ctrl__instance_block_034__instance_period_comp__tp_reg   )
       begin :  instance_inj_ctrl__instance_block_034__instance_period_comp__vhdl_period_comp  
         if (  instance_inj_ctrl__instance_block_034__instance_period_comp__chop_count  ==  instance_inj_ctrl__instance_block_034__instance_period_comp__tp_reg  ) 
             instance_inj_ctrl__instance_block_034__instance_period_comp__end_period   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_034__instance_period_comp__end_period   <=1'b0;
       end
 
  
  
wire  instance_inj_ctrl__instance_block_034__instance_sel_cmd__clock;
wire  instance_inj_ctrl__instance_block_034__instance_sel_cmd__cs2;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_sel_cmd__inj_cmd;
wire  instance_inj_ctrl__instance_block_034__instance_sel_cmd__rst;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_sel_cmd__cmd_stored;
reg  instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en_cur;
reg  instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_cur;
wire [3-1:0] instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_mask;
wire  instance_inj_ctrl__instance_block_125__instance_sel_cmd__clock;
wire  instance_inj_ctrl__instance_block_125__instance_sel_cmd__cs2;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_sel_cmd__inj_cmd;
wire  instance_inj_ctrl__instance_block_125__instance_sel_cmd__rst;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_sel_cmd__cmd_stored;
reg  instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en_cur;
reg  instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_cur;
wire [3-1:0] instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_mask;
 
   reg[2:0]  instance_inj_ctrl__instance_block_034__instance_sel_cmd__cmd_stored_int  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_034__instance_sel_cmd__clock          or  negedge   instance_inj_ctrl__instance_block_034__instance_sel_cmd__rst  )
       begin :  instance_inj_ctrl__instance_block_034__instance_sel_cmd__vhdl_sel_cmd  
         if (  instance_inj_ctrl__instance_block_034__instance_sel_cmd__rst  ==1'b0) 
             instance_inj_ctrl__instance_block_034__instance_sel_cmd__cmd_stored_int   <=3'b000;
          else 
            begin 
              if (  instance_inj_ctrl__instance_block_034__instance_sel_cmd__cs2  ==1'b1) 
                  instance_inj_ctrl__instance_block_034__instance_sel_cmd__cmd_stored_int   <=  instance_inj_ctrl__instance_block_034__instance_sel_cmd__inj_cmd  ;
            end 
       end
  
  always @(     instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk              or    instance_inj_ctrl__instance_block_034__instance_sel_cmd__cmd_stored_int           or    instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en   )
       case (  instance_inj_ctrl__instance_block_034__instance_sel_cmd__cmd_stored_int  )
        3'b001:
           begin  
              instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_cur   <=  instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk  [0]; 
              instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en_cur   <=  instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en  [0];
           end 
        3'b010:
           begin  
              instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_cur   <=  instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk  [1]; 
              instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en_cur   <=  instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en  [1];
           end 
        3'b100:
           begin  
              instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_cur   <=  instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk  [2]; 
              instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en_cur   <=  instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en  [2];
           end 
        default :
           begin  
              instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_cur   <=1'b0; 
              instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en_cur   <=1'b1;
           end 
       endcase
  
  assign   instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_mask  [0]=  instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk  [0]&  instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en  [0]; 
  assign   instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_mask  [1]=  instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk  [1]&  instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en  [1]; 
  assign   instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_mask  [2]=  instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk  [2]&  instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en  [2]; 
  assign   instance_inj_ctrl__instance_block_034__instance_sel_cmd__cmd_stored  =  instance_inj_ctrl__instance_block_034__instance_sel_cmd__cmd_stored_int  ;

  
  
 
   wire  instance_inj_ctrl__instance_block_125__cs8  ; 
   wire  instance_inj_ctrl__instance_block_125__end_t0  ; 
   wire  instance_inj_ctrl__instance_block_125__cs4  ; 
   wire[7-1:0]  instance_inj_ctrl__instance_block_125__chop_count  ; 
   wire[12-1:0]  instance_inj_ctrl__instance_block_125__count  ; 
   wire[12-1:0]  instance_inj_ctrl__instance_block_125__stop_count_bus  ; 
   wire  instance_inj_ctrl__instance_block_125__comp  ; 
   wire  instance_inj_ctrl__instance_block_125__cs1  ; 
   wire[3-1:0]  instance_inj_ctrl__instance_block_125__cmd_stored  ; 
   wire  instance_inj_ctrl__instance_block_125__end_on  ; 
   wire  instance_inj_ctrl__instance_block_125__end_period  ; 
   wire  instance_inj_ctrl__instance_block_125__sh_mode  ; 
   wire  instance_inj_ctrl__instance_block_125__t4_0  ; 
   wire  instance_inj_ctrl__instance_block_125__test_en_cur  ; 
   wire  instance_inj_ctrl__instance_block_125__th_0  ; 
   wire  instance_inj_ctrl__instance_block_125__v_fbk_cur  ; 
   wire[3-1:0]  instance_inj_ctrl__instance_block_125__v_fbk_mask  ; 
   wire[4-1:0]  instance_inj_ctrl__instance_block_125__cs0  ; 
   wire  instance_inj_ctrl__instance_block_125__cs2  ; 
   wire  instance_inj_ctrl__instance_block_125__t1  ; 
   wire  instance_inj_ctrl__instance_block_125__t2  ; 
   wire[7-1:0]  instance_inj_ctrl__instance_block_125__ton_reg  ; 
   wire[7-1:0]  instance_inj_ctrl__instance_block_125__tp_reg  ;  
  
 
   reg[2:0]  instance_inj_ctrl__instance_block_125__instance_anti_glitch__counter  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_anti_glitch__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_anti_glitch__rst  )
       begin :  instance_inj_ctrl__instance_block_125__instance_anti_glitch__vhdl_count  
         if (  instance_inj_ctrl__instance_block_125__instance_anti_glitch__rst  ==1'b0) 
             instance_inj_ctrl__instance_block_125__instance_anti_glitch__counter   <=3'b000;
          else 
            begin 
              if (  instance_inj_ctrl__instance_block_125__instance_anti_glitch__cs8  ==1'b1) 
                  instance_inj_ctrl__instance_block_125__instance_anti_glitch__counter   <=3'b000;
               else  
                  instance_inj_ctrl__instance_block_125__instance_anti_glitch__counter   <=  instance_inj_ctrl__instance_block_125__instance_anti_glitch__counter  +3'b001;
            end 
       end
  
  assign   instance_inj_ctrl__instance_block_125__instance_anti_glitch__end_t0  =  instance_inj_ctrl__instance_block_125__instance_anti_glitch__counter  [0]&  instance_inj_ctrl__instance_block_125__instance_anti_glitch__counter  [1]&  instance_inj_ctrl__instance_block_125__instance_anti_glitch__counter  [2];
assign instance_inj_ctrl__instance_block_034__instance_anti_glitch__clock = instance_inj_ctrl__instance_block_034__clock;
assign instance_inj_ctrl__instance_block_034__instance_anti_glitch__cs8 = instance_inj_ctrl__instance_block_034__cs8;
assign instance_inj_ctrl__instance_block_034__instance_anti_glitch__rst = instance_inj_ctrl__instance_block_034__rst;
assign instance_inj_ctrl__instance_block_034__end_t0 = instance_inj_ctrl__instance_block_034__instance_anti_glitch__end_t0;
assign instance_inj_ctrl__instance_block_125__instance_anti_glitch__clock = instance_inj_ctrl__instance_block_125__clock;
assign instance_inj_ctrl__instance_block_125__instance_anti_glitch__cs8 = instance_inj_ctrl__instance_block_125__cs8;
assign instance_inj_ctrl__instance_block_125__instance_anti_glitch__rst = instance_inj_ctrl__instance_block_125__rst;
assign instance_inj_ctrl__instance_block_125__end_t0 = instance_inj_ctrl__instance_block_125__instance_anti_glitch__end_t0;
  
  
 
   reg[7-1:0]  instance_inj_ctrl__instance_block_125__instance_chopper_count__int_counter  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_chopper_count__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_chopper_count__rst  )
       begin :  instance_inj_ctrl__instance_block_125__instance_chopper_count__vhdl_chopper_count  
         if (  instance_inj_ctrl__instance_block_125__instance_chopper_count__rst  ==1'b0) 
             instance_inj_ctrl__instance_block_125__instance_chopper_count__int_counter   <={7{1'b0}};
          else 
            begin 
              if (  instance_inj_ctrl__instance_block_125__instance_chopper_count__cs4  ==1'b1) 
                  instance_inj_ctrl__instance_block_125__instance_chopper_count__int_counter   <={7{1'b0}};
               else  
                  instance_inj_ctrl__instance_block_125__instance_chopper_count__int_counter   <=  instance_inj_ctrl__instance_block_125__instance_chopper_count__int_counter  +7'b0000001;
            end 
       end
  
  assign   instance_inj_ctrl__instance_block_125__instance_chopper_count__chop_count  =  instance_inj_ctrl__instance_block_125__instance_chopper_count__int_counter  ;
assign instance_inj_ctrl__instance_block_034__instance_chopper_count__clock = instance_inj_ctrl__instance_block_034__clock;
assign instance_inj_ctrl__instance_block_034__instance_chopper_count__cs4 = instance_inj_ctrl__instance_block_034__cs4;
assign instance_inj_ctrl__instance_block_034__instance_chopper_count__rst = instance_inj_ctrl__instance_block_034__rst;
assign instance_inj_ctrl__instance_block_034__chop_count = instance_inj_ctrl__instance_block_034__instance_chopper_count__chop_count;
assign instance_inj_ctrl__instance_block_125__instance_chopper_count__clock = instance_inj_ctrl__instance_block_125__clock;
assign instance_inj_ctrl__instance_block_125__instance_chopper_count__cs4 = instance_inj_ctrl__instance_block_125__cs4;
assign instance_inj_ctrl__instance_block_125__instance_chopper_count__rst = instance_inj_ctrl__instance_block_125__rst;
assign instance_inj_ctrl__instance_block_125__chop_count = instance_inj_ctrl__instance_block_125__instance_chopper_count__chop_count;
  
  
 
  always @(    instance_inj_ctrl__instance_block_125__instance_comparator__count            or    instance_inj_ctrl__instance_block_125__instance_comparator__stop_count_bus   )
       begin :  instance_inj_ctrl__instance_block_125__instance_comparator__vhdl_comparator  
         if (  instance_inj_ctrl__instance_block_125__instance_comparator__count  ==  instance_inj_ctrl__instance_block_125__instance_comparator__stop_count_bus  ) 
             instance_inj_ctrl__instance_block_125__instance_comparator__comp   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_125__instance_comparator__comp   <=1'b0;
       end
 
assign instance_inj_ctrl__instance_block_034__instance_comparator__count = instance_inj_ctrl__instance_block_034__count;
assign instance_inj_ctrl__instance_block_034__instance_comparator__stop_count_bus = instance_inj_ctrl__instance_block_034__stop_count_bus;
assign instance_inj_ctrl__instance_block_034__comp = instance_inj_ctrl__instance_block_034__instance_comparator__comp;
assign instance_inj_ctrl__instance_block_125__instance_comparator__count = instance_inj_ctrl__instance_block_125__count;
assign instance_inj_ctrl__instance_block_125__instance_comparator__stop_count_bus = instance_inj_ctrl__instance_block_125__stop_count_bus;
assign instance_inj_ctrl__instance_block_125__comp = instance_inj_ctrl__instance_block_125__instance_comparator__comp;
  
  
 
   reg[12-1:0]  instance_inj_ctrl__instance_block_125__instance_counter__int_counter  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_counter__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_counter__rst  )
       begin :  instance_inj_ctrl__instance_block_125__instance_counter__vhdl_counter  
         if (  instance_inj_ctrl__instance_block_125__instance_counter__rst  ==1'b0) 
             instance_inj_ctrl__instance_block_125__instance_counter__int_counter   <={12{1'b0}};
          else 
            begin 
              if (  instance_inj_ctrl__instance_block_125__instance_counter__cs1  ==1'b1) 
                  instance_inj_ctrl__instance_block_125__instance_counter__int_counter   <={12{1'b0}};
               else  
                  instance_inj_ctrl__instance_block_125__instance_counter__int_counter   <=  instance_inj_ctrl__instance_block_125__instance_counter__int_counter  +11'b00000000001;
            end 
       end
  
  assign   instance_inj_ctrl__instance_block_125__instance_counter__count  =  instance_inj_ctrl__instance_block_125__instance_counter__int_counter  ;
assign instance_inj_ctrl__instance_block_034__instance_counter__clock = instance_inj_ctrl__instance_block_034__clock;
assign instance_inj_ctrl__instance_block_034__instance_counter__cs1 = instance_inj_ctrl__instance_block_034__cs1;
assign instance_inj_ctrl__instance_block_034__instance_counter__rst = instance_inj_ctrl__instance_block_034__rst;
assign instance_inj_ctrl__instance_block_034__count = instance_inj_ctrl__instance_block_034__instance_counter__count;
assign instance_inj_ctrl__instance_block_125__instance_counter__clock = instance_inj_ctrl__instance_block_125__clock;
assign instance_inj_ctrl__instance_block_125__instance_counter__cs1 = instance_inj_ctrl__instance_block_125__cs1;
assign instance_inj_ctrl__instance_block_125__instance_counter__rst = instance_inj_ctrl__instance_block_125__rst;
assign instance_inj_ctrl__instance_block_125__count = instance_inj_ctrl__instance_block_125__instance_counter__count;
  
  
 
   wire[7-1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__global_state  ; 
   wire  instance_inj_ctrl__instance_block_125__instance_fsm__enable_check  ; 
   wire[5-1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__cur_state  ; 
   wire  instance_inj_ctrl__instance_block_125__instance_fsm__cs11  ; 
   wire  instance_inj_ctrl__instance_block_125__instance_fsm__global1_state  ; 
   wire  instance_inj_ctrl__instance_block_125__instance_fsm__cs111  ; 
   wire  instance_inj_ctrl__instance_block_125__instance_fsm__t31  ; 
   wire[2-1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__global2_state  ; 
   wire  instance_inj_ctrl__instance_block_125__instance_fsm__cs42  ; 
   wire  instance_inj_ctrl__instance_block_125__instance_fsm__t12  ; 
   wire[2-1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__global4_state  ; 
   wire  instance_inj_ctrl__instance_block_125__instance_fsm__cs44  ; 
   wire  instance_inj_ctrl__instance_block_125__instance_fsm__t14  ; 
   wire  instance_inj_ctrl__instance_block_125__instance_fsm__en_fbk_store_internal  ;  
  
 
   reg[6:0]  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state_store_int  ; 
   reg[3-1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__delay_counter  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__rst  )
       if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__rst  ==1'b0) 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state_store_int   <=7'b0000000;
        else  
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state_store_int   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state  ;
 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__rst  )
       if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__rst  ==1'b0) 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__delay_counter   <=3'b000;
        else 
          begin 
            if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state_store_int  !=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state  ) 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__delay_counter   <=3'b000;
             else 
               if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__delay_counter  [2]==1'b0) 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__delay_counter   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__delay_counter  +3'b001;
          end
  
  always @(      instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__delay_counter      [2]          or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__test_en_cur            or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state           or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state_store_int   )
       begin 
         if ((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__delay_counter  [2]==1'b1)&(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__test_en_cur  ==1'b1)&(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state  ==  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state_store_int  )) 
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__enable_check   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__enable_check   <=1'b0;
         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state_store_int  !=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state  )
            begin 
              if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state  [6:5]!=2'b11)
                 begin  
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__en_state_store   <=1'b1; 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__en_fbk_store   <=1'b1;
                 end 
               else 
                 begin  
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__en_state_store   <=1'b0; 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__en_fbk_store   <=1'b1;
                 end 
            end 
          else 
            begin  
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__en_state_store   <=1'b0; 
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__en_fbk_store   <=1'b0;
            end 
       end
  
  assign   instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state_store  =  instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state  ;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__clock = instance_inj_ctrl__instance_block_034__instance_fsm__clock;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state = instance_inj_ctrl__instance_block_034__instance_fsm__global_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__rst = instance_inj_ctrl__instance_block_034__instance_fsm__rst;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__test_en_cur = instance_inj_ctrl__instance_block_034__instance_fsm__test_en_cur;
assign instance_inj_ctrl__instance_block_034__instance_fsm__enable_check = instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__enable_check;
assign instance_inj_ctrl__instance_block_034__instance_fsm__en_fbk_store_internal = instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__en_fbk_store;
assign instance_inj_ctrl__instance_block_034__instance_fsm__en_state_store = instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__en_state_store;
assign instance_inj_ctrl__instance_block_034__instance_fsm__global_state_store = instance_inj_ctrl__instance_block_034__instance_fsm__instance_enable_fbk_chk__global_state_store;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__clock = instance_inj_ctrl__instance_block_125__instance_fsm__clock;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state = instance_inj_ctrl__instance_block_125__instance_fsm__global_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__rst = instance_inj_ctrl__instance_block_125__instance_fsm__rst;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__test_en_cur = instance_inj_ctrl__instance_block_125__instance_fsm__test_en_cur;
assign instance_inj_ctrl__instance_block_125__instance_fsm__enable_check = instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__enable_check;
assign instance_inj_ctrl__instance_block_125__instance_fsm__en_fbk_store_internal = instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__en_fbk_store;
assign instance_inj_ctrl__instance_block_125__instance_fsm__en_state_store = instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__en_state_store;
assign instance_inj_ctrl__instance_block_125__instance_fsm__global_state_store = instance_inj_ctrl__instance_block_125__instance_fsm__instance_enable_fbk_chk__global_state_store;
  
  
 
  assign   instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__relpot  =  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state  [4]&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state  [3]&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state  [2]&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state  [0]; 
  assign   instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs0  =  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state  [4:1]; 
  assign   instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__error  =  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state  [4]&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state  [3]&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state  [2]&(~(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__en_fbk_store  )); 
  always @(   instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state   )
       case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state  )
        5'b00000: 
            instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b00010: 
            instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b00100: 
            instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b00110: 
            instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b01000: 
            instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b01010: 
            instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b01100: 
            instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b01110: 
            instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        5'b11000: 
            instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11   <=1'b1;
        default : 
            instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11   <=1'b0;
       endcase
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cur_state = instance_inj_ctrl__instance_block_034__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__en_fbk_store = instance_inj_ctrl__instance_block_034__instance_fsm__en_fbk_store_internal;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cs0 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs0;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cs11 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__cs11;
assign instance_inj_ctrl__instance_block_034__instance_fsm__error = instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__error;
assign instance_inj_ctrl__instance_block_034__instance_fsm__relpot = instance_inj_ctrl__instance_block_034__instance_fsm__instance_fsm_output_handle__relpot;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cur_state = instance_inj_ctrl__instance_block_125__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__en_fbk_store = instance_inj_ctrl__instance_block_125__instance_fsm__en_fbk_store_internal;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cs0 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs0;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cs11 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__cs11;
assign instance_inj_ctrl__instance_block_125__instance_fsm__error = instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__error;
assign instance_inj_ctrl__instance_block_125__instance_fsm__relpot = instance_inj_ctrl__instance_block_125__instance_fsm__instance_fsm_output_handle__relpot;
  
  
 
   reg[1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__current_state  ; 
   reg[1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__rst  )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__clocked  
         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__current_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__ph1_handle_state_type_ph1_1_state  ; 
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__global1_state   <=1'b0;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__current_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__next_state  ;
              case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__next_state  ) 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__ph1_handle_state_type_ph1_1_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__global1_state   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__ph1_handle_state_type_ph1_2_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__global1_state   <=1'b1;
               default :;
              endcase 
            end 
       end
  
  always @(         instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__current_state                      or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__clock               or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__cmd_stored              or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__cur_state             or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__end_t0            or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__inj_cmd           or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__rst   )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__set_next_state   
          instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__current_state  ;
         case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__current_state  ) 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__ph1_handle_state_type_ph1_1_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__end_t0  ==1'b1&(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__inj_cmd  ==  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__cmd_stored  )&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__cur_state  ==5'b00001) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__ph1_handle_state_type_ph1_2_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__cur_state  !=5'b00001) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__ph1_handle_state_type_ph1_1_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__ph1_handle_state_type_ph1_2_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__cur_state  !=5'b00001) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__ph1_handle_state_type_ph1_1_state  ;
          default :;
         endcase 
       end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__clock = instance_inj_ctrl__instance_block_034__instance_fsm__clock;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__cmd_stored = instance_inj_ctrl__instance_block_034__instance_fsm__cmd_stored;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__cur_state = instance_inj_ctrl__instance_block_034__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__end_t0 = instance_inj_ctrl__instance_block_034__instance_fsm__end_t0;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__inj_cmd = instance_inj_ctrl__instance_block_034__instance_fsm__inj_cmd;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__rst = instance_inj_ctrl__instance_block_034__instance_fsm__rst;
assign instance_inj_ctrl__instance_block_034__instance_fsm__global1_state = instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_handle__global1_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__clock = instance_inj_ctrl__instance_block_125__instance_fsm__clock;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__cmd_stored = instance_inj_ctrl__instance_block_125__instance_fsm__cmd_stored;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__cur_state = instance_inj_ctrl__instance_block_125__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__end_t0 = instance_inj_ctrl__instance_block_125__instance_fsm__end_t0;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__inj_cmd = instance_inj_ctrl__instance_block_125__instance_fsm__inj_cmd;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__rst = instance_inj_ctrl__instance_block_125__instance_fsm__rst;
assign instance_inj_ctrl__instance_block_125__instance_fsm__global1_state = instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_handle__global1_state;
  
  
 
  always @(   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__global1_state   )
       if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__global1_state  ==1'b1)
          begin  
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__t31   <=1'b1; 
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__cs111   <=1'b0;
          end 
        else 
          begin  
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__t31   <=1'b0; 
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__cs111   <=1'b1;
          end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__global1_state = instance_inj_ctrl__instance_block_034__instance_fsm__global1_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cs111 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__cs111;
assign instance_inj_ctrl__instance_block_034__instance_fsm__t31 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph1_output_handle__t31;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__global1_state = instance_inj_ctrl__instance_block_125__instance_fsm__global1_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cs111 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__cs111;
assign instance_inj_ctrl__instance_block_125__instance_fsm__t31 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph1_output_handle__t31;
  
  
 
   reg[1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__current_state  ; 
   reg[1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__rst  )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__clocked  
         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__current_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_1_state  ; 
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__global2_state   <=2'b01;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__current_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state  ;
              case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state  ) 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_1_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__global2_state   <=2'b01; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_2_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__global2_state   <=2'b10; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_3_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__global2_state   <=2'b11; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_4_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__global2_state   <=2'b00;
               default :;
              endcase 
            end 
       end
  
  always @(          instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__current_state                        or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__clock                or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__cur_state               or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__end_on              or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__end_period             or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__i_fbk            or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__rst           or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__sh_mode   )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__set_next_state   
          instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__current_state  ;
         case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__current_state  ) 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_1_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__cur_state  ==5'b00101&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__i_fbk  ==1'b1)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__end_on  ==1'b1))) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_2_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__cur_state  !=5'b00101) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_1_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_2_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__cur_state  ==5'b00101) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_3_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__cur_state  !=5'b00101) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_1_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_3_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__cur_state  ==5'b00101&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__i_fbk  ==1'b0)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__end_period  ==1'b1))) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_4_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__cur_state  !=5'b00101) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_1_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_4_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__ph2_handle_state_type_ph2_1_state  ;
          default :;
         endcase 
       end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__clock = instance_inj_ctrl__instance_block_034__instance_fsm__clock;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__cur_state = instance_inj_ctrl__instance_block_034__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__end_on = instance_inj_ctrl__instance_block_034__instance_fsm__end_on;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__end_period = instance_inj_ctrl__instance_block_034__instance_fsm__end_period;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__i_fbk = instance_inj_ctrl__instance_block_034__instance_fsm__i_fbk;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__rst = instance_inj_ctrl__instance_block_034__instance_fsm__rst;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__sh_mode = instance_inj_ctrl__instance_block_034__instance_fsm__sh_mode;
assign instance_inj_ctrl__instance_block_034__instance_fsm__global2_state = instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_handle__global2_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__clock = instance_inj_ctrl__instance_block_125__instance_fsm__clock;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__cur_state = instance_inj_ctrl__instance_block_125__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__end_on = instance_inj_ctrl__instance_block_125__instance_fsm__end_on;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__end_period = instance_inj_ctrl__instance_block_125__instance_fsm__end_period;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__i_fbk = instance_inj_ctrl__instance_block_125__instance_fsm__i_fbk;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__rst = instance_inj_ctrl__instance_block_125__instance_fsm__rst;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__sh_mode = instance_inj_ctrl__instance_block_125__instance_fsm__sh_mode;
assign instance_inj_ctrl__instance_block_125__instance_fsm__global2_state = instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_handle__global2_state;
  
  
 
  always @(   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__global2_state   )
       begin 
         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__global2_state  ==2'b00) 
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__cs42   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__cs42   <=1'b0;
         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__global2_state  [1]==1'b1) 
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__t12   <=1'b0;
          else  
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__t12   <=1'b1;
       end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__global2_state = instance_inj_ctrl__instance_block_034__instance_fsm__global2_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cs42 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__cs42;
assign instance_inj_ctrl__instance_block_034__instance_fsm__t12 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph2_output_handle__t12;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__global2_state = instance_inj_ctrl__instance_block_125__instance_fsm__global2_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cs42 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__cs42;
assign instance_inj_ctrl__instance_block_125__instance_fsm__t12 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph2_output_handle__t12;
  
  
 
   reg[1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__current_state  ; 
   reg[1:0]  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__rst  )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__clocked  
         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__current_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_1_state  ; 
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__global4_state   <=2'b01;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__current_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state  ;
              case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state  ) 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_1_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__global4_state   <=2'b01; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_2_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__global4_state   <=2'b10; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_3_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__global4_state   <=2'b11; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_4_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__global4_state   <=2'b00;
               default :;
              endcase 
            end 
       end
  
  always @(          instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__current_state                        or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__clock                or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state               or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__end_on              or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__end_period             or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__i_fbk            or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__rst           or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode   )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__set_next_state   
          instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__current_state  ;
         case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__current_state  ) 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_1_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  ==5'b01001&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__i_fbk  ==1'b1)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__end_on  ==1'b1))) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_2_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  !=5'b01001&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  !=5'b11001) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_1_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  ==5'b11001&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__i_fbk  ==1'b1)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__end_on  ==1'b1))) 
                       instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_2_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_2_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  ==5'b01001|  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  ==5'b11001) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_3_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  !=5'b01001&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  !=5'b11001) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_1_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_3_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  ==5'b01001&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__i_fbk  ==1'b0)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__end_period  ==1'b1))) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_4_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  !=5'b01001&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  !=5'b11001) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_1_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state  ==5'b11001&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__i_fbk  ==1'b0)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__end_period  ==1'b1))) 
                       instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_4_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_4_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__ph4_handle_state_type_ph4_1_state  ;
          default :;
         endcase 
       end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__clock = instance_inj_ctrl__instance_block_034__instance_fsm__clock;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__cur_state = instance_inj_ctrl__instance_block_034__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__end_on = instance_inj_ctrl__instance_block_034__instance_fsm__end_on;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__end_period = instance_inj_ctrl__instance_block_034__instance_fsm__end_period;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__i_fbk = instance_inj_ctrl__instance_block_034__instance_fsm__i_fbk;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__rst = instance_inj_ctrl__instance_block_034__instance_fsm__rst;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__sh_mode = instance_inj_ctrl__instance_block_034__instance_fsm__sh_mode;
assign instance_inj_ctrl__instance_block_034__instance_fsm__global4_state = instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_handle__global4_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__clock = instance_inj_ctrl__instance_block_125__instance_fsm__clock;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__cur_state = instance_inj_ctrl__instance_block_125__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__end_on = instance_inj_ctrl__instance_block_125__instance_fsm__end_on;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__end_period = instance_inj_ctrl__instance_block_125__instance_fsm__end_period;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__i_fbk = instance_inj_ctrl__instance_block_125__instance_fsm__i_fbk;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__rst = instance_inj_ctrl__instance_block_125__instance_fsm__rst;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__sh_mode = instance_inj_ctrl__instance_block_125__instance_fsm__sh_mode;
assign instance_inj_ctrl__instance_block_125__instance_fsm__global4_state = instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_handle__global4_state;
  
  
 
  always @(   instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__global4_state   )
       begin 
         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__global4_state  ==2'b00) 
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__cs44   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__cs44   <=1'b0;
         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__global4_state  [1]==1'b1) 
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__t14   <=1'b0;
          else  
             instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__t14   <=1'b1;
       end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__global4_state = instance_inj_ctrl__instance_block_034__instance_fsm__global4_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cs44 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__cs44;
assign instance_inj_ctrl__instance_block_034__instance_fsm__t14 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_ph4_output_handle__t14;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__global4_state = instance_inj_ctrl__instance_block_125__instance_fsm__global4_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cs44 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__cs44;
assign instance_inj_ctrl__instance_block_125__instance_fsm__t14 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_ph4_output_handle__t14;
  
  
 
  always @(      instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t31                or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t12            or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t14           or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__cur_state   )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__vhdl_sel_actuator  
         case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__cur_state  )
          5'b00000:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b00001:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t31  ;
             end 
          5'b00010:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b1;
             end 
          5'b00011:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b1;
             end 
          5'b00100:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b00101:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t12  ; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b00110:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b00111:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01000:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01001:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t14  ; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01010:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01011:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01100:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01101:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01110:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b01111:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b11000:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b11001:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t14  ; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b1; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b11100:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          5'b11101:
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
          default :
             begin  
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3   <=1'b0;
             end 
         endcase 
       end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__cur_state = instance_inj_ctrl__instance_block_034__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t12 = instance_inj_ctrl__instance_block_034__instance_fsm__t12;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t14 = instance_inj_ctrl__instance_block_034__instance_fsm__t14;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t31 = instance_inj_ctrl__instance_block_034__instance_fsm__t31;
assign instance_inj_ctrl__instance_block_034__instance_fsm__hl = instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__hl;
assign instance_inj_ctrl__instance_block_034__instance_fsm__t1 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t1;
assign instance_inj_ctrl__instance_block_034__instance_fsm__t2 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t2;
assign instance_inj_ctrl__instance_block_034__instance_fsm__t3 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_actuator__t3;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__cur_state = instance_inj_ctrl__instance_block_125__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t12 = instance_inj_ctrl__instance_block_125__instance_fsm__t12;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t14 = instance_inj_ctrl__instance_block_125__instance_fsm__t14;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t31 = instance_inj_ctrl__instance_block_125__instance_fsm__t31;
assign instance_inj_ctrl__instance_block_125__instance_fsm__hl = instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__hl;
assign instance_inj_ctrl__instance_block_125__instance_fsm__t1 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t1;
assign instance_inj_ctrl__instance_block_125__instance_fsm__t2 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t2;
assign instance_inj_ctrl__instance_block_125__instance_fsm__t3 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_actuator__t3;
  
  
 
  always @(     instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs42              or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs44           or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cur_state   )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__vhdl_sel_chop_control  
         case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cur_state  )
          5'b00101: 
              instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs4   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs42  ;
          5'b01001: 
              instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs4   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs44  ;
          5'b11001: 
              instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs4   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs44  ;
          default : 
              instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs4   <=1'b1;
         endcase 
       end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs42 = instance_inj_ctrl__instance_block_034__instance_fsm__cs42;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs44 = instance_inj_ctrl__instance_block_034__instance_fsm__cs44;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cur_state = instance_inj_ctrl__instance_block_034__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cs4 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_chop_control__cs4;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs42 = instance_inj_ctrl__instance_block_125__instance_fsm__cs42;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs44 = instance_inj_ctrl__instance_block_125__instance_fsm__cs44;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cur_state = instance_inj_ctrl__instance_block_125__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cs4 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_chop_control__cs4;
  
  
 
  always @(      instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs11                or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs111            or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cur_state           or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__global1_state   )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__vhdl_sel_glob_count_cs  
         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cur_state  ==5'b00001)
            begin  
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs1   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs111  ;
              if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__global1_state  ==1'b0) 
                  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs2   <=1'b1;
               else  
                  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs2   <=1'b0; 
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs8   <=1'b0;
            end 
          else 
            if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cur_state  ==5'b00000)
               begin  
                  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs1   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs11  ; 
                  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs2   <=1'b1; 
                  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs8   <=1'b1;
               end 
             else 
               begin  
                  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs1   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs11  ; 
                  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs2   <=1'b0; 
                  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs8   <=1'b1;
               end 
       end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs11 = instance_inj_ctrl__instance_block_034__instance_fsm__cs11;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs111 = instance_inj_ctrl__instance_block_034__instance_fsm__cs111;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cur_state = instance_inj_ctrl__instance_block_034__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__global1_state = instance_inj_ctrl__instance_block_034__instance_fsm__global1_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cs1 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs1;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cs2 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs2;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cs8 = instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_glob_count_cs__cs8;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs11 = instance_inj_ctrl__instance_block_125__instance_fsm__cs11;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs111 = instance_inj_ctrl__instance_block_125__instance_fsm__cs111;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cur_state = instance_inj_ctrl__instance_block_125__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__global1_state = instance_inj_ctrl__instance_block_125__instance_fsm__global1_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cs1 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs1;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cs2 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs2;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cs8 = instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_glob_count_cs__cs8;
  
  
 
  always @(      instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__cur_state                or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global1_state            or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global2_state           or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global4_state   )
       begin  
          instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global_state   [6:2]<=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__cur_state  ;
         case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__cur_state  )
          5'b00001: 
              instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global_state   [1:0]<={1'b0,  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global1_state  };
          5'b00101: 
              instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global_state   [1:0]<=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global2_state  ;
          5'b01001: 
              instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global_state   [1:0]<=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global4_state  ;
          5'b11001: 
              instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global_state   [1:0]<=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global4_state  ;
          default : 
              instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global_state   [1:0]<=2'b00;
         endcase 
       end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__cur_state = instance_inj_ctrl__instance_block_034__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global1_state = instance_inj_ctrl__instance_block_034__instance_fsm__global1_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global2_state = instance_inj_ctrl__instance_block_034__instance_fsm__global2_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global4_state = instance_inj_ctrl__instance_block_034__instance_fsm__global4_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__global_state = instance_inj_ctrl__instance_block_034__instance_fsm__instance_sel_global_state__global_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__cur_state = instance_inj_ctrl__instance_block_125__instance_fsm__cur_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global1_state = instance_inj_ctrl__instance_block_125__instance_fsm__global1_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global2_state = instance_inj_ctrl__instance_block_125__instance_fsm__global2_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global4_state = instance_inj_ctrl__instance_block_125__instance_fsm__global4_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__global_state = instance_inj_ctrl__instance_block_125__instance_fsm__instance_sel_global_state__global_state;
  
  
 
   reg[4:0]  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__current_state  ; 
   reg[4:0]  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__rst  )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__clocked  
         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__current_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_start_state  ; 
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b00000;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__current_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state  ;
              case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state  ) 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_start_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b00000; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph1bis_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b00011; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph2_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b00101; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph3_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b00111; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph4_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b01001; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph5_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b01011; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph1_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b00001; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b11100; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b11101; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int1_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b00010; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int_2_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b00100; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int3_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b00110; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int4_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b01000; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int5_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b01010; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int6_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b01100; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph6_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b01101; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int7_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b01110; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph7_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b01111; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int8_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b11000; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph8_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b11001; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int9_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b01010; 
                instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph9_state   : 
                   instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state   <=5'b01011;
               default :;
              endcase 
            end 
       end
  
  always @(                  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__current_state                                        or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__clock                        or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cmd_stored                       or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp                      or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check                     or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__end_t0                    or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state                   or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__inj_cmd                  or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__i_fbk                 or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__rst                or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__sh_mode               or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__status_reg              or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__t4_0             or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__th_0            or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur           or    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_mask   )
       begin :  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__set_next_state   
          instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__current_state  ;
         case (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__current_state  ) 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_start_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__inj_cmd  !=3'b000&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_mask  ==3'b000) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph1_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__inj_cmd  !=3'b000&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_mask  !=3'b000&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph1_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__inj_cmd  !=3'b000&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_mask  !=3'b000&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph1bis_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int_2_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                       instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int_2_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph2_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int3_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state  ;
                    else 
                      if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                          instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int3_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph3_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__th_0  ==1'b0) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int4_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__th_0  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1) 
                       instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int5_state  ;
                    else 
                      if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__th_0  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                          instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int4_state  ;
                       else 
                         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__th_0  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                             instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int5_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph4_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int5_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ;
                    else 
                      if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                          instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int5_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph5_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__t4_0  ==1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__t4_0  ==1'b0) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int6_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph1_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__i_fbk  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__sh_mode  ==1'b1)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__sh_mode  ==1'b0))) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int1_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [0]==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__i_fbk  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__sh_mode  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ;
                    else 
                      if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__inj_cmd  !=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cmd_stored  &  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [0]==1'b0) 
                          instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_start_state  ;
                       else 
                         if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0|((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__i_fbk  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__sh_mode  ==1'b1)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__sh_mode  ==1'b0)))&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                             instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int1_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__status_reg  ==11'b00000000000) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_start_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__status_reg  ==11'b00000000000) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_start_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int1_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph1bis_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int_2_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph2_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int3_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph3_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int4_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph4_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int5_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph5_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int6_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph6_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph6_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int7_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int7_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph7_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph7_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int8_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int8_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int8_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph8_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph8_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b0) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int9_state  ;
              else 
                if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1&((  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b10)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1)|(  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b00))) 
                    instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int9_state  ;
                 else 
                   if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b11&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b1&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                       instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_vcc_state  ;
                    else 
                      if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state  [1:0]==2'b01&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur  ==1'b0&  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check  ==1'b1) 
                          instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_cc_gnd_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_int9_state   :
             if (1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph9_state  ; 
           instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_ph9_state   :
             if (  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp  ==1'b1) 
                 instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__next_state   <=  instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__state_progression_state_type_start_state  ;
          default :;
         endcase 
       end
 
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__clock = instance_inj_ctrl__instance_block_034__instance_fsm__clock;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cmd_stored = instance_inj_ctrl__instance_block_034__instance_fsm__cmd_stored;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__comp = instance_inj_ctrl__instance_block_034__instance_fsm__comp;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__enable_check = instance_inj_ctrl__instance_block_034__instance_fsm__enable_check;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__end_t0 = instance_inj_ctrl__instance_block_034__instance_fsm__end_t0;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__global_state = instance_inj_ctrl__instance_block_034__instance_fsm__global_state;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__inj_cmd = instance_inj_ctrl__instance_block_034__instance_fsm__inj_cmd;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__i_fbk = instance_inj_ctrl__instance_block_034__instance_fsm__i_fbk;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__rst = instance_inj_ctrl__instance_block_034__instance_fsm__rst;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__sh_mode = instance_inj_ctrl__instance_block_034__instance_fsm__sh_mode;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__status_reg = instance_inj_ctrl__instance_block_034__instance_fsm__status_reg;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__t4_0 = instance_inj_ctrl__instance_block_034__instance_fsm__t4_0;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__th_0 = instance_inj_ctrl__instance_block_034__instance_fsm__th_0;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_cur = instance_inj_ctrl__instance_block_034__instance_fsm__v_fbk_cur;
assign instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__v_fbk_mask = instance_inj_ctrl__instance_block_034__instance_fsm__v_fbk_mask;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cur_state = instance_inj_ctrl__instance_block_034__instance_fsm__instance_state_progression__cur_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__clock = instance_inj_ctrl__instance_block_125__instance_fsm__clock;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cmd_stored = instance_inj_ctrl__instance_block_125__instance_fsm__cmd_stored;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__comp = instance_inj_ctrl__instance_block_125__instance_fsm__comp;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__enable_check = instance_inj_ctrl__instance_block_125__instance_fsm__enable_check;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__end_t0 = instance_inj_ctrl__instance_block_125__instance_fsm__end_t0;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__global_state = instance_inj_ctrl__instance_block_125__instance_fsm__global_state;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__inj_cmd = instance_inj_ctrl__instance_block_125__instance_fsm__inj_cmd;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__i_fbk = instance_inj_ctrl__instance_block_125__instance_fsm__i_fbk;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__rst = instance_inj_ctrl__instance_block_125__instance_fsm__rst;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__sh_mode = instance_inj_ctrl__instance_block_125__instance_fsm__sh_mode;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__status_reg = instance_inj_ctrl__instance_block_125__instance_fsm__status_reg;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__t4_0 = instance_inj_ctrl__instance_block_125__instance_fsm__t4_0;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__th_0 = instance_inj_ctrl__instance_block_125__instance_fsm__th_0;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_cur = instance_inj_ctrl__instance_block_125__instance_fsm__v_fbk_cur;
assign instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__v_fbk_mask = instance_inj_ctrl__instance_block_125__instance_fsm__v_fbk_mask;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cur_state = instance_inj_ctrl__instance_block_125__instance_fsm__instance_state_progression__cur_state;
 
  assign   instance_inj_ctrl__instance_block_125__instance_fsm__en_fbk_store  =  instance_inj_ctrl__instance_block_125__instance_fsm__en_fbk_store_internal  ;
assign instance_inj_ctrl__instance_block_034__instance_fsm__clock = instance_inj_ctrl__instance_block_034__clock;
assign instance_inj_ctrl__instance_block_034__instance_fsm__cmd_stored = instance_inj_ctrl__instance_block_034__cmd_stored;
assign instance_inj_ctrl__instance_block_034__instance_fsm__comp = instance_inj_ctrl__instance_block_034__comp;
assign instance_inj_ctrl__instance_block_034__instance_fsm__end_on = instance_inj_ctrl__instance_block_034__end_on;
assign instance_inj_ctrl__instance_block_034__instance_fsm__end_period = instance_inj_ctrl__instance_block_034__end_period;
assign instance_inj_ctrl__instance_block_034__instance_fsm__end_t0 = instance_inj_ctrl__instance_block_034__end_t0;
assign instance_inj_ctrl__instance_block_034__instance_fsm__inj_cmd = instance_inj_ctrl__instance_block_034__inj_cmd;
assign instance_inj_ctrl__instance_block_034__instance_fsm__i_fbk = instance_inj_ctrl__instance_block_034__i_fbk;
assign instance_inj_ctrl__instance_block_034__instance_fsm__rst = instance_inj_ctrl__instance_block_034__rst;
assign instance_inj_ctrl__instance_block_034__instance_fsm__sh_mode = instance_inj_ctrl__instance_block_034__sh_mode;
assign instance_inj_ctrl__instance_block_034__instance_fsm__status_reg = instance_inj_ctrl__instance_block_034__status_reg;
assign instance_inj_ctrl__instance_block_034__instance_fsm__t4_0 = instance_inj_ctrl__instance_block_034__t4_0;
assign instance_inj_ctrl__instance_block_034__instance_fsm__test_en_cur = instance_inj_ctrl__instance_block_034__test_en_cur;
assign instance_inj_ctrl__instance_block_034__instance_fsm__th_0 = instance_inj_ctrl__instance_block_034__th_0;
assign instance_inj_ctrl__instance_block_034__instance_fsm__v_fbk_cur = instance_inj_ctrl__instance_block_034__v_fbk_cur;
assign instance_inj_ctrl__instance_block_034__instance_fsm__v_fbk_mask = instance_inj_ctrl__instance_block_034__v_fbk_mask;
assign instance_inj_ctrl__instance_block_034__cs0 = instance_inj_ctrl__instance_block_034__instance_fsm__cs0;
assign instance_inj_ctrl__instance_block_034__cs1 = instance_inj_ctrl__instance_block_034__instance_fsm__cs1;
assign instance_inj_ctrl__instance_block_034__cs2 = instance_inj_ctrl__instance_block_034__instance_fsm__cs2;
assign instance_inj_ctrl__instance_block_034__cs4 = instance_inj_ctrl__instance_block_034__instance_fsm__cs4;
assign instance_inj_ctrl__instance_block_034__cs8 = instance_inj_ctrl__instance_block_034__instance_fsm__cs8;
assign instance_inj_ctrl__instance_block_034__en_fbk_store = instance_inj_ctrl__instance_block_034__instance_fsm__en_fbk_store;
assign instance_inj_ctrl__instance_block_034__en_state_store = instance_inj_ctrl__instance_block_034__instance_fsm__en_state_store;
assign instance_inj_ctrl__instance_block_034__error = instance_inj_ctrl__instance_block_034__instance_fsm__error;
assign instance_inj_ctrl__instance_block_034__global_state_store = instance_inj_ctrl__instance_block_034__instance_fsm__global_state_store;
assign instance_inj_ctrl__instance_block_034__hl = instance_inj_ctrl__instance_block_034__instance_fsm__hl;
assign instance_inj_ctrl__instance_block_034__relpot = instance_inj_ctrl__instance_block_034__instance_fsm__relpot;
assign instance_inj_ctrl__instance_block_034__t1 = instance_inj_ctrl__instance_block_034__instance_fsm__t1;
assign instance_inj_ctrl__instance_block_034__t2 = instance_inj_ctrl__instance_block_034__instance_fsm__t2;
assign instance_inj_ctrl__instance_block_034__t3 = instance_inj_ctrl__instance_block_034__instance_fsm__t3;
assign instance_inj_ctrl__instance_block_125__instance_fsm__clock = instance_inj_ctrl__instance_block_125__clock;
assign instance_inj_ctrl__instance_block_125__instance_fsm__cmd_stored = instance_inj_ctrl__instance_block_125__cmd_stored;
assign instance_inj_ctrl__instance_block_125__instance_fsm__comp = instance_inj_ctrl__instance_block_125__comp;
assign instance_inj_ctrl__instance_block_125__instance_fsm__end_on = instance_inj_ctrl__instance_block_125__end_on;
assign instance_inj_ctrl__instance_block_125__instance_fsm__end_period = instance_inj_ctrl__instance_block_125__end_period;
assign instance_inj_ctrl__instance_block_125__instance_fsm__end_t0 = instance_inj_ctrl__instance_block_125__end_t0;
assign instance_inj_ctrl__instance_block_125__instance_fsm__inj_cmd = instance_inj_ctrl__instance_block_125__inj_cmd;
assign instance_inj_ctrl__instance_block_125__instance_fsm__i_fbk = instance_inj_ctrl__instance_block_125__i_fbk;
assign instance_inj_ctrl__instance_block_125__instance_fsm__rst = instance_inj_ctrl__instance_block_125__rst;
assign instance_inj_ctrl__instance_block_125__instance_fsm__sh_mode = instance_inj_ctrl__instance_block_125__sh_mode;
assign instance_inj_ctrl__instance_block_125__instance_fsm__status_reg = instance_inj_ctrl__instance_block_125__status_reg;
assign instance_inj_ctrl__instance_block_125__instance_fsm__t4_0 = instance_inj_ctrl__instance_block_125__t4_0;
assign instance_inj_ctrl__instance_block_125__instance_fsm__test_en_cur = instance_inj_ctrl__instance_block_125__test_en_cur;
assign instance_inj_ctrl__instance_block_125__instance_fsm__th_0 = instance_inj_ctrl__instance_block_125__th_0;
assign instance_inj_ctrl__instance_block_125__instance_fsm__v_fbk_cur = instance_inj_ctrl__instance_block_125__v_fbk_cur;
assign instance_inj_ctrl__instance_block_125__instance_fsm__v_fbk_mask = instance_inj_ctrl__instance_block_125__v_fbk_mask;
assign instance_inj_ctrl__instance_block_125__cs0 = instance_inj_ctrl__instance_block_125__instance_fsm__cs0;
assign instance_inj_ctrl__instance_block_125__cs1 = instance_inj_ctrl__instance_block_125__instance_fsm__cs1;
assign instance_inj_ctrl__instance_block_125__cs2 = instance_inj_ctrl__instance_block_125__instance_fsm__cs2;
assign instance_inj_ctrl__instance_block_125__cs4 = instance_inj_ctrl__instance_block_125__instance_fsm__cs4;
assign instance_inj_ctrl__instance_block_125__cs8 = instance_inj_ctrl__instance_block_125__instance_fsm__cs8;
assign instance_inj_ctrl__instance_block_125__en_fbk_store = instance_inj_ctrl__instance_block_125__instance_fsm__en_fbk_store;
assign instance_inj_ctrl__instance_block_125__en_state_store = instance_inj_ctrl__instance_block_125__instance_fsm__en_state_store;
assign instance_inj_ctrl__instance_block_125__error = instance_inj_ctrl__instance_block_125__instance_fsm__error;
assign instance_inj_ctrl__instance_block_125__global_state_store = instance_inj_ctrl__instance_block_125__instance_fsm__global_state_store;
assign instance_inj_ctrl__instance_block_125__hl = instance_inj_ctrl__instance_block_125__instance_fsm__hl;
assign instance_inj_ctrl__instance_block_125__relpot = instance_inj_ctrl__instance_block_125__instance_fsm__relpot;
assign instance_inj_ctrl__instance_block_125__t1 = instance_inj_ctrl__instance_block_125__instance_fsm__t1;
assign instance_inj_ctrl__instance_block_125__t2 = instance_inj_ctrl__instance_block_125__instance_fsm__t2;
assign instance_inj_ctrl__instance_block_125__t3 = instance_inj_ctrl__instance_block_125__instance_fsm__t3;
  
  
 
   reg[12-1:0]  instance_inj_ctrl__instance_block_125__instance_internal_register__th  ; 
   reg[10-1:0]  instance_inj_ctrl__instance_block_125__instance_internal_register__tb  ; 
   reg[7-1:0]  instance_inj_ctrl__instance_block_125__instance_internal_register__tonh  ; 
   reg[7-1:0]  instance_inj_ctrl__instance_block_125__instance_internal_register__tonl  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_internal_register__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_internal_register__rst  )
       begin :  instance_inj_ctrl__instance_block_125__instance_internal_register__vhdl_internal_register  
         if (  instance_inj_ctrl__instance_block_125__instance_internal_register__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_block_125__instance_internal_register__tb   <={10{1'b0}}; 
               instance_inj_ctrl__instance_block_125__instance_internal_register__th   <={12{1'b0}}; 
               instance_inj_ctrl__instance_block_125__instance_internal_register__tonh   <={7{1'b0}}; 
               instance_inj_ctrl__instance_block_125__instance_internal_register__tonl   <={7{1'b0}};
            end 
          else 
            begin 
              if (  instance_inj_ctrl__instance_block_125__instance_internal_register__cs2  ==1'b1)
                 begin  
                    instance_inj_ctrl__instance_block_125__instance_internal_register__tb   <=  instance_inj_ctrl__instance_block_125__instance_internal_register__r_tb  ; 
                    instance_inj_ctrl__instance_block_125__instance_internal_register__th   <=  instance_inj_ctrl__instance_block_125__instance_internal_register__r_th  ; 
                    instance_inj_ctrl__instance_block_125__instance_internal_register__tonh   <=  instance_inj_ctrl__instance_block_125__instance_internal_register__r_tonh  ; 
                    instance_inj_ctrl__instance_block_125__instance_internal_register__tonl   <=  instance_inj_ctrl__instance_block_125__instance_internal_register__r_tonl  ;
                 end 
            end 
       end
  
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__tp_reg  =  instance_inj_ctrl__instance_block_125__instance_internal_register__r_tp  ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__sh_mode  =  instance_inj_ctrl__instance_block_125__instance_internal_register__tb  [9]; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__th_0  =(~(  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [0]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [1]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [2]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [3]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [4]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [5]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [6]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [7]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [8]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [9]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [10]|  instance_inj_ctrl__instance_block_125__instance_internal_register__th  [11])); 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__t4_0  =(~(  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t4  [6]|  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t4  [5]|  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t4  [4]|  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t4  [3])); 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0000) ? {5'b00000,  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t1  [7:1]}:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0000) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__tonh  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0001) ? {5'b00000,  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t1  [7:1]}:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0001) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__tonh  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0010) ? {3'b000,  instance_inj_ctrl__instance_block_125__instance_internal_register__tb  [8:0]}:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0010) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__tonh  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0011) ? {5'b00000,  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t2  }:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0011) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0100) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__th  :12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0100) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0101) ? {5'b00000,  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t1  [7:1]}:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0101) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0110) ? {4'b0000,  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t3  }:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0110) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0111) ? {3'b000,  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t1  ,1'b0}:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b0111) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b1100) ? {5'b00000,  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t4  }:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  ==4'b1100) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__tonl  :7'bZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  [3:1]==3'b111) ? {4'b0000,  instance_inj_ctrl__instance_block_125__instance_internal_register__r_t1  }:12'bZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg  =(  instance_inj_ctrl__instance_block_125__instance_internal_register__cs0  [3:1]==3'b111) ?   instance_inj_ctrl__instance_block_125__instance_internal_register__tonl  :7'bZZZZZZZ;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__clock = instance_inj_ctrl__instance_block_034__clock;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__cs0 = instance_inj_ctrl__instance_block_034__cs0;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__cs2 = instance_inj_ctrl__instance_block_034__cs2;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__rst = instance_inj_ctrl__instance_block_034__rst;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__r_t1 = instance_inj_ctrl__instance_block_034__r_t1;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__r_t2 = instance_inj_ctrl__instance_block_034__r_t2;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__r_t3 = instance_inj_ctrl__instance_block_034__r_t3;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__r_t4 = instance_inj_ctrl__instance_block_034__r_t4;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__r_tb = instance_inj_ctrl__instance_block_034__r_tb;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__r_th = instance_inj_ctrl__instance_block_034__r_th;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__r_tonh = instance_inj_ctrl__instance_block_034__r_tonh;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__r_tonl = instance_inj_ctrl__instance_block_034__r_tonl;
assign instance_inj_ctrl__instance_block_034__instance_internal_register__r_tp = instance_inj_ctrl__instance_block_034__r_tp;
assign instance_inj_ctrl__instance_block_034__sh_mode = instance_inj_ctrl__instance_block_034__instance_internal_register__sh_mode;
assign instance_inj_ctrl__instance_block_034__stop_count_bus = instance_inj_ctrl__instance_block_034__instance_internal_register__stop_count_bus;
assign instance_inj_ctrl__instance_block_034__t4_0 = instance_inj_ctrl__instance_block_034__instance_internal_register__t4_0;
assign instance_inj_ctrl__instance_block_034__th_0 = instance_inj_ctrl__instance_block_034__instance_internal_register__th_0;
assign instance_inj_ctrl__instance_block_034__ton_reg = instance_inj_ctrl__instance_block_034__instance_internal_register__ton_reg;
assign instance_inj_ctrl__instance_block_034__tp_reg = instance_inj_ctrl__instance_block_034__instance_internal_register__tp_reg;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__clock = instance_inj_ctrl__instance_block_125__clock;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__cs0 = instance_inj_ctrl__instance_block_125__cs0;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__cs2 = instance_inj_ctrl__instance_block_125__cs2;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__rst = instance_inj_ctrl__instance_block_125__rst;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__r_t1 = instance_inj_ctrl__instance_block_125__r_t1;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__r_t2 = instance_inj_ctrl__instance_block_125__r_t2;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__r_t3 = instance_inj_ctrl__instance_block_125__r_t3;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__r_t4 = instance_inj_ctrl__instance_block_125__r_t4;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__r_tb = instance_inj_ctrl__instance_block_125__r_tb;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__r_th = instance_inj_ctrl__instance_block_125__r_th;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__r_tonh = instance_inj_ctrl__instance_block_125__r_tonh;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__r_tonl = instance_inj_ctrl__instance_block_125__r_tonl;
assign instance_inj_ctrl__instance_block_125__instance_internal_register__r_tp = instance_inj_ctrl__instance_block_125__r_tp;
assign instance_inj_ctrl__instance_block_125__sh_mode = instance_inj_ctrl__instance_block_125__instance_internal_register__sh_mode;
assign instance_inj_ctrl__instance_block_125__stop_count_bus = instance_inj_ctrl__instance_block_125__instance_internal_register__stop_count_bus;
assign instance_inj_ctrl__instance_block_125__t4_0 = instance_inj_ctrl__instance_block_125__instance_internal_register__t4_0;
assign instance_inj_ctrl__instance_block_125__th_0 = instance_inj_ctrl__instance_block_125__instance_internal_register__th_0;
assign instance_inj_ctrl__instance_block_125__ton_reg = instance_inj_ctrl__instance_block_125__instance_internal_register__ton_reg;
assign instance_inj_ctrl__instance_block_125__tp_reg = instance_inj_ctrl__instance_block_125__instance_internal_register__tp_reg;
  
  
 
  always @(    instance_inj_ctrl__instance_block_125__instance_on_comp__chop_count            or    instance_inj_ctrl__instance_block_125__instance_on_comp__ton_reg   )
       begin :  instance_inj_ctrl__instance_block_125__instance_on_comp__vhdl_on_comp  
         if (  instance_inj_ctrl__instance_block_125__instance_on_comp__chop_count  ==  instance_inj_ctrl__instance_block_125__instance_on_comp__ton_reg  ) 
             instance_inj_ctrl__instance_block_125__instance_on_comp__end_on   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_125__instance_on_comp__end_on   <=1'b0;
       end
 
assign instance_inj_ctrl__instance_block_034__instance_on_comp__chop_count = instance_inj_ctrl__instance_block_034__chop_count;
assign instance_inj_ctrl__instance_block_034__instance_on_comp__ton_reg = instance_inj_ctrl__instance_block_034__ton_reg;
assign instance_inj_ctrl__instance_block_034__end_on = instance_inj_ctrl__instance_block_034__instance_on_comp__end_on;
assign instance_inj_ctrl__instance_block_125__instance_on_comp__chop_count = instance_inj_ctrl__instance_block_125__chop_count;
assign instance_inj_ctrl__instance_block_125__instance_on_comp__ton_reg = instance_inj_ctrl__instance_block_125__ton_reg;
assign instance_inj_ctrl__instance_block_125__end_on = instance_inj_ctrl__instance_block_125__instance_on_comp__end_on;
  
  
 
  always @(     instance_inj_ctrl__instance_block_125__instance_output_decoder__cmd_stored              or    instance_inj_ctrl__instance_block_125__instance_output_decoder__t1           or    instance_inj_ctrl__instance_block_125__instance_output_decoder__t2   )
       begin :  instance_inj_ctrl__instance_block_125__instance_output_decoder__vhdl_output_decoder  
         case (  instance_inj_ctrl__instance_block_125__instance_output_decoder__cmd_stored  )
          3'b001:
             begin  
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1a   <=  instance_inj_ctrl__instance_block_125__instance_output_decoder__t1  ; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2a   <=  instance_inj_ctrl__instance_block_125__instance_output_decoder__t2  ; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1b   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2b   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1c   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2c   <=1'b0;
             end 
          3'b010:
             begin  
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1b   <=  instance_inj_ctrl__instance_block_125__instance_output_decoder__t1  ; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2b   <=  instance_inj_ctrl__instance_block_125__instance_output_decoder__t2  ; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1a   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2a   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1c   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2c   <=1'b0;
             end 
          3'b100:
             begin  
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1c   <=  instance_inj_ctrl__instance_block_125__instance_output_decoder__t1  ; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2c   <=  instance_inj_ctrl__instance_block_125__instance_output_decoder__t2  ; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1b   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2b   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1a   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2a   <=1'b0;
             end 
          default :
             begin  
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1a   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2a   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1b   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2b   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t1c   <=1'b0; 
                instance_inj_ctrl__instance_block_125__instance_output_decoder__t2c   <=1'b0;
             end 
         endcase 
       end
 
assign instance_inj_ctrl__instance_block_034__instance_output_decoder__cmd_stored = instance_inj_ctrl__instance_block_034__cmd_stored;
assign instance_inj_ctrl__instance_block_034__instance_output_decoder__t1 = instance_inj_ctrl__instance_block_034__t1;
assign instance_inj_ctrl__instance_block_034__instance_output_decoder__t2 = instance_inj_ctrl__instance_block_034__t2;
assign instance_inj_ctrl__instance_block_034__t1a = instance_inj_ctrl__instance_block_034__instance_output_decoder__t1a;
assign instance_inj_ctrl__instance_block_034__t1b = instance_inj_ctrl__instance_block_034__instance_output_decoder__t1b;
assign instance_inj_ctrl__instance_block_034__t1c = instance_inj_ctrl__instance_block_034__instance_output_decoder__t1c;
assign instance_inj_ctrl__instance_block_034__t2a = instance_inj_ctrl__instance_block_034__instance_output_decoder__t2a;
assign instance_inj_ctrl__instance_block_034__t2b = instance_inj_ctrl__instance_block_034__instance_output_decoder__t2b;
assign instance_inj_ctrl__instance_block_034__t2c = instance_inj_ctrl__instance_block_034__instance_output_decoder__t2c;
assign instance_inj_ctrl__instance_block_125__instance_output_decoder__cmd_stored = instance_inj_ctrl__instance_block_125__cmd_stored;
assign instance_inj_ctrl__instance_block_125__instance_output_decoder__t1 = instance_inj_ctrl__instance_block_125__t1;
assign instance_inj_ctrl__instance_block_125__instance_output_decoder__t2 = instance_inj_ctrl__instance_block_125__t2;
assign instance_inj_ctrl__instance_block_125__t1a = instance_inj_ctrl__instance_block_125__instance_output_decoder__t1a;
assign instance_inj_ctrl__instance_block_125__t1b = instance_inj_ctrl__instance_block_125__instance_output_decoder__t1b;
assign instance_inj_ctrl__instance_block_125__t1c = instance_inj_ctrl__instance_block_125__instance_output_decoder__t1c;
assign instance_inj_ctrl__instance_block_125__t2a = instance_inj_ctrl__instance_block_125__instance_output_decoder__t2a;
assign instance_inj_ctrl__instance_block_125__t2b = instance_inj_ctrl__instance_block_125__instance_output_decoder__t2b;
assign instance_inj_ctrl__instance_block_125__t2c = instance_inj_ctrl__instance_block_125__instance_output_decoder__t2c;
  
  
 
  always @(    instance_inj_ctrl__instance_block_125__instance_period_comp__chop_count            or    instance_inj_ctrl__instance_block_125__instance_period_comp__tp_reg   )
       begin :  instance_inj_ctrl__instance_block_125__instance_period_comp__vhdl_period_comp  
         if (  instance_inj_ctrl__instance_block_125__instance_period_comp__chop_count  ==  instance_inj_ctrl__instance_block_125__instance_period_comp__tp_reg  ) 
             instance_inj_ctrl__instance_block_125__instance_period_comp__end_period   <=1'b1;
          else  
             instance_inj_ctrl__instance_block_125__instance_period_comp__end_period   <=1'b0;
       end
 
assign instance_inj_ctrl__instance_block_034__instance_period_comp__chop_count = instance_inj_ctrl__instance_block_034__chop_count;
assign instance_inj_ctrl__instance_block_034__instance_period_comp__tp_reg = instance_inj_ctrl__instance_block_034__tp_reg;
assign instance_inj_ctrl__instance_block_034__end_period = instance_inj_ctrl__instance_block_034__instance_period_comp__end_period;
assign instance_inj_ctrl__instance_block_125__instance_period_comp__chop_count = instance_inj_ctrl__instance_block_125__chop_count;
assign instance_inj_ctrl__instance_block_125__instance_period_comp__tp_reg = instance_inj_ctrl__instance_block_125__tp_reg;
assign instance_inj_ctrl__instance_block_125__end_period = instance_inj_ctrl__instance_block_125__instance_period_comp__end_period;
  
  
 
   reg[2:0]  instance_inj_ctrl__instance_block_125__instance_sel_cmd__cmd_stored_int  ; 
  always @(  posedge    instance_inj_ctrl__instance_block_125__instance_sel_cmd__clock          or  negedge   instance_inj_ctrl__instance_block_125__instance_sel_cmd__rst  )
       begin :  instance_inj_ctrl__instance_block_125__instance_sel_cmd__vhdl_sel_cmd  
         if (  instance_inj_ctrl__instance_block_125__instance_sel_cmd__rst  ==1'b0) 
             instance_inj_ctrl__instance_block_125__instance_sel_cmd__cmd_stored_int   <=3'b000;
          else 
            begin 
              if (  instance_inj_ctrl__instance_block_125__instance_sel_cmd__cs2  ==1'b1) 
                  instance_inj_ctrl__instance_block_125__instance_sel_cmd__cmd_stored_int   <=  instance_inj_ctrl__instance_block_125__instance_sel_cmd__inj_cmd  ;
            end 
       end
  
  always @(     instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk              or    instance_inj_ctrl__instance_block_125__instance_sel_cmd__cmd_stored_int           or    instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en   )
       case (  instance_inj_ctrl__instance_block_125__instance_sel_cmd__cmd_stored_int  )
        3'b001:
           begin  
              instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_cur   <=  instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk  [0]; 
              instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en_cur   <=  instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en  [0];
           end 
        3'b010:
           begin  
              instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_cur   <=  instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk  [1]; 
              instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en_cur   <=  instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en  [1];
           end 
        3'b100:
           begin  
              instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_cur   <=  instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk  [2]; 
              instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en_cur   <=  instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en  [2];
           end 
        default :
           begin  
              instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_cur   <=1'b0; 
              instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en_cur   <=1'b1;
           end 
       endcase
  
  assign   instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_mask  [0]=  instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk  [0]&  instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en  [0]; 
  assign   instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_mask  [1]=  instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk  [1]&  instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en  [1]; 
  assign   instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_mask  [2]=  instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk  [2]&  instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en  [2]; 
  assign   instance_inj_ctrl__instance_block_125__instance_sel_cmd__cmd_stored  =  instance_inj_ctrl__instance_block_125__instance_sel_cmd__cmd_stored_int  ;
assign instance_inj_ctrl__instance_block_034__instance_sel_cmd__clock = instance_inj_ctrl__instance_block_034__clock;
assign instance_inj_ctrl__instance_block_034__instance_sel_cmd__cs2 = instance_inj_ctrl__instance_block_034__cs2;
assign instance_inj_ctrl__instance_block_034__instance_sel_cmd__inj_cmd = instance_inj_ctrl__instance_block_034__inj_cmd;
assign instance_inj_ctrl__instance_block_034__instance_sel_cmd__rst = instance_inj_ctrl__instance_block_034__rst;
assign instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en = instance_inj_ctrl__instance_block_034__test_en;
assign instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk = instance_inj_ctrl__instance_block_034__v_fbk;
assign instance_inj_ctrl__instance_block_034__cmd_stored = instance_inj_ctrl__instance_block_034__instance_sel_cmd__cmd_stored;
assign instance_inj_ctrl__instance_block_034__test_en_cur = instance_inj_ctrl__instance_block_034__instance_sel_cmd__test_en_cur;
assign instance_inj_ctrl__instance_block_034__v_fbk_cur = instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_cur;
assign instance_inj_ctrl__instance_block_034__v_fbk_mask = instance_inj_ctrl__instance_block_034__instance_sel_cmd__v_fbk_mask;
assign instance_inj_ctrl__instance_block_125__instance_sel_cmd__clock = instance_inj_ctrl__instance_block_125__clock;
assign instance_inj_ctrl__instance_block_125__instance_sel_cmd__cs2 = instance_inj_ctrl__instance_block_125__cs2;
assign instance_inj_ctrl__instance_block_125__instance_sel_cmd__inj_cmd = instance_inj_ctrl__instance_block_125__inj_cmd;
assign instance_inj_ctrl__instance_block_125__instance_sel_cmd__rst = instance_inj_ctrl__instance_block_125__rst;
assign instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en = instance_inj_ctrl__instance_block_125__test_en;
assign instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk = instance_inj_ctrl__instance_block_125__v_fbk;
assign instance_inj_ctrl__instance_block_125__cmd_stored = instance_inj_ctrl__instance_block_125__instance_sel_cmd__cmd_stored;
assign instance_inj_ctrl__instance_block_125__test_en_cur = instance_inj_ctrl__instance_block_125__instance_sel_cmd__test_en_cur;
assign instance_inj_ctrl__instance_block_125__v_fbk_cur = instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_cur;
assign instance_inj_ctrl__instance_block_125__v_fbk_mask = instance_inj_ctrl__instance_block_125__instance_sel_cmd__v_fbk_mask;

assign instance_inj_ctrl__instance_block_034__clock = instance_inj_ctrl__clock_internal;
assign instance_inj_ctrl__instance_block_034__inj_cmd = instance_inj_ctrl__inj_cmd_034;
assign instance_inj_ctrl__instance_block_034__i_fbk = instance_inj_ctrl__i_fbk_034;
assign instance_inj_ctrl__instance_block_034__rst = instance_inj_ctrl__rst;
assign instance_inj_ctrl__instance_block_034__r_t1 = instance_inj_ctrl__r_t1;
assign instance_inj_ctrl__instance_block_034__r_t2 = instance_inj_ctrl__r_t2;
assign instance_inj_ctrl__instance_block_034__r_t3 = instance_inj_ctrl__r_t3_034;
assign instance_inj_ctrl__instance_block_034__r_t4 = instance_inj_ctrl__r_t4_034;
assign instance_inj_ctrl__instance_block_034__r_tb = instance_inj_ctrl__r_tb_034;
assign instance_inj_ctrl__instance_block_034__r_th = instance_inj_ctrl__r_th_034;
assign instance_inj_ctrl__instance_block_034__r_tonh = instance_inj_ctrl__r_tonh;
assign instance_inj_ctrl__instance_block_034__r_tonl = instance_inj_ctrl__r_tonl;
assign instance_inj_ctrl__instance_block_034__r_tp = instance_inj_ctrl__r_tp;
assign instance_inj_ctrl__instance_block_034__status_reg = instance_inj_ctrl__status_reg_034;
assign instance_inj_ctrl__instance_block_034__test_en = instance_inj_ctrl__test_en_034;
assign instance_inj_ctrl__instance_block_034__v_fbk = instance_inj_ctrl__v_fbk_034;
assign instance_inj_ctrl__en_fbk_store_034 = instance_inj_ctrl__instance_block_034__en_fbk_store;
assign instance_inj_ctrl__en_state_store_034 = instance_inj_ctrl__instance_block_034__en_state_store;
assign instance_inj_ctrl__error1 = instance_inj_ctrl__instance_block_034__error;
assign instance_inj_ctrl__global_state_034 = instance_inj_ctrl__instance_block_034__global_state_store;
assign instance_inj_ctrl__hl_034 = instance_inj_ctrl__instance_block_034__hl;
assign instance_inj_ctrl__relpot1 = instance_inj_ctrl__instance_block_034__relpot;
assign instance_inj_ctrl__t1_0 = instance_inj_ctrl__instance_block_034__t1a;
assign instance_inj_ctrl__t1_3 = instance_inj_ctrl__instance_block_034__t1b;
assign instance_inj_ctrl__t1_4 = instance_inj_ctrl__instance_block_034__t1c;
assign instance_inj_ctrl__t2_0 = instance_inj_ctrl__instance_block_034__t2a;
assign instance_inj_ctrl__t2_3 = instance_inj_ctrl__instance_block_034__t2b;
assign instance_inj_ctrl__t2_4 = instance_inj_ctrl__instance_block_034__t2c;
assign instance_inj_ctrl__t3_034 = instance_inj_ctrl__instance_block_034__t3;
assign instance_inj_ctrl__instance_block_125__clock = instance_inj_ctrl__clock_internal;
assign instance_inj_ctrl__instance_block_125__inj_cmd = instance_inj_ctrl__inj_cmd_125;
assign instance_inj_ctrl__instance_block_125__i_fbk = instance_inj_ctrl__i_fbk_125;
assign instance_inj_ctrl__instance_block_125__rst = instance_inj_ctrl__rst;
assign instance_inj_ctrl__instance_block_125__r_t1 = instance_inj_ctrl__r_t1;
assign instance_inj_ctrl__instance_block_125__r_t2 = instance_inj_ctrl__r_t2;
assign instance_inj_ctrl__instance_block_125__r_t3 = instance_inj_ctrl__r_t3_125;
assign instance_inj_ctrl__instance_block_125__r_t4 = instance_inj_ctrl__r_t4_125;
assign instance_inj_ctrl__instance_block_125__r_tb = instance_inj_ctrl__r_tb_125;
assign instance_inj_ctrl__instance_block_125__r_th = instance_inj_ctrl__r_th_125;
assign instance_inj_ctrl__instance_block_125__r_tonh = instance_inj_ctrl__r_tonh;
assign instance_inj_ctrl__instance_block_125__r_tonl = instance_inj_ctrl__r_tonl;
assign instance_inj_ctrl__instance_block_125__r_tp = instance_inj_ctrl__r_tp;
assign instance_inj_ctrl__instance_block_125__status_reg = instance_inj_ctrl__status_reg_125;
assign instance_inj_ctrl__instance_block_125__test_en = instance_inj_ctrl__test_en_125;
assign instance_inj_ctrl__instance_block_125__v_fbk = instance_inj_ctrl__v_fbk_125;
assign instance_inj_ctrl__en_fbk_store_125 = instance_inj_ctrl__instance_block_125__en_fbk_store;
assign instance_inj_ctrl__en_state_store_125 = instance_inj_ctrl__instance_block_125__en_state_store;
assign instance_inj_ctrl__error2 = instance_inj_ctrl__instance_block_125__error;
assign instance_inj_ctrl__global_state_125 = instance_inj_ctrl__instance_block_125__global_state_store;
assign instance_inj_ctrl__hl_125 = instance_inj_ctrl__instance_block_125__hl;
assign instance_inj_ctrl__relpot2 = instance_inj_ctrl__instance_block_125__relpot;
assign instance_inj_ctrl__t1_1 = instance_inj_ctrl__instance_block_125__t1a;
assign instance_inj_ctrl__t1_2 = instance_inj_ctrl__instance_block_125__t1b;
assign instance_inj_ctrl__t1_5 = instance_inj_ctrl__instance_block_125__t1c;
assign instance_inj_ctrl__t2_1 = instance_inj_ctrl__instance_block_125__t2a;
assign instance_inj_ctrl__t2_2 = instance_inj_ctrl__instance_block_125__t2b;
assign instance_inj_ctrl__t2_5 = instance_inj_ctrl__instance_block_125__t2c;
assign instance_inj_ctrl__t3_125 = instance_inj_ctrl__instance_block_125__t3;
  
  
wire  instance_inj_ctrl__instance_clock_gen__clock_i;
wire  instance_inj_ctrl__instance_clock_gen__rst;
wire  instance_inj_ctrl__instance_clock_gen__clock_o;
 
   reg[3:0]  instance_inj_ctrl__instance_clock_gen__counter  ; 
   reg  instance_inj_ctrl__instance_clock_gen__clock_int  ; 
  always @(  posedge    instance_inj_ctrl__instance_clock_gen__clock_i          or  negedge   instance_inj_ctrl__instance_clock_gen__rst  )
       begin :  instance_inj_ctrl__instance_clock_gen__vhdl_clock_gen  
         if (  instance_inj_ctrl__instance_clock_gen__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_clock_gen__counter   <={4{1'b0}}; 
               instance_inj_ctrl__instance_clock_gen__clock_int   <=1'b0;
            end 
          else 
            begin 
              if (  instance_inj_ctrl__instance_clock_gen__counter  ==4'b1001)
                 begin  
                    instance_inj_ctrl__instance_clock_gen__counter   <=4'b0000; 
                    instance_inj_ctrl__instance_clock_gen__clock_int   <=(~  instance_inj_ctrl__instance_clock_gen__clock_int  );
                 end 
               else  
                  instance_inj_ctrl__instance_clock_gen__counter   <=  instance_inj_ctrl__instance_clock_gen__counter  +4'b0001;
            end 
       end
  
  assign   instance_inj_ctrl__instance_clock_gen__clock_o  =  instance_inj_ctrl__instance_clock_gen__clock_int  ;
assign instance_inj_ctrl__clock = instance_inj_ctrl__instance_clock_gen__clock_i;
assign instance_inj_ctrl__instance_clock_gen__rst = instance_inj_ctrl__rst;
assign instance_inj_ctrl__clock_internal = instance_inj_ctrl__instance_clock_gen__clock_o;
  
  
wire  instance_inj_ctrl__instance_d_bus_interface__clock;
wire  instance_inj_ctrl__instance_d_bus_interface__cs;
wire  instance_inj_ctrl__instance_d_bus_interface__ds;
wire  instance_inj_ctrl__instance_d_bus_interface__rst;
wire  instance_inj_ctrl__instance_d_bus_interface__r_w;
wire  instance_inj_ctrl__instance_d_bus_interface__rd_en;
wire  instance_inj_ctrl__instance_d_bus_interface__wr_en;
wire [16-1:0] instance_inj_ctrl__instance_d_bus_interface__d_bus;
wire [16-1:0] instance_inj_ctrl__instance_d_bus_interface__d_bus_ext;
 
   wire  instance_inj_ctrl__instance_d_bus_interface__rd_en_internal  ; 
   wire  instance_inj_ctrl__instance_d_bus_interface__wr_en_internal  ;  
  
wire  instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__clock;
wire  instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__rd_en;
wire  instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__rst;
wire  instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__wr_en;
wire [16-1:0] instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus;
wire [16-1:0] instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus_ext;
 
   reg[16-1:0]  instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus_int  ; 
  assign   instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus  =((  instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__wr_en  ==1'b1)) ?   instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus_int  :16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus_ext  =((  instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__rd_en  ==1'b1)) ?   instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus  :16'bZZZZZZZZZZZZZZZZ; 
  always @(  posedge    instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__clock          or  negedge   instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__rst  )
       begin :  instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__vhdl_d_bus_handle  
         if (  instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__rst  ==1'b0) 
             instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus_int   <={16{1'b0}};
          else  
             instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus_int   <=  instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus_ext  ;
       end
 
assign instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__clock = instance_inj_ctrl__instance_d_bus_interface__clock;
assign instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__rd_en = instance_inj_ctrl__instance_d_bus_interface__rd_en_internal;
assign instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__rst = instance_inj_ctrl__instance_d_bus_interface__rst;
assign instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__wr_en = instance_inj_ctrl__instance_d_bus_interface__wr_en_internal;
assign instance_inj_ctrl__instance_d_bus_interface__d_bus = instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus;
assign instance_inj_ctrl__instance_d_bus_interface__d_bus_ext = instance_inj_ctrl__instance_d_bus_interface__instance_d_bus_handle__d_bus_ext;
  
  
wire  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__clock;
wire  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__cs;
wire  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__ds;
wire  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__rst;
wire  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__r_w;
wire  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__rd_en;
reg  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__wr_en;
 
   wire  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__wr_en_int  ; 
  assign   instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__rd_en  =(~(  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__cs  ))&  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__r_w  ; 
  assign   instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__wr_en_int  =(~(  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__cs  ))&(~(  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__ds  ))&(~(  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__r_w  )); 
  always @(  posedge    instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__clock          or  negedge   instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__rst  )
       begin :  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__vhdl_ds_handle  
         if (  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__rst  ==1'b0) 
             instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__wr_en   <=1'b0;
          else  
             instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__wr_en   <=  instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__wr_en_int  ;
       end
 
assign instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__clock = instance_inj_ctrl__instance_d_bus_interface__clock;
assign instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__cs = instance_inj_ctrl__instance_d_bus_interface__cs;
assign instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__ds = instance_inj_ctrl__instance_d_bus_interface__ds;
assign instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__rst = instance_inj_ctrl__instance_d_bus_interface__rst;
assign instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__r_w = instance_inj_ctrl__instance_d_bus_interface__r_w;
assign instance_inj_ctrl__instance_d_bus_interface__rd_en_internal = instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__rd_en;
assign instance_inj_ctrl__instance_d_bus_interface__wr_en_internal = instance_inj_ctrl__instance_d_bus_interface__instance_ds_handle__wr_en;
 
  assign   instance_inj_ctrl__instance_d_bus_interface__rd_en  =  instance_inj_ctrl__instance_d_bus_interface__rd_en_internal  ; 
  assign   instance_inj_ctrl__instance_d_bus_interface__wr_en  =  instance_inj_ctrl__instance_d_bus_interface__wr_en_internal  ;
assign instance_inj_ctrl__instance_d_bus_interface__clock = instance_inj_ctrl__clock;
assign instance_inj_ctrl__instance_d_bus_interface__cs = instance_inj_ctrl__cs;
assign instance_inj_ctrl__instance_d_bus_interface__ds = instance_inj_ctrl__ds;
assign instance_inj_ctrl__instance_d_bus_interface__rst = instance_inj_ctrl__rst;
assign instance_inj_ctrl__instance_d_bus_interface__r_w = instance_inj_ctrl__r_w;
assign instance_inj_ctrl__rd_en = instance_inj_ctrl__instance_d_bus_interface__rd_en;
assign instance_inj_ctrl__wr_en = instance_inj_ctrl__instance_d_bus_interface__wr_en;
assign instance_inj_ctrl__d_bus = instance_inj_ctrl__instance_d_bus_interface__d_bus;
assign instance_inj_ctrl__d_bus_ext = instance_inj_ctrl__instance_d_bus_interface__d_bus_ext;
  
  
wire  instance_inj_ctrl__instance_filter_feedback__clock;
wire [2-1:0] instance_inj_ctrl__instance_filter_feedback__i_fbk;
wire  instance_inj_ctrl__instance_filter_feedback__rst;
wire [6-1:0] instance_inj_ctrl__instance_filter_feedback__v_fbk;
wire [2-1:0] instance_inj_ctrl__instance_filter_feedback__i_fbk_f;
wire [6-1:0] instance_inj_ctrl__instance_filter_feedback__v_fbk_f;
 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_0  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_f0  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_1  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_f1  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_2  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_f2  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_3  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_f3  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_4  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_f4  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_5  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__v_fbk_f5  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__i_fbk_0  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__i_fbk_f0  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__i_fbk_1  ; 
   wire  instance_inj_ctrl__instance_filter_feedback__i_fbk_f1  ;  
  
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt0__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt0__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt0__rst;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt0__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt1__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt1__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt1__rst;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt1__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt2__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt2__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt2__rst;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt2__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt3__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt3__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt3__rst;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt3__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt4__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt4__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt4__rst;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt4__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt5__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt5__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt5__rst;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt5__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt6__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt6__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt6__rst;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt6__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt7__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt7__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt7__rst;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt7__filtered_value;
  
  
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__rst;
reg  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__rst;
reg  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__rst;
reg  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__rst;
reg  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__rst;
reg  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__rst;
reg  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__rst;
reg  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filtered_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__clock;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value;
wire  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__rst;
reg  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filtered_value;
 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__current_state  ; 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__clock          or  negedge   instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__rst  )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__clocked  
         if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__rst  ==1'b0) 
             instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_start_state  ;
          else  
             instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state  ;
       end
  
  always @(      instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__current_state                or    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__clock            or    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value           or    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__rst   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__set_next_state   
          instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__current_state  ;
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_start_state   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b0) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b1) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_start_state  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_3  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_0   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_1  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_3  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_start_state  ;
          default :;
         endcase 
       end
  
  always @(   instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__current_state   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__unclocked  
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_start_state   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_zero_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_0   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filter_state_type_one_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filtered_value   <=1'b1;
          default :;
         endcase 
       end
 

  
  
  
  
 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__current_state  ; 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__clock          or  negedge   instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__rst  )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__clocked  
         if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__rst  ==1'b0) 
             instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_start_state  ;
          else  
             instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state  ;
       end
  
  always @(      instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__current_state                or    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__clock            or    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value           or    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__rst   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__set_next_state   
          instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__current_state  ;
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_start_state   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b0) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b1) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_start_state  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_3  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_0   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_1  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_3  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_start_state  ;
          default :;
         endcase 
       end
  
  always @(   instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__current_state   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__unclocked  
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_start_state   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_zero_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_0   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filter_state_type_one_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filtered_value   <=1'b1;
          default :;
         endcase 
       end
 

  
  
  
  
 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__current_state  ; 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__clock          or  negedge   instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__rst  )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__clocked  
         if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__rst  ==1'b0) 
             instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_start_state  ;
          else  
             instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state  ;
       end
  
  always @(      instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__current_state                or    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__clock            or    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value           or    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__rst   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__set_next_state   
          instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__current_state  ;
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_start_state   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b0) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b1) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_start_state  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_3  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_0   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_1  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_3  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_start_state  ;
          default :;
         endcase 
       end
  
  always @(   instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__current_state   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__unclocked  
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_start_state   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_zero_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_0   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filter_state_type_one_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filtered_value   <=1'b1;
          default :;
         endcase 
       end
 

  
  
  
  
 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__current_state  ; 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__clock          or  negedge   instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__rst  )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__clocked  
         if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__rst  ==1'b0) 
             instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_start_state  ;
          else  
             instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state  ;
       end
  
  always @(      instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__current_state                or    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__clock            or    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value           or    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__rst   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__set_next_state   
          instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__current_state  ;
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_start_state   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b0) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b1) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_start_state  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_3  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_0   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_1  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_3  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_start_state  ;
          default :;
         endcase 
       end
  
  always @(   instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__current_state   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__unclocked  
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_start_state   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_zero_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_0   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filter_state_type_one_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filtered_value   <=1'b1;
          default :;
         endcase 
       end
 

  
  
  
  
 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__current_state  ; 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__clock          or  negedge   instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__rst  )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__clocked  
         if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__rst  ==1'b0) 
             instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_start_state  ;
          else  
             instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state  ;
       end
  
  always @(      instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__current_state                or    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__clock            or    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value           or    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__rst   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__set_next_state   
          instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__current_state  ;
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_start_state   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b0) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b1) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_start_state  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_3  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_0   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_1  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_3  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_start_state  ;
          default :;
         endcase 
       end
  
  always @(   instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__current_state   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__unclocked  
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_start_state   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_zero_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_0   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filter_state_type_one_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filtered_value   <=1'b1;
          default :;
         endcase 
       end
 

  
  
  
  
 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__current_state  ; 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__clock          or  negedge   instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__rst  )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__clocked  
         if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__rst  ==1'b0) 
             instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_start_state  ;
          else  
             instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state  ;
       end
  
  always @(      instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__current_state                or    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__clock            or    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value           or    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__rst   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__set_next_state   
          instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__current_state  ;
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_start_state   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b0) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b1) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_start_state  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_3  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_0   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_1  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_3  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_start_state  ;
          default :;
         endcase 
       end
  
  always @(   instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__current_state   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__unclocked  
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_start_state   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_zero_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_0   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filter_state_type_one_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filtered_value   <=1'b1;
          default :;
         endcase 
       end
 

  
  
  
  
 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__current_state  ; 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__clock          or  negedge   instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__rst  )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__clocked  
         if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__rst  ==1'b0) 
             instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_start_state  ;
          else  
             instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state  ;
       end
  
  always @(      instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__current_state                or    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__clock            or    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value           or    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__rst   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__set_next_state   
          instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__current_state  ;
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_start_state   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b0) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b1) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_start_state  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_3  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_0   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_1  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_3  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_start_state  ;
          default :;
         endcase 
       end
  
  always @(   instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__current_state   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__unclocked  
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_start_state   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_zero_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_0   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filter_state_type_one_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filtered_value   <=1'b1;
          default :;
         endcase 
       end
 

  
  
  
  
 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__current_state  ; 
   reg[2:0]  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__clock          or  negedge   instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__rst  )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__clocked  
         if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__rst  ==1'b0) 
             instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_start_state  ;
          else  
             instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__current_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state  ;
       end
  
  always @(      instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__current_state                or    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__clock            or    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value           or    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__rst   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__set_next_state   
          instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__current_state  ;
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_start_state   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b0) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b1) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_start_state  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_3  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_0   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_1  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_1   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_0  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_2  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_2   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_1  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_3  ; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_3   :
             if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b1) 
                 instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_2  ;
              else 
                if (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value  ==1'b0) 
                    instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__next_state   <=  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_start_state  ;
          default :;
         endcase 
       end
  
  always @(   instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__current_state   )
       begin :  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__unclocked  
         case (  instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__current_state  ) 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_start_state   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_zero_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filtered_value   <=1'b0; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_0   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_1   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_2   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filtered_value   <=1'b1; 
           instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filter_state_type_one_3   : 
              instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filtered_value   <=1'b1;
          default :;
         endcase 
       end
 
assign instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__clock = instance_inj_ctrl__instance_filter_feedback__instance_filt0__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__new_value = instance_inj_ctrl__instance_filter_feedback__instance_filt0__new_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__rst = instance_inj_ctrl__instance_filter_feedback__instance_filt0__rst;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt0__filtered_value = instance_inj_ctrl__instance_filter_feedback__instance_filt0__instance_filter__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__clock = instance_inj_ctrl__instance_filter_feedback__instance_filt1__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__new_value = instance_inj_ctrl__instance_filter_feedback__instance_filt1__new_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__rst = instance_inj_ctrl__instance_filter_feedback__instance_filt1__rst;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt1__filtered_value = instance_inj_ctrl__instance_filter_feedback__instance_filt1__instance_filter__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__clock = instance_inj_ctrl__instance_filter_feedback__instance_filt2__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__new_value = instance_inj_ctrl__instance_filter_feedback__instance_filt2__new_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__rst = instance_inj_ctrl__instance_filter_feedback__instance_filt2__rst;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt2__filtered_value = instance_inj_ctrl__instance_filter_feedback__instance_filt2__instance_filter__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__clock = instance_inj_ctrl__instance_filter_feedback__instance_filt3__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__new_value = instance_inj_ctrl__instance_filter_feedback__instance_filt3__new_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__rst = instance_inj_ctrl__instance_filter_feedback__instance_filt3__rst;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt3__filtered_value = instance_inj_ctrl__instance_filter_feedback__instance_filt3__instance_filter__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__clock = instance_inj_ctrl__instance_filter_feedback__instance_filt4__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__new_value = instance_inj_ctrl__instance_filter_feedback__instance_filt4__new_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__rst = instance_inj_ctrl__instance_filter_feedback__instance_filt4__rst;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt4__filtered_value = instance_inj_ctrl__instance_filter_feedback__instance_filt4__instance_filter__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__clock = instance_inj_ctrl__instance_filter_feedback__instance_filt5__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__new_value = instance_inj_ctrl__instance_filter_feedback__instance_filt5__new_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__rst = instance_inj_ctrl__instance_filter_feedback__instance_filt5__rst;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt5__filtered_value = instance_inj_ctrl__instance_filter_feedback__instance_filt5__instance_filter__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__clock = instance_inj_ctrl__instance_filter_feedback__instance_filt6__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__new_value = instance_inj_ctrl__instance_filter_feedback__instance_filt6__new_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__rst = instance_inj_ctrl__instance_filter_feedback__instance_filt6__rst;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt6__filtered_value = instance_inj_ctrl__instance_filter_feedback__instance_filt6__instance_filter__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__clock = instance_inj_ctrl__instance_filter_feedback__instance_filt7__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__new_value = instance_inj_ctrl__instance_filter_feedback__instance_filt7__new_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__rst = instance_inj_ctrl__instance_filter_feedback__instance_filt7__rst;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt7__filtered_value = instance_inj_ctrl__instance_filter_feedback__instance_filt7__instance_filter__filtered_value;

assign instance_inj_ctrl__instance_filter_feedback__instance_filt0__clock = instance_inj_ctrl__instance_filter_feedback__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt0__new_value = instance_inj_ctrl__instance_filter_feedback__v_fbk_0;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt0__rst = instance_inj_ctrl__instance_filter_feedback__rst;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_f0 = instance_inj_ctrl__instance_filter_feedback__instance_filt0__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt1__clock = instance_inj_ctrl__instance_filter_feedback__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt1__new_value = instance_inj_ctrl__instance_filter_feedback__v_fbk_1;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt1__rst = instance_inj_ctrl__instance_filter_feedback__rst;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_f1 = instance_inj_ctrl__instance_filter_feedback__instance_filt1__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt2__clock = instance_inj_ctrl__instance_filter_feedback__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt2__new_value = instance_inj_ctrl__instance_filter_feedback__v_fbk_2;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt2__rst = instance_inj_ctrl__instance_filter_feedback__rst;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_f2 = instance_inj_ctrl__instance_filter_feedback__instance_filt2__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt3__clock = instance_inj_ctrl__instance_filter_feedback__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt3__new_value = instance_inj_ctrl__instance_filter_feedback__v_fbk_3;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt3__rst = instance_inj_ctrl__instance_filter_feedback__rst;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_f3 = instance_inj_ctrl__instance_filter_feedback__instance_filt3__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt4__clock = instance_inj_ctrl__instance_filter_feedback__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt4__new_value = instance_inj_ctrl__instance_filter_feedback__v_fbk_4;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt4__rst = instance_inj_ctrl__instance_filter_feedback__rst;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_f4 = instance_inj_ctrl__instance_filter_feedback__instance_filt4__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt5__clock = instance_inj_ctrl__instance_filter_feedback__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt5__new_value = instance_inj_ctrl__instance_filter_feedback__v_fbk_5;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt5__rst = instance_inj_ctrl__instance_filter_feedback__rst;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_f5 = instance_inj_ctrl__instance_filter_feedback__instance_filt5__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt6__clock = instance_inj_ctrl__instance_filter_feedback__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt6__new_value = instance_inj_ctrl__instance_filter_feedback__i_fbk_0;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt6__rst = instance_inj_ctrl__instance_filter_feedback__rst;
assign instance_inj_ctrl__instance_filter_feedback__i_fbk_f0 = instance_inj_ctrl__instance_filter_feedback__instance_filt6__filtered_value;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt7__clock = instance_inj_ctrl__instance_filter_feedback__clock;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt7__new_value = instance_inj_ctrl__instance_filter_feedback__i_fbk_1;
assign instance_inj_ctrl__instance_filter_feedback__instance_filt7__rst = instance_inj_ctrl__instance_filter_feedback__rst;
assign instance_inj_ctrl__instance_filter_feedback__i_fbk_f1 = instance_inj_ctrl__instance_filter_feedback__instance_filt7__filtered_value;
  
  
wire [2-1:0] instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_f0;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_f1;
wire [6-1:0] instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f0;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f1;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f2;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f3;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f4;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f5;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_0;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_1;
wire [2-1:0] instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_f;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_0;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_1;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_2;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_3;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_4;
wire  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_5;
wire [6-1:0] instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f;
 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_0  =  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk  [0]; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_1  =  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk  [1]; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_2  =  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk  [2]; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_3  =  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk  [3]; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_4  =  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk  [4]; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_5  =  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk  [5]; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f  [0]=  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f0  ; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f  [1]=  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f1  ; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f  [2]=  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f2  ; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f  [3]=  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f3  ; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f  [4]=  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f4  ; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f  [5]=  instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f5  ; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_0  =(~(  instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk  [0])); 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_1  =(~(  instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk  [1])); 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_f  [0]=  instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_f0  ; 
  assign   instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_f  [1]=  instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_f1  ;
assign instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk = instance_inj_ctrl__instance_filter_feedback__i_fbk;
assign instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_f0 = instance_inj_ctrl__instance_filter_feedback__i_fbk_f0;
assign instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_f1 = instance_inj_ctrl__instance_filter_feedback__i_fbk_f1;
assign instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk = instance_inj_ctrl__instance_filter_feedback__v_fbk;
assign instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f0 = instance_inj_ctrl__instance_filter_feedback__v_fbk_f0;
assign instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f1 = instance_inj_ctrl__instance_filter_feedback__v_fbk_f1;
assign instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f2 = instance_inj_ctrl__instance_filter_feedback__v_fbk_f2;
assign instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f3 = instance_inj_ctrl__instance_filter_feedback__v_fbk_f3;
assign instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f4 = instance_inj_ctrl__instance_filter_feedback__v_fbk_f4;
assign instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f5 = instance_inj_ctrl__instance_filter_feedback__v_fbk_f5;
assign instance_inj_ctrl__instance_filter_feedback__i_fbk_0 = instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_0;
assign instance_inj_ctrl__instance_filter_feedback__i_fbk_1 = instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_1;
assign instance_inj_ctrl__instance_filter_feedback__i_fbk_f = instance_inj_ctrl__instance_filter_feedback__instance_interface__i_fbk_f;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_0 = instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_0;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_1 = instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_1;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_2 = instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_2;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_3 = instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_3;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_4 = instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_4;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_5 = instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_5;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk_f = instance_inj_ctrl__instance_filter_feedback__instance_interface__v_fbk_f;

assign instance_inj_ctrl__instance_filter_feedback__clock = instance_inj_ctrl__clock_internal;
assign instance_inj_ctrl__instance_filter_feedback__i_fbk = instance_inj_ctrl__i_fbk;
assign instance_inj_ctrl__instance_filter_feedback__rst = instance_inj_ctrl__rst;
assign instance_inj_ctrl__instance_filter_feedback__v_fbk = instance_inj_ctrl__v_fbk;
assign instance_inj_ctrl__i_fbk_f = instance_inj_ctrl__instance_filter_feedback__i_fbk_f;
assign instance_inj_ctrl__v_fbk_f = instance_inj_ctrl__instance_filter_feedback__v_fbk_f;
  
  
wire  instance_inj_ctrl__instance_merge__error1;
wire  instance_inj_ctrl__instance_merge__error2;
wire  instance_inj_ctrl__instance_merge__hl_034;
wire  instance_inj_ctrl__instance_merge__hl_125;
wire  instance_inj_ctrl__instance_merge__relpot1;
wire  instance_inj_ctrl__instance_merge__relpot2;
wire [2-1:0] instance_inj_ctrl__instance_merge__hlo;
wire  instance_inj_ctrl__instance_merge__irq;
wire  instance_inj_ctrl__instance_merge__rel_pot_en;
 
  assign   instance_inj_ctrl__instance_merge__rel_pot_en  =  instance_inj_ctrl__instance_merge__relpot2  |  instance_inj_ctrl__instance_merge__relpot1  ; 
  assign   instance_inj_ctrl__instance_merge__hlo  [0]=(~(  instance_inj_ctrl__instance_merge__hl_034  )); 
  assign   instance_inj_ctrl__instance_merge__hlo  [1]=(~(  instance_inj_ctrl__instance_merge__hl_125  )); 
  assign   instance_inj_ctrl__instance_merge__irq  =(~(  instance_inj_ctrl__instance_merge__error1  |  instance_inj_ctrl__instance_merge__error2  ));
assign instance_inj_ctrl__instance_merge__error1 = instance_inj_ctrl__error1;
assign instance_inj_ctrl__instance_merge__error2 = instance_inj_ctrl__error2;
assign instance_inj_ctrl__instance_merge__hl_034 = instance_inj_ctrl__hl_034;
assign instance_inj_ctrl__instance_merge__hl_125 = instance_inj_ctrl__hl_125;
assign instance_inj_ctrl__instance_merge__relpot1 = instance_inj_ctrl__relpot1;
assign instance_inj_ctrl__instance_merge__relpot2 = instance_inj_ctrl__relpot2;
assign instance_inj_ctrl__hlo = instance_inj_ctrl__instance_merge__hlo;
assign instance_inj_ctrl__irq = instance_inj_ctrl__instance_merge__irq;
assign instance_inj_ctrl__rel_pot_en = instance_inj_ctrl__instance_merge__rel_pot_en;
  
  
wire  instance_inj_ctrl__instance_merge_actuators__t1_0;
wire  instance_inj_ctrl__instance_merge_actuators__t1_1;
wire  instance_inj_ctrl__instance_merge_actuators__t1_2;
wire  instance_inj_ctrl__instance_merge_actuators__t1_3;
wire  instance_inj_ctrl__instance_merge_actuators__t1_4;
wire  instance_inj_ctrl__instance_merge_actuators__t1_5;
wire  instance_inj_ctrl__instance_merge_actuators__t2_0;
wire  instance_inj_ctrl__instance_merge_actuators__t2_1;
wire  instance_inj_ctrl__instance_merge_actuators__t2_2;
wire  instance_inj_ctrl__instance_merge_actuators__t2_3;
wire  instance_inj_ctrl__instance_merge_actuators__t2_4;
wire  instance_inj_ctrl__instance_merge_actuators__t2_5;
wire  instance_inj_ctrl__instance_merge_actuators__t3_034;
wire  instance_inj_ctrl__instance_merge_actuators__t3_125;
wire [6-1:0] instance_inj_ctrl__instance_merge_actuators__t1;
wire [6-1:0] instance_inj_ctrl__instance_merge_actuators__t2;
wire [2-1:0] instance_inj_ctrl__instance_merge_actuators__t3;
  
  
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_0;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_1;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_2;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_3;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_4;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_5;
reg [6-1:0] instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1;
 
  always @(        instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_0                    or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_1              or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_2             or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_3            or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_4           or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_5   )
       begin :  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__vhdl_merge_t1   
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1   [0]<=(~(  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_0  )); 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1   [1]<=(~(  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_1  )); 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1   [2]<=(~(  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_2  )); 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1   [3]<=(~(  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_3  )); 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1   [4]<=(~(  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_4  )); 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1   [5]<=(~(  instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_5  ));
       end
 
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_0 = instance_inj_ctrl__instance_merge_actuators__t1_0;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_1 = instance_inj_ctrl__instance_merge_actuators__t1_1;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_2 = instance_inj_ctrl__instance_merge_actuators__t1_2;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_3 = instance_inj_ctrl__instance_merge_actuators__t1_3;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_4 = instance_inj_ctrl__instance_merge_actuators__t1_4;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1_5 = instance_inj_ctrl__instance_merge_actuators__t1_5;
assign instance_inj_ctrl__instance_merge_actuators__t1 = instance_inj_ctrl__instance_merge_actuators__instance_merge_t1__t1;
  
  
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_0;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_1;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_2;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_3;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_4;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_5;
reg [6-1:0] instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2;
 
  always @(        instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_0                    or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_1              or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_2             or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_3            or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_4           or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_5   )
       begin :  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__vhdl_merge_t2   
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2   [0]<=  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_0  ; 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2   [1]<=  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_1  ; 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2   [2]<=  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_2  ; 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2   [3]<=  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_3  ; 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2   [4]<=  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_4  ; 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2   [5]<=  instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_5  ;
       end
 
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_0 = instance_inj_ctrl__instance_merge_actuators__t2_0;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_1 = instance_inj_ctrl__instance_merge_actuators__t2_1;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_2 = instance_inj_ctrl__instance_merge_actuators__t2_2;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_3 = instance_inj_ctrl__instance_merge_actuators__t2_3;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_4 = instance_inj_ctrl__instance_merge_actuators__t2_4;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2_5 = instance_inj_ctrl__instance_merge_actuators__t2_5;
assign instance_inj_ctrl__instance_merge_actuators__t2 = instance_inj_ctrl__instance_merge_actuators__instance_merge_t2__t2;
  
  
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3_034;
wire  instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3_125;
reg [2-1:0] instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3;
 
  always @(    instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3_034            or    instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3_125   )
       begin :  instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__vhdl_merge_t3   
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3   [0]<=(~(  instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3_034  )); 
          instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3   [1]<=(~(  instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3_125  ));
       end
 
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3_034 = instance_inj_ctrl__instance_merge_actuators__t3_034;
assign instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3_125 = instance_inj_ctrl__instance_merge_actuators__t3_125;
assign instance_inj_ctrl__instance_merge_actuators__t3 = instance_inj_ctrl__instance_merge_actuators__instance_merge_t3__t3;

assign instance_inj_ctrl__instance_merge_actuators__t1_0 = instance_inj_ctrl__t1_0;
assign instance_inj_ctrl__instance_merge_actuators__t1_1 = instance_inj_ctrl__t1_1;
assign instance_inj_ctrl__instance_merge_actuators__t1_2 = instance_inj_ctrl__t1_2;
assign instance_inj_ctrl__instance_merge_actuators__t1_3 = instance_inj_ctrl__t1_3;
assign instance_inj_ctrl__instance_merge_actuators__t1_4 = instance_inj_ctrl__t1_4;
assign instance_inj_ctrl__instance_merge_actuators__t1_5 = instance_inj_ctrl__t1_5;
assign instance_inj_ctrl__instance_merge_actuators__t2_0 = instance_inj_ctrl__t2_0;
assign instance_inj_ctrl__instance_merge_actuators__t2_1 = instance_inj_ctrl__t2_1;
assign instance_inj_ctrl__instance_merge_actuators__t2_2 = instance_inj_ctrl__t2_2;
assign instance_inj_ctrl__instance_merge_actuators__t2_3 = instance_inj_ctrl__t2_3;
assign instance_inj_ctrl__instance_merge_actuators__t2_4 = instance_inj_ctrl__t2_4;
assign instance_inj_ctrl__instance_merge_actuators__t2_5 = instance_inj_ctrl__t2_5;
assign instance_inj_ctrl__instance_merge_actuators__t3_034 = instance_inj_ctrl__t3_034;
assign instance_inj_ctrl__instance_merge_actuators__t3_125 = instance_inj_ctrl__t3_125;
assign instance_inj_ctrl__t1 = instance_inj_ctrl__instance_merge_actuators__t1;
assign instance_inj_ctrl__t2 = instance_inj_ctrl__instance_merge_actuators__t2;
assign instance_inj_ctrl__t3 = instance_inj_ctrl__instance_merge_actuators__t3;
  
  
wire [6-1:0] instance_inj_ctrl__instance_registers__a_bus;
wire  instance_inj_ctrl__instance_registers__clock;
wire [21-1:0] instance_inj_ctrl__instance_registers__digital_input;
wire  instance_inj_ctrl__instance_registers__en_fbk_store_034;
wire  instance_inj_ctrl__instance_registers__en_fbk_store_125;
wire  instance_inj_ctrl__instance_registers__en_state_store_034;
wire  instance_inj_ctrl__instance_registers__en_state_store_125;
wire [3-1:0] instance_inj_ctrl__instance_registers__fbk_pwm;
wire [7-1:0] instance_inj_ctrl__instance_registers__global_state_034;
wire [7-1:0] instance_inj_ctrl__instance_registers__global_state_125;
wire [2-1:0] instance_inj_ctrl__instance_registers__i_fbk_f;
wire [7-1:0] instance_inj_ctrl__instance_registers__nssm_in;
wire  instance_inj_ctrl__instance_registers__rd_en;
wire  instance_inj_ctrl__instance_registers__rel_pot_en;
wire  instance_inj_ctrl__instance_registers__rst;
wire [6-1:0] instance_inj_ctrl__instance_registers__v_fbk_f;
wire  instance_inj_ctrl__instance_registers__wr_en;
wire [7:0] instance_inj_ctrl__instance_registers__digital_output;
wire  instance_inj_ctrl__instance_registers__in_speed_lev;
wire  instance_inj_ctrl__instance_registers__knock1u;
wire  instance_inj_ctrl__instance_registers__knock2u;
wire  instance_inj_ctrl__instance_registers__pickup_hall;
wire  instance_inj_ctrl__instance_registers__relpot;
wire [8-1:0] instance_inj_ctrl__instance_registers__r_t1;
wire [7-1:0] instance_inj_ctrl__instance_registers__r_t2;
wire [8-1:0] instance_inj_ctrl__instance_registers__r_t3_034;
wire [8-1:0] instance_inj_ctrl__instance_registers__r_t3_125;
wire [7-1:0] instance_inj_ctrl__instance_registers__r_t4_034;
wire [7-1:0] instance_inj_ctrl__instance_registers__r_t4_125;
wire [10-1:0] instance_inj_ctrl__instance_registers__r_tb_034;
wire [10-1:0] instance_inj_ctrl__instance_registers__r_tb_125;
wire [12-1:0] instance_inj_ctrl__instance_registers__r_th_034;
wire [12-1:0] instance_inj_ctrl__instance_registers__r_th_125;
wire [7-1:0] instance_inj_ctrl__instance_registers__r_tonh;
wire [7-1:0] instance_inj_ctrl__instance_registers__r_tonl;
wire [7-1:0] instance_inj_ctrl__instance_registers__r_tp;
wire  instance_inj_ctrl__instance_registers__seg_speed_lev;
wire  instance_inj_ctrl__instance_registers__smot_camme_en;
wire [11-1:0] instance_inj_ctrl__instance_registers__status_reg_034;
wire [11-1:0] instance_inj_ctrl__instance_registers__status_reg_125;
wire [3-1:0] instance_inj_ctrl__instance_registers__test_en_034;
wire [3-1:0] instance_inj_ctrl__instance_registers__test_en_125;
wire  instance_inj_ctrl__instance_registers__trg_knock_en;
wire  instance_inj_ctrl__instance_registers__turbo_speed_lev;
wire [16-1:0] instance_inj_ctrl__instance_registers__d_bus;
 
   wire[13-1:0]  instance_inj_ctrl__instance_registers__add_decoded  ; 
   wire[13-1:0]  instance_inj_ctrl__instance_registers__add_decoded_r  ; 
   wire  instance_inj_ctrl__instance_registers__add_test_en  ; 
   wire[2-1:0]  instance_inj_ctrl__instance_registers__a_dig_in  ; 
   wire  instance_inj_ctrl__instance_registers__a_dig_out  ; 
   wire[2-1:0]  instance_inj_ctrl__instance_registers__a_fault_dec  ; 
   wire[2-1:0]  instance_inj_ctrl__instance_registers__a_fault_dec_r  ;  
  
wire [6-1:0] instance_inj_ctrl__instance_registers__instance_add_dec__a_bus;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__clock;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__rst;
reg [13-1:0] instance_inj_ctrl__instance_registers__instance_add_dec__add_decoded;
wire [13-1:0] instance_inj_ctrl__instance_registers__instance_add_dec__add_decoded_r;
reg  instance_inj_ctrl__instance_registers__instance_add_dec__add_test_en;
wire [2-1:0] instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_in;
reg  instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_out;
reg [2-1:0] instance_inj_ctrl__instance_registers__instance_add_dec__a_fault_dec;
wire [2-1:0] instance_inj_ctrl__instance_registers__instance_add_dec__a_fault_dec_r;
 
   wire[13-1:0]  instance_inj_ctrl__instance_registers__instance_add_dec__add_decoded_int  ; 
   wire[2-1:0]  instance_inj_ctrl__instance_registers__instance_add_dec__a_fault_dec_int  ; 
   wire[2-1:0]  instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_in_int  ; 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_out_int  ; 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__add_test_en_int  ; 
   wire[4:0]  instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus  ; 
  always @(  posedge    instance_inj_ctrl__instance_registers__instance_add_dec__clock          or  negedge   instance_inj_ctrl__instance_registers__instance_add_dec__rst  )
       begin :  instance_inj_ctrl__instance_registers__instance_add_dec__vhdl_add_dec  
         if (  instance_inj_ctrl__instance_registers__instance_add_dec__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_registers__instance_add_dec__add_decoded   <={13{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_add_dec__a_fault_dec   <={2{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_out   <=1'b0; 
               instance_inj_ctrl__instance_registers__instance_add_dec__add_test_en   <=1'b0;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_registers__instance_add_dec__add_decoded   <=  instance_inj_ctrl__instance_registers__instance_add_dec__add_decoded_int  &13'b1111111111111; 
               instance_inj_ctrl__instance_registers__instance_add_dec__a_fault_dec   <=  instance_inj_ctrl__instance_registers__instance_add_dec__a_fault_dec_int  &2'b11; 
               instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_out   <=  instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_out_int  &1'b1; 
               instance_inj_ctrl__instance_registers__instance_add_dec__add_test_en   <=  instance_inj_ctrl__instance_registers__instance_add_dec__add_test_en_int  &1'b1;
            end 
       end
  
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_in  ={2{  instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_in_int  }}&2'b11; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__add_decoded_r  =  instance_inj_ctrl__instance_registers__instance_add_dec__add_decoded_int  &13'b1111111111111; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__a_fault_dec_r  =  instance_inj_ctrl__instance_registers__instance_add_dec__a_fault_dec_int  &2'b11; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus  [0]=(~(  instance_inj_ctrl__instance_registers__instance_add_dec__a_bus  [0])); 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus  [1]=(~(  instance_inj_ctrl__instance_registers__instance_add_dec__a_bus  [1])); 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus  [2]=(~(  instance_inj_ctrl__instance_registers__instance_add_dec__a_bus  [2])); 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus  [3]=(~(  instance_inj_ctrl__instance_registers__instance_add_dec__a_bus  [3])); 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus  [4]=(~(  instance_inj_ctrl__instance_registers__instance_add_dec__a_bus  [4]));  
  
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i4;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i0;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i1;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i2;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i3;
wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i4;
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i4  );
  
  
 
   wire  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__o  ; 
  assign   instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__o  =(  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i0  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i1  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i2  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i3  &  instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i4  );
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t1__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t2__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tab__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tah__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbb__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tbh__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonh__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tonl__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_tp__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_034__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t3_125__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_034__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_t4_125__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr1__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_fr2__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_in_int1__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_a_dig_out__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[0];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i0 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[4];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i1 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[3];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i2 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[2];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i3 = instance_inj_ctrl__instance_registers__instance_add_dec__a_bus[1];
assign instance_inj_ctrl__instance_registers__instance_add_dec__dwand_add_test_en_int__i4 = instance_inj_ctrl__instance_registers__instance_add_dec__not_a_bus[0];

assign instance_inj_ctrl__instance_registers__instance_add_dec__a_bus = instance_inj_ctrl__instance_registers__a_bus;
assign instance_inj_ctrl__instance_registers__instance_add_dec__clock = instance_inj_ctrl__instance_registers__clock;
assign instance_inj_ctrl__instance_registers__instance_add_dec__rst = instance_inj_ctrl__instance_registers__rst;
assign instance_inj_ctrl__instance_registers__add_decoded = instance_inj_ctrl__instance_registers__instance_add_dec__add_decoded;
assign instance_inj_ctrl__instance_registers__add_decoded_r = instance_inj_ctrl__instance_registers__instance_add_dec__add_decoded_r;
assign instance_inj_ctrl__instance_registers__add_test_en = instance_inj_ctrl__instance_registers__instance_add_dec__add_test_en;
assign instance_inj_ctrl__instance_registers__a_dig_in = instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_in;
assign instance_inj_ctrl__instance_registers__a_dig_out = instance_inj_ctrl__instance_registers__instance_add_dec__a_dig_out;
assign instance_inj_ctrl__instance_registers__a_fault_dec = instance_inj_ctrl__instance_registers__instance_add_dec__a_fault_dec;
assign instance_inj_ctrl__instance_registers__a_fault_dec_r = instance_inj_ctrl__instance_registers__instance_add_dec__a_fault_dec_r;
  
  
wire [2-1:0] instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__a_dig_in;
wire  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__clock;
wire [21-1:0] instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__digital_input;
wire [3-1:0] instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__fbk_pwm;
wire [7-1:0] instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__nssm_in;
wire  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__rd_en;
wire  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__rst;
wire [16-1:0] instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__d_bus;
 
   reg[31:0]  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__store_digital_input  ; 
  always @(  posedge    instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__clock          or  negedge   instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__rst  )
       begin :  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__vhdl_digital_inputs_handle  
         if (  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__rst  ==1'b0) 
             instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__store_digital_input   <={32{1'b0}};
          else 
            begin  
               instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__store_digital_input   [20:0]<=  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__digital_input  ; 
               instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__store_digital_input   [23:21]<=  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__fbk_pwm  ; 
               instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__store_digital_input   [30:24]<=  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__nssm_in  ;
            end 
       end
  
  assign   instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__d_bus  =((  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__a_dig_in  [0]==1'b1&  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__rd_en  ==1'b1)) ?   instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__store_digital_input  [15:0]:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__d_bus  =((  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__a_dig_in  [1]==1'b1&  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__rd_en  ==1'b1)) ? {1'b0,  instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__store_digital_input  [30:16]}:16'bZZZZZZZZZZZZZZZZ;
assign instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__a_dig_in = instance_inj_ctrl__instance_registers__a_dig_in;
assign instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__clock = instance_inj_ctrl__instance_registers__clock;
assign instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__digital_input = instance_inj_ctrl__instance_registers__digital_input;
assign instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__fbk_pwm = instance_inj_ctrl__instance_registers__fbk_pwm;
assign instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__nssm_in = instance_inj_ctrl__instance_registers__nssm_in;
assign instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__rd_en = instance_inj_ctrl__instance_registers__rd_en;
assign instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__rst = instance_inj_ctrl__instance_registers__rst;
assign instance_inj_ctrl__instance_registers__d_bus = instance_inj_ctrl__instance_registers__instance_digital_inputs_handle__d_bus;
  
  
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__a_dig_out;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__clock;
wire [16-1:0] instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__rst;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__wr_en;
wire [7:0] instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__digital_output;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__in_speed_lev;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock1u;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock2u;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__pickup_hall;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__seg_speed_lev;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__smot_camme_en;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__trg_knock_en;
wire  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__turbo_speed_lev;
 
   reg[7:0]  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__digital_output_store  ; 
   reg  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__smot_camme_store  ; 
   reg  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__trg_knock_store  ; 
   reg  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock1_store  ; 
   reg  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock2_store  ; 
   reg  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__in_speed_lev_store  ; 
   reg  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__seg_speed_lev_store  ; 
   reg  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__turbo_speed_lev_store  ; 
   reg  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__pickup_hall_store  ; 
  assign   instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__digital_output  =  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__digital_output_store  ; 
  assign   instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__smot_camme_en  =  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__smot_camme_store  ; 
  assign   instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__trg_knock_en  =  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__trg_knock_store  ; 
  assign   instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__pickup_hall  =  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__pickup_hall_store  ; 
  assign   instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__in_speed_lev  =  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__in_speed_lev_store  ; 
  assign   instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__seg_speed_lev  =  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__seg_speed_lev_store  ; 
  assign   instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__turbo_speed_lev  =  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__turbo_speed_lev_store  ; 
  assign   instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock1u  =  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock1_store  ; 
  assign   instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock2u  =  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock2_store  ; 
  always @(  posedge    instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__clock          or  negedge   instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__rst  )
       begin :  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__vhdl_digital_outputs_handle  
         if (  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__digital_output_store   <={8{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__smot_camme_store   <=1'b0; 
               instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__trg_knock_store   <=1'b0; 
               instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__pickup_hall_store   <=1'b0; 
               instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__in_speed_lev_store   <=1'b0; 
               instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__seg_speed_lev_store   <=1'b0; 
               instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__turbo_speed_lev_store   <=1'b0; 
               instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock1_store   <=1'b0; 
               instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock2_store   <=1'b0;
            end 
          else 
            begin 
              if (  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__a_dig_out  ==1'b1&  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__wr_en  ==1'b1)
                 begin  
                    instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__digital_output_store   <=  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus  [7:0]; 
                    instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__smot_camme_store   <=  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus  [8]; 
                    instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__trg_knock_store   <=  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus  [9]; 
                    instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__pickup_hall_store   <=  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus  [10]; 
                    instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__in_speed_lev_store   <=  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus  [11]; 
                    instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__seg_speed_lev_store   <=  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus  [12]; 
                    instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__turbo_speed_lev_store   <=  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus  [13]; 
                    instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock1_store   <=  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus  [14]; 
                    instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock2_store   <=  instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus  [15];
                 end 
            end 
       end
 
assign instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__a_dig_out = instance_inj_ctrl__instance_registers__a_dig_out;
assign instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__clock = instance_inj_ctrl__instance_registers__clock;
assign instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__d_bus = instance_inj_ctrl__instance_registers__d_bus;
assign instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__rst = instance_inj_ctrl__instance_registers__rst;
assign instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__wr_en = instance_inj_ctrl__instance_registers__wr_en;
assign instance_inj_ctrl__instance_registers__digital_output = instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__digital_output;
assign instance_inj_ctrl__instance_registers__in_speed_lev = instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__in_speed_lev;
assign instance_inj_ctrl__instance_registers__knock1u = instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock1u;
assign instance_inj_ctrl__instance_registers__knock2u = instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__knock2u;
assign instance_inj_ctrl__instance_registers__pickup_hall = instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__pickup_hall;
assign instance_inj_ctrl__instance_registers__seg_speed_lev = instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__seg_speed_lev;
assign instance_inj_ctrl__instance_registers__smot_camme_en = instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__smot_camme_en;
assign instance_inj_ctrl__instance_registers__trg_knock_en = instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__trg_knock_en;
assign instance_inj_ctrl__instance_registers__turbo_speed_lev = instance_inj_ctrl__instance_registers__instance_digital_outputs_handle__turbo_speed_lev;
  
  
wire [2-1:0] instance_inj_ctrl__instance_registers__instance_error_handle__a_fault_dec;
wire [2-1:0] instance_inj_ctrl__instance_registers__instance_error_handle__a_fault_dec_r;
wire  instance_inj_ctrl__instance_registers__instance_error_handle__clock;
wire  instance_inj_ctrl__instance_registers__instance_error_handle__en_fbk_store_034;
wire  instance_inj_ctrl__instance_registers__instance_error_handle__en_fbk_store_125;
wire  instance_inj_ctrl__instance_registers__instance_error_handle__en_state_store_034;
wire  instance_inj_ctrl__instance_registers__instance_error_handle__en_state_store_125;
wire [7-1:0] instance_inj_ctrl__instance_registers__instance_error_handle__global_state_034;
wire [7-1:0] instance_inj_ctrl__instance_registers__instance_error_handle__global_state_125;
wire [2-1:0] instance_inj_ctrl__instance_registers__instance_error_handle__i_fbk_f;
wire  instance_inj_ctrl__instance_registers__instance_error_handle__rd_en;
wire  instance_inj_ctrl__instance_registers__instance_error_handle__rel_pot_en;
wire  instance_inj_ctrl__instance_registers__instance_error_handle__rst;
wire [6-1:0] instance_inj_ctrl__instance_registers__instance_error_handle__v_fbk_f;
wire  instance_inj_ctrl__instance_registers__instance_error_handle__wr_en;
wire  instance_inj_ctrl__instance_registers__instance_error_handle__relpot;
wire [11-1:0] instance_inj_ctrl__instance_registers__instance_error_handle__status_reg_034;
wire [11-1:0] instance_inj_ctrl__instance_registers__instance_error_handle__status_reg_125;
wire [16-1:0] instance_inj_ctrl__instance_registers__instance_error_handle__d_bus;
 
   reg[10:0]  instance_inj_ctrl__instance_registers__instance_error_handle__sr_034  ; 
   reg[10:0]  instance_inj_ctrl__instance_registers__instance_error_handle__sr_125  ; 
  assign   instance_inj_ctrl__instance_registers__instance_error_handle__status_reg_034  =  instance_inj_ctrl__instance_registers__instance_error_handle__sr_034  [10:0]; 
  assign   instance_inj_ctrl__instance_registers__instance_error_handle__status_reg_125  =  instance_inj_ctrl__instance_registers__instance_error_handle__sr_125  [10:0]; 
  assign   instance_inj_ctrl__instance_registers__instance_error_handle__relpot  =  instance_inj_ctrl__instance_registers__instance_error_handle__rel_pot_en  ; 
  always @(   posedge     instance_inj_ctrl__instance_registers__instance_error_handle__clock           or  negedge   instance_inj_ctrl__instance_registers__instance_error_handle__rst          or  posedge   instance_inj_ctrl__instance_registers__instance_error_handle__wr_en  )
       begin :  instance_inj_ctrl__instance_registers__instance_error_handle__vhdl_st_reg_wr_034  
         if ((  instance_inj_ctrl__instance_registers__instance_error_handle__rst  ==1'b0)|(  instance_inj_ctrl__instance_registers__instance_error_handle__a_fault_dec  [0]==1'b1&  instance_inj_ctrl__instance_registers__instance_error_handle__wr_en  ==1'b1)) 
             instance_inj_ctrl__instance_registers__instance_error_handle__sr_034   <={11{1'b0}};
          else 
            begin 
              if (  instance_inj_ctrl__instance_registers__instance_error_handle__en_state_store_034  ==1'b1) 
                  instance_inj_ctrl__instance_registers__instance_error_handle__sr_034   [6:0]<=  instance_inj_ctrl__instance_registers__instance_error_handle__global_state_034  ;
              if (  instance_inj_ctrl__instance_registers__instance_error_handle__en_fbk_store_034  ==1'b1)
                 begin  
                    instance_inj_ctrl__instance_registers__instance_error_handle__sr_034   [7]<=  instance_inj_ctrl__instance_registers__instance_error_handle__i_fbk_f  [0]; 
                    instance_inj_ctrl__instance_registers__instance_error_handle__sr_034   [8]<=  instance_inj_ctrl__instance_registers__instance_error_handle__v_fbk_f  [0]; 
                    instance_inj_ctrl__instance_registers__instance_error_handle__sr_034   [9]<=  instance_inj_ctrl__instance_registers__instance_error_handle__v_fbk_f  [3]; 
                    instance_inj_ctrl__instance_registers__instance_error_handle__sr_034   [10]<=  instance_inj_ctrl__instance_registers__instance_error_handle__v_fbk_f  [4];
                 end 
            end 
       end
  
  always @(   posedge     instance_inj_ctrl__instance_registers__instance_error_handle__clock           or  negedge   instance_inj_ctrl__instance_registers__instance_error_handle__rst          or  posedge   instance_inj_ctrl__instance_registers__instance_error_handle__wr_en  )
       begin :  instance_inj_ctrl__instance_registers__instance_error_handle__vhdl_st_reg_wr_125  
         if ((  instance_inj_ctrl__instance_registers__instance_error_handle__rst  ==1'b0)|(  instance_inj_ctrl__instance_registers__instance_error_handle__a_fault_dec  [1]==1'b1&  instance_inj_ctrl__instance_registers__instance_error_handle__wr_en  ==1'b1)) 
             instance_inj_ctrl__instance_registers__instance_error_handle__sr_125   <={11{1'b0}};
          else 
            begin 
              if (  instance_inj_ctrl__instance_registers__instance_error_handle__en_state_store_125  ==1'b1) 
                  instance_inj_ctrl__instance_registers__instance_error_handle__sr_125   [6:0]<=  instance_inj_ctrl__instance_registers__instance_error_handle__global_state_125  ;
              if (  instance_inj_ctrl__instance_registers__instance_error_handle__en_fbk_store_125  ==1'b1)
                 begin  
                    instance_inj_ctrl__instance_registers__instance_error_handle__sr_125   [7]<=  instance_inj_ctrl__instance_registers__instance_error_handle__i_fbk_f  [1]; 
                    instance_inj_ctrl__instance_registers__instance_error_handle__sr_125   [8]<=  instance_inj_ctrl__instance_registers__instance_error_handle__v_fbk_f  [1]; 
                    instance_inj_ctrl__instance_registers__instance_error_handle__sr_125   [9]<=  instance_inj_ctrl__instance_registers__instance_error_handle__v_fbk_f  [2]; 
                    instance_inj_ctrl__instance_registers__instance_error_handle__sr_125   [10]<=  instance_inj_ctrl__instance_registers__instance_error_handle__v_fbk_f  [5];
                 end 
            end 
       end
  
  assign   instance_inj_ctrl__instance_registers__instance_error_handle__d_bus  =((  instance_inj_ctrl__instance_registers__instance_error_handle__a_fault_dec_r  [0]==1'b1&  instance_inj_ctrl__instance_registers__instance_error_handle__rd_en  ==1'b1)) ? {5'b00000,  instance_inj_ctrl__instance_registers__instance_error_handle__sr_034  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_error_handle__d_bus  =((  instance_inj_ctrl__instance_registers__instance_error_handle__a_fault_dec_r  [1]==1'b1&  instance_inj_ctrl__instance_registers__instance_error_handle__rd_en  ==1'b1)) ? {5'b00000,  instance_inj_ctrl__instance_registers__instance_error_handle__sr_125  }:16'bZZZZZZZZZZZZZZZZ;
assign instance_inj_ctrl__instance_registers__instance_error_handle__a_fault_dec = instance_inj_ctrl__instance_registers__a_fault_dec;
assign instance_inj_ctrl__instance_registers__instance_error_handle__a_fault_dec_r = instance_inj_ctrl__instance_registers__a_fault_dec_r;
assign instance_inj_ctrl__instance_registers__instance_error_handle__clock = instance_inj_ctrl__instance_registers__clock;
assign instance_inj_ctrl__instance_registers__instance_error_handle__en_fbk_store_034 = instance_inj_ctrl__instance_registers__en_fbk_store_034;
assign instance_inj_ctrl__instance_registers__instance_error_handle__en_fbk_store_125 = instance_inj_ctrl__instance_registers__en_fbk_store_125;
assign instance_inj_ctrl__instance_registers__instance_error_handle__en_state_store_034 = instance_inj_ctrl__instance_registers__en_state_store_034;
assign instance_inj_ctrl__instance_registers__instance_error_handle__en_state_store_125 = instance_inj_ctrl__instance_registers__en_state_store_125;
assign instance_inj_ctrl__instance_registers__instance_error_handle__global_state_034 = instance_inj_ctrl__instance_registers__global_state_034;
assign instance_inj_ctrl__instance_registers__instance_error_handle__global_state_125 = instance_inj_ctrl__instance_registers__global_state_125;
assign instance_inj_ctrl__instance_registers__instance_error_handle__i_fbk_f = instance_inj_ctrl__instance_registers__i_fbk_f;
assign instance_inj_ctrl__instance_registers__instance_error_handle__rd_en = instance_inj_ctrl__instance_registers__rd_en;
assign instance_inj_ctrl__instance_registers__instance_error_handle__rel_pot_en = instance_inj_ctrl__instance_registers__rel_pot_en;
assign instance_inj_ctrl__instance_registers__instance_error_handle__rst = instance_inj_ctrl__instance_registers__rst;
assign instance_inj_ctrl__instance_registers__instance_error_handle__v_fbk_f = instance_inj_ctrl__instance_registers__v_fbk_f;
assign instance_inj_ctrl__instance_registers__instance_error_handle__wr_en = instance_inj_ctrl__instance_registers__wr_en;
assign instance_inj_ctrl__instance_registers__relpot = instance_inj_ctrl__instance_registers__instance_error_handle__relpot;
assign instance_inj_ctrl__instance_registers__status_reg_034 = instance_inj_ctrl__instance_registers__instance_error_handle__status_reg_034;
assign instance_inj_ctrl__instance_registers__status_reg_125 = instance_inj_ctrl__instance_registers__instance_error_handle__status_reg_125;
assign instance_inj_ctrl__instance_registers__d_bus = instance_inj_ctrl__instance_registers__instance_error_handle__d_bus;
  
  
wire [13-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded;
wire [13-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r;
wire  instance_inj_ctrl__instance_registers__instance_in_reg__clock;
wire  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en;
wire  instance_inj_ctrl__instance_registers__instance_in_reg__rst;
wire  instance_inj_ctrl__instance_registers__instance_in_reg__wr_en;
wire [8-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_t1;
wire [7-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_t2;
wire [8-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_t3_034;
wire [8-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_t3_125;
wire [7-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_t4_034;
wire [7-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_t4_125;
wire [10-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_tb_034;
wire [10-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_tb_125;
wire [12-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_th_034;
wire [12-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_th_125;
wire [7-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_tonh;
wire [7-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_tonl;
wire [7-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__r_tp;
wire [16-1:0] instance_inj_ctrl__instance_registers__instance_in_reg__d_bus;
 
   reg[12-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__th_034  ; 
   reg[12-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__th_125  ; 
   reg[7-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__t2  ; 
   reg[7-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__tp  ; 
   reg[7-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__t4_034  ; 
   reg[7-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__t4_125  ; 
   reg[7-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__tonh  ; 
   reg[7-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__tonl  ; 
   reg[8-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__t1  ; 
   reg[8-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__t3_034  ; 
   reg[8-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__t3_125  ; 
   reg[10-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__tb_034  ; 
   reg[10-1:0]  instance_inj_ctrl__instance_registers__instance_in_reg__tb_125  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_t1  =  instance_inj_ctrl__instance_registers__instance_in_reg__t1  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_t2  =  instance_inj_ctrl__instance_registers__instance_in_reg__t2  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_tb_034  =  instance_inj_ctrl__instance_registers__instance_in_reg__tb_034  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_th_034  =  instance_inj_ctrl__instance_registers__instance_in_reg__th_034  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_tb_125  =  instance_inj_ctrl__instance_registers__instance_in_reg__tb_125  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_th_125  =  instance_inj_ctrl__instance_registers__instance_in_reg__th_125  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_tonh  =  instance_inj_ctrl__instance_registers__instance_in_reg__tonh  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_tonl  =  instance_inj_ctrl__instance_registers__instance_in_reg__tonl  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_tp  =  instance_inj_ctrl__instance_registers__instance_in_reg__tp  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_t3_034  =  instance_inj_ctrl__instance_registers__instance_in_reg__t3_034  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_t3_125  =  instance_inj_ctrl__instance_registers__instance_in_reg__t3_125  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_t4_034  =  instance_inj_ctrl__instance_registers__instance_in_reg__t4_034  ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__r_t4_125  =  instance_inj_ctrl__instance_registers__instance_in_reg__t4_125  ; 
  always @(  posedge    instance_inj_ctrl__instance_registers__instance_in_reg__clock          or  negedge   instance_inj_ctrl__instance_registers__instance_in_reg__rst  )
       begin :  instance_inj_ctrl__instance_registers__instance_in_reg__vhdl_in_reg  
         if (  instance_inj_ctrl__instance_registers__instance_in_reg__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_registers__instance_in_reg__t1   <={8{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__t2   <={7{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__tb_034   <={10{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__th_034   <={12{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__tb_125   <={10{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__th_125   <={12{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__tonh   <={7{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__tonl   <={7{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__tp   <={7{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__t3_034   <={8{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__t3_125   <={8{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__t4_034   <={7{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_in_reg__t4_125   <={7{1'b0}};
            end 
          else 
            begin 
              if (  instance_inj_ctrl__instance_registers__instance_in_reg__wr_en  ==1'b1)
                 begin 
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [0]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__t1   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [7:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [1]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__t2   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [6:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [2]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__tb_034   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [9:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [3]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__th_034   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [11:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [4]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__tb_125   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [9:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [5]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__th_125   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [11:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [6]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__tonh   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [6:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [7]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__tonl   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [6:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [8]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__tp   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [6:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [9]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__t3_034   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [7:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [10]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__t3_125   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [7:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [11]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__t4_034   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [6:0];
                   if (  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded  [12]==1'b1) 
                       instance_inj_ctrl__instance_registers__instance_in_reg__t4_125   <=  instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  [6:0];
                 end 
            end 
       end
  
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [0]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {8'b00000000,  instance_inj_ctrl__instance_registers__instance_in_reg__t1  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [1]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {9'b000000000,  instance_inj_ctrl__instance_registers__instance_in_reg__t2  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [2]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {6'b000000,  instance_inj_ctrl__instance_registers__instance_in_reg__tb_034  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [3]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {4'b0000,  instance_inj_ctrl__instance_registers__instance_in_reg__th_034  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [4]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {6'b000000,  instance_inj_ctrl__instance_registers__instance_in_reg__tb_125  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [5]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {4'b0000,  instance_inj_ctrl__instance_registers__instance_in_reg__th_125  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [6]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {9'b000000000,  instance_inj_ctrl__instance_registers__instance_in_reg__tonh  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [7]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {9'b000000000,  instance_inj_ctrl__instance_registers__instance_in_reg__tonl  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [8]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {9'b000000000,  instance_inj_ctrl__instance_registers__instance_in_reg__tp  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [9]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {8'b00000000,  instance_inj_ctrl__instance_registers__instance_in_reg__t3_034  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [10]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {8'b00000000,  instance_inj_ctrl__instance_registers__instance_in_reg__t3_125  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [11]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {9'b000000000,  instance_inj_ctrl__instance_registers__instance_in_reg__t4_034  }:16'bZZZZZZZZZZZZZZZZ; 
  assign   instance_inj_ctrl__instance_registers__instance_in_reg__d_bus  =((  instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r  [12]==1'b1&  instance_inj_ctrl__instance_registers__instance_in_reg__rd_en  ==1'b1)) ? {9'b000000000,  instance_inj_ctrl__instance_registers__instance_in_reg__t4_125  }:16'bZZZZZZZZZZZZZZZZ;
assign instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded = instance_inj_ctrl__instance_registers__add_decoded;
assign instance_inj_ctrl__instance_registers__instance_in_reg__add_decoded_r = instance_inj_ctrl__instance_registers__add_decoded_r;
assign instance_inj_ctrl__instance_registers__instance_in_reg__clock = instance_inj_ctrl__instance_registers__clock;
assign instance_inj_ctrl__instance_registers__instance_in_reg__rd_en = instance_inj_ctrl__instance_registers__rd_en;
assign instance_inj_ctrl__instance_registers__instance_in_reg__rst = instance_inj_ctrl__instance_registers__rst;
assign instance_inj_ctrl__instance_registers__instance_in_reg__wr_en = instance_inj_ctrl__instance_registers__wr_en;
assign instance_inj_ctrl__instance_registers__r_t1 = instance_inj_ctrl__instance_registers__instance_in_reg__r_t1;
assign instance_inj_ctrl__instance_registers__r_t2 = instance_inj_ctrl__instance_registers__instance_in_reg__r_t2;
assign instance_inj_ctrl__instance_registers__r_t3_034 = instance_inj_ctrl__instance_registers__instance_in_reg__r_t3_034;
assign instance_inj_ctrl__instance_registers__r_t3_125 = instance_inj_ctrl__instance_registers__instance_in_reg__r_t3_125;
assign instance_inj_ctrl__instance_registers__r_t4_034 = instance_inj_ctrl__instance_registers__instance_in_reg__r_t4_034;
assign instance_inj_ctrl__instance_registers__r_t4_125 = instance_inj_ctrl__instance_registers__instance_in_reg__r_t4_125;
assign instance_inj_ctrl__instance_registers__r_tb_034 = instance_inj_ctrl__instance_registers__instance_in_reg__r_tb_034;
assign instance_inj_ctrl__instance_registers__r_tb_125 = instance_inj_ctrl__instance_registers__instance_in_reg__r_tb_125;
assign instance_inj_ctrl__instance_registers__r_th_034 = instance_inj_ctrl__instance_registers__instance_in_reg__r_th_034;
assign instance_inj_ctrl__instance_registers__r_th_125 = instance_inj_ctrl__instance_registers__instance_in_reg__r_th_125;
assign instance_inj_ctrl__instance_registers__r_tonh = instance_inj_ctrl__instance_registers__instance_in_reg__r_tonh;
assign instance_inj_ctrl__instance_registers__r_tonl = instance_inj_ctrl__instance_registers__instance_in_reg__r_tonl;
assign instance_inj_ctrl__instance_registers__r_tp = instance_inj_ctrl__instance_registers__instance_in_reg__r_tp;
assign instance_inj_ctrl__instance_registers__d_bus = instance_inj_ctrl__instance_registers__instance_in_reg__d_bus;
  
  
wire  instance_inj_ctrl__instance_registers__instance_test_en__add_test_en;
wire  instance_inj_ctrl__instance_registers__instance_test_en__clock;
wire [16-1:0] instance_inj_ctrl__instance_registers__instance_test_en__d_bus;
wire  instance_inj_ctrl__instance_registers__instance_test_en__rd_en;
wire  instance_inj_ctrl__instance_registers__instance_test_en__rst;
wire  instance_inj_ctrl__instance_registers__instance_test_en__wr_en;
reg [3-1:0] instance_inj_ctrl__instance_registers__instance_test_en__test_en_034;
reg [3-1:0] instance_inj_ctrl__instance_registers__instance_test_en__test_en_125;
 
  always @(  posedge    instance_inj_ctrl__instance_registers__instance_test_en__clock          or  negedge   instance_inj_ctrl__instance_registers__instance_test_en__rst  )
       begin :  instance_inj_ctrl__instance_registers__instance_test_en__vhdl_test_en  
         if (  instance_inj_ctrl__instance_registers__instance_test_en__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_registers__instance_test_en__test_en_034   <={3{1'b0}}; 
               instance_inj_ctrl__instance_registers__instance_test_en__test_en_125   <={3{1'b0}};
            end 
          else 
            begin 
              if (  instance_inj_ctrl__instance_registers__instance_test_en__add_test_en  ==1'b1&  instance_inj_ctrl__instance_registers__instance_test_en__wr_en  ==1'b1)
                 begin  
                    instance_inj_ctrl__instance_registers__instance_test_en__test_en_034   [0]<=  instance_inj_ctrl__instance_registers__instance_test_en__d_bus  [0]; 
                    instance_inj_ctrl__instance_registers__instance_test_en__test_en_034   [1]<=  instance_inj_ctrl__instance_registers__instance_test_en__d_bus  [3]; 
                    instance_inj_ctrl__instance_registers__instance_test_en__test_en_034   [2]<=  instance_inj_ctrl__instance_registers__instance_test_en__d_bus  [4]; 
                    instance_inj_ctrl__instance_registers__instance_test_en__test_en_125   [0]<=  instance_inj_ctrl__instance_registers__instance_test_en__d_bus  [1]; 
                    instance_inj_ctrl__instance_registers__instance_test_en__test_en_125   [1]<=  instance_inj_ctrl__instance_registers__instance_test_en__d_bus  [2]; 
                    instance_inj_ctrl__instance_registers__instance_test_en__test_en_125   [2]<=  instance_inj_ctrl__instance_registers__instance_test_en__d_bus  [5];
                 end 
            end 
       end
 
assign instance_inj_ctrl__instance_registers__instance_test_en__add_test_en = instance_inj_ctrl__instance_registers__add_test_en;
assign instance_inj_ctrl__instance_registers__instance_test_en__clock = instance_inj_ctrl__instance_registers__clock;
assign instance_inj_ctrl__instance_registers__instance_test_en__d_bus = instance_inj_ctrl__instance_registers__d_bus;
assign instance_inj_ctrl__instance_registers__instance_test_en__rd_en = instance_inj_ctrl__instance_registers__rd_en;
assign instance_inj_ctrl__instance_registers__instance_test_en__rst = instance_inj_ctrl__instance_registers__rst;
assign instance_inj_ctrl__instance_registers__instance_test_en__wr_en = instance_inj_ctrl__instance_registers__wr_en;
assign instance_inj_ctrl__instance_registers__test_en_034 = instance_inj_ctrl__instance_registers__instance_test_en__test_en_034;
assign instance_inj_ctrl__instance_registers__test_en_125 = instance_inj_ctrl__instance_registers__instance_test_en__test_en_125;

assign instance_inj_ctrl__instance_registers__a_bus = instance_inj_ctrl__a_bus;
assign instance_inj_ctrl__instance_registers__clock = instance_inj_ctrl__clock;
assign instance_inj_ctrl__instance_registers__digital_input = instance_inj_ctrl__digital_input;
assign instance_inj_ctrl__instance_registers__en_fbk_store_034 = instance_inj_ctrl__en_fbk_store_034;
assign instance_inj_ctrl__instance_registers__en_fbk_store_125 = instance_inj_ctrl__en_fbk_store_125;
assign instance_inj_ctrl__instance_registers__en_state_store_034 = instance_inj_ctrl__en_state_store_034;
assign instance_inj_ctrl__instance_registers__en_state_store_125 = instance_inj_ctrl__en_state_store_125;
assign instance_inj_ctrl__instance_registers__fbk_pwm = instance_inj_ctrl__fbk_pwm;
assign instance_inj_ctrl__instance_registers__global_state_034 = instance_inj_ctrl__global_state_034;
assign instance_inj_ctrl__instance_registers__global_state_125 = instance_inj_ctrl__global_state_125;
assign instance_inj_ctrl__instance_registers__i_fbk_f = instance_inj_ctrl__i_fbk_f;
assign instance_inj_ctrl__instance_registers__nssm_in = instance_inj_ctrl__nssm_in;
assign instance_inj_ctrl__instance_registers__rd_en = instance_inj_ctrl__rd_en;
assign instance_inj_ctrl__instance_registers__rel_pot_en = instance_inj_ctrl__rel_pot_en;
assign instance_inj_ctrl__instance_registers__rst = instance_inj_ctrl__rst;
assign instance_inj_ctrl__instance_registers__v_fbk_f = instance_inj_ctrl__v_fbk_f;
assign instance_inj_ctrl__instance_registers__wr_en = instance_inj_ctrl__wr_en;
assign instance_inj_ctrl__digital_output = instance_inj_ctrl__instance_registers__digital_output;
assign instance_inj_ctrl__in_speed_lev = instance_inj_ctrl__instance_registers__in_speed_lev;
assign instance_inj_ctrl__knock1u = instance_inj_ctrl__instance_registers__knock1u;
assign instance_inj_ctrl__knock2u = instance_inj_ctrl__instance_registers__knock2u;
assign instance_inj_ctrl__pickup_hall = instance_inj_ctrl__instance_registers__pickup_hall;
assign instance_inj_ctrl__relpot = instance_inj_ctrl__instance_registers__relpot;
assign instance_inj_ctrl__r_t1 = instance_inj_ctrl__instance_registers__r_t1;
assign instance_inj_ctrl__r_t2 = instance_inj_ctrl__instance_registers__r_t2;
assign instance_inj_ctrl__r_t3_034 = instance_inj_ctrl__instance_registers__r_t3_034;
assign instance_inj_ctrl__r_t3_125 = instance_inj_ctrl__instance_registers__r_t3_125;
assign instance_inj_ctrl__r_t4_034 = instance_inj_ctrl__instance_registers__r_t4_034;
assign instance_inj_ctrl__r_t4_125 = instance_inj_ctrl__instance_registers__r_t4_125;
assign instance_inj_ctrl__r_tb_034 = instance_inj_ctrl__instance_registers__r_tb_034;
assign instance_inj_ctrl__r_tb_125 = instance_inj_ctrl__instance_registers__r_tb_125;
assign instance_inj_ctrl__r_th_034 = instance_inj_ctrl__instance_registers__r_th_034;
assign instance_inj_ctrl__r_th_125 = instance_inj_ctrl__instance_registers__r_th_125;
assign instance_inj_ctrl__r_tonh = instance_inj_ctrl__instance_registers__r_tonh;
assign instance_inj_ctrl__r_tonl = instance_inj_ctrl__instance_registers__r_tonl;
assign instance_inj_ctrl__r_tp = instance_inj_ctrl__instance_registers__r_tp;
assign instance_inj_ctrl__seg_speed_lev = instance_inj_ctrl__instance_registers__seg_speed_lev;
assign instance_inj_ctrl__smot_camme_en = instance_inj_ctrl__instance_registers__smot_camme_en;
assign instance_inj_ctrl__status_reg_034 = instance_inj_ctrl__instance_registers__status_reg_034;
assign instance_inj_ctrl__status_reg_125 = instance_inj_ctrl__instance_registers__status_reg_125;
assign instance_inj_ctrl__test_en_034 = instance_inj_ctrl__instance_registers__test_en_034;
assign instance_inj_ctrl__test_en_125 = instance_inj_ctrl__instance_registers__test_en_125;
assign instance_inj_ctrl__trg_knock_en = instance_inj_ctrl__instance_registers__trg_knock_en;
assign instance_inj_ctrl__turbo_speed_lev = instance_inj_ctrl__instance_registers__turbo_speed_lev;
assign instance_inj_ctrl__d_bus = instance_inj_ctrl__instance_registers__d_bus;
  
  
wire  instance_inj_ctrl__instance_smot_knock_handle__clock;
wire  instance_inj_ctrl__instance_smot_knock_handle__in_speed;
wire  instance_inj_ctrl__instance_smot_knock_handle__pickup_hall;
wire  instance_inj_ctrl__instance_smot_knock_handle__rst;
wire  instance_inj_ctrl__instance_smot_knock_handle__seg_speed_hall;
wire  instance_inj_ctrl__instance_smot_knock_handle__seg_speed_pickup;
wire  instance_inj_ctrl__instance_smot_knock_handle__smot_camme_en;
wire  instance_inj_ctrl__instance_smot_knock_handle__trg_knock1;
wire  instance_inj_ctrl__instance_smot_knock_handle__trg_knock2;
wire  instance_inj_ctrl__instance_smot_knock_handle__trg_knock_en;
wire  instance_inj_ctrl__instance_smot_knock_handle__cam_smot;
wire [2-1:0] instance_inj_ctrl__instance_smot_knock_handle__knock1;
wire [2-1:0] instance_inj_ctrl__instance_smot_knock_handle__knock2;
wire  instance_inj_ctrl__instance_smot_knock_handle__smot60;
 
   wire  instance_inj_ctrl__instance_smot_knock_handle__internal_trg_knock1  ;  
  
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__clock;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__internal_trg_knock1;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__rst;
wire [2-1:0] instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__knock1;
 
   wire[6-1:0]  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__count1  ; 
   wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__en_comp1  ; 
   wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__impulse  ; 
   wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__long  ;  
  
wire [6-1:0] instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__en_comp1;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__impulse;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__long;
 
  assign   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__impulse  =(  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1  [5]|  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1  [4]|  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1  [3])&(~(  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__en_comp1  )); 
  assign   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__long  =  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1  [0]&  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1  [1]&  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1  [2]&  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1  [3]&  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1  [4]&  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1  [5];
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__count1 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__count1;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__en_comp1 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__en_comp1;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__impulse = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__impulse;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__long = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_comp1__long;
  
  
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__clock;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__internal_trg_knock1;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__rst;
wire [6-1:0] instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__count1;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__en_comp1;
 
   reg  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__store_trg_knock1  ; 
   reg  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__store_reset_trg  ; 
   wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__rst_int  ; 
   reg[6-1:0]  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__int_counter1  ; 
  always @(  posedge    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__clock          or  negedge   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__rst  )
       begin :  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__vhdl_knock_store  
         if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__store_trg_knock1   <=1'b0; 
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__store_reset_trg   <=1'b0;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__store_trg_knock1   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__internal_trg_knock1  ; 
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__store_reset_trg   <=(~(  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__store_trg_knock1  ));
            end 
       end
  
  assign   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__rst_int  =  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__rst  &(~(  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__store_reset_trg  )); 
  assign   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__en_comp1  =  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__store_trg_knock1  ; 
  always @(  posedge    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__clock          or  negedge   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__rst_int  )
       if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__rst_int  ==1'b0) 
           instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__int_counter1   <={6{1'b0}};
        else 
          begin 
            if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__store_trg_knock1  ==1'b1) 
                instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__int_counter1   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__int_counter1  +6'b000001;
          end
  
  assign   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__count1  =  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__int_counter1  ;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__clock = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__clock;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__internal_trg_knock1 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__internal_trg_knock1;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__rst = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__rst;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__count1 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__count1;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__en_comp1 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_count1__en_comp1;
  
  
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__clock;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__impulse;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__long;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__rst;
reg [2-1:0] instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock1;
 
   reg[1:0]  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__current_state  ; 
   reg[1:0]  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__clock          or  negedge   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__rst  )
       begin :  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__clocked  
         if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__current_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_start_state  ; 
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock1   <=2'b01;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__current_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state  ;
              case (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state  ) 
                instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_start_state   : 
                   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock1   <=2'b01; 
                instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_off1_state   : 
                   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock1   <=2'b00; 
                instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_sample_state   : 
                   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock1   <=2'b10; 
                instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_off2_state   : 
                   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock1   <=2'b00;
               default :;
              endcase 
            end 
       end
  
  always @(       instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__current_state                  or    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__clock             or    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__impulse            or    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__long           or    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__rst   )
       begin :  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__set_next_state   
          instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__current_state  ;
         case (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__current_state  ) 
           instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_start_state   :
             if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__long  ==1'b1) 
                 instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__impulse  ==1'b1) 
                    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_off1_state  ; 
           instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_off1_state   :
             if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__impulse  ==1'b1) 
                 instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_sample_state  ;
              else 
                if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__long  ==1'b1) 
                    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_start_state  ; 
           instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_sample_state   :
             if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__impulse  ==1'b1) 
                 instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_off2_state  ;
              else 
                if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__long  ==1'b1) 
                    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_start_state  ; 
           instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_off2_state   :
             if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__long  ==1'b1) 
                 instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__impulse  ==1'b1) 
                    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock_fsm1_state_type_start_state  ;
          default :;
         endcase 
       end
 
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__clock = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__clock;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__impulse = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__impulse;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__long = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__long;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__rst = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__rst;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__knock1 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__instance_knock_fsm1__knock1;

assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__clock = instance_inj_ctrl__instance_smot_knock_handle__clock;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__internal_trg_knock1 = instance_inj_ctrl__instance_smot_knock_handle__internal_trg_knock1;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__rst = instance_inj_ctrl__instance_smot_knock_handle__rst;
assign instance_inj_ctrl__instance_smot_knock_handle__knock1 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm1__knock1;
  
  
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__clock;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__rst;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__trg_knock2;
wire [2-1:0] instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__knock2;
 
   wire[6-1:0]  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__count2  ; 
   wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__en_comp2  ; 
   wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__impulse  ; 
   wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__long  ;  
  
wire [6-1:0] instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__en_comp2;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__impulse;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__long;
 
  assign   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__impulse  =(  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2  [5]|  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2  [4]|  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2  [3])&(~(  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__en_comp2  )); 
  assign   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__long  =  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2  [0]&  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2  [1]&  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2  [2]&  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2  [3]&  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2  [4]&  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2  [5];
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__count2 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__count2;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__en_comp2 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__en_comp2;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__impulse = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__impulse;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__long = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_comp2__long;
  
  
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__clock;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__rst;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__trg_knock2;
wire [6-1:0] instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__count2;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__en_comp2;
 
   reg  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__store_trg_knock2  ; 
   reg  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__store_reset_trg  ; 
   wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__rst_int  ; 
   reg[6-1:0]  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__int_counter2  ; 
  always @(  posedge    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__clock          or  negedge   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__rst  )
       begin :  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__vhdl_knock_store  
         if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__store_trg_knock2   <=1'b0; 
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__store_reset_trg   <=1'b0;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__store_trg_knock2   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__trg_knock2  ; 
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__store_reset_trg   <=(~(  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__store_trg_knock2  ));
            end 
       end
  
  assign   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__rst_int  =  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__rst  &(~(  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__store_reset_trg  )); 
  assign   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__en_comp2  =  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__store_trg_knock2  ; 
  always @(  posedge    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__clock          or  negedge   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__rst_int  )
       if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__rst_int  ==1'b0) 
           instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__int_counter2   <={6{1'b0}};
        else 
          begin 
            if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__store_trg_knock2  ==1'b1) 
                instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__int_counter2   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__int_counter2  +6'b000001;
          end
  
  assign   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__count2  =  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__int_counter2  ;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__clock = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__clock;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__rst = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__rst;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__trg_knock2 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__trg_knock2;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__count2 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__count2;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__en_comp2 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_count2__en_comp2;
  
  
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__clock;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__impulse;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__long;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__rst;
reg [2-1:0] instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock2;
 
   reg[1:0]  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__current_state  ; 
   reg[1:0]  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state  ; 
  always @(  posedge    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__clock          or  negedge   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__rst  )
       begin :  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__clocked  
         if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__rst  ==1'b0)
            begin  
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__current_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_start_state  ; 
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock2   <=2'b01;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__current_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state  ;
              case (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state  ) 
                instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_start_state   : 
                   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock2   <=2'b01; 
                instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_off1_state   : 
                   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock2   <=2'b00; 
                instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_sample_state   : 
                   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock2   <=2'b10; 
                3   : 
                   instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock2   <=2'b00;
               default :;
              endcase 
            end 
       end
  
  always @(       instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__current_state                  or    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__clock             or    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__impulse            or    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__long           or    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__rst   )
       begin :  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__set_next_state   
          instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__current_state  ;
         case (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__current_state  ) 
           instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_start_state   :
             if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__long  ==1'b1) 
                 instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__impulse  ==1'b1) 
                    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_off1_state  ; 
           instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_off1_state   :
             if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__impulse  ==1'b1) 
                 instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_sample_state  ;
              else 
                if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__long  ==1'b1) 
                    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_start_state  ; 
           instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_sample_state   :
             if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__impulse  ==1'b1) 
                 instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state   <=  3  ;
              else 
                if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__long  ==1'b1) 
                    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_start_state  ; 
           3   :
             if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__long  ==1'b1) 
                 instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_start_state  ;
              else 
                if (  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__impulse  ==1'b1) 
                    instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__next_state   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock_fsm2_state_type_start_state  ;
          default :;
         endcase 
       end
 
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__clock = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__clock;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__impulse = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__impulse;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__long = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__long;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__rst = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__rst;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__knock2 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__instance_knock_fsm2__knock2;

assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__clock = instance_inj_ctrl__instance_smot_knock_handle__clock;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__rst = instance_inj_ctrl__instance_smot_knock_handle__rst;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__trg_knock2 = instance_inj_ctrl__instance_smot_knock_handle__trg_knock2;
assign instance_inj_ctrl__instance_smot_knock_handle__knock2 = instance_inj_ctrl__instance_smot_knock_handle__instance_knock_detection_fsm2__knock2;
  
  
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__in_speed;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__pickup_hall;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__seg_speed_hall;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__seg_speed_pickup;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__smot_camme_en;
reg  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__cam_smot;
 
  always @(       instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__seg_speed_pickup                  or    instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__seg_speed_hall             or    instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__pickup_hall            or    instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__in_speed           or    instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__smot_camme_en   )
       begin :  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__vhdl_smot_camme_mux  
         if (  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__smot_camme_en  ==1'b0) 
             instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__cam_smot   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__in_speed  ;
          else 
            if (  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__pickup_hall  ==1'b1) 
                instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__cam_smot   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__seg_speed_pickup  ;
             else  
                instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__cam_smot   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__seg_speed_hall  ;
       end
 
assign instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__in_speed = instance_inj_ctrl__instance_smot_knock_handle__in_speed;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__pickup_hall = instance_inj_ctrl__instance_smot_knock_handle__pickup_hall;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__seg_speed_hall = instance_inj_ctrl__instance_smot_knock_handle__seg_speed_hall;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__seg_speed_pickup = instance_inj_ctrl__instance_smot_knock_handle__seg_speed_pickup;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__smot_camme_en = instance_inj_ctrl__instance_smot_knock_handle__smot_camme_en;
assign instance_inj_ctrl__instance_smot_knock_handle__cam_smot = instance_inj_ctrl__instance_smot_knock_handle__instance_smot_camme_mux__cam_smot;
  
  
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__in_speed;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__trg_knock1;
wire  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__trg_knock_en;
reg  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__internal_trg_knock1;
reg  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__smot60;
 
  always @(     instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__in_speed              or    instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__trg_knock1           or    instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__trg_knock_en   )
       begin :  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__vhdl_trg_knock1_handle  
         if (  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__trg_knock_en  ==1'b0)
            begin  
               instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__smot60   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__in_speed  |  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__trg_knock1  ; 
               instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__internal_trg_knock1   <=1'b0;
            end 
          else 
            begin  
               instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__smot60   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__in_speed  ; 
               instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__internal_trg_knock1   <=  instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__trg_knock1  ;
            end 
       end
 
assign instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__in_speed = instance_inj_ctrl__instance_smot_knock_handle__in_speed;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__trg_knock1 = instance_inj_ctrl__instance_smot_knock_handle__trg_knock1;
assign instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__trg_knock_en = instance_inj_ctrl__instance_smot_knock_handle__trg_knock_en;
assign instance_inj_ctrl__instance_smot_knock_handle__internal_trg_knock1 = instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__internal_trg_knock1;
assign instance_inj_ctrl__instance_smot_knock_handle__smot60 = instance_inj_ctrl__instance_smot_knock_handle__instance_trg_knock1_handle__smot60;

assign instance_inj_ctrl__instance_smot_knock_handle__clock = instance_inj_ctrl__clock_internal;
assign instance_inj_ctrl__instance_smot_knock_handle__in_speed = instance_inj_ctrl__in_speed;
assign instance_inj_ctrl__instance_smot_knock_handle__pickup_hall = instance_inj_ctrl__pickup_hall;
assign instance_inj_ctrl__instance_smot_knock_handle__rst = instance_inj_ctrl__rst;
assign instance_inj_ctrl__instance_smot_knock_handle__seg_speed_hall = instance_inj_ctrl__seg_speed_hall;
assign instance_inj_ctrl__instance_smot_knock_handle__seg_speed_pickup = instance_inj_ctrl__seg_speed_pickup;
assign instance_inj_ctrl__instance_smot_knock_handle__smot_camme_en = instance_inj_ctrl__smot_camme_en;
assign instance_inj_ctrl__instance_smot_knock_handle__trg_knock1 = instance_inj_ctrl__trg_knock1;
assign instance_inj_ctrl__instance_smot_knock_handle__trg_knock2 = instance_inj_ctrl__trg_knock2;
assign instance_inj_ctrl__instance_smot_knock_handle__trg_knock_en = instance_inj_ctrl__trg_knock_en;
assign instance_inj_ctrl__cam_smot = instance_inj_ctrl__instance_smot_knock_handle__cam_smot;
assign instance_inj_ctrl__knock1 = instance_inj_ctrl__instance_smot_knock_handle__knock1;
assign instance_inj_ctrl__knock2 = instance_inj_ctrl__instance_smot_knock_handle__knock2;
assign instance_inj_ctrl__smot60 = instance_inj_ctrl__instance_smot_knock_handle__smot60;
  
  
wire  instance_inj_ctrl__instance_split__clock;
wire  instance_inj_ctrl__instance_split__rst;
wire [6-1:0] instance_inj_ctrl__instance_split__inj_cmd;
wire [2-1:0] instance_inj_ctrl__instance_split__i_fbk_f;
wire [6-1:0] instance_inj_ctrl__instance_split__v_fbk_f;
reg [3-1:0] instance_inj_ctrl__instance_split__inj_cmd_034;
reg [3-1:0] instance_inj_ctrl__instance_split__inj_cmd_125;
reg  instance_inj_ctrl__instance_split__i_fbk_034;
reg  instance_inj_ctrl__instance_split__i_fbk_125;
reg [3-1:0] instance_inj_ctrl__instance_split__v_fbk_034;
reg [3-1:0] instance_inj_ctrl__instance_split__v_fbk_125;
 
   reg[5:0]  instance_inj_ctrl__instance_split__inj_cmd_int  ; 
  always @(  posedge    instance_inj_ctrl__instance_split__clock          or  negedge   instance_inj_ctrl__instance_split__rst  )
       if (  instance_inj_ctrl__instance_split__rst  ==1'b0) 
           instance_inj_ctrl__instance_split__inj_cmd_int   <={6{1'b0}};
        else  
           instance_inj_ctrl__instance_split__inj_cmd_int   <=  instance_inj_ctrl__instance_split__inj_cmd  ;
 
  always @(     instance_inj_ctrl__instance_split__i_fbk_f              or    instance_inj_ctrl__instance_split__inj_cmd_int           or    instance_inj_ctrl__instance_split__v_fbk_f   )
       begin :  instance_inj_ctrl__instance_split__vhdl_split   
          instance_inj_ctrl__instance_split__i_fbk_034   <=  instance_inj_ctrl__instance_split__i_fbk_f  [0]; 
          instance_inj_ctrl__instance_split__i_fbk_125   <=  instance_inj_ctrl__instance_split__i_fbk_f  [1]; 
          instance_inj_ctrl__instance_split__inj_cmd_034   [0]<=  instance_inj_ctrl__instance_split__inj_cmd_int  [0]; 
          instance_inj_ctrl__instance_split__inj_cmd_034   [1]<=  instance_inj_ctrl__instance_split__inj_cmd_int  [3]; 
          instance_inj_ctrl__instance_split__inj_cmd_034   [2]<=  instance_inj_ctrl__instance_split__inj_cmd_int  [4]; 
          instance_inj_ctrl__instance_split__inj_cmd_125   [0]<=  instance_inj_ctrl__instance_split__inj_cmd_int  [1]; 
          instance_inj_ctrl__instance_split__inj_cmd_125   [1]<=  instance_inj_ctrl__instance_split__inj_cmd_int  [2]; 
          instance_inj_ctrl__instance_split__inj_cmd_125   [2]<=  instance_inj_ctrl__instance_split__inj_cmd_int  [5]; 
          instance_inj_ctrl__instance_split__v_fbk_034   [0]<=  instance_inj_ctrl__instance_split__v_fbk_f  [0]; 
          instance_inj_ctrl__instance_split__v_fbk_034   [1]<=  instance_inj_ctrl__instance_split__v_fbk_f  [3]; 
          instance_inj_ctrl__instance_split__v_fbk_034   [2]<=  instance_inj_ctrl__instance_split__v_fbk_f  [4]; 
          instance_inj_ctrl__instance_split__v_fbk_125   [0]<=  instance_inj_ctrl__instance_split__v_fbk_f  [1]; 
          instance_inj_ctrl__instance_split__v_fbk_125   [1]<=  instance_inj_ctrl__instance_split__v_fbk_f  [2]; 
          instance_inj_ctrl__instance_split__v_fbk_125   [2]<=  instance_inj_ctrl__instance_split__v_fbk_f  [5];
       end
 
assign instance_inj_ctrl__instance_split__clock = instance_inj_ctrl__clock_internal;
assign instance_inj_ctrl__instance_split__rst = instance_inj_ctrl__rst;
assign instance_inj_ctrl__instance_split__inj_cmd = instance_inj_ctrl__inj_cmd;
assign instance_inj_ctrl__instance_split__i_fbk_f = instance_inj_ctrl__i_fbk_f;
assign instance_inj_ctrl__instance_split__v_fbk_f = instance_inj_ctrl__v_fbk_f;
assign instance_inj_ctrl__inj_cmd_034 = instance_inj_ctrl__instance_split__inj_cmd_034;
assign instance_inj_ctrl__inj_cmd_125 = instance_inj_ctrl__instance_split__inj_cmd_125;
assign instance_inj_ctrl__i_fbk_034 = instance_inj_ctrl__instance_split__i_fbk_034;
assign instance_inj_ctrl__i_fbk_125 = instance_inj_ctrl__instance_split__i_fbk_125;
assign instance_inj_ctrl__v_fbk_034 = instance_inj_ctrl__instance_split__v_fbk_034;
assign instance_inj_ctrl__v_fbk_125 = instance_inj_ctrl__instance_split__v_fbk_125;
  
  
wire  instance_inj_ctrl__instance_turbo_vehicle_speed__rpm_in;
wire  instance_inj_ctrl__instance_turbo_vehicle_speed__turbo_speed;
wire  instance_inj_ctrl__instance_turbo_vehicle_speed__vehicle_speed;
wire  instance_inj_ctrl__instance_turbo_vehicle_speed__rpm_out;
wire  instance_inj_ctrl__instance_turbo_vehicle_speed__turbo;
wire  instance_inj_ctrl__instance_turbo_vehicle_speed__vehicle;
 
  assign   instance_inj_ctrl__instance_turbo_vehicle_speed__turbo  =  instance_inj_ctrl__instance_turbo_vehicle_speed__turbo_speed  ; 
  assign   instance_inj_ctrl__instance_turbo_vehicle_speed__vehicle  =  instance_inj_ctrl__instance_turbo_vehicle_speed__vehicle_speed  ; 
  assign   instance_inj_ctrl__instance_turbo_vehicle_speed__rpm_out  =  instance_inj_ctrl__instance_turbo_vehicle_speed__rpm_in  ;
assign instance_inj_ctrl__instance_turbo_vehicle_speed__rpm_in = instance_inj_ctrl__rpm_in;
assign instance_inj_ctrl__instance_turbo_vehicle_speed__turbo_speed = instance_inj_ctrl__turbo_speed;
assign instance_inj_ctrl__instance_turbo_vehicle_speed__vehicle_speed = instance_inj_ctrl__vehicle_speed;
assign instance_inj_ctrl__rpm_out = instance_inj_ctrl__instance_turbo_vehicle_speed__rpm_out;
assign instance_inj_ctrl__turbo = instance_inj_ctrl__instance_turbo_vehicle_speed__turbo;
assign instance_inj_ctrl__vehicle = instance_inj_ctrl__instance_turbo_vehicle_speed__vehicle;
 
  assign   instance_inj_ctrl__clock  =  instance_inj_ctrl__clock_internal  ;
assign instance_inj_ctrl__a_bus = a_bus;
assign instance_inj_ctrl__clock = clock;
assign instance_inj_ctrl__cs = cs;
assign instance_inj_ctrl__digital_input = digital_input;
assign instance_inj_ctrl__ds = ds;
assign instance_inj_ctrl__fbk_pwm = fbk_pwm;
assign instance_inj_ctrl__inj_cmd = inj_cmd;
assign instance_inj_ctrl__in_speed = in_speed;
assign instance_inj_ctrl__i_fbk = i_fbk;
assign instance_inj_ctrl__nssm_in = nssm_in;
assign instance_inj_ctrl__rpm_in = rpm_in;
assign instance_inj_ctrl__rst = reset;
assign instance_inj_ctrl__r_w = r_w;
assign instance_inj_ctrl__seg_speed_hall = seg_speed_hall;
assign instance_inj_ctrl__seg_speed_pickup = seg_speed_pickup;
assign instance_inj_ctrl__trg_knock1 = trg_knock1;
assign instance_inj_ctrl__trg_knock2 = trg_knock2;
assign instance_inj_ctrl__turbo_speed = turbo_speed;
assign instance_inj_ctrl__vehicle_speed = vehicle_speed;
assign instance_inj_ctrl__v_fbk = v_fbk;
assign cam_smot = instance_inj_ctrl__cam_smot;
assign digital_output = instance_inj_ctrl__digital_output;
assign hlo = instance_inj_ctrl__hlo;
assign in_speed_lev = instance_inj_ctrl__in_speed_lev;
assign irq = instance_inj_ctrl__irq;
assign knock1 = instance_inj_ctrl__knock1;
assign knock1u = instance_inj_ctrl__knock1u;
assign knock2 = instance_inj_ctrl__knock2;
assign knock2u = instance_inj_ctrl__knock2u;
assign relpot = instance_inj_ctrl__relpot;
assign rpm_out = instance_inj_ctrl__rpm_out;
assign seg_speed_lev = instance_inj_ctrl__seg_speed_lev;
assign smot60 = instance_inj_ctrl__smot60;
assign t1 = instance_inj_ctrl__t1;
assign t2 = instance_inj_ctrl__t2;
assign t3 = instance_inj_ctrl__t3;
assign turbo = instance_inj_ctrl__turbo;
assign turbo_speed_lev = instance_inj_ctrl__turbo_speed_lev;
assign vehicle = instance_inj_ctrl__vehicle;
assign d_bus_ext = instance_inj_ctrl__d_bus_ext;
 
  
wire  instance_rst_inv__reset;
 
   wire  instance_rst_inv__rst_neg  ; 
  assign   instance_rst_inv__rst_neg  =(~(  instance_rst_inv__reset  ));  
  
wire  instance_rst_inv__u0__gsr;

assign instance_rst_inv__u0__gsr = instance_rst_inv__rst_neg;

assign instance_rst_inv__reset = reset;
 
endmodule