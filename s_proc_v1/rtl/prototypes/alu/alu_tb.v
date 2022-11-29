module alu_tb;
   reg [7:0] tsta;
   reg [7:0] tstb;
   reg [4:0] tstalu;
   wire [7:0] tstdout;
   wire       tstcarry;
   
   alu dut(
	   .a(tsta),
	   .b(tstb),
	   .alu(tstalu),
	   .dout(tstdout),
	   .carry(tstcarry)
	   );
   initial
     begin
	$dumpvars;
	tsta <= 8'b00000101;
	tstb <= 8'b00000111;
	tstalu <= 5'b00000;
	#20;
	tstalu <= 5'b01100;
	#20;
	tstalu <= 5'b00001;
	#20;
	
	$finish;
     end
endmodule
