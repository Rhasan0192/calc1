

`ifndef GUARD_DRIVER
`define GUARD_DRIVER
`define D_IF	vif.driver_cb
//`include "coverage.sv"
`include "transaction.sv"
`include "interface.sv"
class driver;
  
  //used to count the number of transactions
  int no_transactions;
logic[0:3] queue[$];
int index,temp_var,i;
 //logic [0:3]  queue [$:3];
 //logic [0:3] cmd_port;
  //CovGrp cg = new();
 // coverage cov=new();
 // cov cg=new();
 //  bit [0:31] a,b;
  // a=(`D_IF.req1_data_in ||`D_IF.req2_data_in ||`D_IF.req3_data_in ||`D_IF.req4_data_in);
 // b=(`D_IF.req1_data_in ||`D_IF.req2_data_in ||`D_IF.req3_data_in ||`D_IF.req4_data_in);
   //creating virtual interface handle
  virtual calc2_if vif;
 // virtual calc2_if vif;
   
  //creating mailbox handle
  mailbox gen2driv,driv2scb;
   
  //constructor
  function new(virtual calc2_if vif,mailbox gen2driv,driv2scb);
    //getting the interface
	//this.vif=vif;
    this.vif = vif;
    //getting the mailbox handles from  environment
    this.gen2driv = gen2driv;
    this.driv2scb= driv2scb;
  endfunction
   
  //Reset task, Reset the Interface signals to default/initial values

  
  //drivers the transaction items to interface signals
  task main();
    forever begin
      
      transaction tr;
      gen2driv.get(tr);
queue   = {tr.req1_cmd_in,tr.req2_cmd_in,tr.req3_cmd_in,tr.req4_cmd_in};
    
	//  cov.sample(tr);
 
         $display("----------Driver::transaction %d received from generator---------------",no_transactions);
	//reg[0:3] queue   = {tr.req1_cmd_in,tr.req2_cmd_in,tr.req3_cmd_in,tr.req4_cmd_in};
      
      index    = $urandom_range(0,3); //index of queue is from 0 to 4
      temp_var = queue[index];
	  for(i=0; i<$random; i++) 
queue.push_back($urandom());
	// queue.push_back(cmd_port);
      @(posedge vif.driver_cb);
	`D_IF.req1_cmd_in <= queue.pop_front()  ;
	`D_IF.req2_cmd_in <=  queue.pop_front();
	`D_IF.req3_cmd_in <=  queue.pop_front();
	`D_IF.req4_cmd_in <= queue.pop_front();
	
	
	`D_IF.req1_tag_in <= tr.req1_tag_in;
	`D_IF.req2_tag_in <= tr.req2_tag_in;
	`D_IF.req3_tag_in <= tr.req3_tag_in;
	`D_IF.req4_tag_in <= tr.req4_tag_in;
	
	`D_IF.req1_data_in <= tr.req1_data_in;
	`D_IF.req2_data_in <= tr.req2_data_in;
	`D_IF.req3_data_in <= tr.req3_data_in;
	`D_IF.req4_data_in <= tr.req4_data_in;

$display($time,"port1:cmd:%0h,port2:cmd: %0h, port3:cmd:%0h,port4:cmd: %0h",tr.req1_cmd_in,tr.req2_cmd_in,tr.req3_cmd_in,tr.req4_cmd_in);
$display($time,"port1:tag:%0h,port2:tag: %0h, port3:tag:%0h,port4:tag: %0h",tr.req1_tag_in,tr.req2_tag_in,tr.req3_tag_in,tr.req4_tag_in);
$display($time,"port1:op1:%0h,port2:op1: %0h, port3:op1:%0h,port4:op1: %0h",tr.req1_data_in,tr.req2_data_in,tr.req3_data_in,tr.req4_data_in);


//$display($time,"port1:op1:%0h,port2:op1: %0h, port3:op1:%0h,port4:op1: %0h",vif.req1_data_in,vif.req2_data,vif.req3_data_in,vif.req4_data_in);
//wait(`D_IF.req1_cmd_in||`D_IF.req2_cmd_in ||`D_IF.req3_cmd_in ||`D_IF.req4_cmd_in);
     @(posedge vif.driver_cb);
`D_IF.req1_cmd_in <= tr.req1_cmd_in1;
	`D_IF.req2_cmd_in <= tr.req2_cmd_in1;
		`D_IF.req3_cmd_in <= tr.req3_cmd_in1;
	`D_IF.req4_cmd_in <= tr.req4_cmd_in1;

  
  `D_IF.req1_data_in <= tr.req1_data_in1;
	`D_IF.req2_data_in <= tr.req2_data_in1;
	`D_IF.req3_data_in <= tr.req3_data_in1;
	`D_IF.req4_data_in <= tr.req4_data_in1;
$display("--------------------next clock cycle--------------");
$display($time,"port1:cmd:%0h,port2:cmd: %0h, port3:cmd:%0h,port4:cmd: %0h",tr.req1_cmd_in1,tr.req2_cmd_in1,tr.req3_cmd_in1,tr.req4_cmd_in1);
	$display($time,"port1:op2:%0h,port2:op2: %0h, port3:op2:%0h,port4:op2: %0h",tr.req1_data_in1,tr.req2_data_in1,tr.req3_data_in1,tr.req4_data_in1);
//$display($time,"port1:op2:%0h,port2:op2: %0h, port3:op2:%0h,port4:op2: %0h",vif.req1_data_in1,vif.req2_data_in1,vif.req3_data_in1,vif.req4_data_in1);

//	$display($time,tr.req1_data_in1,tr.req2_data_in1,tr.req3_data_in1,tr.req4_data_in1);
//z wait(`D_IF.req1_cmd_in==0 ||`D_IF.req2_cmd_in==0 ||`D_IF.req3_cmd_in==0 ||`D_IF.req4_cmd_in==0);    
//	 @(posedge vif_driver.driver_cb);
	 
	//  tr.out_data_in1 = `D_IF.out_data_in1 ;
	  //tr.out_data_in2 = `D_IF.out_data_in2 ;
	 // tr.out_data_in3 = `D_IF.out_data_in3 ;
	  //tr.out_data_in4 = `D_IF.out_data_in4 ;
	  
	  
	  
	//  tr.out_resp1 = `D_IF.out_resp1;
	 // tr.out_resp2 = `D_IF.out_resp2;
	 // tr.out_resp3 = `D_IF.out_resp3;
	//  tr.out_resp4= `D_IF.out_resp4;
	  
	  
	//  tr.out_tag_in1 = `D_IF.out_tag_in1;
	//  tr.out_tag_in2 = `D_IF.out_tag_in2;
	//  tr.out_tag_in3 = `D_IF.out_tag_in3;
//	  tr.out_tag_in4 = `D_IF.out_tag_in4;
//	  wait (`D_IF.out_data_in1 || `D_IF.out_data_in2 || `D_IF.out_data_in3 || `D_IF.out_data_in4);
  //    @(posedge vif_driver.driver_cb);
   //   tr.display("[ Driver ]");
      no_transactions++;
@(posedge vif.driver_cb);
      driv2scb.put(tr);
$display("%0h",tr);
    end
  endtask
  task reset();
 //  wait(`D_IF.reset);
    $display("[ DRIVER ] ----- Reset Started -----");
   @(posedge vif.driver_cb);  
 `D_IF.reset <= 7'b1111111;
 //cg.stop ();
//begin   
    
//	end
  //  wait(!`D_IF.reset);
// begin
  repeat  (7)
  @(posedge vif.driver_cb);
	`D_IF.reset <= 7'b0000000; 
//	cg.start ();
    $display("[ DRIVER ] ----- Reset Ended   -----");
//  end
  endtask
   
           
endclass

`endif