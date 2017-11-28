module led_decoder (input logic [3:0] in,
		    output logic [6:0] out);

	always_ff @(*)
		case(in)
			4'b0000: out = 7'b0001000;
			4'b0001: out = 7'b1100000;
			4'b0010: out = 7'b0110001;
			4'b0011: out = 7'b1000010;
			4'b0100: out = 7'b0110000;
			4'b0101: out = 7'b0111000;
			4'b0110: out = 7'b0000100;
			4'b0111: out = 7'b0001000;

			default: out = 7'b1111111;
		endcase
endmodule		