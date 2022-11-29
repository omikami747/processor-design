module mem_ctrl(
		din,
		dout,
		rw,
		adrs,
		data_in,
		data_out,
		adrs_out,
		rw_out
		);
   input wire din;
   input wire dout;
   input wire rw;
   input wire adrs;
   input wire data_in;
   input wire data_out;
   input wire adrs_out;
   input wire rw_out;
   

   
   assign data_in = din ;
   assign data_out = dout;
   assign rw_out = rw;
   assign adrs_out = adrs;

   
endmodule
		
		
