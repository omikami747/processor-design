module pc(
	  clk,
	  rst,
	  adrs_in,
	  adrs_out,
	  en_pc
	  );
   input wire clk;
   input wire rst;
   input wire [7:0] adrs_in;
   input wire 	    en_pc;
   
   output  wire [7:0] adrs_out;
   reg [7:0] 	      temp_adrs;
   
   always @(posedge clk or negedge rst)
     begin
	if(rst === 1'b0)
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
     end // always @ (posedge clk or negedge rst)
   
   assign adrs_out = temp_adrs;
   
   
endmodule
