/*Author: Kenneth Truong
 *ECE 271 Final Project
 *Fall 2017 Oregon State University*/
module shiftreg (input logic kb_clk, input logic data, output logic [10:0] parallel_dat);

	logic [10:0] tmp;
	logic [3:0] count = 0;

	always_ff @ (posedge kb_clk)
	begin
		tmp[10] <= tmp[9];
		tmp[9] <= tmp[8];
		tmp[8] <= tmp[7];
		tmp[7] <= tmp[6];
		tmp[6] <= tmp[5];
		tmp[5] <= tmp[4];
		tmp[4] <= tmp[3];
		tmp[3] <= tmp[2];
		tmp[2] <= tmp[1];
		tmp[1] <= tmp[0];
		tmp[0] <= data;

		//tmp = {tmp[9:0], data};
	end

	always_ff @ (posedge kb_clk)
	begin
		if (count == 11)
		begin
			parallel_dat = tmp;
			count = 0;
		end
		
		else
			count = count + 1;
	end	

endmodule
