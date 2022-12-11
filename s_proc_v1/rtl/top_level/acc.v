module acc
  (clk,
   clr,
   acc_in,
   acc_out,
   en_da
   );

   input  wire          clk;
   input  wire 		clr;
   input  wire [7:0] 	acc_in;
   input  wire 		en_da;
   
   output  reg [7:0] 	acc_out;
   
   
   always @(posedge clk or negedge clr)
     begin
	if (clr  == 1'b0)
	  begin
	     acc_out <= 'h0;
	  end

	else if (en_da == 1'b1)
	  begin
	     acc_out <= acc_in;
	  end

     end // always @(posedge clk or negedge clr)
   
endmodule // acc

