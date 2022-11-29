module decoder_tb;
   reg tstclk ;
   reg tstclr;
   reg tstcarry;
   reg tstzero;
   reg [7:0] tstir;

   wire      tstrw;
   wire [4:0] tstalu;
   wire       tstmuxa;
   wire       tstmuxb;
   wire       tstmuxc;
   wire       tsten_ir;
   wire       tsten_da;
   wire       tsten_pc;

   decoder dut(
	       .clk(tstclk),
	       .clr(tstclr),
	       .carry(tstcarry),
	       .zero(tstzero),
	       .ir(tstir),
	       .rw(tstrw),
	       .alu(tstalu),
	       .muxa(tstmuxa),
	       .muxb(tstmuxb),
	       .muxc(tstmuxc),
	       .en_ir(tsten_ir),
	       .en_da(tsten_da),
	       .en_pc(tsten_pc));
   
   always
     begin
	tstclk <= 1'b0;
	#5;
	tstclk <= 1'b1;
	#5;
     end
   
   initial
     begin
	$dumpvars;
	tstclr <= 1'b0;
	tstzero <= 1'b0;
	tstcarry <= 1'b1;
	
	repeat (2)
	  begin
	     @(posedge tstclk)
	       begin
	       end
	  end
	@(posedge tstclk)
	  begin
	     tstclr <= 1'b1;
	     tstir <= 8'b11100000;
	  end
	repeat (3)
	@(posedge tstclk)
	  begin
	  end
	@(posedge tstclk)
	  begin
	     tstir <= 8'b10010100;
	  end
        
	
	#200;
	
	
	
	$finish;
     end // initial begin
endmodule
