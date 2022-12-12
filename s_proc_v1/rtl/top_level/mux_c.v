//------------------------------------------------------------------------------
// File:        mux_c.v
// Author:      Omkar Kamath
// Date:        11 Dec 2022
//
// Description: MUX C for the Simple CPU v1
//
// (C) Omkar Kamath, 2022. No part may be reproduced without permission from
//     author.
//------------------------------------------------------------------------------

module mux_c(
	     muxc,
	     pc,
	     ir,
	     c
	     );
   
   input wire muxc;
   input wire [7:0] pc;
   input wire [7:0] ir;
   
   output reg [7:0] c;
   
   //--------------------------------------------------------------------
   // Main MUX C process
   //--------------------------------------------------------------------]
   
   always @(*)
     begin
	if (muxc == 1'b0)
	  begin
	     c <= pc;
	  end
	else
	  begin
	     c <= ir;
	  end
     end // always @ (*)
   
endmodule // mux_c
