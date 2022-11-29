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
   
   
   always @(*)
     begin
	case (alu)
	  5'b00000 :
	    begin
	       temp_dout <= (a + b);
	    end
	  5'b00001 :
	    begin
	       temp_dout <= (a & b);
	    end
	  5'b00010 :
	    begin
	       temp_dout <= (a);
	    end
	  5'b00011 :
	    begin
	       temp_dout <= (b);
	    end
	  5'b01100 :
	    begin
	       temp_dout <= (a-b);
	    end
	  5'b10100 :
	    begin
	       temp_dout <= (a + 1);
	    end
	endcase // case (alu)
     end // always @ (*)

   assign dout = temp_dout[7:0];
   assign carry = temp_dout[8];

endmodule
	       
