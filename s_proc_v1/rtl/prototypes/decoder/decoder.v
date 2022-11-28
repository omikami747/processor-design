module decoder(
	       clk,
	       clr,
	       carry,
	       zero,
	       ir,
	       rw,
	       alu,
	       muxa,
	       muxb,
	       muxc,
	       en_ir,
	       en_da,
	       en_pc);
   input wire clk ;
   input wire clr ;
   input wire carry;
   input wire zero;
   input wire [7:0] ir;
   
   output reg 	    rw;
   output reg [4:0] alu;
   output reg 	    muxa;
   output reg 	    muxb;
   output reg 	    muxc;
   output reg 	    en_ir;	     
   output reg 	    en_pc;
   output reg 	    en_da;
   

   
   //////////////////////////////////////////////////////////////////////
   //   Sequence Generator 
   //   Brief description :
   //   'f' indicates the fetch state , 'd' indicates the decode state 
   //   ,'e' indicates the execute state and 'i' indicates the increment state
   //
   //////////////////////////////////////////////////////////////////////
   
   wire 	     f;
   wire 	     d;
   wire 	     e;
   wire 	     i;
   
   
   reg [3:0] 	     state;
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






   
   //////////////////////////////////////////////////////////////////////
   //   Instruction Decoder
   //
   //
   //////////////////////////////////////////////////////////////////////




   
   reg 	    load;
   reg 	    inp;
   reg 	    add;
   reg 	    outp; 
   reg 	    jumpz;
   reg 	    jump;
   reg 	    jumpnz;
   reg 	    jumpc;
   reg	    jumpnc;
   reg	    sub;
   reg 	    bitand;
   
		 
   reg 	    decexe ;
   always @ (*)
     begin
	if(d || e === 1'b1)
	  begin
	     decexe <= 1'b1;
	  end
	else
	  begin
	     decexe <= 1'b0;
	     
	  end
     end

   
   always @ (*)
     begin
	case (ir[7:4])
	  4'b0000 :
	    begin
	       load <= decexe;
	       inp <= 1'b0;
	       outp <= 1'b0;
	       sub <= 1'b0;
	       add <= 1'b0;
	       bitand <= 1'b0;
	       jump <= 1'b0;
	       jumpz <= 1'b0;
	       jumpnz <= 1'b0;
	       jumpc <= 1'b0;
	       jumpnc <= 1'b0;
	    end
	  4'b0100 :
	    begin
	       add <=  decexe;
	       inp <= 1'b0;
	       outp <= 1'b0;
	       sub <= 1'b0;
	       load <= 1'b0;
	       bitand <= 1'b0;
	       jump <= 1'b0;
	       jumpz <= 1'b0;
	       jumpnz <= 1'b0;
	       jumpc <= 1'b0;
	       jumpnc <= 1'b0;
	    end
	  4'b0001 :
	    begin
	       bitand <= decexe;
	       inp <= 1'b0;
	       outp <= 1'b0;
	       sub <= 1'b0;
	       load <= 1'b0;
	       add <= 1'b0;
	       jump <= 1'b0;
	       jumpz <= 1'b0;
	       jumpnz <= 1'b0;
	       jumpc <= 1'b0;
	       jumpnc <= 1'b0;
	    end
	  4'b0110 :
	    begin
	       sub <= decexe;
	       inp <= 1'b0;
	       outp <= 1'b0;
	       add <= 1'b0;
	       load <= 1'b0;
	       bitand <= 1'b0;
	       jump <= 1'b0;
	       jumpz <= 1'b0;
	       jumpnz <= 1'b0;
	       jumpc <= 1'b0;
	       jumpnc <= 1'b0;
	    end
	  4'b1010 :
	    begin
	       inp <=  decexe;
	       add <= 1'b0;
	       outp <= 1'b0;
	       sub <= 1'b0;
	       load <= 1'b0;
	       bitand <= 1'b0;
	       jump <= 1'b0;
	       jumpz <= 1'b0;
	       jumpnz <= 1'b0;
	       jumpc <= 1'b0;
	       jumpnc <= 1'b0;
	    end
	  4'b1110 :
	    begin
	       outp <=  decexe;
	       inp <= 1'b0;
	       add <= 1'b0;
	       sub <= 1'b0;
	       load <= 1'b0;
	       bitand <= 1'b0;
	       jump <= 1'b0;
	       jumpz <= 1'b0;
	       jumpnz <= 1'b0;
	       jumpc <= 1'b0;
	       jumpnc <= 1'b0;
	    end
	  4'b1000 :
	    begin
	       jump <= decexe;   
	       inp <= 1'b0;
	       outp <= 1'b0;
	       sub <= 1'b0;
	       load <= 1'b0;
	       bitand <= 1'b0;
	       add <= 1'b0;
	       jumpz <= 1'b0;
	       jumpnz <= 1'b0;
	       jumpc <= 1'b0;
	       jumpnc <= 1'b0; 
	    end
	  4'b1001 :
	    begin
	       case (ir[3:2])
		 2'b00 :
		   begin
		      jumpz <= decexe;
		      inp <= 1'b0;
		      outp <= 1'b0;
		      sub <= 1'b0;
		      load <= 1'b0;
		      bitand <= 1'b0;
		      jump <= 1'b0;
		      add  <= 1'b0;
		      jumpnz <= 1'b0;
		      jumpc <= 1'b0;
		      jumpnc <= 1'b0;
		   end
		 2'b10 :
		   begin
		      jumpc <= decexe;
		      inp <= 1'b0;
		      outp <= 1'b0;
		      sub <= 1'b0;
		      load <= 1'b0;
		      bitand <= 1'b0;
		      jump <= 1'b0;
		      jumpz <= 1'b0;
		      jumpnz <= 1'b0;
		      add <= 1'b0;
		      jumpnc <= 1'b0;
		   end
		 2'b01 :
		   begin
		      jumpnz <=  decexe;
		      inp <= 1'b0;
		      outp <= 1'b0;
		      sub <= 1'b0;
		      load <= 1'b0;
		      bitand <= 1'b0;
		      jump <= 1'b0;
		      jumpz <= 1'b0;
		      add <= 1'b0;
		      jumpc <= 1'b0;
		      jumpnc <= 1'b0;
		   end
		 2'b11 :
		   begin
		      jumpnc <= decexe;
		      inp <= 1'b0;
		      outp <= 1'b0;
		      sub <= 1'b0;
		      load <= 1'b0;
		      bitand <= 1'b0;
		      jump <= 1'b0;
		      jumpz <= 1'b0;
		      jumpnz <= 1'b0;
		      jumpc <= 1'b0;
		      add <= 1'b0;
		   end	  
		 default :
		   begin
		      jumpnc <= 1'b0;
		      inp <= 1'b0;
		      outp <= 1'b0;
		      sub <= 1'b0;
		      load <= 1'b0;
		      bitand <= 1'b0;
		      jump <= 1'b0;
		      jumpz <= 1'b0;
		      jumpnz <= 1'b0;
		      jumpc <= 1'b0;
		      add <= 1'b0;
		   end // case: default
	       endcase // case (ir[3:2])
	    end
	endcase // case (ir[7:2])
     end // always @ (*)


   //////////////////////////////////////////////////////////////////////
   //   Rest of the smaller circuits
   //
   //
   //////////////////////////////////////////////////////////////////////

   //////////////////////////////////////////////////////////////////////
   //
   //   read write control signal for memory
   //
   //////////////////////////////////////////////////////////////////////

   
   always @(*)
     begin
	if (e & outp === 1'b1)
	  begin
	     rw <= 1'b1;
	  end
	else
	  begin
	     rw <= 1'b0;
	  end
     end // always @ (*)


   
   //////////////////////////////////////////////////////////////////////
   //
   //    ALU control signals
   //
   //////////////////////////////////////////////////////////////////////
   
   
   always @(*)
     begin
	if((bitand | inp | load | jump | jumpc | jumpnc | jumpz | jumpnz) === 1'b1)
	  begin
	     alu[0] <= 1'b1;
	  end
	else
	  begin
	     alu[0] <= 1'b0;
	  end
     end // always @ (*)


    always @(*)
     begin
	if((outp | inp | load | jump | jumpc | jumpnc | jumpz | jumpnz) === 1'b1)
	  begin
	     alu[1] <= 1'b1;
	  end
	else
	  begin
	     alu[1] <= 1'b0;
	  end
     end // always @ (*)

   always @(*)
     begin
	if(i | sub === 1'b1)
	  begin
	     alu[2] <= 1'b1;
	  end
	else
	  begin
	     alu[2] <= 1'b0;
	  end
     end // always @ (*)

   always @(*)
     begin
	if( sub === 1'b1)
	  begin
	     alu[3] <= 1'b1;
	  end
	else
	  begin
	     alu[3] <= 1'b0;
	  end
     end // always @ (*)
   
   always @(*)
     begin
	if(i === 1'b1)
	  begin
	     alu[4] <= 1'b1;
	  end
	else
	  begin
	     alu[4] <= 1'b0;
	  end
     end // always @ (*)


   //////////////////////////////////////////////////////////////////////
   //
   //   MUX control signals
   //
   //////////////////////////////////////////////////////////////////////

   always @(*)
     begin
	if(i === 1'b1)
	  begin
	     muxa <= 1'b1;
	  end
	else
	  begin
	     muxa <= 1'b0;
	  end
     end // always @ (*)

   always @(*)
     begin
	if(i === 1'b1)
	  begin
	     muxa <= 1'b1;
	  end
	else
	  begin
	     muxa <= 1'b0;
	  end
     end // always @ (*)
   always @(*)
     begin
	if((load | add | bitand | sub ) === 1'b1)
	  begin
	     muxb <= 1'b1;
	  end
	else
	  begin
	     muxb <= 1'b0;
	  end
     end // always @ (*)
   always @(*)
     begin
	if((inp | outp) === 1'b1)
	  begin
	     muxc <= 1'b1;
	  end
	else
	  begin
	     muxc <= 1'b0;
	  end
     end // always @ (*)

   //////////////////////////////////////////////////////////////////////
   //
   //  Instruction Register update control signal
   //
   //////////////////////////////////////////////////////////////////////

   always @(*)
     begin
	if(f === 1'b1)
	  begin
	     en_ir <= 1'b1;
	  end
	else
	  begin
	     en_ir <= 1'b0;
	  end
     end // always @ (*)

   //////////////////////////////////////////////////////////////////////
   //
   //  Accumulator update control signal
   //
   //////////////////////////////////////////////////////////////////////

   always @(*)
     begin
	if((e & (load | add | sub | bitand | inp)) === 1'b1)
	  begin
	     en_da <= 1'b1;
	  end
	else
	  begin
	     en_da <= 1'b0;
	  end
     end // always @ (*)

   //////////////////////////////////////////////////////////////////////
   //
   //  Program Counter update control signal
   //
   //////////////////////////////////////////////////////////////////////

   

   
endmodule
