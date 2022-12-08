module ram(
	   clk,
	   rw,
	   adrs,
	   dout,
	   din
	   );
   input wire clk ;
   input wire clr;
   input wire rw ;
   input wire [7:0] adrs  ;
   input wire [7:0] din  ;
   
   output wire [15:0] dout;
   
   reg [15:0] mem [255:0] ;
   
   always @(posedge clk)
     begin
	if(rw == 1'b1)
	  begin
	     mem[adrs] <= {8'b00000000,din};
	  end
     end
   
   assign dout = mem[adrs] ;
   
   initial
     begin
	$readmemb("ram_contents.txt",mem,0,255);
     end
endmodule // ram

   
