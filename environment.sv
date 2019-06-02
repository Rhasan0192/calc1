
`ifndef GUARD_ENVIRONMENT
`define GUARD_ENVIRONMENT
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
   
  //generator and driver instance
  generator  gen;
  driver     driv;
  monitor    mon;
  scoreboard scb;
   
  //mailbox handle's
  mailbox gen2driv;
  mailbox mon2scb;
  mailbox driv2scb; 
  //virtual interface
  virtual calc2_if vif;
   
  //constructor
  function new(virtual calc2_if vif);
    //get the interface from test
    this.vif = vif;

     
    //creating the mailbox (Same handle will be shared across generator and driver)
    gen2driv = new();
    driv2scb=new();
    mon2scb  = new();
     
    //creating generator and driver
    gen  = new(gen2driv);
    driv = new(this.vif,gen2driv,driv2scb);
    mon  = new(this.vif,mon2scb);
    scb  = new(this.vif,driv2scb,mon2scb);
  endfunction
   
  //
 virtual task pre_test();
   // driv.reset();
    fork 
    driv.main();
      mon.main();
      scb.main();
      join_none
  endtask
   
  task test();
    driv.reset();
    fork
      gen.main();
  //   driv.main();
  //    mon.main();
  //    scb.main();
    join_none
  endtask
   
  task post_test();
    wait(gen.ended.triggered);
    wait(gen.repeat_count == driv.no_transactions); //Optional
 //   wait(gen.repeat_count == scb.no_transactions);
  endtask 
   
  //run task
  task run;
    pre_test();
    test();
    post_test();
    $finish;
  endtask
   
endclass

`endif