module seq_gen_tb;
   reg tstclk;
   reg 	     tstce;
   reg 	     tstclr;
   wire [3:0] tststate;

   seq_gen dut(
	       .clk(tstclk),
	       .ce(tstce),
	       .clr(tstclr),
	       .state(tststate)
	       );
   
   always
     begin
      #5   tstclk <= 0;
      #5   tstclk <= 1;
     end
   initial
     begin
	$dumpvars;
	tstce <= 0;
	#10
	tstclr <= 0;
	#10
	tstce <= 1;
	#10
	tstclr <=1;
	#50;
	tstclr <=0;
	#10;
	tstclr <= 1;
	#50;
	
		  
	$finish;
	
     end
endmodule
