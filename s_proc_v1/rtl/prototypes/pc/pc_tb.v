module pc_tb;
   reg tstclk;
   reg tstclr;
   reg [7:0] tstadrs_in;
   reg 	     tsten_pc ;
   wire [7:0] tstadrs_out;

   pc dut(
	  .clk(tstclk),
	  .clr(tstclr),
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
	
	tstclr <= 1'b0;
	
	tsten_pc <= 1'b1;
	
	
	
	@(posedge tstclk)
	  begin
	     tstclr <= 1'b1;
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
	     
	     
	  end
        
	
	
	@(posedge tstclk)
	  tstadrs_in <= 8'b00000101;
	
	#50;
	
	$finish;
     end
   
   
   
    
endmodule
