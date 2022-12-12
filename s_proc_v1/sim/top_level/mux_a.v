//------------------------------------------------------------------------------
// File:        mux_a.v
// Author:      Omkar Kamath
// Date:        11 Dec 2022
//
// Description: MUX A for the Simple CPU v1
//
// (C) Omkar Kamath, 2022. No part may be reproduced without permission from
//     author.
//------------------------------------------------------------------------------

module mux_a
  (
   muxa,
   acc,
   pc,
   a
   );
   
   input wire            muxa;
   input wire [7:0]       acc;
   input wire [7:0]        pc;
   
   output reg [7:0]         a;
   
   //--------------------------------------------------------------------
   // MUX A main process
   //--------------------------------------------------------------------
   
   always @(*)
     begin
	if (muxa == 1'b0)
	  begin
	     a <= acc;
	  end
	else
	  begin
	     a <= pc;
	  end
     end // always @ (*)
   
endmodule // mux_a

