/***********************************************************************
        Copyright (C) 2012,
        Virginia Polytechnic Institute & State University
        
        This verilog file is transformed from ITC 99 benchmark
        which is available from:
        http://www.cad.polito.it/downloads/tools/itc99.html.
        This verilog file was originally coverted by Mr. Min Li
        under the supervision of Dr. Michael S. Hsiao, in the
        Bradley Department of Electrical Engineering, VPI&SU, in
        2012. We made the conversion manually and verified it by 
        random simulation.

        This verilog file is released for research use only. This
        verilog file, or any derivative thereof, may not be
        reproduced nor used for any commercial product without the
        written permission of the authors.

        Mr. Min Li
        Research Assistant
        Bradley Department of Electrical Engineering
        Virginia Polytechnic Institute & State University
        Blacksburg, VA 24061

        Ph.: (540) 808-8129
        Fax: (540) 231-3362
        E-Mail: min.li@vt.edu
        Web: http://www.ece.vt.edu/mhsiao

***********************************************************************/

/*verilator lint_off WIDTH*/

module b07 ( 

	input clock,
    input reset,
    input start,
    output reg [7:0] punti_retta
    );
	



					
	reg [2:0]  stato; 
	reg [7:0]  cont;
    reg [3:0] mar;
    reg [7:0] x;
    reg [7:0]  y ;
    reg [7:0]   t;
	reg [7:0] mem [0:15];

always @(posedge clock)
	begin
		if (reset == 1'b1)
		begin
			punti_retta <= 0;
			cont <= 0;
			mar <= 0;
			x <= 0;
			y <= 0;
			t <= 0;

	        mem[0] <= 8'b00000001;
			mem[1] <= 8'b11111111;
			mem[2] <= 8'b00000000;
			mem[3] <= 8'b00000000;

			mem[4] <= 8'b00000000;
			mem[5] <= 8'b00000010;
			mem[6] <= 8'b00000000;
			mem[7] <= 8'b00000000;

			mem[8] <= 8'b00000000;
			mem[9] <= 8'b00000010;
			mem[10] <= 8'b11111111;
			mem[11] <= 8'b00000101;

			mem[12] <= 8'b00000000;
			mem[13] <= 8'b00000010;
			mem[14] <= 8'b00000001;
			mem[14] <= 8'b00000000;
			mem[15] <= 8'b00000010;
			
			stato <= 3'b000;
		end
		else
		begin
			case (stato)
				3'b000:
				begin
					stato <= 3'b001;
				end
				3'b001:
				begin
					if (start == 1)
					begin
						cont <= 0;
						mar <= 0;
						stato <= 3'b010;
					end
					else
					begin
						punti_retta <= 0;
						stato <= 3'b001;
					end
				end
				3'b010:
				begin
					x <= mem[mar];
					stato <= 3'b011;
				end
				3'b011:
				begin
					mar <= mar + 1;
					t <= x + x;
					stato <= 3'b100;
				end
				3'b100:
				begin
					y <= mem[mar];
					x <= x+t;
					stato <= 3'b101;
				end
				3'b101:
				begin
					x<= x + y ;
					stato <= 3'b110;
				end
				3'b110:
				begin
				   if (mar != 4'b1111)
					begin
						if ( x == 4'b0010) 
						begin
							cont <= cont +1;
							mar <= mar + 1;
							stato <= 3'b010;							
						end
						else
						begin
							mar <= mar + 1;
							stato <= 3'b010;
						end
					end
					else
					begin
						if (start == 0)
						begin
							if (x == 8'b00000010)
							begin
								punti_retta <= cont + 1;
								stato <= 3'b001;
							end
							else
							begin
								punti_retta <= cont;
								stato <= 3'b001;
							end
						end
						else
						begin
							stato <= 3'b110;
						end
					end
				end // case: 3'b110
              default:
                stato <= 3'b001; // min added! Should not reach!!
			endcase 
		end
	end
	


endmodule 
