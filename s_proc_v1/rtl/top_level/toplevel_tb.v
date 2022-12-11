module toplevel_tb;
   reg [15:0] tstdin;
   reg tstclk;
   reg tstclr;
   
   wire tstrw;
   wire [7:0] tstdout;
   wire [7:0] tstadrs;

   toplevel dut(
		.clk(tstclk),
		.clr(tstclr),
		.din(tstdin),
		.rw(tstrw),
		.dout(tstdout),
		.adrs(tstadrs)
		);
   always
     begin
	tstclk <= 1'b0;
	#5;
	tstclk <= 1'b1;
	#5;
     end

   initial
     begin
	$dumpvars;
	tstclr <= 1'b0;
	repeat(3)
	  @ (posedge tstclk)
	    begin
	       
	    end
	@ (posedge tstclk)
	  begin
	     tstclr <= 1'b1;
	     tstdin <= 16'b1010000010000000;
	  end
	repeat(4)
	  @ (posedge tstclk)
	    begin
	       
	    end
	@ (posedge tstclk)
	  begin
	     tstdin <= 16'b0100000000001111;
	  end
//	@ (posedge tstclk)
//	  begin
//	     tstdin <= 16'b0000000000001111;
//	  end
	#200;
	
	$finish;
     end
endmodule