//////////////////////////////////////////////////////////////////////
//
// Author : Omkar Girish Kamath
// Instruction Register Prototype
// Data : 20 / 11 / 22
//
//////////////////////////////////////////////////////////////////////

module ir(
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
   
   always @(posedge clk or negedge clr)
     begin
	if(clr == 1'b0)
	  begin
	     d_out <= 'h0;
	  end
	else
	  if(en_ir == 1'b1)
	    begin
	       d_out <= d_in;
	    end
     end
   
endmodule
