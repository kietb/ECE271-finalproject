module mux( input logic [3:0] select,
			input logic clk_A3, 
			input logic clk_B3, 
			input logic clk_C4, 
			input logic clk_D4, 
			input logic clk_E4, 
			input logic clk_F4, 
			input logic clk_G4, 
			input logic clk_A4,
			output logic clk_o);
always @ (*)
		case(select)
			0:	clk_o = 0;
			1:  clk_o = clk_A3;
			2:  clk_o = clk_B3;
			3:  clk_o = clk_C4;
			4:  clk_o = clk_D4;
			5:  clk_o = clk_E4;
			6:  clk_o = clk_F4;
			7:  clk_o = clk_G4;
			8:  clk_o = clk_A4;
			default:clk_o = 0;
		endcase	
endmodule