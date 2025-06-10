module b06(
	input eql,
	input clock,
	input reset,
	input cont_eql,

	output reg  [1:0] cc_mux,
	output reg  [1:0] uscite,
	output reg        enable_count,
	output reg  	  ackout
	);

	reg [2:0] state ;
	 
	always@(posedge clock)
		if(reset == 1'b1)
			begin
				state <= 3'b000;
				cc_mux <= 2'b00;
				enable_count <= 1'b0;
				ackout <= 1'b0;
				uscite <= 2'b00;
			end
		else
		begin
			if(cont_eql == 1'b1)
			begin
				ackout <= 1'b0;
				enable_count <= 1'b0;
			end
			else
			begin
				ackout <= 1'b1;
				enable_count <= 1'b1;
			end
		
			case(state)
			3'b000:
			begin
				cc_mux <= 2'b01;
				uscite <= 2'b01;
				state <= 3'b001;
			end
			3'b001:
				if(eql == 1'b1)
				begin
					uscite <= 2'b00;
					cc_mux <= 2'b01;
					state <= 3'b010;
				end
				else
				begin
					uscite <= 2'b01;
					cc_mux <= 2'b01;
					state <= 3'b101;
				end
			3'b101:
				if(eql == 1'b1)
					begin
						uscite <=2'b00;
						cc_mux <= 2'b01;
						state <= 3'b100;
					end
				else
				begin
					uscite <= 2'b01;
					cc_mux <= 2'b01;
					state <= 3'b001;
				end

			3'b010:
				if(eql == 1'b1)
					begin
						uscite <= 2'b00;
						cc_mux <= 2'b01;
						state <= 3'b010;
					end
				else
					begin
						uscite <= 2'b01;
						ackout <= 1'b1;
						enable_count <= 1'b1;
						cc_mux <= 2'b01;
						state <= 3'b011;
					end

			3'b011:
				if(eql == 1'b1)
					begin
						uscite <= 2'b01;
						cc_mux <= 2'b01;
						state <= 3'b011;
					end
				else
					begin
						uscite <= 2'b01;
						cc_mux <= 2'b01;
						state <= 3'b001;
					end

			3'b100:
				if(eql == 1'b1)
					begin
						uscite <= 2'b00;
						cc_mux <= 2'b01;
						state <= 3'b100;
					end
				 else
					begin
						uscite <= 2'b11;
						cc_mux <= 2'b01;
						state <= 3'b110;
					end

			3'b110:
				if(eql == 1'b1)
					begin
						uscite <= 2'b11;
						cc_mux <= 2'b01;
						state <= 3'b110;
					end
				else
					begin
						uscite <= 2'b01;
						cc_mux <= 2'b01;
						state <= 3'b001;
					end

		endcase
		end
endmodule

