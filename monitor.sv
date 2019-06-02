
`ifndef GUARD_MONITOR
`define GUARD_MONITOR
`define M_IF	vif.monitor_cb
`include "transaction.sv"
class monitor;
   
  //creating virtual interface handle
  virtual calc2_if vif;
   
  //creating mailbox handle
  mailbox mon2scb;
   
  //constructor
  function new(virtual calc2_if vif,mailbox mon2scb);
    //getting the interface
    this.vif = vif;
    //getting the mailbox handles from  environment
    this.mon2scb = mon2scb;
  endfunction
   
  //Samples the interface signal and send the sample packet to scoreboard
  task main;
    forever begin
      transaction tr;
      tr = new();
      @(posedge vif.monitor_cb);
   //   wait(`M_IF.req1_cmd_in||`M_IF.req2_cmd_in||`M_IF.req3_cmd_in||`M_IF.req4_cmd_in);
      tr.req1_cmd_in = vif.req1_cmd_in;
	  tr.req2_cmd_in = vif.req2_cmd_in;
	  tr.req3_cmd_in=vif.req3_cmd_in;
	  tr.req4_cmd_in=vif.req4_cmd_in;
	
	tr.req1_tag_in = vif.req1_tag_in;
	  tr.req2_tag_in = vif.req2_tag_in;
	  tr.req3_tag_in=vif.req3_tag_in;
	  tr.req4_tag_in=vif.req4_tag_in;
	
	tr.req1_data_in = vif.req1_data_in;
	  tr.req2_data_in = vif.req2_data_in;
	  tr.req3_data_in=vif.req3_data_in;
	  tr.req4_data_in=vif.req4_data_in;
$display($time,"From Monitor----port1:cmd:%0h,port2:cmd: %0h, port3:cmd:%0h,port4:cmd: %0h",tr.req1_cmd_in,tr.req2_cmd_in,tr.req3_cmd_in,tr.req4_cmd_in);
$display($time,"From Monitor-----port1:op1:%0h,port2:op1: %0h, port3:op1:%0h,port4:op1: %0h",tr.req1_data_in,tr.req2_data_in,tr.req3_data_in,tr.req4_data_in);

    
      @(posedge vif.monitor_cb);
      
	  vif.req1_cmd_in = 0;
	vif.req2_cmd_in = 0;
	vif.req3_cmd_in = 0;
	vif.req4_cmd_in = 0;
	
		tr.req1_data_in1 = vif.req1_data_in;
	  tr.req2_data_in1 = vif.req2_data_in;
	  tr.req3_data_in1= vif.req3_data_in;
	  tr.req4_data_in1= vif.req4_data_in;
	

	
	@(posedge vif.monitor_cb);
	
	  tr.out_data1 = vif.out_data1;
	  tr.out_data2 = vif.out_data2;
	  tr.out_data3 = vif.out_data3;
	  tr.out_data4 = vif.out_data4;
	  
	  
	  tr.out_resp1 = vif.out_resp1;
	  tr.out_resp2 = vif.out_resp2;
	  tr.out_resp3 = vif.out_resp3;
	  tr.out_resp4= vif.out_resp4;
	  
	  
	  tr.out_tag1 = vif.out_tag1;
	  tr.out_tag2 = vif.out_tag2;
	  tr.out_tag3 = vif.out_tag3;
	  tr.out_tag4 = vif.out_tag4;
	  @(posedge vif.monitor_cb);
wait(vif.out_data1 || vif.out_data2 || vif.out_data3 || vif.out_data4);
$display($time,"port1:output::%0h, port2:output::%0h, port3:output::%0h,port4:output::%0h",vif.out_data1,vif.out_data2,vif.out_data3,vif.out_data4);
$display($time,"port1:resp::%0h, port2:resp::%0h, port3:resp::%0h,port4:resp::%0h",vif.out_resp1,vif.out_resp2,vif.out_resp3,vif.out_resp4);
$display($time,"port1:tag::%0h, port2:tag::%0h, port3:tag::%0h,port4:tag::%0h",vif.out_tag1,vif.out_tag2,vif.out_tag3,vif.out_tag4);
  
	  
    @(posedge vif.monitor_cb);
      mon2scb.put(tr);
   //   tr.display("[ Monitor ]");
     //  $display($time,"output1.1::%0h, output2::%0h, output3::%0h,output4::%0h",vif.out_data1,vif.out_data2,vif.out_data3,vif.out_data4);
        end
  endtask
   
endclass
`endif