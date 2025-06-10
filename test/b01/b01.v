module b01 (
	input clock, 
	input  line1, 
	input line2,
	input reset,

	output reg outp,
	output reg overflw
);

reg [2:0] stato;



always@(posedge clock)
    if(reset==1'b1) 
		begin
			stato <= 3'b0;
			outp <= 1'b0;
			overflw<=1'b0;
		end
    else 
		case(stato)
		3'b0:
			begin
				if(line1 == 1'b1 && line2==1'b1) begin
					stato <= 3'b100;
				end
				else begin
					stato <= 3'b001 ;
					end
				outp <= line1 | line2;
				overflw <= 1'b0;
			end
		3'b011:
			begin
				if(line1 == 1'b1 && line2==1'b1 ) begin
					stato <= 3'b100;
				end
				else begin
					stato <= 3'b001 ;
				end
				outp <= line1 | line2;
				overflw <= 1'b1;
			end
        3'b001:   
			begin
                if(line1 == 1'b1 && line2 == 1'b1) begin
					stato <= 3'b101 ;
				end
                else begin 
                    stato <= 3'b010;
				end
				outp <= line1 | line2;
				overflw <= 1'b0 ;
			end
        3'b100:
			begin
                if( line1 == 1'b1 || line2 == 1'b1) begin
                    stato <= 3'b101;
				end
                else begin
                    stato <= 3'b010;
				end
				outp <= ~(line1 ^ line2);
				overflw <= 1'b0 ;
			end
        3'b010:  
			begin
                if(line1 == 1'b1 && line2 == 1'b1 ) begin
                    stato <= 3'b111;
				end
                else begin
                    stato <= 3'b110;
				end
				outp <= line1 | line2;
				overflw <= 1'b0 ;
			end
        3'b101: 
			begin
                if( line1 == 1'b1 || line2 ==1'b1) begin
					stato <= 3'b111;
				end
                else begin
					stato <= 3'b110;
            	end
				outp <= ~(line1 | line2);
				overflw <= 1'b0 ;
			end
        3'b110:
			begin
                if( line1==1'b1 && line2==1'b1 ) begin
                    stato <= 3'b011;
				end
                else begin
                    stato <= 3'b0;
				end
				outp <= line1 | line2;
				overflw <= 1'b0 ;
			end
        3'b111:
			begin
                if( line1==1'b1 || line2==1'b1 ) begin
                    stato <= 3'b011;
				end
                else begin
                    stato <= 3'b000;
				end
				outp <= ~(line1 | line2);
				overflw <= 1'b0 ;
			end
        endcase

endmodule
