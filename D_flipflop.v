module D_flipflop (clk,in,out);

	input in,clk;
	output out;
	reg out;
	

	
	always@(posedge clk)
		out<=in;
	
	endmodule
	
	