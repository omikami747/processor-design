//------------------------------------------------------------------------------
// File:        acc.v
// Author:      Omkar Kamath
// Date:        11 Dec 2022
//
// Description: Accumulator for the Simple CPU
//
// (C) Omkar Kamath, 2022. No part may be reproduced without permission from
//     author.
//------------------------------------------------------------------------------

module acc
  (clk,
   clr,
   acc_in,
   acc_out,
   en_da
   );

   input  wire          clk;
   input  wire 		clr;
   input  wire [7:0] 	acc_in;
   input  wire 		en_da;
   
   output  reg [7:0] 	acc_out;
   
   //----------------------------------------------------------------------
   // Main accumulator process
   //----------------------------------------------------------------------
   always @(posedge clk or negedge clr)
     begin
	if (clr  == 1'b0)
	  begin
	     acc_out <= 'h0;
	  end

	else if (en_da == 1'b1)
	  begin
	     acc_out <= acc_in;
	  end

     end // always @(posedge clk or negedge clr)
   
endmodule // acc

