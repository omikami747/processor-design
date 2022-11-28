module ins_dec_tb ;
   reg [7:0] tstir;
   reg 	     tstdecode;
   reg 	     tstexecute;
   wire      tstload;
   wire      tstinp;
   wire      tstadd;
   wire      tstoutp;
   wire      tstjumpz;
   wire      tstjump;
   wire      tstjumpnz;
   wire      tstjumpc;
   wire      tstjumpnc;
   wire      tstbitand;
   wire      tstsub;

   ins_dec dut (
		.ir(tstir),
		.decode(tstdecode),
	        .execute(tstexecute),
		.add(tstadd),
		.load(tstload),
		.inp(tstinp),
		.outp(tstoutp),
		.jumpz(tstjumpz),
		.jump(tstjump),
		.jumpc(tstjumpc),
		.jumpnc(tstjumpnc),
		.jumpnz(tstjumpnz),
 		.bitand(tstbitand),
		.sub(tstsub)
		);
   
   
   initial
     begin
	$dumpvars;
	#10;
	tstdecode <= 1'b1;
	tstexecute <= 1'b0;
	tstir <= 8'b11100000;
	#20;
	tstir <= 8'b100101XX;
	#20;
	tstir <= 8'b100111XX;
	tstdecode <= 1'b0;
	#20;
	tstir <= 8'b10011000;
	tstexecute <= 1'b1;
	
	#20;
	
	$finish;
     end
endmodule
