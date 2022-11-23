module ir_tb;
   reg tstclk;
   reg tstrst;
   reg [15:0] tstd_in;
   reg 	      tsten_ir ;
   
   wire [15:0] tstd_out;

   ir dut(
	  .clk(tstclk),
	  .rst(tstrst),
	  .d_in(tstd_in),
	  .d_out(tstd_out),
	  .en_ir(tsten_ir)
	  );
   always
     begin
	tstclk <= 1;
	#5;
	tstclk <= 0;
	#5;
     end
   initial
     begin
	$dumpvars;
	tstd_in <= 0000000010110001;
	tsten_ir <= 1'b1;
	tstrst <= 1'b0;
	
	
	
        @(posedge tstclk)
	  begin
	     tstd_in <= 0100001110110001;
	     
	     
	  end
	
       
	@(posedge tstclk)
	  begin
	     tstd_in <= 0001000100110001;
	     tstrst <= 1'b1;
	     
	  end
	
       
	@(posedge tstclk)
	  begin
	     
	     tstd_in <= 0000000010110001;
	  end
	
       
	@(posedge tstclk)
	  begin
	     tstd_in <= 1000000010110001;
	     tsten_ir <= 1'b0;
	  end
       
	@(posedge tstclk)
	  begin
	     tstd_in <= 1100110010110001;
	  end
	@(posedge tstclk)
	  begin
	     tstd_in <= 0001000111110001;
	     tsten_ir <= 1'b1;
	     
	  end
	@(posedge tstclk)
	  begin
	     tstd_in <= 0001000100110001;
	    	     
	  end
	#100;
	
	$finish;
     end
endmodule // ir_tb

   
       
