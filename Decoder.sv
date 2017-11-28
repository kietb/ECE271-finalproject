module decoder (input logic [10:0] in,
		output logic [3:0] out);

always_ff @(in)begin
	case(in)
		11'b000_1110_0001: out <= 4'b0000; // a pressed, play A3
		11'b010_1110_0011: out <= 4'b0001; // s pressed, play B3
		11'b011_0001_0001: out <= 4'b0010;//d, C4
		11'b011_0101_0011: out <= 4'b0011;//f, D4
		11'b010_1110_0011: out <= 4'b0100;//w, E4
		11'b000_1001_0011: out <= 4'b0101;//e, F4
		11'b010_1101_0011: out <= 4'b0110;//r, G4
		11'b000_1101_0001: out <= 4'b0111;//t, A4
		
		default: out <= 4'b1111;
	endcase
end
endmodule	
