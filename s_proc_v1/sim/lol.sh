#!/bin/bash
rm ./assembly/machinecode.txt

rm a.out

rm dump.vcd

touch ./assembly/machinecode.txt

gawk '{if(($1 == "LOAD") && ($2 == "ACC") && (length($3) == 8)){print ("00000000"$3" ")> "./assembly/machinecode.txt";
       	      }
     	      else if(($1 == "ADD") && ($2 == "ACC")){print ("01000000"$3" ")> "./assembly/machinecode.txt";
     	      	     	    	   		 }
	      else if(($1 == "AND") && ($2 == "ACC")){print ("00010000"$3" ")> "./assembly/machinecode.txt";
     	      	     	    	   		 }
	      else if(($1 == "SUB") && ($2 == "ACC")){print ("01100000"$3" ")> "./assembly/machinecode.txt";
     	      	     	    	   		 }
	    else if(($1 == "INPUT") && ($2 == "ACC")){print ("10100000"$3" ")> "./assembly/machinecode.txt";
     	      	     	    	   		 }
	   else if(($1 == "OUTPUT") && ($2 == "ACC")){print ("11100000"$3" ")> "./assembly/machinecode.txt";
     	      	     	    	   		 }
	       else if(($1 == "JUMP") && ($2 == "U")){print ("10000000"$3" ")> "./assembly/machinecode.txt";
     	      	     	    	   		 }
	       else if(($1 == "JUMP") && ($2 == "Z")){print ("10010000"$3" ")> "./assembly/machinecode.txt";
     	      	     	    	   		 }
	       else if(($1 == "JUMP") && ($2 == "C")){print ("10011000"$3" ")> "./assembly/machinecode.txt";
     	      	     	    	   		 }
	      else if(($1 == "JUMP") && ($2 == "NZ")){print ("10010100"$3" ")> "./assembly/machinecode.txt";
     	      	     	    	   		 }
	      else if(($1 == "JUMP") && ($2 == "NC")){print ("10011100"$3" ")> "./assembly/machinecode.txt";
     	      	     	    	   		 }
	      else {flag1=0;}}' assemblycode.txt

iverilog -f simfiles.txt

vvp a.out

gtkwave dump.vcd

