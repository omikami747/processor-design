module ir_tb;
   reg tstclk;
   reg tstrst;
   reg tstc_e;
   reg [15:0] tstd_in;
   wire [15:0] tstd_out;

   ir dut(
	  .clk(tstclk),
	  .rst(tstrst),
	  .c_e(tstc_e),
	  .d_in(tstd_in),
	  .d_out(tstd_out)
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
	tstc_e <= 1'b1;
	
        @(posedge tstclk)
	  begin
	     tstd_in <= 0100001110110001;
	  end
	
       
	@(posedge tstclk)
	  begin
	     tstd_in <= 0001000100110001;
	     tstc_e <= 1'b0;
	  end
	
       
	@(posedge tstclk)
	  begin
	     tstc_e <= 1'b1;
	     tstd_in <= 0000000010110001;
	  end
	
       
	@(posedge tstclk)
	  begin
	     tstd_in <= 1000000010110001;
	  end
	
	
       
	@(posedge tstclk)
	  begin
	     tstd_in <= 1100000010110001;
	  end
	
	#100;
	
	$finish;
     end
endmodule // ir_tb

   
       
