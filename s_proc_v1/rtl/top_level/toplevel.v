//------------------------------------------------------------------------------
// File:        toplevel.v
// Author:      Omkar Kamath
// Date:        11 Dec 2022
//
// Description: Top level Module for the Simple CPU v1
//
// (C) Omkar Kamath, 2022. No part may be reproduced without permission from
//     author.
//------------------------------------------------------------------------------

module toplevel(
		din,
		clk,
		clr,
		rw,
		adrs,
		dout
		);

   input wire [15:0] din;
   input wire clk;
   input wire clr;

   output wire [7:0] dout;
   output wire [7:0] adrs;
   output wire 	     rw;               	     
   
   wire [15:0] 	     ir_out ;    
   wire [7:0]	     adrs_in;
   wire [7:0] 	     pc_out;
   wire 	     carry;
   wire 	     zero;
   wire [4:0] 	     alu;
   wire 	     muxa; 
   wire 	     muxb;
   wire 	     muxc;
   wire 	     en_ir;
   wire 	     en_da;	     
   wire 	     en_pc;
   wire [7:0] 	     a;
   wire [7:0]	     b;
   wire [7:0]	     c;
   wire [7:0]	     alu_result;
   
		     
   ir dut_ir(
	     .clk(clk),
	     .clr(clr),
	     .d_in(din),
	     .d_out(ir_out),
	     .en_ir(en_ir)
	     );
   
   pc dut_pc(
	     .clk(clk),
	     .clr(clr),
	     .adrs_in(alu_result),
	     .adrs_out(pc_out),
	     .en_pc(en_pc)
	     );
   
   decoder dut_decoder(.clk(clk),
		       .clr(clr),
		       .carry(carry),
		       .zero(zero),
		       .ir(ir_out[15:8]),
		       .rw(rw),
		       .alu(alu),
		       .muxa(muxa),
		       .muxb(muxb),
		       .muxc(muxc),
		       .en_ir(en_ir),
		       .en_da(en_da),
		       .en_pc(en_pc)
		       );
   
   alu dut_alu(
	       .a(a),
	       .b(b),
	       .alu(alu),
	       .dout(alu_result),
	       .carry(carry),
	       .zero(zero)
	       );

   acc dut_acc(
	       .clk(clk),
	       .clr(clr),
	       .acc_in(alu_result),
	       .acc_out(dout),
	       .en_da(en_da)
	       );
   
   mux_a dut_muxa(
		  .muxa(muxa),
		  .acc(dout),
		  .pc(pc_out),
		  .a(a)
		  );
   
   mux_b dut_muxb(
		  .muxb(muxb),
		  .mem(din[7:0]),
		  .ir(ir_out[7:0]),
		  .b(b)
		  );

   mux_c dut_muxc(
		  .muxc(muxc),
		  .pc(pc_out),
		  .ir(ir_out[7:0]),
		  .c(adrs)
		  );
   
endmodule   
   
