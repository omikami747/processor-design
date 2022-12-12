//------------------------------------------------------------------------------
// File:        mem_ctrl.v
// Author:      Omkar Kamath
// Date:        11 Dec 2022
//
// Description: Memory Control Unit of the Simple CPU v1
//
// (C) Omkar Kamath, 2022. No part may be reproduced without permission from
//     author.
//------------------------------------------------------------------------------

module mem_ctrl
  (
   din,
   dout,
   rw,
   adrs,
   data_in,
   data_out,
   adrs_out,
   rw_out
   );
   
   input wire din;
   input wire dout;
   input wire rw;
   input wire adrs;
   
   output wire data_in;
   output wire data_out;
   output wire adrs_out;
   output wire rw_out;

   
   assign data_in = din ;
   assign data_out = dout;
   assign rw_out = rw;
   assign adrs_out = adrs;

   
endmodule
		
		
