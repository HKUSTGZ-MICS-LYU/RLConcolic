module b11(
		input [5:0] x_in,
		input stbi,
		input clock,
		input reset,
		output reg [5:0] x_out
	);

reg [5:0] r_in ;
reg [3:0] stato ;
reg [5:0] cont ;
wire signed [8:0] cont1_inv;

reg	signed [8:0] cont1 ;



assign cont1_inv = -cont1;

always@(posedge clock)
	if(reset == 1'b1)
		begin
			stato  =  4'b0000;
			r_in  =  6'b0;
			cont  =  6'b0;
			cont1  =  9'b0;
			x_out = 6'b0;
		end
	else
		case(stato)
		4'b0000:
			begin
				cont = 6'b0;
				r_in = x_in;
				x_out<=6'b0;
				stato = 4'b0001;
			end
		4'b0001:
			begin
				r_in = x_in;
				if(stbi == 1'b1)
					stato = 4'b0001;
				else
					stato = 4'b0010;        
			end
		4'b0010:
			if(r_in == 6'b0 || r_in == 6'b111111)
			begin
				if(cont<6'b11001)
					cont  =  cont+1'b1;
				else
					cont = 6'b0;
				cont1 = {3'b0,r_in};
				stato = 4'b1000;
			end
			else if(r_in <= 6'b011010) 
				stato = 4'b0011;
			else
				stato = 4'b0001;
		4'b0011:
			begin
			if( r_in[0]==1'b1 )
				cont1 = {2'b0 , cont, 1'b0};
			else 
				cont1 = {3'b0,cont};
				
			stato = 4'b0100;
			end
		4'b0100:
			if (r_in[1]==1'b1)
				begin
					cont1 = {3'b0,r_in} + cont1;                                               
					stato = 4'b0101;
				end
			else
				begin
					cont1 = {3'b0,r_in} - cont1;
					stato = 4'b0110;
				end
		4'b0101:
			if(cont1 > 9'b000011010)
				begin
					cont1 = cont1 - 9'b011010;
					stato = 4'b0101;
				end
			else
				stato = 4'b0111;
		4'b0110:
			if(cont1 > 9'b000111111)
				begin
					cont1 = cont1 + 9'b011010;
					stato = 4'b0110;
				end
			else
				stato = 4'b0111;
				
		4'b0111:
			begin
				if ( r_in[3:2] ==2'b00 )
					cont1 = cont1 - 9'b000010101;
				else if (r_in[3:2] ==2'b01)
					cont1 = cont1 - 9'b000101010;
				else if (r_in[3:2] ==2'b10)
					cont1 = cont1 + 9'b000000111;
				else
					cont1 = cont1 + 9'b000011100;
				stato = 4'b1000;
			end
		4'b1000:
			begin
				if (cont1 < 9'sb0 )
					  x_out<= cont1_inv[5:0]; //cont1[5:0];
				else
					  x_out<= cont1[5:0];
				stato = 4'b0001;
			end
		endcase
endmodule
