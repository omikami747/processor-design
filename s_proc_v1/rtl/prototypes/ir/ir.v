//////////////////////////////////////////////////////////////////////
//
// Author : Omkar Girish Kamath
// Instruction Register Prototype
// Data : 20 / 11 / 22
//
//////////////////////////////////////////////////////////////////////

module ir(
          clk,
          rst,
          d_in,
          d_out
          );
   
   input wire rst;
   input wire clk;
   
   input wire [15:0] d_in;
   output reg [15:0] d_out;
   always @(posedge clk or negedge rst)
     begin
	  begin
	     d_out <= d_in;
	  end
     end
   
   
endmodule
