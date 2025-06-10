module b14 (
	input clock,
	input reset,
	input [30:0] datai,
	output reg [19:0] addr,
	output reg [30:0] datao,
	output reg rd,
	output reg wr
	);




reg [30:0] reg0 ;
reg [30:0] reg1 ;
reg [30:0] reg2 ;
reg [30:0] reg3 ;

reg B;

reg [30:0] IR ;

reg state;

reg [30:0] rx;
reg [30:0] m;
reg [30:0] t;
reg [1:0] d;


wire cf;// : integer range 1 downto 0;
wire [1:0] mf;// : integer range 2**2 - 1 downto 0;
wire [2:0] df;// : integer range 2**3 - 1 downto 0;

wire [3:0] ff;// : integer range 2**4 - 1 downto 0;
wire [19:0] tail;// : integer range 2**20 - 1 downto 0;
wire [1:0] s ;// : integer range 3 downto 0;






assign 	mf = IR[28:27];// / 2**27) mod 4 ;

assign	df = IR[26:24];// / 2**24) mod 2**3;

assign	ff = IR[22:19];// / 2**19) mod 2**4;

assign	cf = IR[23];// / 2**23) mod 2;

assign	tail = IR[19:0];// mod 2**20;
//		reg3 = {1'b0,reg3[28:0] + 8);
assign	s = IR[30:29];///2**29) mod 4;

always@(posedge clock)
	if(reset == 1'b1)
	begin
		IR <= 31'b0;
		d <= 2'b0;
		rx <= 31'b0;
		m <= 31'b0;
		B <= 1'b0;


		reg0 <= 31'b0;
		reg1 <= 31'b0;
		reg2 <= 31'b0;
		reg3 <= 31'b0;
		addr <= 20'b0;
		rd <= 1'b0;
		wr <= 1'b0;
		datao <= 31'b0;
		state <= 1'b0;
	end
	else
	begin
		//rd = 1'b0;
		//wr = 1'b0;
		case(state)
		1'b0:
		begin
			addr <= reg3[19:0];
			rd <= 1'b1;
			IR <= datai;
			state <= 1'b1;
			case(datai[30:29])
				2'b00:
					rx <= reg0;
				2'b01:
					rx <= reg1;
				2'b10: begin
					rx <= reg2;
					end
				2'b11:
					rx <= reg3;
			endcase
		end
		1'b1:
		begin
//		if(IR < 0)
//		  IR = -IR;

		case(cf)
		1'b1:
			begin
			case(mf)
				2'b0:
					m = {11'b0,tail};
				2'b1:
				begin
					m = datai;
					addr <= tail;
					rd <= 1'b1;
				end
				2'b10:
				begin
					addr <= tail + reg1[19:0];
					rd <= 1'b1;
					m = datai;
				end
				2'b11:
				begin
					addr <= tail + reg2[19:0];
					rd <= 1'b1;
					m = datai;
				end
			endcase
			case(ff)
			4'b0:
				if(rx < m)
					B <= 1'b1;
				else
					B <= 1'b0;
			4'b1:
				if(rx >= m)
					B <= 1'b1;
				else
					B <= 1'b0; 
			4'b10:
				if(rx == m) 
					B <= 1'b1;
				else 
					B <= 1'b0; 
			4'b11:
				if(rx != m) 
					B <= 1'b1; 
				else
					B <= 1'b0;
			4'b100:
				if(rx <= m)
					B <= 1'b1; 
				else 
					B <= 1'b0; 
			4'b101:
				if(rx > m) 
					B <= 1'b1; 
				else 
					B <= 1'b0; 
			4'b110:
				begin
				if(rx > 31'b0111111111111111111111111111111)
//					   rx = rx - 2**30;
						rx = rx;
				if(rx < m) 
					   B <= 1'b1; 
				else 
					   B <= 1'b0; 
				end
			4'b111:
				begin
				if(rx > 31'b0111111111111111111111111111111)
//					   rx = rx - 2**30;
					   rx = rx;
				if(rx >= m)
					   B <= 1'b1; 
				else 
					   B <= 1'b0; 
				end 
			4'b1000:
			begin
				if( (rx < m) || ( B == 1'b1))
						B <= 1'b1;
				else
						B <= 1'b0;
			end
			4'b1001:
				if( !(rx < m) || ( B == 1'b1))
						B <= 1'b1;
				else
						B <= 1'b0;
			4'b1010:
				if( (rx == m) || ( B == 1'b1) )
						B <= 1'b1;
				else
						B <= 1'b0;
			4'b1011:
				if(!(rx == m) || ( B == 1'b1))
						B <= 1'b1;
				else
						B <= 1'b0;
			4'b1100:
				if( !(rx > m) || (B == 1'b1) )
						B <= 1'b1;
				else
						B <= 1'b0;
			4'b1101:
				if( (rx > m) || (B == 1'b1))
						B <= 1'b1;
				else
						B <= 1'b0;
			4'b1110:
				begin
				if(rx > 31'b0111111111111111111111111111111)
//					   rx = rx - 2**30;
						rx = rx;
				if ((rx < m) || ( B == 1'b1) ) begin
						B <= 1'b1;              
					end
				else
						B <= 1'b0;
				end
			4'b1111:
				begin
				if(rx > 31'b0111111111111111111111111111111)
//					   rx = rx - 2**30;
						rx = rx;
				if(!(rx < m) || ( B == 1'b1))
						B <= 1'b1;
				else
						B <= 1'b0;
				end
		  endcase
		  end
		1'b0:
			if((df != 3'b111))
			begin
			/*
				if(df == 3'b101) 
				begin
					if( B == 1'b0)
						d = 2'b11;
				end
				else if(df == 3'b100)
				begin
					if(B == 1'b1)
						d = 2'b11;
				end
				else if(df == 3'b11)
					d = 2'b11;
				else if(df == 3'b10)
					d = 2'b10;
				else if(df == 3'b1)
					d = 2'b1;
				else if(df == 3'b0)
					d = 2'b0;
				*/
				
				//d = ((df == 3'b101 && B == 1'b0) || (df == 3'b100 && B == 1'b1)) ? 2'b11 : df[1:0];
				if((df == 3'b101 && B == 1'b0) || (df == 3'b100 && B == 1'b1)) begin
					d = 2'b11;
				end
				else begin
					d = df[1:0];
				end
				
				case(ff)
				4'b0:
					begin
						case(mf)
							2'b0:
							m = {11'b0,tail};
							2'b1:
							begin
								m = datai;
								addr <= tail;
								rd <= 1'b1;
							end
							2'b10:
							begin
								addr <= tail + reg1[19:0];
								rd <= 1'b1;
								m = datai;
							end
							2'b11:
							begin
								addr <= tail + reg2[19:0];
								rd <= 1'b1;
								m = datai;
							end
						endcase
						t = 31'b0;
						case(d)
						2'b0: reg0 = t - m;
						2'b1: reg1 = t - m;
						2'b10: reg2 = t - m;
						2'b11: reg3 = t - m;
						endcase
					end
				4'b1:
					begin
						case(mf)
						2'b0: m = {11'b0,tail};
						2'b1:
						begin
							m = datai;
							addr <= tail;
							rd <= 1'b1;
						end
						2'b10:
						begin
							addr <= tail + reg1[19:0];
							rd <= 1'b1;
							m = datai;
						end
						2'b11:
						begin
							addr <= tail + reg2[19:0];
							rd <= 1'b1;
							m = datai;
						end
						endcase
						reg2 = reg3; 
						reg3 = m;
					end
				4'b10:  
					begin
					case(mf)
						2'b0: 
							m = {11'b0,tail};
						2'b1:
						begin
							m = datai;
							addr <= tail;
							rd <= 1'b1;
						end
						2'b10:
						begin
							addr <= tail + reg1[19:0];
							rd <= 1'b1;
							m = datai;
						end
						2'b11:
						begin
							addr <= tail + reg2[19:0];
							rd <= 1'b1;
							m = datai;
						end
					endcase
					case(d)
					2'b0:
						reg0 = m;
					2'b1:
						reg1 = m;
					2'b10:
						reg2 = m;
					2'b11:
						reg3 = m;
					endcase
					end
				4'b11:  
					begin
						case(mf)
						2'b0: 
							m = {11'b0,tail};
						2'b1:
						begin
							m = datai;
							addr <= tail;
							rd <= 1'b1;
						end
						2'b10:
						begin
							addr <= tail + reg1[19:0];
							rd <= 1'b1;
							m = datai;
						end
						2'b11:
						begin
							addr <= tail + reg2[19:0];
							rd <= 1'b1;
							m = datai;
						end
						endcase
						case(d)
						2'b0: 	reg0 = m;
						2'b1:	reg1 = m;
						2'b10:	reg2 = m;
						2'b11:	reg3 = m;
						endcase
					end
				4'b100:
					begin
					case(mf)
					2'b0: m = {11'b0,tail};
					2'b1: 	
					begin
						m = datai;
						addr <= tail;
						rd <= 1'b1;
					end
					2'b10:
					begin
						addr <= tail + reg1[19:0];
						rd <= 1'b1;
						m = datai;
					end
					2'b11:
					begin
						addr <= tail + reg2[19:0];
						rd <= 1'b1;
						m = datai;
					end
					endcase
					case(d)
					2'b0: reg0 = (rx + m) ;
					2'b1: reg1 = (rx + m) ;
					2'b10: reg2 = (rx + m) ;
					2'b11: reg3 = (rx + m) ;
					endcase
					end
					
				4'b101:
					begin
					case(mf)
					2'b0:  m = {11'b0,tail};
					2'b1:
					begin
						m = datai;
						addr <= tail;
						rd <= 1'b1;
					end
					2'b10:
					begin
						addr <= tail + reg1[19:0];
						rd <= 1'b1;
						m = datai;
					end
					2'b11:
					begin
						addr <= tail + reg2[19:0];
						rd <= 1'b1;
						m = datai;
					end
					endcase
					case (d)
					2'b0: reg0 = (rx + m) ;
					2'b1: reg1 = (rx + m) ;
					2'b10: reg2 = (rx + m) ;
					2'b11: reg3 = (rx + m) ;
					endcase
					end
				4'b110:   
					begin
					case(mf)
					2'b0:  m = {11'b0,tail};
					2'b1:  
						begin
						m = datai;
						addr <= tail;
						rd <= 1'b1;
						end
					2'b10:
						begin
						addr <= tail + reg1[19:0];
						rd <= 1'b1;
						m = datai;
						end
					2'b11:
						begin
						addr <= tail + reg2[19:0];
						rd <= 1'b1;
						m = datai;
						end
					endcase
					case (d)
					2'b0:  reg0 = (rx - m) ;
					2'b1: reg1 = (rx - m) ;
					2'b10: reg2 = (rx - m) ;
					2'b11: reg3 = (rx - m) ;
					endcase
					end
				4'b111:
					begin
					case(mf)
						2'b0: 
							m = {11'b0,tail};
						2'b1: 
						begin
							m = datai;
							addr <= tail;
							rd <= 1'b1;
						end
						2'b10:
						begin
							addr <= tail + reg1[19:0];
							rd <= 1'b1;
							m = datai;
						end
						2'b11:
						begin
							addr <= tail + reg2[19:0];
							rd <= 1'b1;
							m = datai;
						end
					endcase
					case(d)
					2'b0: reg0 = (rx - m) ;
					2'b1: reg1 = (rx - m) ;
					2'b10: reg2 = (rx - m) ;
					2'b11: reg3 = (rx - m) ;
					endcase
					end
				4'b1000:
					begin
					case(mf)
					2'b0:
						m = {11'b0,tail};
					2'b1: 
					begin
						m = datai;
						addr <= tail;
						rd <= 1'b1;
					end
					2'b10:
					begin 
						addr <= tail + reg1[19:0];
						rd <= 1'b1;
						m = datai;
					end
					2'b11:
					begin
						addr <= tail + reg2[19:0];
						rd <= 1'b1;
						m = datai;
					end
					endcase
					case(d)
					2'b0: reg0 = (rx + m) ;
					2'b1: reg1 = (rx + m) ;
					2'b10: reg2 = (rx + m) ;
					2'b11: reg3 = (rx + m) ;
					endcase
					end
				4'b1001:
					begin
					case(mf)
						2'b0:
							m = {11'b0,tail};
						2'b1:
						begin
							m = datai;
							addr <= tail;
							rd <= 1'b1;
						end
						2'b10:
						begin
							addr <= tail + reg1[19:0];
							rd <= 1'b1;
							m = datai;
						end
						2'b11:
						begin
							addr <= tail + reg2[19:0];
							rd <= 1'b1;
							m = datai;
						end
					endcase
					case(d)
					2'b0:  reg0 = (rx - m) ;
					2'b1: reg1 = (rx - m) ;
					2'b10: reg2 = (rx - m) ;
					2'b11: reg3 = (rx - m) ;
					endcase
					end
				4'b1010:
					begin
					case(mf)
						2'b0: 
							m = {11'b0,tail};
						2'b1:
						begin
							m = datai;
							addr <= tail;
							rd <= 1'b1;
						end
						2'b10:
						begin
							addr <= tail + reg1[19:0];
							rd <= 1'b1;
							m = datai;
						end
						2'b11:
						begin
							addr <= tail + reg2[19:0];
							rd <= 1'b1;
							m = datai;
						end
					endcase
					case(d)
					2'b0:	reg0 = (rx + m) ;
					2'b1: reg1 = (rx + m) ;
					2'b10: reg2 = (rx + m) ;
					2'b11: reg3 = (rx + m) ;
					endcase
					end
				4'b1011:
					begin
					case(mf)
					2'b0:
						m = {11'b0,tail};
					2'b1:
					begin
						m = datai;
						addr <= tail;
						rd <= 1'b1;
					end
					2'b10:
					begin
						addr <= tail + reg1[19:0];
						rd <= 1'b1;
						m = datai;
					end
					2'b11:
					begin
						addr <= tail + reg2[19:0];
						rd <= 1'b1;
						m = datai;
					end
					endcase
					case(d)
					2'b0: reg0 = (rx - m) ;
					2'b1: reg1 = (rx - m) ;
					2'b10:  reg2 = (rx - m) ;
					2'b11:  reg3 = (rx - m) ;
					endcase
					end
				4'b1100:
					begin
					case(mf)
					2'b0:
						t = {1'b0,rx[30:1]};
					2'b1:
					begin
						t = {1'b0, (B == 1'b1) ? 1'b0 : rx[30], rx[29:1]};
						//t[30] = 1'b0;
						//if(B == 1'b1)
						//  t[29] = 1'b0;
						//else
						//	t[29] = rx[30];
						//t[28:0] = rx[29:1];
					end
					2'b10:
						t = {rx[29:0],1'b0};
					2'b11:
					begin
						t = {rx[29:0],1'b0};
						if(t > 31'b0111111111111111111111111111111) begin
				
							B <= 1'b1;
						end
						else
							B <= 1'b0;
					end
				  endcase
					case(d)
					2'b0: reg0 <= t;
					2'b1: reg1 <= t;
					2'b10: reg2 <= t;
					2'b11: reg3 <= t;
					endcase
					end
				//default: 
				//	reg0 = reg0;
				endcase
				end
			else if(df == 3'b111)
			begin
			case(mf)
			2'b0: m = {11'b0,tail};
			2'b01: m = {11'b0,tail};
			2'b10: m = reg1 + {11'b0,tail};
			2'b11: m = reg2 + {11'b0,tail};
			endcase
		
			addr <= m [19:0];

			wr <=1'b1;
			datao <= rx;
		  end
		endcase
		state <= 1'b0;
		end
		endcase
	end


endmodule