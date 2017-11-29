/* Author: Kiet Bui, Emily Liu, Kenneth Truong, Rebecca Croysdale
 * ECE 271 Fall 2017
 * Oregon State University
*/
module Simple_piano_top_module(
	/*Set input and output here*/
	input logic data,	//data and clock taken from the keyboard
	input logic kb_clk,	
	input logic reset_n,	//Active low reset, pull up mode or connected to 3.3V
	output logic [7:0] out,
	output logic [6:0] segs
);

	/*Set internal variable here*/
	logic clk; 	// For the oscillator 2.08MHz clock
	logic clk_A3;	//Storing clock needed to play each note.
	logic clk_B3;
	logic clk_C4;
	logic clk_D4;
	logic clk_E4;
	logic clk_F4;
	logic clk_G4;
	logic clk_A4;
	logic sel_clk;
	logic [10:0] parallel_dat; 	//To store messages from the keyboard
	logic [3:0] sel;		//To store decoded signal used as select signal 
					//play different notes 

       /********************
	*Define module here*
	********************/

	// Accessing the chip built-in module for the clock
OSCH # ("2.08") osc_int (	//Specify the operating clock speed 2.08MHz
	.STDBY(1'b0),
	.OSC(clk),		//Output clock signal to clock net
	.SEDSTDBY()); 		//Leave SEDSTDBY unconnected

	//Using module from other files
	
	//Generating different frequencies for the notes
clock_generate generator(
	.clk_i(clk),
	.clk_A3(clk_A3),
	.clk_B3(clk_B3),
	.clk_C4(clk_C4),
	.clk_D4(clk_D4),
	.clk_E4(clk_E4),
	.clk_F4(clk_F4),
	.clk_G4(clk_G4),
	.clk_A4(clk_A4));

	//The different clocks get passed into a mux
clockMux clock_select( 
	.select(sel),		//Input select signal
	.clk_A3(clk_A3),	//Input clock signals
	.clk_B3(clk_B3),
	.clk_C4(clk_C4),
	.clk_D4(clk_D4),
	.clk_E4(clk_E4),
	.clk_F4(clk_F4),
	.clk_G4(clk_G4),
	.clk_A4(clk_A4),
	.clk_o(sel_clk));	//Output the selected clock

	//Shift register takes in keyboard data and clock, and 
	//turns serial data to parallel data

shiftreg shift_register(
	.kb_clk(kb_clk),
	.data(data),
	.parallel_dat(parallel_dat) );

	//Decoder determines which key is being pressed and which 
	//note to play
decoder decoder_1(
	.parallel_dat(parallel_dat),	//Input the data
	.sel(sel));			//Output a select signal

	//Display which note is being play
led_decoder led(
	.sel(sel), 		//Input select signal
	.segs(segs));		//Output the segment for the display board

	//Generate the sine wave for the sound
sinWave wave_generator(
	.s_clk(sel_clk),	//Input selected clock
	.wave(out));		//Generate a wave accordingly
	





	

