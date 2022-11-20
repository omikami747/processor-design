module pc_tb;
   reg tstclk;
   reg tstrst;
   reg tstc_e;
   reg [7:0] tstadrs_in;
   reg 	     tsten_pc ;
   wire [7:0] tstadrs_out;

   pc dut(
	  .clk(tstclk),
	  .rst(tstrst),
	  .c_e(tstc_e),
	  .adrs_in(tstadrs_in),
	  .adrs_out(tstadrs_out),
	  .en_pc(tsten_pc)
	  );
   always
     begin
	tstclk <= 0 ;
	#5;
	tstclk <= 1 ;
	#5;
     end
   
   initial
     begin
	$dumpvars;
	
	tstrst <= 1'b0;
	tstc_e <= 1'b1;
	tsten_pc <= 1'b1;
	
	
	
	@(posedge tstclk)
	  begin
	     tstrst <= 1'b1;
	     tstadrs_in <= 8'b00000001;
	     
	  end
        @(posedge tstclk)
	  begin
	     tstadrs_in <= 8'b00000010;
	     
	     
	  end
	@(posedge tstclk)
	  tstadrs_in <= 8'b00000011;
	@(posedge tstclk)
	  
	  begin
	     tstadrs_in <= 8'b00000100;
	     tstc_e <= 1'b0;
	     
	  end
	@(posedge tstclk)
	  tstc_e <= 1'b1;
	
	
	@(posedge tstclk)
	  tstadrs_in <= 8'b00000101;
	
	#50;
	
	$finish;
     end
   
   
   
    
endmodule
