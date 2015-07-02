`timescale 1ns/1ps  
module testbench();

reg clk;
wire[1:0] data_out;
reg [3:0] data_in;

integer data_in_file;
integer scan_file;
integer data_out_file;
integer control=0;

On_line_adder_test2 adder(data_in[3],data_in[2],data_in[1],data_in[0],clk,data_out);
initial begin
	clk=0;
	data_in=0;
	while(1)
		#10 clk=~clk;
end
// clock module, 50Mhz clk



initial begin
  data_in_file=$fopen("C:/altera/13.0/UROP/UROP research/verilog/Online_adder_test2/input.txt","r");
  data_out_file=$fopen("C:/altera/13.0/UROP/UROP research/verilog/Online_adder_test2/output.dat","w");
end

always@(posedge clk) begin
  //scan_file=$fscanf(data_in_file,"%b%b%b%b\n",data_in[3],data_in[2],data_in[1],data_in[0]);
  scan_file=$fscanf(data_in_file,"%b",data_in);
  $display("%b%b%b%b",data_in[3],data_in[2],data_in[1],data_in[0]);
end


always@(negedge clk) begin
  control=control+1;
  if(control<1025)
    $fwrite(data_out_file,"%b\n",data_out);
end

endmodule