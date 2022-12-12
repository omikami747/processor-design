//------------------------------------------------------------------------------
// File:        ir.v
// Author:      Omkar Kamath
// Date:        11 Dec 2022
//
// Description:  Instruction Register for the Simple CPU V1
//
// (C) Omkar Kamath, 2022. No part may be reproduced without permission from
//     author.
//------------------------------------------------------------------------------

module ir
  (
   clk,
   clr,
   d_in,
   d_out,
   en_ir
   );
   
   input wire clr;
   input wire clk;
   input wire en_ir;
   input wire [15:0] d_in;
   
   output reg [15:0] d_out;
   
   //--------------------------------------------------------------------
   // Main Instruction Register process
   //--------------------------------------------------------------------
   
   always @(posedge clk or negedge clr)
     begin
	if (clr == 1'b0)
	  begin
	     d_out <= 'h0;
	  end
	else
	  if (en_ir == 1'b1)
	    begin
	       d_out <= d_in;
	    end
     end
   
endmodule
