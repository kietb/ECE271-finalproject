module led_decoder (input logic [3:0] sel,
		    output logic [6:0] segs);

	always_ff @(*)
		case(sel)
			4'b0000: segs = 7'b0001000;
			4'b0001: segs = 7'b1100000;
			4'b0010: segs = 7'b0110001;
			4'b0011: segs = 7'b1000010;
			4'b0100: segs = 7'b0110000;
			4'b0101: segs = 7'b0111000;
			4'b0110: segs = 7'b0000100;
			4'b0111: segs = 7'b0001000;
			4'b1111: segs = 7'b1111111;

			default: segs = 7'b1111111;
		endcase
endmodule		