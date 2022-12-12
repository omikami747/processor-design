//------------------------------------------------------------------------------
// File:        ram.v
// Author:      Omkar Kamath
// Date:        11 Dec 2022
//
// Description: External RAM for the Simple CPU v1
//
// (C) Omkar Kamath, 2022. No part may be reproduced without permission from
//     author.
//------------------------------------------------------------------------------

module ram
  (
   clk,
   rw,
   adrs,
   dout,
   din
   );
   
   input wire clk          ;
   input wire clr          ;
   input wire rw           ;
   input wire [7:0] adrs   ;
   input wire [7:0] din    ;
   
   output wire [15:0] dout ;
   
   reg [15:0] mem [255:0]  ;
   
   always @(posedge clk)
     begin
	if (rw == 1'b1)
	  begin
	     mem[adrs] <= {8'b00000000,din};
	  end
     end
   
   assign dout = mem[adrs] ;
   
   initial
     begin
	$readmemb("/home/kali/PROJECTS/processor-design/s_proc_v1/sim/assembly/machinecode.txt",mem,0,255);
     end
   
endmodule // ram

   
