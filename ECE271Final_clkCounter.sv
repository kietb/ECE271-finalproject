module clk_generate(
	input logic clk_i, //Clock driving the counter. 2.08MHz by default.
	input logic reset_n, //Active low reset.
	
	output logic clk_A3, clk_B3, clk_C4, clk_D4, clk_E4, clk_F4, clk_G4, clk_A4 
);

logic [4:0] counter1; //Max value is ~18.
logic [4:0] counter2;
logic [4:0] counter3;
logic [4:0] counter4;
logic [4:0] counter5;
logic [4:0] counter6;
logic [4:0] counter7;
logic [4:0] counter8;

always_ff @ (posedge clk_i, negedge reset_n)
	begin
		counter1 <= counter1 + 1; //Counter increments every rising edge of clock.
		counter2 <= counter2 + 1; //Counter increments every rising edge of clock.
		counter3 <= counter3 + 1; //Counter increments every rising edge of clock.
		counter4 <= counter4 + 1; //Counter increments every rising edge of clock.
		counter5 <= counter5 + 1; //Counter increments every rising edge of clock.
		counter6 <= counter6 + 1; //Counter increments every rising edge of clock.
		counter7 <= counter7 + 1; //Counter increments every rising edge of clock.
		counter8 <= counter8 + 1; //Counter increments every rising edge of clock.

		
	    if (!reset_n) //Reset pulled to GND
			begin
				clk_A3 <= 0; //Clock is reset.
				clk_B3 <= 0;
				clk_C4 <= 0;
				clk_D4 <= 0;
				clk_E4 <= 0;
				clk_F4 <= 0;
				clk_G4 <= 0;
				clk_A4 <= 0;
				counter1 <= 0; //Counter is reset.
				counter2 <= 0; //Counter is reset.
				counter3 <= 0; //Counter is reset.
				counter4 <= 0; //Counter is reset.
				counter5 <= 0; //Counter is reset.
				counter6 <= 0; //Counter is reset.
				counter7 <= 0; //Counter is reset.
				counter8 <= 0; //Counter is reset.
			end
		
		else
			begin
				if (counter1 >= 18)
					begin
						clk_A3 <= ~clk_A3; //Output clock HIGH/LOW flipped.
						counter1 <= 0; //Counter is reset.
					end
				
				if (counter2 >= 16)
					begin
						clk_B3 <= ~clk_B3; //Output clock HIGH/LOW flipped.
						counter2 <= 0; //Counter is reset.
					end
				
				if (counter3 >= 15)
					begin
						clk_C4 <= ~clk_C4; //Output clock HIGH/LOW flipped.
						counter3 <= 0; //Counter is reset.
					end
				
				if (counter4 >= 13)
					begin
						clk_D4 <= ~clk_D4; //Output clock HIGH/LOW flipped.
						counter4 <= 0; //Counter is reset.
					end
				
				if (counter5 >= 12)
					begin
						clk_E4 <= ~clk_E4; //Output clock HIGH/LOW flipped.
						counter5 <= 0; //Counter is reset.
					end
				
				if (counter6 >= 11)
					begin
						clk_F4 <= ~clk_F4; //Output clock HIGH/LOW flipped.
						counter6 <= 0; //Counter is reset.
					end
				
				if (counter7 >= 10)
					begin
						clk_G4 <= ~clk_G4; //Output clock HIGH/LOW flipped.
						counter7 <= 0; //Counter is reset.
					end

				if (counter8 >= 9)
					begin
						clk_A4 <= ~clk_A4; //Output clock HIGH/LOW flipped.
						counter8 <= 0; //Counter is reset.
					end
			end
	end
endmodule