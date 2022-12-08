module mux_c(
	     muxc,
	     pc,
	     ir,
	     c
	     );
   
   input wire muxc;
   input wire [7:0] pc;
   input wire [7:0] ir;
   
   output reg [7:0] c;
   
   always @(*)
     begin
	if(muxc === 1'b0)
	  begin
	     c <= pc;
	  end
	else
	  begin
	     c <= ir;
	  end
     end // always @ (*)
   
endmodule // mux_c
