`include "top_level/toplevel.v"
`include "top_level/ram.v"
module sim_env;
   reg tstclk;
   reg tstclr;
   
   wire [15:0] topdin;
   wire [7:0]  topdout;
   wire        toprw;
   wire [7:0]  topadrs;

   always
     begin
	tstclk <= 1'b0;
	#5;
	tstclk <= 1'b1;
	#5;
     end
   
   toplevel dut_top (
		     .clk(tstclk),
		     .clr(tstclr),
		     .din(topdin),
		     .dout(topdout),
		     .adrs(topadrs),
		     .rw(toprw)
		     );
   ram dut_ram (
		.clk(tstclk),
		.rw(toprw),
		.adrs(topadrs),
		.dout(topdin),
		.din(topdout)
		);
   
   initial
     begin
	$dumpvars;
	tstclr <= 1'b0;
	#20;
	@(posedge tstclk)
	  tstclr <= 1'b1;
	#400;
	$finish;
     end
   
endmodule // sim_env

   
