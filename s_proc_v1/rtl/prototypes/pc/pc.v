module pc(
	  clk,
	  clr,
	  adrs_in,
	  adrs_out,
	  en_pc
	  );
   input wire clk;
   input wire clr;
   input wire [7:0] adrs_in;
   input wire 	    en_pc;
   
   output  wire [7:0] adrs_out;
   reg [7:0] 	      temp_adrs;
   
   always @(posedge clk or negedge clr)
     begin
	if( clr  === 1'b0)
	  begin
	     temp_adrs <= 8'b00000000;
	  end
	else if(en_pc === 1'b1)
	  begin
	     temp_adrs <= adrs_in;
	  end
	else
	  begin
	  end
     end // always @ (posedge clk or negedge clr)
   
   assign adrs_out = temp_adrs;
   
   
endmodule
