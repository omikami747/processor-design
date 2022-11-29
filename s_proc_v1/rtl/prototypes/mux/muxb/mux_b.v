module mux_b(
	     muxb,
	     mem,
	     ir,
	     b);
   
   input wire muxb;
   input wire [7:0] mem;
   input wire [7:0] ir;
   output reg [7:0] b;
   
   always @(*)
     begin
	if(muxb === 1'b0)
	  begin
	     b <= mem;
	  end
	else
	  begin
	     b <= ir;
	  end
     end // always @ (*)
endmodule // mux_b


