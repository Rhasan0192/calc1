`ifndef CALC2_IF_DEFINE
`define CALC2_IF_DEFINE
typedef enum { req1_data_in, req2_data_in, req3_data_in, req4_data_in } req_data_in;
typedef enum { req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in } req_tag_in;
typedef enum { req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in } req_cmd_in;
class transaction;
   
  //declaring the transaction items
  
   bit [0:31] out_data1, out_data2, out_data3, out_data4;
   bit [0:1]  out_resp1, out_resp2, out_resp3, out_resp4, out_tag1, out_tag2, out_tag3, out_tag4;
   rand bit [0:3] 	 req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
   rand bit [0:3] 	 req1_cmd_in1, req2_cmd_in1, req3_cmd_in1, req4_cmd_in1;
   rand bit[0:1] 	 req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;
   rand bit [0:31]  req1_data_in, req2_data_in, req3_data_in, req4_data_in;
  // rand bit cmd_port[$:3];
    rand bit [0:31]  req1_data_in1, req2_data_in1, req3_data_in1, req4_data_in1;   
    rand req_data_in data;
    rand req_tag_in tag;
  //  rand req_cmd_in cmd;
//	cmd_port = {req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in};

	   //constraints
/* 	constraint a_opcode {(req1_cmd_in == 0) || (req1_cmd_in == 1) || (req1_cmd_in == 2) || (req1_cmd_in == 5) || (req1_cmd_in == 6) ;}
	constraint b_opcode {(req2_cmd_in == 0) || (req2_cmd_in == 1) || (req2_cmd_in == 2) || (req2_cmd_in == 5) || (req2_cmd_in == 6) ;}
	constraint c_opcode {(req3_cmd_in == 0) || (req3_cmd_in == 1) || (req3_cmd_in == 2) || (req3_cmd_in == 5) || (req3_cmd_in == 6) ;}
	constraint d_opcode {(req4_cmd_in == 0) || (req4_cmd_in == 1) || (req4_cmd_in == 2) || (req4_cmd_in == 5) || (req4_cmd_in == 6) ;}
	constraint e_opcode {(req1_cmd_in1 == 0); (req2_cmd_in1 == 0); (req3_cmd_in1 == 0); (req4_cmd_in1 == 0) ;}
constraint e_tag {( req1_tag_in != req2_tag_in); (req3_tag_in != req4_tag_in);(req1_tag_in != req3_tag_in);(req3_tag_in != req2_tag_in);(req1_tag_in != req4_tag_in);(req2_tag_in != req4_tag_in);}
 */	constraint direct_common1  {(req1_data_in == 32'hFFFFFFFF) || (req2_data_in == 32'hFFFFFFFF) || (req3_data_in == 32'hFFFFFFFF) || (req1_data_in == 32'hFFFFFFFF) || 
	                      (req1_data_in1 == 32'h00000000) || (req2_data_in1 == 32'h00000000) || (req3_data_in1 == 32'h00000000) || (req4_data_in1 == 32'h00000000) ;}

	constraint direct_common2   {(req1_data_in1 == 32'h00000004) || (req2_data_in1 == 32'h00000004) || (req3_data_in1 == 32'h00000004) || (req4_data_in1 == 32'h00000004) || 
                       	(req1_data_in1 == 32'hFFFFFFFF) || (req2_data_in1 == 32'hFFFFFFFF) || (req3_data_in1 == 32'hFFFFFFFF) || (req4_data_in1 == 32'hFFFFFFFF) ||
                       	(req1_data_in1 == 32'h00000000) || (req2_data_in1 == 32'h00000000) || (req3_data_in1 == 32'h00000000) || (req4_data_in1 == 32'h00000000);}
constraint direct2_4_1   {(req1_data_in == 32'h245689DF) || (req2_data_in == 32'h245689DF) || (req3_data_in == 32'h245689DF) || (req4_data_in == 32'h245689DF) || 
                       	(req1_data_in1 == 32'hDBA97621) || (req2_data_in1 == 32'hDBA97621) || (req3_data_in1 == 32'hDBA97621) || (req4_data_in1 == 32'hDBA97621) ;}
constraint direct2_4_2   {(req1_data_in == 32'h245689DE) || (req2_data_in == 32'h245689DE) || (req3_data_in == 32'h245689DE) || (req4_data_in == 32'h245689DE) || 
                       	(req1_data_in1 == 32'hDBA97621) || (req2_data_in1 == 32'hDBA97621) || (req3_data_in1 == 32'hDBA97621) || (req4_data_in1 == 32'hDBA97621) ;}
constraint direct2_4_3   {(req1_data_in == 32'h245689DE) || (req2_data_in == 32'h245689DE) || (req3_data_in == 32'h245689DE) || (req4_data_in == 32'h245689DE) || 
                       	(req1_data_in1 == 32'h245689DE) || (req2_data_in1 == 32'h245689DE) || (req3_data_in1 == 32'h245689DE) || (req4_data_in1 == 32'h245689DE) ;}
constraint direct2_4_4   {(req1_data_in == 32'h245689DE) || (req2_data_in == 32'h245689DE) || (req3_data_in == 32'h245689DE) || (req4_data_in == 32'h245689DE) || 
                       	(req1_data_in1 == 32'h245689DF) || (req2_data_in1 == 32'h245689DF) || (req3_data_in1 == 32'h245689DF) || (req4_data_in1 == 32'h245689DF) ;}
constraint direct2_4_5	{(req1_data_in1 == 32'h24568900) || (req2_data_in1 == 32'h24568900) || (req3_data_in1 == 32'h24568900) || (req4_data_in1 == 32'h24568900) ;}
constraint direct2_4_6	{(req1_data_in1 == 32'h2456891F) || (req2_data_in1 == 32'h2456891F) || (req3_data_in1 == 32'h2456891F) || (req4_data_in1 == 32'h2456891F) ;}	
function transaction copy();
		transaction tr 		= new();
		tr.req1_cmd_in		= this.req1_cmd_in;
		tr.req2_cmd_in		= this.req2_cmd_in;
		tr.req3_cmd_in		= this.req3_cmd_in;
	tr.req4_cmd_in		= this.req4_cmd_in;
		
		tr.req1_tag_in		= this.req1_tag_in;
		tr.req2_tag_in		= this.req2_tag_in;
		tr.req3_tag_in		= this.req3_tag_in;
		tr.req4_tag_in		= this.req4_tag_in;
		
		
		tr.req1_data_in = this.req1_data_in;
		tr.req2_data_in = this.req2_data_in;
		tr.req3_data_in = this.req3_data_in;
		tr.req4_data_in = this.req4_data_in;
		
		
	tr.req1_data_in1 = this.req1_data_in1;
		tr.req2_data_in1 = this.req2_data_in1;
		tr.req3_data_in1 = this.req3_data_in1;
		tr.req4_data_in1 = this.req4_data_in1;
		tr.data=this.data;
		//tr.cmd=this.cmd;
		tr.tag=this.tag;
		
//		tr.transaction	= this.transaction;
		copy = tr;
		
	endfunction: copy
  function void display(string name);
    $display("-------------------------from transaction------------");
   $display("- %s ",name);
    $display("-------------------------");
    $display($time,"-  req1_cmd_in= %0h,req2_cmd_in= %0h,req3_cmd_in= %0h,req4_cmd_in= %0h ",req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in);
	$display($time,"-  req1_tag_in= %0h,req2_tag_in= %0h,req3_tag_in= %0h,req4_tag_in= %0h ",req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in);
	$display($time,"-  port1::op1= %0h,port2::op1= %0h,port3::op1= %0h,port4::op1= %0h ",req1_data_in, req2_data_in, req3_data_in, req4_data_in);
	$display($time,"-  port1::op2= %0h,port2::op2= %0h,port3::op3= %0h,port4::op4= %0h ",req1_data_in1, req2_data_in1, req3_data_in1, req4_data_in1);
	
//	$display($time, "-out_data1 = %0h,out_data2 = %0h,out_data3 = %0h,out_data4 = %0h",out_data1, out_data2, out_data3, out_data4);
//	$display($time,"-out_resp1 = %0h,out_resp2 = %0h,out_resp3 = %0h,out_resp4 = %0h",out_resp1, out_resp2, out_resp3, out_resp4);	
//	$display($time,"-out_tag1 = %0h,out_tag2 = %0h,out_tag3 = %0h,out_tag4 = %0h",out_tag1, out_tag2, out_tag3, out_tag4);		
    $display("-------------------------");
  endfunction
endclass

`endif