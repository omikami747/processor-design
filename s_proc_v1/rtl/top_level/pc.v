//------------------------------------------------------------------------------
// File:        pc.v
// Author:      Omkar Kamath
// Date:        11 Dec 2022
//
// Description: Program Counter for the Simple CPU v1
//
// (C) Omkar Kamath, 2022. No part may be reproduced without permission from
//     author.
//------------------------------------------------------------------------------

module pc
  (
   clk,
   clr,
   adrs_in,
   adrs_out,
   en_pc
   );
   
   input wire clk             ;
   input wire clr             ;
   input wire [7:0] adrs_in   ;
   input wire 	    en_pc     ;
   
   output  reg [7:0] adrs_out ;

   //--------------------------------------------------------------------
   // Main Program Counter Process
   //--------------------------------------------------------------------
   
   always @(posedge clk or negedge clr)
     begin
	if (clr == 1'b0)
	  begin
	     adrs_out <= 'h0;
	  end
	else if (en_pc == 1'b1)
	  begin
	     adrs_out <= adrs_in;
	  end
     end // always @ (posedge clk or negedge clr)
   
   
   
   
endmodule
