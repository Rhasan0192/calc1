`include "transaction.sv"
`include "coverage.sv"

class generator;
	
	//random transaction
	rand transaction tr;
	
  //declaring mailbox
  mailbox gen2driv;
   
  //repeat count, to specify number of items to generate
  int  repeat_count,tr_count=0; 
 coverage cov=new();
  //event, to indicate the end of transaction generation
  event ended;
 
  //constructor
  function new(mailbox gen2driv);
    //getting the mailbox handle from env
    this.gen2driv = gen2driv;
  endfunction
   
  //main task, generates(create and randomizes) the repeat_count number of transaction packets and puts into mailbox
  task main();
 
    repeat(repeat_count) begin
      tr = new();
     // my_tr=new();
      if( !tr.randomize() ) $fatal("Gen:: trans randomization failed");   
      gen2driv.put(tr);
cov.sample(tr);
      tr_count++;
      tr.display("[ GENERATOR]");
      $display( "Transaction sent: %d",tr_count);
    end
    -> ended; //triggering indicatesthe end of generation
  endtask 
endclass