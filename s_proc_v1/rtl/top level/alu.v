module alu(
	   a,
	   b,
	   alu,
	   dout,
	   carry);
   
   input wire [7:0] a;
   input wire [7:0] b;
   input wire [4:0] alu;
   
   output wire [7:0] dout;
   output wire 	     carry;

   reg [8:0] 	    temp_dout;

   localparam ADD        = 5'b00000 ;
   localparam BITAND     = 5'b00001 ;
   localparam INP_A      = 5'b00010 ;
   localparam INP_B      = 5'b00011 ;
   localparam SUB        = 5'b01100 ;
   localparam INCREMENT  = 5'b10100 ;
   
   always @(*)
     begin
	case (alu)
	  ADD :
	    begin
	       temp_dout <= (a + b);
	    end
	  BITAND :
	    begin
	       temp_dout <= (a & b);
	    end
	  INP_A :
	    begin
	       temp_dout <= (a);
	    end
	  INP_B :
	    begin
	       temp_dout <= (b);
	    end
	  SUB :
	    begin
	       temp_dout <= (a-b);
	    end
	  INCREMENT :
	    begin
	       temp_dout <= (a + 1);
	    end
	endcase // case (alu)
     end // always @ (*)

   assign dout = temp_dout[7:0];
   assign carry = temp_dout[8];

endmodule
	       
