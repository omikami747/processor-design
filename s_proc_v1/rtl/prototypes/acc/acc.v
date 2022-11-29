module acc(
	  clk,
	  clr,
	  acc_in,
	  acc_out,
	  en_da
	  );
   input wire clk;
   input wire clr;
   input wire [7:0] acc_in;
   input wire 	    en_da;
   
   output  wire [7:0] acc_out;
   reg [7:0] 	      temp_acc;
   
   always @(posedge clk or negedge clr)
     begin
	if( clr  === 1'b0)
	  begin
	     temp_acc <= 8'b00000000;
	  end
	else if(en_da === 1'b1)
	  begin
	     temp_acc <= acc_in;
	  end
	else
	  begin
	  end
     end // always @ (posedge clk or negedge clr)
   
   assign acc_out = temp_acc;
   
   
endmodule // acc

