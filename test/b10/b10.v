
module b10(
	input	r_button ,
	input	g_button ,
	input	key      ,
	input	start    ,
	input	reset    ,
	input	test     ,
	output	reg cts      ,
	output	reg ctr      ,
	input	rts      ,
	input	rtr      ,
	input	clock    ,
	input [3:0]	v_in ,
	output reg [3:0]	v_out 
);

reg [3:0] stato ;
reg voto0;
reg voto1;
reg voto2;
reg voto3;
reg [3:0] sign ;
reg last_g;
reg last_r;




always@(posedge clock )
	if(reset == 1'b1)
		begin
			stato  <=  4'b0000;
			voto0  <=  1'b0;
			voto1  <=  1'b0;
			voto2  <=  1'b0;
			voto3  <=  1'b0;
			sign  <=  4'b0000;
			last_g  <=  1'b0;
			last_r  <=  1'b0;
			cts <= 1'b0;
			ctr <= 1'b0;
			v_out <= 4'b0000;
		end
	else
		case(stato)

		4'b0000:
			begin
					voto0  <=  1'b0;
				    voto1  <=  1'b0;
				    voto2  <=  1'b0;
				    voto3  <=  1'b0;
				    cts   <= 1'b0     ;
				    ctr   <= 1'b0     ;
				    if ( test == 1'b0 )
					begin
				       sign   <=  4'b0000 ;
				       stato  <=  4'b1001 ;
					end
				    else
					begin
				       voto0  <=  1'b0;
				       voto1  <=  1'b0;
				       voto2  <=  1'b0;
				       voto3  <=  1'b0;
				       stato  <=  4'b0001 ;
					end
			end
			4'b0001:
			begin
					if(start == 1'b1)
					begin
				       voto0  <=  1'b0;
				       voto1  <=  1'b0;
				       voto2  <=  1'b0;
				       voto3  <=  1'b0;
				       stato  <=  4'b0010;
					end
				    if(rtr == 1'b1)
				       cts   <= 1'b1;
				    if(rtr == 1'b0)
				       cts <= 1'b0 ;
			end
			4'b0010:
				if(start == 1'b0)
					stato  <=  4'b0011 ;
				else if(key == 1'b1)
					begin
						voto0  <=  key ;
						if ((( g_button ^ last_g ) & ( g_button )) == 1'b1 )
							voto1  <=  ~voto1 ;
						if ((( r_button ^ last_r ) & ( r_button )) == 1'b1)
							voto2  <=  ~voto2 ;
						last_g  <=  g_button ;
						last_r  <=  r_button ;
					end
				else
					begin
				       voto0  <=  1'b0;
				       voto1  <=  1'b0;
				       voto2  <=  1'b0;
				       voto3  <=  1'b0;
					end
			4'b0011:
			begin
				voto3  <=  voto0 ^ (voto1 ^ voto2);
				stato  <=  4'b0100;
				voto0  <=  1'b0;
			end
			4'b0100:
				if(rtr == 1'b1)
				begin
					v_out <= {voto3, voto2, voto1, voto0};
					//v_out[0] <= voto0 ;
					//v_out[1] <= voto1 ;
					//v_out[2] <= voto2 ;
					//v_out[3] <= voto3 ;
					cts <= 1'b1 ;
					if (voto0 == 1'b0 && voto1 == 1'b1 && voto2 == 1'b1 && voto3 == 1'b0)
					   stato  <=  4'b1000 ;
					else
					   stato  <=  4'b0101 ;
				end
		   4'b0101:
				if(rts == 1'b0)
				begin
				       ctr <= 1'b1 ;
				       stato  <=  4'b0110 ;
				end
			4'b0110:
				if(rts == 1'b1)
				begin
				       voto0  <=  v_in[0] ;
				       voto1  <=  v_in[1] ;
				       voto2  <=  v_in[2] ;
				       voto3  <=  v_in[3] ;
				       ctr <= 1'b0 ;
				       stato  <=  4'b0111 ;
				end
			4'b0111:
				if(rtr == 1'b0)
				begin
				    cts <= 1'b0 ;
				    stato  <=  4'b0100 ;
				end
			4'b1000:
				if(rtr == 1'b0)
				begin
				    cts <= 1'b0 ;
                    stato  <=  4'b0001 ;
				end

			4'b1001:
				begin
					voto0  <=  v_in[0] ;
				    voto1  <=  v_in[1] ;
				    voto2  <=  v_in[2] ;
				    voto3  <=  v_in[3] ;
				    sign  <=  4'b1000;
				    if(voto0 == 1'b1 && voto1 == 1'b1 && voto2 == 1'b1 && voto3 == 1'b1)
						stato  <=  4'b1010 ;
				end
			4'b1010:
				begin 
					voto0  <=  1'b1 ^ sign[0] ;
				    voto0  <=  1'b0 ^ sign[1] ;
				    voto0  <=  1'b0 ^ sign[2] ;
				    voto0  <=  1'b1 ^ sign[3] ;
				    stato  <=  4'b0100 ;
				end
		endcase

endmodule
