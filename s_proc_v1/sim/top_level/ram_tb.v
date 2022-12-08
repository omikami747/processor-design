module ram_tb;
   reg tstclk;
   reg tstrw;
   reg [7:0] tstadrs;
   reg [7:0] tstdin;

   wire [15:0] tstdout;

   ram dut(
	   .clk(tstclk),
	   .rw(tstrw),
	   .adrs(tstadrs),
	   .dout(tstdout),
	   .din(tstdin)
	   );
   always
     begin
	tstclk <= 0;
	#5;
	tstclk <= 1;
	#5;
     end
   initial
     begin
	$dumpvars;
	tstrw <= 1'b0;
	tstadrs <= 8'b00000000;
	@(posedge tstclk)
	  tstadrs <= 8'b00000001;
	@(posedge tstclk)
	  tstadrs <= 8'b00000011;
	repeat(4)
	  @ (posedge tstclk)
	    begin
	    end
	@(posedge tstclk)
	  begin
	     tstrw <= 1'b1;
	     tstdin <= 16'b0000111111111111;
	  end
	repeat(4)
	  @ (posedge tstclk)
	    begin
	       
	    end
	repeat(4)
	  @ (posedge tstclk)
	    begin
	       tstrw <= 1'b0;
	    end
	#200;
	$finish;
     end
endmodule
