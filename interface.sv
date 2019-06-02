`ifndef CALC2_IF_DEFINE
`define CALC2_IF_DEFINE

interface calc2_if (input  clk);
	
   logic [0:31] out_data1, out_data2, out_data3, out_data4;
   logic [0:1]  out_resp1, out_resp2, out_resp3, out_resp4, out_tag1, out_tag2, out_tag3, out_tag4;
   logic 	 scan_out;

   logic 	 a_clk, b_clk,c_clk, scan_in;
   logic [1:7] reset;
   logic [0:3] 	 req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
   logic[0:1] 	 req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;
   logic [0:31]  req1_data_in, req2_data_in, req3_data_in, req4_data_in;
   //   logic [0:31]  req1_data_in1, req2_data_in1, req3_data_in1, req4_data_in1;
 logic error_found;
	//driver clocking block
  clocking driver_cb @(posedge clk);
    default input #1 output #1;
    output req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in;
	output req1_tag_in,req2_tag_in,req3_tag_in,req4_tag_in;
  //  output req1_data_in1,req2_data_in1,req3_data_in1,req4_data_in1;
    output req1_data_in,req2_data_in,req3_data_in,req4_data_in;
//    output req1_data2,req2_data2,req3_data2,req4_data2;
    input  out_resp1,out_resp2,out_resp3,out_resp4;
	input out_data1,out_data2,out_data3,out_data4;
	input out_tag1,out_tag2,out_tag3,out_tag4;
	input error_found;
	output a_clk, b_clk, scan_in;
	input  scan_out;
	inout reset,c_clk;
  endclocking
  
  //monitor clocking block
  clocking monitor_cb @(negedge clk);
  default input #1 output #1;
    input req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in;
    input req1_data_in,req2_data_in,req3_data_in,req4_data_in;
 //   input   req1_data_in1,req2_data_in1,req3_data_in1,req4_data_in1;
	input req1_tag_in,req2_tag_in,req3_tag_in,req4_tag_in;
 //   input req1_data2,req2_data2,req3_data2,req4_data2;
    input out_resp1,out_resp2,out_resp3,out_resp4;
	input out_data1,out_data2,out_data3,out_data4; 
	input out_tag1,out_tag2,out_tag3,out_tag4;
	input error_found;
	input a_clk, b_clk, scan_in, scan_out;
	input reset,c_clk;
  endclocking
  modport one (output out_resp1, out_data1, out_tag1,
             input  req1_cmd_in, req1_data_in, req1_tag_in
			
			 );

modport two (output out_resp2, out_data2, out_tag2,
             input  req2_cmd_in, req2_data_in, req2_tag_in
			
			 );

modport three (output out_resp3, out_data3, out_tag3,
             input  req3_cmd_in, req3_data_in, req3_tag_in
			 
			 );

modport four (output out_resp4, out_data4, out_tag4,
             input  req4_cmd_in, req4_data_in, req4_tag_in
			 
			 );

  modport TEST (clocking driver_cb,input reset,clk);
  modport DUT  (output out_data1, out_data2, out_data3, out_data4, out_resp1, out_resp2, out_resp3, out_resp4,out_tag1,out_tag2,out_tag3,out_tag4, scan_out, input a_clk, b_clk, clk, req1_cmd_in, req1_data_in,req1_tag_in, req2_cmd_in, req2_data_in,req2_tag_in,req3_cmd_in, req3_data_in,req3_tag_in, req4_cmd_in, req4_data_in,req4_tag_in, reset, scan_in);
  modport MONITOR (clocking monitor_cb,input reset,clk);
  modport DRIVER  (clocking driver_cb, input reset,clk);
  
  
  endinterface
  
 `endif