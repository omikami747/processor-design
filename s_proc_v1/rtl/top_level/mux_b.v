//------------------------------------------------------------------------------
// File:        mux_b.v
// Author:      Omkar Kamath
// Date:        11 Dec 2022
//
// Description: MUX B for the Simple CPU v1
//
// (C) Omkar Kamath, 2022. No part may be reproduced without permission from
//     author.
//------------------------------------------------------------------------------

module mux_b
  (
   muxb,
   mem,
   ir,
   b
   );
   
   input wire           muxb ;
   input wire [7:0] 	mem  ;
   input wire [7:0] 	ir   ;
   
   output reg [7:0] 	b    ;

   //--------------------------------------------------------------------
   //  main  MUX B process
   //--------------------------------------------------------------------
       
   always @(*)
     begin
	if (muxb == 1'b0)
	  begin
	     b <= mem;
	  end
	else
	  begin
	     b <= ir;
	  end
     end // always @ (*)

endmodule // mux_b


