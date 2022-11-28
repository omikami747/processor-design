module seq_gen_tb;
   reg tstclk;
   
   reg 	     tstclr;
   wire      tstf;
   wire      tstd;
   wire      tste;
   wire      tsti;
   

   seq_gen dut(
	       .clk(tstclk),
	       .clr(tstclr),
	       .f(tstf),
	       .d(tstd),
	       .e(tste),
	       .i(tsti)
	       );
   
   always
     begin
      #5   tstclk <= 0;
      #5   tstclk <= 1;
     end
   initial
     begin
	$dumpvars;
	#20;
	@(posedge tstclk)
	tstclr <= 0;
	#20;
	@(posedge tstclk)
	tstclr <= 1;
	#100;
	
		  
	$finish;
	
     end
endmodule
