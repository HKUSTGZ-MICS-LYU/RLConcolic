//Following code is from line 1
module mips(clk, pc, rst, __obs);

    input               clk;
    input               rst;
    output        [7:0] pc;
    input               __obs;

    //Parameter Declaration
    wire   pipeline_stall_n;
    wire  [5:0] branch_offset_imm;
    wire   branch_taken;
    wire  [15:0] instruction;
    wire  [56:0] ID_pipeline_reg_out;
    wire  [37:0] EX_pipeline_reg_out;
    wire  [36:0] MEM_pipeline_reg_out;
    wire  [2:0] reg_read_addr_1;
    wire  [2:0] reg_read_addr_2;
    wire  [15:0] reg_read_data_1;
    wire  [15:0] reg_read_data_2;
    wire  [2:0] decoding_op_src1;
    wire  [2:0] decoding_op_src2;
    wire  [2:0] ex_op_dest;
    wire  [2:0] mem_op_dest;
    wire  [2:0] wb_op_dest;
    wire   reg_write_en;
    wire  [2:0] reg_write_dest;
    wire  [15:0] reg_write_data;
    wire   IF_stage_inst_clk;
    wire   IF_stage_inst_rst;
    wire   IF_stage_inst_instruction_fetch_en;
    wire  [5:0] IF_stage_inst_branch_offset_imm;
    wire   IF_stage_inst_branch_taken;
    reg  [7:0]  IF_stage_inst_pc = 8'b0;
    wire  [15:0] IF_stage_inst_instruction;
    wire   IF_stage_inst_imem_clk;
    wire  [3:0] IF_stage_inst_imem_pc;
    reg  [15:0] IF_stage_inst_imem_instruction = 16'b0;
    wire  [3:0] IF_stage_inst_imem_rom_addr;
    assign IF_stage_inst_imem_rom_addr = IF_stage_inst_imem_pc[3:0];

  //assertion( IF_stage_inst_imem_rom_addr = Extract(3, 0, IF_stage_inst_imem_pc)) 0
    wire   ID_stage_inst_clk;
    wire   ID_stage_inst_rst;
    wire   ID_stage_inst_instruction_decode_en;
    reg  [56:0] ID_stage_inst_pipeline_reg_out = 57'b0;
    wire  [15:0] ID_stage_inst_instruction;
    wire  [5:0] ID_stage_inst_branch_offset_imm;
    reg  ID_stage_inst_branch_taken = 1'b0;
    wire  [2:0] ID_stage_inst_reg_read_addr_1;
    wire  [2:0] ID_stage_inst_reg_read_addr_2;
    wire  [15:0] ID_stage_inst_reg_read_data_1;
    wire  [15:0] ID_stage_inst_reg_read_data_2;
    wire  [2:0] ID_stage_inst_decoding_op_src1;
    wire  [2:0] ID_stage_inst_decoding_op_src2;
    reg  [15:0] ID_stage_inst_instruction_reg = 16'b0;
    wire  [3:0] ID_stage_inst_ir_op_code;
    wire  [2:0] ID_stage_inst_ir_dest;
    wire  [2:0] ID_stage_inst_ir_src1;
    wire  [2:0] ID_stage_inst_ir_src2;
    wire  [5:0] ID_stage_inst_ir_imm;
    reg  ID_stage_inst_write_back_en = 1'b0;
    wire  [2:0] ID_stage_inst_write_back_dest;
    reg  ID_stage_inst_write_back_result_mux = 1'b0;
    wire   ID_stage_inst_mem_write_en;
    wire  [15:0] ID_stage_inst_mem_write_data;
    reg  [2:0]  ID_stage_inst_ex_alu_cmd = 3'b0;
    wire  [15:0] ID_stage_inst_ex_alu_src1;
    wire  [15:0] ID_stage_inst_ex_alu_src2;
    reg  ID_stage_inst_alu_src2_mux = 1'b0;
    wire   ID_stage_inst_decoding_op_is_branch;
    wire   ID_stage_inst_decoding_op_is_store;
    wire  [3:0] ID_stage_inst_ir_op_code_with_bubble;
    wire  [2:0] ID_stage_inst_ir_dest_with_bubble;
    wire   EX_stage_inst_clk;
    wire   EX_stage_inst_rst;
    wire  [56:0] EX_stage_inst_pipeline_reg_in;
    reg  [37:0] EX_stage_inst_pipeline_reg_out = 38'b0;
    wire  [2:0] EX_stage_inst_ex_op_dest;
    wire  [2:0] EX_stage_inst_alu_cmd;
    assign EX_stage_inst_alu_cmd = EX_stage_inst_pipeline_reg_in[56:54];

  //assertion( EX_stage_inst_alu_cmd = Extract(56, 54, EX_stage_inst_pipeline_reg_in)) 1
    wire  [15:0] EX_stage_inst_alu_src1;
    assign EX_stage_inst_alu_src1 = EX_stage_inst_pipeline_reg_in[53:38];

  //assertion( EX_stage_inst_alu_src1 = Extract(53, 38, EX_stage_inst_pipeline_reg_in)) 2
    wire  [15:0] EX_stage_inst_alu_src2;
    assign EX_stage_inst_alu_src2 = EX_stage_inst_pipeline_reg_in[37:22];

  //assertion( EX_stage_inst_alu_src2 = Extract(37, 22, EX_stage_inst_pipeline_reg_in)) 3
    reg  [15:0] EX_stage_inst_ex_alu_result = 16'b0;
    wire   MEM_stage_inst_clk;
    wire   MEM_stage_inst_rst;
    wire  [37:0] MEM_stage_inst_pipeline_reg_in;
    reg  [36:0] MEM_stage_inst_pipeline_reg_out = 37'b0;
    wire  [2:0] MEM_stage_inst_mem_op_dest;
    wire  [15:0] MEM_stage_inst_ex_alu_result;
    assign MEM_stage_inst_ex_alu_result = MEM_stage_inst_pipeline_reg_in[37:22];

  //assertion( MEM_stage_inst_ex_alu_result = Extract(37, 22, MEM_stage_inst_pipeline_reg_in)) 4
    wire   MEM_stage_inst_mem_write_en;
    assign MEM_stage_inst_mem_write_en = MEM_stage_inst_pipeline_reg_in[21];

  //assertion( MEM_stage_inst_mem_write_en = Extract(21, 21, MEM_stage_inst_pipeline_reg_in)) 5
    wire  [15:0] MEM_stage_inst_mem_write_data;
    assign MEM_stage_inst_mem_write_data = MEM_stage_inst_pipeline_reg_in[20:5];

  //assertion( MEM_stage_inst_mem_write_data = Extract(20, 5, MEM_stage_inst_pipeline_reg_in)) 6
    wire  [15:0] MEM_stage_inst_mem_read_data;
    wire   MEM_stage_inst_dmem_clk;
    wire  [15:0] MEM_stage_inst_dmem_mem_access_addr;
    wire  [15:0] MEM_stage_inst_dmem_mem_write_data;
    wire   MEM_stage_inst_dmem_mem_write_en;
    wire  [15:0] MEM_stage_inst_dmem_mem_read_data;
    reg  [15:0] MEM_stage_inst_dmem_ram [15:0];
    wire  [7:0] MEM_stage_inst_dmem_ram_addr;
    assign MEM_stage_inst_dmem_ram_addr = MEM_stage_inst_dmem_mem_access_addr[7:0];

  //assertion( MEM_stage_inst_dmem_ram_addr = Extract(7, 0, MEM_stage_inst_dmem_mem_access_addr)) 7
    wire  [36:0] WB_stage_inst_pipeline_reg_in;
    wire   WB_stage_inst_reg_write_en;
    wire  [2:0] WB_stage_inst_reg_write_dest;
    wire  [15:0] WB_stage_inst_reg_write_data;
    wire  [2:0] WB_stage_inst_wb_op_dest;
    wire  [15:0] WB_stage_inst_ex_alu_result;
    assign WB_stage_inst_ex_alu_result = WB_stage_inst_pipeline_reg_in[36:21];

  //assertion( WB_stage_inst_ex_alu_result = Extract(36, 21, WB_stage_inst_pipeline_reg_in)) 8
    wire  [15:0] WB_stage_inst_mem_read_data;
    assign WB_stage_inst_mem_read_data = WB_stage_inst_pipeline_reg_in[20:5];

  //assertion( WB_stage_inst_mem_read_data = Extract(20, 5, WB_stage_inst_pipeline_reg_in)) 9
    wire   WB_stage_inst_write_back_en;
    assign WB_stage_inst_write_back_en = WB_stage_inst_pipeline_reg_in[4];

  //assertion( WB_stage_inst_write_back_en = Extract(4, 4, WB_stage_inst_pipeline_reg_in)) 10
    wire  [2:0] WB_stage_inst_write_back_dest;
    assign WB_stage_inst_write_back_dest = WB_stage_inst_pipeline_reg_in[3:1];

  //assertion( WB_stage_inst_write_back_dest = Extract(3, 1, WB_stage_inst_pipeline_reg_in)) 11
    wire   WB_stage_inst_write_back_result_mux;
    assign WB_stage_inst_write_back_result_mux = WB_stage_inst_pipeline_reg_in[0];

  //assertion( WB_stage_inst_write_back_result_mux = Extract(0, 0, WB_stage_inst_pipeline_reg_in)) 12
    wire   register_file_inst_clk;
    wire   register_file_inst_rst;
    wire   register_file_inst_reg_write_en;
    wire  [2:0] register_file_inst_reg_write_dest;
    wire  [15:0] register_file_inst_reg_write_data;
    wire  [2:0] register_file_inst_reg_read_addr_1;
    wire  [15:0] register_file_inst_reg_read_data_1;
    wire  [2:0] register_file_inst_reg_read_addr_2;
    wire  [15:0] register_file_inst_reg_read_data_2;
    reg  [15:0] register_file_inst_reg_array [7:0];
    wire  [2:0] hazard_detection_unit_inst_decoding_op_src1;
    wire  [2:0] hazard_detection_unit_inst_decoding_op_src2;
    wire  [2:0] hazard_detection_unit_inst_ex_op_dest;
    wire  [2:0] hazard_detection_unit_inst_mem_op_dest;
    wire  [2:0] hazard_detection_unit_inst_wb_op_dest;
    reg  hazard_detection_unit_inst_pipeline_stall_n = 1'b0;

    assign IF_stage_inst_clk = clk;

  //assertion( IF_stage_inst_clk = clk) 13
    assign IF_stage_inst_rst = rst;

  //assertion( IF_stage_inst_rst = rst) 14
    assign IF_stage_inst_instruction_fetch_en = pipeline_stall_n;

  //assertion( IF_stage_inst_instruction_fetch_en = pipeline_stall_n) 15
    assign IF_stage_inst_branch_offset_imm = branch_offset_imm;

  //assertion( IF_stage_inst_branch_offset_imm = branch_offset_imm) 16
    assign IF_stage_inst_branch_taken = branch_taken;

  //assertion( IF_stage_inst_branch_taken = branch_taken) 17
    assign pc = IF_stage_inst_pc;

  //assertion( pc = IF_stage_inst_pc) 18
    assign instruction = IF_stage_inst_instruction;

  //assertion( instruction = IF_stage_inst_instruction) 19
    //Following code is from line 127
        always @(posedge IF_stage_inst_clk or posedge IF_stage_inst_rst) begin
            if (IF_stage_inst_rst)
                begin
                  $display(";A 20");                  //assertion( 0 != IF_stage_inst_rst = True) 20
                    IF_stage_inst_pc <= 8'b0;  $display(";A 22");  //assertion( IF_stage_inst_pc = 0) 22
                end
            else
                begin
                  $display(";A 21");                  //assertion( 0 != IF_stage_inst_rst = False) 21
                    if (IF_stage_inst_instruction_fetch_en)
                        begin
                          $display(";A 23");                          //assertion( 0 != IF_stage_inst_instruction_fetch_en = True) 23
                            if (IF_stage_inst_branch_taken)
                                begin
                                  $display(";A 25");                                  //assertion( 0 != IF_stage_inst_branch_taken = True) 25
                                    IF_stage_inst_pc <= (IF_stage_inst_pc + {2'b0, IF_stage_inst_branch_offset_imm[5:0]});  $display(";A 27");  //assertion( IF_stage_inst_pc = IF_stage_inst_pc + Concat(0, Extract(5, 0, IF_stage_inst_branch_offset_imm))) 27
                                end
                            else
                                begin
                                  $display(";A 26");                                  //assertion( 0 != IF_stage_inst_branch_taken = False) 26
                                    IF_stage_inst_pc <= (IF_stage_inst_pc + 8'd1);  $display(";A 28");  //assertion( IF_stage_inst_pc = IF_stage_inst_pc + 1) 28
                                end
                        end
                    else
                          $display(";A 24");                          //assertion( 0 != IF_stage_inst_instruction_fetch_en = False) 24
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign IF_stage_inst_imem_clk = IF_stage_inst_clk;

  //assertion( IF_stage_inst_imem_clk = IF_stage_inst_clk) 29
    assign IF_stage_inst_imem_pc = IF_stage_inst_pc;

  //assertion( IF_stage_inst_imem_pc = IF_stage_inst_pc) 30
    assign IF_stage_inst_instruction = IF_stage_inst_imem_instruction;

  //assertion( IF_stage_inst_instruction = IF_stage_inst_imem_instruction) 31
    //Following code is from line 151
        always @( * ) begin
            case (IF_stage_inst_imem_rom_addr)
              4'b0000:
                begin
                  $display(";A 32");                  //assertion( 0 == IF_stage_inst_imem_rom_addr = True) 32
                    IF_stage_inst_imem_instruction = 16'b1001001000001000;  $display(";A 33");  //assertion( IF_stage_inst_imem_instruction = 37384) 33
                end
              4'b0001:
                begin
                  $display(";A 34");                  //assertion( 1 == IF_stage_inst_imem_rom_addr = True) 34
                    IF_stage_inst_imem_instruction = 16'b1001010001001000;  $display(";A 35");  //assertion( IF_stage_inst_imem_instruction = 37960) 35
                end
              4'b0010:
                begin
                  $display(";A 36");                  //assertion( 2 == IF_stage_inst_imem_rom_addr = True) 36
                    IF_stage_inst_imem_instruction = 16'b1001011010001000;  $display(";A 37");  //assertion( IF_stage_inst_imem_instruction = 38536) 37
                end
              4'b0011:
                begin
                  $display(";A 38");                  //assertion( 3 == IF_stage_inst_imem_rom_addr = True) 38
                    IF_stage_inst_imem_instruction = 16'b0001100010011000;  $display(";A 39");  //assertion( IF_stage_inst_imem_instruction = 6296) 39
                end
              4'b0100:
                begin
                  $display(";A 40");                  //assertion( 4 == IF_stage_inst_imem_rom_addr = True) 40
                    IF_stage_inst_imem_instruction = 16'b1011100001000010;  $display(";A 41");  //assertion( IF_stage_inst_imem_instruction = 47170) 41
                end
              4'b0101:
                begin
                  $display(";A 42");                  //assertion( 5 == IF_stage_inst_imem_rom_addr = True) 42
                    IF_stage_inst_imem_instruction = 16'b1010101001000010;  $display(";A 43");  //assertion( IF_stage_inst_imem_instruction = 43586) 43
                end
              4'b0110:
                begin
                  $display(";A 44");                  //assertion( 6 == IF_stage_inst_imem_rom_addr = True) 44
                    IF_stage_inst_imem_instruction = 16'b0010110100101000;  $display(";A 45");  //assertion( IF_stage_inst_imem_instruction = 11560) 45
                end
              4'b0111:
                begin
                  $display(";A 46");                  //assertion( 7 == IF_stage_inst_imem_rom_addr = True) 46
                    IF_stage_inst_imem_instruction = 16'b1100000110111000;  $display(";A 47");  //assertion( IF_stage_inst_imem_instruction = 49592) 47
                end
              4'b1000:
                begin
                  $display(";A 48");                  //assertion( 8 == IF_stage_inst_imem_rom_addr = True) 48
                    IF_stage_inst_imem_instruction = 16'b1001111111000001;  $display(";A 49");  //assertion( IF_stage_inst_imem_instruction = 40897) 49
                end
              4'b1001:
                begin
                  $display(";A 50");                  //assertion( 9 == IF_stage_inst_imem_rom_addr = True) 50
                    IF_stage_inst_imem_instruction = 16'b0000000000000000;  $display(";A 51");  //assertion( IF_stage_inst_imem_instruction = 0) 51
                end
              4'b1010:
                begin
                  $display(";A 52");                  //assertion( 10 == IF_stage_inst_imem_rom_addr = True) 52
                    IF_stage_inst_imem_instruction = 16'b0000000000000000;  $display(";A 53");  //assertion( IF_stage_inst_imem_instruction = 0) 53
                end
              4'b1011:
                begin
                  $display(";A 54");                  //assertion( 11 == IF_stage_inst_imem_rom_addr = True) 54
                    IF_stage_inst_imem_instruction = 16'b0000000000000000;  $display(";A 55");  //assertion( IF_stage_inst_imem_instruction = 0) 55
                end
              4'b1100:
                begin
                  $display(";A 56");                  //assertion( 12 == IF_stage_inst_imem_rom_addr = True) 56
                    IF_stage_inst_imem_instruction = 16'b0000000000000000;  $display(";A 57");  //assertion( IF_stage_inst_imem_instruction = 0) 57
                end
              4'b1101:
                begin
                  $display(";A 58");                  //assertion( 13 == IF_stage_inst_imem_rom_addr = True) 58
                    IF_stage_inst_imem_instruction = 16'b0000000000000000;  $display(";A 59");  //assertion( IF_stage_inst_imem_instruction = 0) 59
                end
              4'b1110:
                begin
                  $display(";A 60");                  //assertion( 14 == IF_stage_inst_imem_rom_addr = True) 60
                    IF_stage_inst_imem_instruction = 16'b0000000000000000;  $display(";A 61");  //assertion( IF_stage_inst_imem_instruction = 0) 61
                end
              4'b1111:
                begin
                  $display(";A 62");                  //assertion( 15 == IF_stage_inst_imem_rom_addr = True) 62
                    IF_stage_inst_imem_instruction = 16'b0000000000000000;  $display(";A 63");  //assertion( IF_stage_inst_imem_instruction = 0) 63
                end
              default:
                begin
                  $display(";A 64");                  //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 64
                    IF_stage_inst_imem_instruction = 16'b0000000000000000;  $display(";A 65");  //assertion( IF_stage_inst_imem_instruction = 0) 65
                end
            endcase
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign ID_stage_inst_clk = clk;

  //assertion( ID_stage_inst_clk = clk) 66
    assign ID_stage_inst_rst = rst;

  //assertion( ID_stage_inst_rst = rst) 67
    assign ID_stage_inst_instruction_decode_en = pipeline_stall_n;

  //assertion( ID_stage_inst_instruction_decode_en = pipeline_stall_n) 68
    assign ID_pipeline_reg_out = ID_stage_inst_pipeline_reg_out;

  //assertion( ID_pipeline_reg_out = ID_stage_inst_pipeline_reg_out) 69
    assign ID_stage_inst_instruction = instruction;

  //assertion( ID_stage_inst_instruction = instruction) 70
    assign branch_offset_imm = ID_stage_inst_branch_offset_imm;

  //assertion( branch_offset_imm = ID_stage_inst_branch_offset_imm) 71
    assign branch_taken = ID_stage_inst_branch_taken;

  //assertion( branch_taken = ID_stage_inst_branch_taken) 72
    assign reg_read_addr_1 = ID_stage_inst_reg_read_addr_1;

  //assertion( reg_read_addr_1 = ID_stage_inst_reg_read_addr_1) 73
    assign reg_read_addr_2 = ID_stage_inst_reg_read_addr_2;

  //assertion( reg_read_addr_2 = ID_stage_inst_reg_read_addr_2) 74
    assign ID_stage_inst_reg_read_data_1 = reg_read_data_1;

  //assertion( ID_stage_inst_reg_read_data_1 = reg_read_data_1) 75
    assign ID_stage_inst_reg_read_data_2 = reg_read_data_2;

  //assertion( ID_stage_inst_reg_read_data_2 = reg_read_data_2) 76
    assign decoding_op_src1 = ID_stage_inst_decoding_op_src1;

  //assertion( decoding_op_src1 = ID_stage_inst_decoding_op_src1) 77
    assign decoding_op_src2 = ID_stage_inst_decoding_op_src2;

  //assertion( decoding_op_src2 = ID_stage_inst_decoding_op_src2) 78
    //Following code is from line 237
        always @(posedge ID_stage_inst_clk or posedge ID_stage_inst_rst) begin
            if (ID_stage_inst_rst)
                begin
                  $display(";A 79");                  //assertion( 0 != ID_stage_inst_rst = True) 79
                    ID_stage_inst_instruction_reg <= 0;  $display(";A 81");  //assertion( ID_stage_inst_instruction_reg = 0) 81
                end
            else
                begin
                  $display(";A 80");                  //assertion( 0 != ID_stage_inst_rst = False) 80
                    if (ID_stage_inst_instruction_decode_en)
                        begin
                          $display(";A 82");                          //assertion( 0 != ID_stage_inst_instruction_decode_en = True) 82
                            ID_stage_inst_instruction_reg <= ID_stage_inst_instruction;  $display(";A 84");  //assertion( ID_stage_inst_instruction_reg = ID_stage_inst_instruction) 84
                        end
                    else
                          $display(";A 83");                          //assertion( 0 != ID_stage_inst_instruction_decode_en = False) 83
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign ID_stage_inst_ir_op_code = ID_stage_inst_instruction_reg[15:12];

  //assertion( ID_stage_inst_ir_op_code = Extract(15, 12, ID_stage_inst_instruction_reg)) 85
    assign ID_stage_inst_ir_dest = ID_stage_inst_instruction_reg[11:9];

  //assertion( ID_stage_inst_ir_dest = Extract(11, 9, ID_stage_inst_instruction_reg)) 86
    assign ID_stage_inst_ir_src1 = ID_stage_inst_instruction_reg[8:6];

  //assertion( ID_stage_inst_ir_src1 = Extract(8, 6, ID_stage_inst_instruction_reg)) 87
    assign ID_stage_inst_ir_src2 = ID_stage_inst_decoding_op_is_store ? ID_stage_inst_instruction_reg[11:9] : ID_stage_inst_instruction_reg[5:3];

  //assertion( ID_stage_inst_ir_src2 = If(0 != ID_stage_inst_decoding_op_is_store == True, Extract(11, 9, ID_stage_inst_instruction_reg), Extract(5, 3, ID_stage_inst_instruction_reg))) 88
    assign ID_stage_inst_ir_imm = ID_stage_inst_instruction_reg[5:0];

  //assertion( ID_stage_inst_ir_imm = Extract(5, 0, ID_stage_inst_instruction_reg)) 89
    assign ID_stage_inst_ir_op_code_with_bubble = ID_stage_inst_instruction_decode_en ? ID_stage_inst_ir_op_code : 0;

  //assertion( ID_stage_inst_ir_op_code_with_bubble = If(0 != ID_stage_inst_instruction_decode_en == True, ID_stage_inst_ir_op_code, ZeroExt(3, 0))) 90
    assign ID_stage_inst_ir_dest_with_bubble = ID_stage_inst_instruction_decode_en ? ID_stage_inst_ir_dest : 0;

  //assertion( ID_stage_inst_ir_dest_with_bubble = If(0 != ID_stage_inst_instruction_decode_en == True, ID_stage_inst_ir_dest, ZeroExt(2, 0))) 91
    //Following code is from line 258
        always @( * ) begin
            if (ID_stage_inst_rst)
                begin
                  $display(";A 92");                  //assertion( 0 != ID_stage_inst_rst = True) 92
                    ID_stage_inst_write_back_en = 0;  $display(";A 94");  //assertion( ID_stage_inst_write_back_en = 0) 94
                    ID_stage_inst_write_back_result_mux = 0;  $display(";A 95");  //assertion( ID_stage_inst_write_back_result_mux = 0) 95
                    ID_stage_inst_ex_alu_cmd = 0;  $display(";A 96");  //assertion( ID_stage_inst_ex_alu_cmd = 0) 96
                    ID_stage_inst_alu_src2_mux = 0;  $display(";A 97");  //assertion( ID_stage_inst_alu_src2_mux = 0) 97
                end
            else
                begin
                  $display(";A 93");                  //assertion( 0 != ID_stage_inst_rst = False) 93
                    case (ID_stage_inst_ir_op_code_with_bubble)
                      4'b0000:
                        begin
                          $display(";A 98");                          //assertion( 0 == ID_stage_inst_ir_op_code_with_bubble = True) 98
                            ID_stage_inst_write_back_en = 0;  $display(";A 99");  //assertion( ID_stage_inst_write_back_en = 0) 99
                            ID_stage_inst_write_back_result_mux = 1'bx;  $display(";A 100");  //assertion( ID_stage_inst_write_back_result_mux = 0) 100
                            ID_stage_inst_ex_alu_cmd = 3'bxxx;  $display(";A 101");  //assertion( ID_stage_inst_ex_alu_cmd = 0) 101
                            ID_stage_inst_alu_src2_mux = 1'bx;  $display(";A 102");  //assertion( ID_stage_inst_alu_src2_mux = 0) 102
                        end
                      4'b0001:
                        begin
                          $display(";A 103");                          //assertion( 1 == ID_stage_inst_ir_op_code_with_bubble = True) 103
                            ID_stage_inst_write_back_en = 1;  $display(";A 104");  //assertion( ID_stage_inst_write_back_en = 1) 104
                            ID_stage_inst_write_back_result_mux = 0;  $display(";A 105");  //assertion( ID_stage_inst_write_back_result_mux = 0) 105
                            ID_stage_inst_ex_alu_cmd = 3'b000;  $display(";A 106");  //assertion( ID_stage_inst_ex_alu_cmd = 0) 106
                            ID_stage_inst_alu_src2_mux = 0;  $display(";A 107");  //assertion( ID_stage_inst_alu_src2_mux = 0) 107
                        end
                      4'b0010:
                        begin
                          $display(";A 108");                          //assertion( 2 == ID_stage_inst_ir_op_code_with_bubble = True) 108
                            ID_stage_inst_write_back_en = 1;  $display(";A 109");  //assertion( ID_stage_inst_write_back_en = 1) 109
                            ID_stage_inst_write_back_result_mux = 0;  $display(";A 110");  //assertion( ID_stage_inst_write_back_result_mux = 0) 110
                            ID_stage_inst_ex_alu_cmd = 3'b001;  $display(";A 111");  //assertion( ID_stage_inst_ex_alu_cmd = 1) 111
                            ID_stage_inst_alu_src2_mux = 0;  $display(";A 112");  //assertion( ID_stage_inst_alu_src2_mux = 0) 112
                        end
                      4'b0011:
                        begin
                          $display(";A 113");                          //assertion( 3 == ID_stage_inst_ir_op_code_with_bubble = True) 113
                            ID_stage_inst_write_back_en = 1;  $display(";A 114");  //assertion( ID_stage_inst_write_back_en = 1) 114
                            ID_stage_inst_write_back_result_mux = 0;  $display(";A 115");  //assertion( ID_stage_inst_write_back_result_mux = 0) 115
                            ID_stage_inst_ex_alu_cmd = 3'b010;  $display(";A 116");  //assertion( ID_stage_inst_ex_alu_cmd = 2) 116
                            ID_stage_inst_alu_src2_mux = 0;  $display(";A 117");  //assertion( ID_stage_inst_alu_src2_mux = 0) 117
                        end
                      4'b0100:
                        begin
                          $display(";A 118");                          //assertion( 4 == ID_stage_inst_ir_op_code_with_bubble = True) 118
                            ID_stage_inst_write_back_en = 1;  $display(";A 119");  //assertion( ID_stage_inst_write_back_en = 1) 119
                            ID_stage_inst_write_back_result_mux = 0;  $display(";A 120");  //assertion( ID_stage_inst_write_back_result_mux = 0) 120
                            ID_stage_inst_ex_alu_cmd = 3'b011;  $display(";A 121");  //assertion( ID_stage_inst_ex_alu_cmd = 3) 121
                            ID_stage_inst_alu_src2_mux = 0;  $display(";A 122");  //assertion( ID_stage_inst_alu_src2_mux = 0) 122
                        end
                      4'b0101:
                        begin
                          $display(";A 123");                          //assertion( 5 == ID_stage_inst_ir_op_code_with_bubble = True) 123
                            ID_stage_inst_write_back_en = 1;  $display(";A 124");  //assertion( ID_stage_inst_write_back_en = 1) 124
                            ID_stage_inst_write_back_result_mux = 0;  $display(";A 125");  //assertion( ID_stage_inst_write_back_result_mux = 0) 125
                            ID_stage_inst_ex_alu_cmd = 3'b100;  $display(";A 126");  //assertion( ID_stage_inst_ex_alu_cmd = 4) 126
                            ID_stage_inst_alu_src2_mux = 1'bx;  $display(";A 127");  //assertion( ID_stage_inst_alu_src2_mux = 0) 127
                        end
                      4'b0110:
                        begin
                          $display(";A 128");                          //assertion( 6 == ID_stage_inst_ir_op_code_with_bubble = True) 128
                            ID_stage_inst_write_back_en = 1;  $display(";A 129");  //assertion( ID_stage_inst_write_back_en = 1) 129
                            ID_stage_inst_write_back_result_mux = 0;  $display(";A 130");  //assertion( ID_stage_inst_write_back_result_mux = 0) 130
                            ID_stage_inst_ex_alu_cmd = 3'b101;  $display(";A 131");  //assertion( ID_stage_inst_ex_alu_cmd = 5) 131
                            ID_stage_inst_alu_src2_mux = 0;  $display(";A 132");  //assertion( ID_stage_inst_alu_src2_mux = 0) 132
                        end
                      4'b0111:
                        begin
                          $display(";A 133");                          //assertion( 7 == ID_stage_inst_ir_op_code_with_bubble = True) 133
                            ID_stage_inst_write_back_en = 1;  $display(";A 134");  //assertion( ID_stage_inst_write_back_en = 1) 134
                            ID_stage_inst_write_back_result_mux = 0;  $display(";A 135");  //assertion( ID_stage_inst_write_back_result_mux = 0) 135
                            ID_stage_inst_ex_alu_cmd = 3'b110;  $display(";A 136");  //assertion( ID_stage_inst_ex_alu_cmd = 6) 136
                            ID_stage_inst_alu_src2_mux = 0;  $display(";A 137");  //assertion( ID_stage_inst_alu_src2_mux = 0) 137
                        end
                      4'b1000:
                        begin
                          $display(";A 138");                          //assertion( 8 == ID_stage_inst_ir_op_code_with_bubble = True) 138
                            ID_stage_inst_write_back_en = 1;  $display(";A 139");  //assertion( ID_stage_inst_write_back_en = 1) 139
                            ID_stage_inst_write_back_result_mux = 0;  $display(";A 140");  //assertion( ID_stage_inst_write_back_result_mux = 0) 140
                            ID_stage_inst_ex_alu_cmd = 3'b111;  $display(";A 141");  //assertion( ID_stage_inst_ex_alu_cmd = 7) 141
                            ID_stage_inst_alu_src2_mux = 0;  $display(";A 142");  //assertion( ID_stage_inst_alu_src2_mux = 0) 142
                        end
                      4'b1001:
                        begin
                          $display(";A 143");                          //assertion( 9 == ID_stage_inst_ir_op_code_with_bubble = True) 143
                            ID_stage_inst_write_back_en = 1;  $display(";A 144");  //assertion( ID_stage_inst_write_back_en = 1) 144
                            ID_stage_inst_write_back_result_mux = 0;  $display(";A 145");  //assertion( ID_stage_inst_write_back_result_mux = 0) 145
                            ID_stage_inst_ex_alu_cmd = 3'b000;  $display(";A 146");  //assertion( ID_stage_inst_ex_alu_cmd = 0) 146
                            ID_stage_inst_alu_src2_mux = 1;  $display(";A 147");  //assertion( ID_stage_inst_alu_src2_mux = 1) 147
                        end
                      4'b1010:
                        begin
                          $display(";A 148");                          //assertion( 10 == ID_stage_inst_ir_op_code_with_bubble = True) 148
                            ID_stage_inst_write_back_en = 1;  $display(";A 149");  //assertion( ID_stage_inst_write_back_en = 1) 149
                            ID_stage_inst_write_back_result_mux = 1;  $display(";A 150");  //assertion( ID_stage_inst_write_back_result_mux = 1) 150
                            ID_stage_inst_ex_alu_cmd = 3'b000;  $display(";A 151");  //assertion( ID_stage_inst_ex_alu_cmd = 0) 151
                            ID_stage_inst_alu_src2_mux = 1;  $display(";A 152");  //assertion( ID_stage_inst_alu_src2_mux = 1) 152
                        end
                      4'b1011:
                        begin
                          $display(";A 153");                          //assertion( 11 == ID_stage_inst_ir_op_code_with_bubble = True) 153
                            ID_stage_inst_write_back_en = 0;  $display(";A 154");  //assertion( ID_stage_inst_write_back_en = 0) 154
                            ID_stage_inst_write_back_result_mux = 1'bx;  $display(";A 155");  //assertion( ID_stage_inst_write_back_result_mux = 0) 155
                            ID_stage_inst_ex_alu_cmd = 3'b000;  $display(";A 156");  //assertion( ID_stage_inst_ex_alu_cmd = 0) 156
                            ID_stage_inst_alu_src2_mux = 1;  $display(";A 157");  //assertion( ID_stage_inst_alu_src2_mux = 1) 157
                        end
                      4'b1100:
                        begin
                          $display(";A 158");                          //assertion( 12 == ID_stage_inst_ir_op_code_with_bubble = True) 158
                            ID_stage_inst_write_back_en = 0;  $display(";A 159");  //assertion( ID_stage_inst_write_back_en = 0) 159
                            ID_stage_inst_write_back_result_mux = 1'bx;  $display(";A 160");  //assertion( ID_stage_inst_write_back_result_mux = 0) 160
                            ID_stage_inst_ex_alu_cmd = 3'bxxx;  $display(";A 161");  //assertion( ID_stage_inst_ex_alu_cmd = 0) 161
                            ID_stage_inst_alu_src2_mux = 1;  $display(";A 162");  //assertion( ID_stage_inst_alu_src2_mux = 1) 162
                        end
                      default:
                        begin
                          $display(";A 163");                          //assertion( ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... & ... = True) 163
                            ID_stage_inst_write_back_en = 0;  $display(";A 164");  //assertion( ID_stage_inst_write_back_en = 0) 164
                            ID_stage_inst_write_back_result_mux = 1'bx;  $display(";A 165");  //assertion( ID_stage_inst_write_back_result_mux = 0) 165
                            ID_stage_inst_ex_alu_cmd = 3'bxxx;  $display(";A 166");  //assertion( ID_stage_inst_ex_alu_cmd = 0) 166
                            ID_stage_inst_alu_src2_mux = 1'bx;  $display(";A 167");  //assertion( ID_stage_inst_alu_src2_mux = 0) 167
                        end
                    endcase
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign ID_stage_inst_decoding_op_is_branch = (ID_stage_inst_ir_op_code == 4'b1100) ? 1 : 0;

  //assertion( ID_stage_inst_decoding_op_is_branch = If((12 == ID_stage_inst_ir_op_code) == True, 1, 0)) 168
    assign ID_stage_inst_decoding_op_is_store = (ID_stage_inst_ir_op_code == 4'b1011) ? 1 : 0;

  //assertion( ID_stage_inst_decoding_op_is_store = If((11 == ID_stage_inst_ir_op_code) == True, 1, 0)) 169
    assign ID_stage_inst_mem_write_data = ID_stage_inst_reg_read_data_2;

  //assertion( ID_stage_inst_mem_write_data = ID_stage_inst_reg_read_data_2) 170
    assign ID_stage_inst_mem_write_en = ID_stage_inst_decoding_op_is_store;

  //assertion( ID_stage_inst_mem_write_en = ID_stage_inst_decoding_op_is_store) 171
    assign ID_stage_inst_write_back_dest = ID_stage_inst_ir_dest_with_bubble;

  //assertion( ID_stage_inst_write_back_dest = ID_stage_inst_ir_dest_with_bubble) 172
    assign ID_stage_inst_ex_alu_src1 = ID_stage_inst_reg_read_data_1;

  //assertion( ID_stage_inst_ex_alu_src1 = ID_stage_inst_reg_read_data_1) 173
    assign ID_stage_inst_ex_alu_src2 = ID_stage_inst_alu_src2_mux ? {{ 10{ ID_stage_inst_ir_imm[5] } }, ID_stage_inst_ir_imm} : ID_stage_inst_reg_read_data_2;

  //assertion( ID_stage_inst_ex_alu_src2 = If(0 != ID_stage_inst_alu_src2_mux == True, Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(5, 5, ID_stage_inst_ir_imm), Extract(5, 5, ID_stage_inst_ir_imm)), Extract(5, 5, ID_stage_inst_ir_imm)), Extract(5, 5, ID_stage_inst_ir_imm)), Extract(5, 5, ID_stage_inst_ir_imm)), Extract(5, 5, ID_stage_inst_ir_imm)), Extract(5, 5, ID_stage_inst_ir_imm)), Extract(5, 5, ID_stage_inst_ir_imm)), Extract(5, 5, ID_stage_inst_ir_imm)), Extract(5, 5, ID_stage_inst_ir_imm)), ID_stage_inst_ir_imm), ID_stage_inst_reg_read_data_2)) 174
    //Following code is from line 379
        always @(posedge ID_stage_inst_clk or posedge ID_stage_inst_rst) begin
            if (ID_stage_inst_rst)
                begin
                  $display(";A 175");                  //assertion( 0 != ID_stage_inst_rst = True) 175
                    ID_stage_inst_pipeline_reg_out[56:0] <= 0;  $display(";A 177");  //assertion( Extract(56, 0, ID_stage_inst_pipeline_reg_out) = 0) 177
                end
            else
                begin
                  $display(";A 176");                  //assertion( 0 != ID_stage_inst_rst = False) 176
                    ID_stage_inst_pipeline_reg_out[56:0] <= {ID_stage_inst_ex_alu_cmd[2:0], ID_stage_inst_ex_alu_src1[15:0], ID_stage_inst_ex_alu_src2[15:0], ID_stage_inst_mem_write_en, ID_stage_inst_mem_write_data[15:0], ID_stage_inst_write_back_en, ID_stage_inst_write_back_dest[2:0], ID_stage_inst_write_back_result_mux};  $display(";A 178");  //assertion( Extract(56, 0, ID_stage_inst_pipeline_reg_out) = Concat(Concat(Concat(Concat(Concat(Concat(Concat(Extract(2, 0, ID_stage_inst_ex_alu_cmd), Extract(15, 0, ID_stage_inst_ex_alu_src1)), Extract(15, 0, ID_stage_inst_ex_alu_src2)), ID_stage_inst_mem_write_en), Extract(15, 0, ID_stage_inst_mem_write_data)), ID_stage_inst_write_back_en), Extract(2, 0, ID_stage_inst_write_back_dest)), ID_stage_inst_write_back_result_mux)) 178
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign ID_stage_inst_reg_read_addr_1 = ID_stage_inst_ir_src1;

  //assertion( ID_stage_inst_reg_read_addr_1 = ID_stage_inst_ir_src1) 179
    assign ID_stage_inst_reg_read_addr_2 = ID_stage_inst_ir_src2;

  //assertion( ID_stage_inst_reg_read_addr_2 = ID_stage_inst_ir_src2) 180
    //Following code is from line 392
        always @( * ) begin
            if (ID_stage_inst_decoding_op_is_branch)
                begin
                  $display(";A 181");                  //assertion( 0 != ID_stage_inst_decoding_op_is_branch = True) 181
                    case (ID_stage_inst_ir_dest_with_bubble)
                      3'b000:
                        begin
                          $display(";A 183");                          //assertion( 0 == ID_stage_inst_ir_dest_with_bubble = True) 183
                            if ((ID_stage_inst_reg_read_data_1 == 0))
                                begin
                                  $display(";A 184");                                  //assertion( ID_stage_inst_reg_read_data_1 == ZeroExt(15, 0) = True) 184
                                    ID_stage_inst_branch_taken = 1;  $display(";A 186");  //assertion( ID_stage_inst_branch_taken = 1) 186
                                end
                            else
                                begin
                                  $display(";A 185");                                  //assertion( ID_stage_inst_reg_read_data_1 == ZeroExt(15, 0) = False) 185
                                    ID_stage_inst_branch_taken = 0;  $display(";A 187");  //assertion( ID_stage_inst_branch_taken = 0) 187
                                end
                        end
                      default:
                        begin
                          $display(";A 188");                          //assertion( 0 != ID_stage_inst_ir_dest_with_bubble = True) 188
                            ID_stage_inst_branch_taken = 0;  $display(";A 189");  //assertion( ID_stage_inst_branch_taken = 0) 189
                        end
                    endcase
                end
            else
                begin
                  $display(";A 182");                  //assertion( 0 != ID_stage_inst_decoding_op_is_branch = False) 182
                    ID_stage_inst_branch_taken = 0;  $display(";A 190");  //assertion( ID_stage_inst_branch_taken = 0) 190
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign ID_stage_inst_branch_offset_imm = ID_stage_inst_ir_imm;

  //assertion( ID_stage_inst_branch_offset_imm = ID_stage_inst_ir_imm) 191
    assign ID_stage_inst_decoding_op_src1 = ID_stage_inst_ir_src1;

  //assertion( ID_stage_inst_decoding_op_src1 = ID_stage_inst_ir_src1) 192
    assign ID_stage_inst_decoding_op_src2 = ((((ID_stage_inst_ir_op_code == 4'b0000) || (ID_stage_inst_ir_op_code == 4'b1001)) || (ID_stage_inst_ir_op_code == 4'b1010)) || (ID_stage_inst_ir_op_code == 4'b1100)) ? 3'b000 : ID_stage_inst_ir_src2;

  //assertion( ID_stage_inst_decoding_op_src2 = If(Or(If(Or(If(Or(If((0 == ID_stage_inst_ir_op_code) == True, 1, 0) == 1, If((9 == ID_stage_inst_ir_op_code) == True, 1, 0) == 1) == True, 1, 0) == 1, If((10 == ID_stage_inst_ir_op_code) == True, 1, 0) == 1) == True, 1, 0) == 1, If((12 == ID_stage_inst_ir_op_code) == True, 1, 0) == 1) == True, 0, ID_stage_inst_ir_src2)) 193
    assign EX_stage_inst_clk = clk;

  //assertion( EX_stage_inst_clk = clk) 194
    assign EX_stage_inst_rst = rst;

  //assertion( EX_stage_inst_rst = rst) 195
    assign EX_stage_inst_pipeline_reg_in = ID_pipeline_reg_out;

  //assertion( EX_stage_inst_pipeline_reg_in = ID_pipeline_reg_out) 196
    assign EX_pipeline_reg_out = EX_stage_inst_pipeline_reg_out;

  //assertion( EX_pipeline_reg_out = EX_stage_inst_pipeline_reg_out) 197
    assign ex_op_dest = EX_stage_inst_ex_op_dest;

  //assertion( ex_op_dest = EX_stage_inst_ex_op_dest) 198
    //Following code is from line 427
        always @( * ) begin
            case (EX_stage_inst_alu_cmd)
              3'b000:
                begin
                  $display(";A 199");                  //assertion( 0 == EX_stage_inst_alu_cmd = True) 199
                    EX_stage_inst_ex_alu_result = (EX_stage_inst_alu_src1 + EX_stage_inst_alu_src2);  $display(";A 200");  //assertion( EX_stage_inst_ex_alu_result = EX_stage_inst_alu_src1 + EX_stage_inst_alu_src2) 200
                end
              3'b001:
                begin
                  $display(";A 201");                  //assertion( 1 == EX_stage_inst_alu_cmd = True) 201
                    EX_stage_inst_ex_alu_result = (EX_stage_inst_alu_src1 - EX_stage_inst_alu_src2);  $display(";A 202");  //assertion( EX_stage_inst_ex_alu_result = EX_stage_inst_alu_src1 - EX_stage_inst_alu_src2) 202
                end
              3'b010:
                begin
                  $display(";A 203");                  //assertion( 2 == EX_stage_inst_alu_cmd = True) 203
                    EX_stage_inst_ex_alu_result = (EX_stage_inst_alu_src1 & EX_stage_inst_alu_src2);  $display(";A 204");  //assertion( EX_stage_inst_ex_alu_result = EX_stage_inst_alu_src1 & EX_stage_inst_alu_src2) 204
                end
              3'b011:
                begin
                  $display(";A 205");                  //assertion( 3 == EX_stage_inst_alu_cmd = True) 205
                    EX_stage_inst_ex_alu_result = (EX_stage_inst_alu_src1 | EX_stage_inst_alu_src2);  $display(";A 206");  //assertion( EX_stage_inst_ex_alu_result = EX_stage_inst_alu_src1 | EX_stage_inst_alu_src2) 206
                end
              3'b100:
                begin
                  $display(";A 207");                  //assertion( 4 == EX_stage_inst_alu_cmd = True) 207
                    EX_stage_inst_ex_alu_result = (~EX_stage_inst_alu_src1);  $display(";A 208");  //assertion( EX_stage_inst_ex_alu_result = ~EX_stage_inst_alu_src1) 208
                end
              3'b101:
                begin
                  $display(";A 209");                  //assertion( 5 == EX_stage_inst_alu_cmd = True) 209
                    EX_stage_inst_ex_alu_result = (EX_stage_inst_alu_src1 ^ EX_stage_inst_alu_src2);  $display(";A 210");  //assertion( EX_stage_inst_ex_alu_result = EX_stage_inst_alu_src1 ^ EX_stage_inst_alu_src2) 210
                end
              3'b110:
                begin
                  $display(";A 211");                  //assertion( 6 == EX_stage_inst_alu_cmd = True) 211
                    EX_stage_inst_ex_alu_result = (EX_stage_inst_alu_src1 << EX_stage_inst_alu_src2[3:0]);  $display(";A 212");  //assertion( EX_stage_inst_ex_alu_result = ZeroExt(4, EX_stage_inst_alu_src1) << ZeroExt(16, Extract(3, 0, EX_stage_inst_alu_src2))) 212
                end
              3'b111:
                begin
                  $display(";A 213");                  //assertion( 7 == EX_stage_inst_alu_cmd = True) 213
                    EX_stage_inst_ex_alu_result = (EX_stage_inst_alu_src1 >> EX_stage_inst_alu_src2[3:0]);  $display(";A 214");  //assertion( EX_stage_inst_ex_alu_result = LShR(ZeroExt(4, EX_stage_inst_alu_src1), ZeroExt(16, Extract(3, 0, EX_stage_inst_alu_src2)))) 214
                end
              default:
                begin
                  $display(";A 215");                  //assertion( If(0 != EX_stage_inst_alu_cmd == True, 1, 0) & If(1 != EX_stage_inst_alu_cmd == True, 1, 0) & If(2 != EX_stage_inst_alu_cmd == True, 1, 0) & If(3 != EX_stage_inst_alu_cmd == True, 1, 0) & If(4 != EX_stage_inst_alu_cmd == True, 1, 0) & If(5 != EX_stage_inst_alu_cmd == True, 1, 0) & If(6 != EX_stage_inst_alu_cmd == True, 1, 0) & If(7 != EX_stage_inst_alu_cmd == True, 1, 0) = True) 215
                    EX_stage_inst_ex_alu_result = 16'b0;  $display(";A 216");  //assertion( EX_stage_inst_ex_alu_result = 0) 216
                end
            endcase
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    //Following code is from line 440
        always @(posedge EX_stage_inst_clk) begin
            if (EX_stage_inst_rst)
                begin
                  $display(";A 217");                  //assertion( 0 != EX_stage_inst_rst = True) 217
                    EX_stage_inst_pipeline_reg_out[37:0] <= 0;  $display(";A 219");  //assertion( Extract(37, 0, EX_stage_inst_pipeline_reg_out) = 0) 219
                end
            else
                begin
                  $display(";A 218");                  //assertion( 0 != EX_stage_inst_rst = False) 218
                    EX_stage_inst_pipeline_reg_out[37:22] <= EX_stage_inst_ex_alu_result;  $display(";A 220");  //assertion( Extract(37, 22, EX_stage_inst_pipeline_reg_out) = EX_stage_inst_ex_alu_result) 220
                    EX_stage_inst_pipeline_reg_out[21:0] <= EX_stage_inst_pipeline_reg_in[21:0];  $display(";A 221");  //assertion( Extract(21, 0, EX_stage_inst_pipeline_reg_out) = Extract(21, 0, EX_stage_inst_pipeline_reg_in)) 221
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign EX_stage_inst_ex_op_dest = EX_stage_inst_pipeline_reg_in[3:1];

  //assertion( EX_stage_inst_ex_op_dest = Extract(3, 1, EX_stage_inst_pipeline_reg_in)) 222
    assign MEM_stage_inst_clk = clk;

  //assertion( MEM_stage_inst_clk = clk) 223
    assign MEM_stage_inst_rst = rst;

  //assertion( MEM_stage_inst_rst = rst) 224
    assign MEM_stage_inst_pipeline_reg_in = EX_pipeline_reg_out;

  //assertion( MEM_stage_inst_pipeline_reg_in = EX_pipeline_reg_out) 225
    assign MEM_pipeline_reg_out = MEM_stage_inst_pipeline_reg_out;

  //assertion( MEM_pipeline_reg_out = MEM_stage_inst_pipeline_reg_out) 226
    assign mem_op_dest = MEM_stage_inst_mem_op_dest;

  //assertion( mem_op_dest = MEM_stage_inst_mem_op_dest) 227
    assign MEM_stage_inst_dmem_clk = MEM_stage_inst_clk;

  //assertion( MEM_stage_inst_dmem_clk = MEM_stage_inst_clk) 228
    assign MEM_stage_inst_dmem_mem_access_addr = MEM_stage_inst_ex_alu_result;

  //assertion( MEM_stage_inst_dmem_mem_access_addr = MEM_stage_inst_ex_alu_result) 229
    assign MEM_stage_inst_dmem_mem_write_data = MEM_stage_inst_mem_write_data;

  //assertion( MEM_stage_inst_dmem_mem_write_data = MEM_stage_inst_mem_write_data) 230
    assign MEM_stage_inst_dmem_mem_write_en = MEM_stage_inst_mem_write_en;

  //assertion( MEM_stage_inst_dmem_mem_write_en = MEM_stage_inst_mem_write_en) 231
    assign MEM_stage_inst_mem_read_data = MEM_stage_inst_dmem_mem_read_data;

  //assertion( MEM_stage_inst_mem_read_data = MEM_stage_inst_dmem_mem_read_data) 232
    //Following code is from line 463
        always @(posedge MEM_stage_inst_dmem_clk) begin
            if (MEM_stage_inst_dmem_mem_write_en)
                begin
                  $display(";A 233");                  //assertion( 0 != MEM_stage_inst_dmem_mem_write_en = True) 233
                    MEM_stage_inst_dmem_ram[MEM_stage_inst_dmem_ram_addr] <= MEM_stage_inst_dmem_mem_write_data;  $display(";A 235");  //assertion( MEM_stage_inst_dmem_ram[Extract(3, 0, MEM_stage_inst_dmem_ram_addr)] = MEM_stage_inst_dmem_mem_write_data) 235
                end
            else
                  $display(";A 234");                  //assertion( 0 != MEM_stage_inst_dmem_mem_write_en = False) 234
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign MEM_stage_inst_dmem_mem_read_data = MEM_stage_inst_dmem_ram[MEM_stage_inst_dmem_ram_addr];

  //assertion( MEM_stage_inst_dmem_mem_read_data = MEM_stage_inst_dmem_ram[Extract(3, 0, MEM_stage_inst_dmem_ram_addr)]) 236
    //Following code is from line 471
        always @(posedge MEM_stage_inst_clk) begin
            if (MEM_stage_inst_rst)
                begin
                  $display(";A 237");                  //assertion( 0 != MEM_stage_inst_rst = True) 237
                    MEM_stage_inst_pipeline_reg_out[36:0] <= 0;  $display(";A 239");  //assertion( Extract(36, 0, MEM_stage_inst_pipeline_reg_out) = 0) 239
                end
            else
                begin
                  $display(";A 238");                  //assertion( 0 != MEM_stage_inst_rst = False) 238
                    MEM_stage_inst_pipeline_reg_out[36:21] <= MEM_stage_inst_ex_alu_result;  $display(";A 240");  //assertion( Extract(36, 21, MEM_stage_inst_pipeline_reg_out) = MEM_stage_inst_ex_alu_result) 240
                    MEM_stage_inst_pipeline_reg_out[20:5] <= MEM_stage_inst_mem_read_data;  $display(";A 241");  //assertion( Extract(20, 5, MEM_stage_inst_pipeline_reg_out) = MEM_stage_inst_mem_read_data) 241
                    MEM_stage_inst_pipeline_reg_out[4:0] <= MEM_stage_inst_pipeline_reg_in[4:0];  $display(";A 242");  //assertion( Extract(4, 0, MEM_stage_inst_pipeline_reg_out) = Extract(4, 0, MEM_stage_inst_pipeline_reg_in)) 242
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign MEM_stage_inst_mem_op_dest = MEM_stage_inst_pipeline_reg_in[3:1];

  //assertion( MEM_stage_inst_mem_op_dest = Extract(3, 1, MEM_stage_inst_pipeline_reg_in)) 243
    assign WB_stage_inst_pipeline_reg_in = MEM_pipeline_reg_out;

  //assertion( WB_stage_inst_pipeline_reg_in = MEM_pipeline_reg_out) 244
    assign reg_write_en = WB_stage_inst_reg_write_en;

  //assertion( reg_write_en = WB_stage_inst_reg_write_en) 245
    assign reg_write_dest = WB_stage_inst_reg_write_dest;

  //assertion( reg_write_dest = WB_stage_inst_reg_write_dest) 246
    assign reg_write_data = WB_stage_inst_reg_write_data;

  //assertion( reg_write_data = WB_stage_inst_reg_write_data) 247
    assign wb_op_dest = WB_stage_inst_wb_op_dest;

  //assertion( wb_op_dest = WB_stage_inst_wb_op_dest) 248
    assign WB_stage_inst_reg_write_en = WB_stage_inst_write_back_en;

  //assertion( WB_stage_inst_reg_write_en = WB_stage_inst_write_back_en) 249
    assign WB_stage_inst_reg_write_dest = WB_stage_inst_write_back_dest;

  //assertion( WB_stage_inst_reg_write_dest = WB_stage_inst_write_back_dest) 250
    assign WB_stage_inst_reg_write_data = WB_stage_inst_write_back_result_mux ? WB_stage_inst_mem_read_data : WB_stage_inst_ex_alu_result;

  //assertion( WB_stage_inst_reg_write_data = If(0 != WB_stage_inst_write_back_result_mux == True, WB_stage_inst_mem_read_data, WB_stage_inst_ex_alu_result)) 251
    assign WB_stage_inst_wb_op_dest = WB_stage_inst_pipeline_reg_in[3:1];

  //assertion( WB_stage_inst_wb_op_dest = Extract(3, 1, WB_stage_inst_pipeline_reg_in)) 252
    assign register_file_inst_clk = clk;

  //assertion( register_file_inst_clk = clk) 253
    assign register_file_inst_rst = rst;

  //assertion( register_file_inst_rst = rst) 254
    assign register_file_inst_reg_write_en = reg_write_en;

  //assertion( register_file_inst_reg_write_en = reg_write_en) 255
    assign register_file_inst_reg_write_dest = reg_write_dest;

  //assertion( register_file_inst_reg_write_dest = reg_write_dest) 256
    assign register_file_inst_reg_write_data = reg_write_data;

  //assertion( register_file_inst_reg_write_data = reg_write_data) 257
    assign register_file_inst_reg_read_addr_1 = reg_read_addr_1;

  //assertion( register_file_inst_reg_read_addr_1 = reg_read_addr_1) 258
    assign reg_read_data_1 = register_file_inst_reg_read_data_1;

  //assertion( reg_read_data_1 = register_file_inst_reg_read_data_1) 259
    assign register_file_inst_reg_read_addr_2 = reg_read_addr_2;

  //assertion( register_file_inst_reg_read_addr_2 = reg_read_addr_2) 260
    assign reg_read_data_2 = register_file_inst_reg_read_data_2;

  //assertion( reg_read_data_2 = register_file_inst_reg_read_data_2) 261
    //Following code is from line 503
        always @(posedge register_file_inst_clk or posedge register_file_inst_rst) begin
            if (register_file_inst_rst)
                begin
                  $display(";A 262");                  //assertion( 0 != register_file_inst_rst = True) 262
                    register_file_inst_reg_array[0] <= 15'b0;  $display(";A 264");  //assertion( register_file_inst_reg_array[0] = 0) 264
                    register_file_inst_reg_array[1] <= 15'b0;  $display(";A 265");  //assertion( register_file_inst_reg_array[1] = 0) 265
                    register_file_inst_reg_array[2] <= 15'b0;  $display(";A 266");  //assertion( register_file_inst_reg_array[2] = 0) 266
                    register_file_inst_reg_array[3] <= 15'b0;  $display(";A 267");  //assertion( register_file_inst_reg_array[3] = 0) 267
                    register_file_inst_reg_array[4] <= 15'b0;  $display(";A 268");  //assertion( register_file_inst_reg_array[4] = 0) 268
                    register_file_inst_reg_array[5] <= 15'b0;  $display(";A 269");  //assertion( register_file_inst_reg_array[5] = 0) 269
                    register_file_inst_reg_array[6] <= 15'b0;  $display(";A 270");  //assertion( register_file_inst_reg_array[6] = 0) 270
                    register_file_inst_reg_array[7] <= 15'b0;  $display(";A 271");  //assertion( register_file_inst_reg_array[7] = 0) 271
                end
            else
                begin
                  $display(";A 263");                  //assertion( 0 != register_file_inst_rst = False) 263
                    if (register_file_inst_reg_write_en)
                        begin
                          $display(";A 272");                          //assertion( 0 != register_file_inst_reg_write_en = True) 272
                            register_file_inst_reg_array[register_file_inst_reg_write_dest] <= register_file_inst_reg_write_data;  $display(";A 274");  //assertion( register_file_inst_reg_array[register_file_inst_reg_write_dest] = register_file_inst_reg_write_data) 274
                        end
                    else
                          $display(";A 273");                          //assertion( 0 != register_file_inst_reg_write_en = False) 273
                end
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

    assign register_file_inst_reg_read_data_1 = (register_file_inst_reg_read_addr_1 == 0) ? 15'b0 : register_file_inst_reg_array[register_file_inst_reg_read_addr_1];

  //assertion( register_file_inst_reg_read_data_1 = If((register_file_inst_reg_read_addr_1 == ZeroExt(2, 0)) == True, ZeroExt(1, 0), register_file_inst_reg_array[register_file_inst_reg_read_addr_1])) 275
    assign register_file_inst_reg_read_data_2 = (register_file_inst_reg_read_addr_2 == 0) ? 15'b0 : register_file_inst_reg_array[register_file_inst_reg_read_addr_2];

  //assertion( register_file_inst_reg_read_data_2 = If((register_file_inst_reg_read_addr_2 == ZeroExt(2, 0)) == True, ZeroExt(1, 0), register_file_inst_reg_array[register_file_inst_reg_read_addr_2])) 276
    assign hazard_detection_unit_inst_decoding_op_src1 = decoding_op_src1;

  //assertion( hazard_detection_unit_inst_decoding_op_src1 = decoding_op_src1) 277
    assign hazard_detection_unit_inst_decoding_op_src2 = decoding_op_src2;

  //assertion( hazard_detection_unit_inst_decoding_op_src2 = decoding_op_src2) 278
    assign hazard_detection_unit_inst_ex_op_dest = ex_op_dest;

  //assertion( hazard_detection_unit_inst_ex_op_dest = ex_op_dest) 279
    assign hazard_detection_unit_inst_mem_op_dest = mem_op_dest;

  //assertion( hazard_detection_unit_inst_mem_op_dest = mem_op_dest) 280
    assign hazard_detection_unit_inst_wb_op_dest = wb_op_dest;

  //assertion( hazard_detection_unit_inst_wb_op_dest = wb_op_dest) 281
    assign pipeline_stall_n = hazard_detection_unit_inst_pipeline_stall_n;

  //assertion( pipeline_stall_n = hazard_detection_unit_inst_pipeline_stall_n) 282
    //Following code is from line 532
        always @( * ) begin
            hazard_detection_unit_inst_pipeline_stall_n = 1;  $display(";A 283");  //assertion( hazard_detection_unit_inst_pipeline_stall_n = 1) 283
            if (((hazard_detection_unit_inst_decoding_op_src1 != 0) && (((hazard_detection_unit_inst_decoding_op_src1 == hazard_detection_unit_inst_ex_op_dest) || (hazard_detection_unit_inst_decoding_op_src1 == hazard_detection_unit_inst_mem_op_dest)) || (hazard_detection_unit_inst_decoding_op_src1 == hazard_detection_unit_inst_wb_op_dest))))
                begin
                  $display(";A 284");                  //assertion( And(If(hazard_detection_unit_inst_decoding_op_src1 != ZeroExt(2, 0) == True, 1, 0) == 1, If(Or(If(Or(If((hazard_detection_unit_inst_decoding_op_src1 == hazard_detection_unit_inst_ex_op_dest) == True, 1, 0) == 1, If((hazard_detection_unit_inst_decoding_op_src1 == hazard_detection_unit_inst_mem_op_dest) == True, 1, 0) == 1) == True, 1, 0) == 1, If((hazard_detection_unit_inst_decoding_op_src1 == hazard_detection_unit_inst_wb_op_dest) == True, 1, 0) == 1) == True, 1, 0) == 1) = True) 284
                    hazard_detection_unit_inst_pipeline_stall_n = 0;  $display(";A 286");  //assertion( hazard_detection_unit_inst_pipeline_stall_n = 0) 286
                end
            else
                  $display(";A 285");                  //assertion( And(If(hazard_detection_unit_inst_decoding_op_src1 != ZeroExt(2, 0) == True, 1, 0) == 1, If(Or(If(Or(If((hazard_detection_unit_inst_decoding_op_src1 == hazard_detection_unit_inst_ex_op_dest) == True, 1, 0) == 1, If((hazard_detection_unit_inst_decoding_op_src1 == hazard_detection_unit_inst_mem_op_dest) == True, 1, 0) == 1) == True, 1, 0) == 1, If((hazard_detection_unit_inst_decoding_op_src1 == hazard_detection_unit_inst_wb_op_dest) == True, 1, 0) == 1) == True, 1, 0) == 1) = False) 285
            if (((hazard_detection_unit_inst_decoding_op_src2 != 0) && (((hazard_detection_unit_inst_decoding_op_src2 == hazard_detection_unit_inst_ex_op_dest) || (hazard_detection_unit_inst_decoding_op_src2 == hazard_detection_unit_inst_mem_op_dest)) || (hazard_detection_unit_inst_decoding_op_src2 == hazard_detection_unit_inst_wb_op_dest))))
                begin
                  $display(";A 287");                  //assertion( And(If(hazard_detection_unit_inst_decoding_op_src2 != ZeroExt(2, 0) == True, 1, 0) == 1, If(Or(If(Or(If((hazard_detection_unit_inst_decoding_op_src2 == hazard_detection_unit_inst_ex_op_dest) == True, 1, 0) == 1, If((hazard_detection_unit_inst_decoding_op_src2 == hazard_detection_unit_inst_mem_op_dest) == True, 1, 0) == 1) == True, 1, 0) == 1, If((hazard_detection_unit_inst_decoding_op_src2 == hazard_detection_unit_inst_wb_op_dest) == True, 1, 0) == 1) == True, 1, 0) == 1) = True) 287
                    hazard_detection_unit_inst_pipeline_stall_n = 0;  $display(";A 289");  //assertion( hazard_detection_unit_inst_pipeline_stall_n = 0) 289
                end
            else
                  $display(";A 288");                  //assertion( And(If(hazard_detection_unit_inst_decoding_op_src2 != ZeroExt(2, 0) == True, 1, 0) == 1, If(Or(If(Or(If((hazard_detection_unit_inst_decoding_op_src2 == hazard_detection_unit_inst_ex_op_dest) == True, 1, 0) == 1, If((hazard_detection_unit_inst_decoding_op_src2 == hazard_detection_unit_inst_mem_op_dest) == True, 1, 0) == 1) == True, 1, 0) == 1, If((hazard_detection_unit_inst_decoding_op_src2 == hazard_detection_unit_inst_wb_op_dest) == True, 1, 0) == 1) == True, 1, 0) == 1) = False) 288
            // Display the variables
            begin
            $display(";R state = 1",);
            end
        end

endmodule
