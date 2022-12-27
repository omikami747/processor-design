//------------------------------------------------------------------------------
// File:        alu.v
// Author:      Omkar Kamath
// Date:        11 Dec 2022
//
// Description: ALU for the Simple CPU
//
// (C) Omkar Kamath, 2022. No part may be reproduced without permission from
//     author.
//------------------------------------------------------------------------------

module alu
  (
   a,
   b,
   alu,
   dout,
   carry,
   zero
   );
   
   input wire [7:0] a          ;
   input wire [7:0] b          ;
   input wire [4:0] alu        ;
   
   output wire [7:0] dout      ;
   output wire 	     carry     ;
   output reg 	     zero      ;
   reg [8:0] 	     temp_dout ;
   
   localparam ADD        = 5'b00000 ;
   localparam BITAND     = 5'b00001 ;
   localparam INP_A      = 5'b00010 ;
   localparam INP_B      = 5'b00011 ;
   localparam SUB        = 5'b01100 ;
   localparam INCREMENT  = 5'b10100 ;
   
   always @(*)
     begin
	case (alu)
	  ADD       :   temp_dout <= (a + b);
	  BITAND    :   temp_dout <= (a & b);
	  INP_A     :   temp_dout <= (a)    ;
	  INP_B     :   temp_dout <= (b)    ;
	  SUB       :   temp_dout <= (a-b)  ;
	  INCREMENT :   temp_dout <= (a + 1);
	endcase // case (alu)
     end // always @ (*)

   assign dout = temp_dout[7:0];
   assign carry = temp_dout[8];

   always @(*)
     begin
	if(temp_dout == 9'b000000000)
	  begin
	     zero <= 1'b1;
	  end
	else
	  begin
	     zero <= 1'b0;
	  end
     end

endmodule	       
