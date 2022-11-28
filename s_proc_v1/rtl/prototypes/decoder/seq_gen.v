module seq_gen(
	       clk,
    	       clr,
	       f,
	       d,
	       e,
	       i
	       );
   input clk;
   
   input clr;
   output wire f;
   output wire d;
   output wire e;
   output wire i;
   
   
   reg [3:0] state;
   always @(posedge clk or negedge clr)
     begin
	
	if(clr === 1'b0)
	  begin
	     state <= 4'b0000;
	     
	  end
	else
	  begin
	     case(state)
	       4'b0000:
		 begin
		    state <= 4'b1000;
		 end
	       4'b1000:
		 begin
		    state <= 4'b0100;
		 end
	       4'b0100:
		 begin
		    state <= 4'b0010;
		 end
	       4'b0010:
		 begin
		    state <= 4'b0001;
		 end
	       4'b0001:
		 begin
		    state <= 4'b1000;
		 end
	       default:	// 
		 begin
		    state <= 4'b0000;
		 end
	     endcase // case (state)
	     
	  end
     end // always @ (posedge clk or negedge clr)
   assign f = state[3];
   assign d = state[2];
   assign e = state[1];
   assign i = state[0];
   
endmodule // seq_gen
