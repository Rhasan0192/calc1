`ifndef GUARD_COVERAGE 
`define GUARD_COVERAGE
`include "transaction.sv"
`include "interface.sv"
class coverage;
bit clk;
rand transaction tr; 
    covergroup CovGrp @(posedge clk);
   cmd1: coverpoint tr.req1_cmd_in {
      bins Addition   = {4'b0001};
      bins Substraction    = {4'b0010};
      bins left_shift   = {4'b0101};
      bins right_shift   = {4'b0110};
      bins no_op  = default;
    }
cmd2: coverpoint tr.req2_cmd_in {
      bins Addition   = {4'b0001};
      bins Substraction    = {4'b0010};
      bins left_shift   = {4'b0101};
      bins right_shift   = {4'b0110};
      bins no_op  = default;
    }
cmd3: coverpoint tr.req3_cmd_in {
      bins Addition   = {4'b0001};
      bins Substraction    = {4'b0010};
      bins left_shift   = {4'b0101};
      bins right_shift   = {4'b0110};
      bins no_op  = default;
    }
cmd4: coverpoint tr.req4_cmd_in {
      bins Addition   = {4'b0001};
      bins Substraction    = {4'b0010};
      bins left_shift   = {4'b0101};
      bins right_shift   = {4'b0110};
      bins no_op  = default;
    }

    data1_1:coverpoint tr.req1_data_in ;
data1_2:coverpoint tr.req2_data_in ;
data1_3:coverpoint tr.req3_data_in ;
data1_4:coverpoint tr.req4_data_in ;

data2_1:coverpoint tr.req1_data_in1 ;
data2_2:coverpoint tr.req2_data_in1 ;
data2_3:coverpoint tr.req3_data_in1 ;
data2_4:coverpoint tr.req4_data_in1 ;

    tag1:coverpoint tr.req1_tag_in;
tag2:coverpoint tr.req2_tag_in;
tag3:coverpoint tr.req3_tag_in;
tag4:coverpoint tr.req4_tag_in;
    all_cross: cross cmd1,cmd2,cmd3,cmd4,data1_1,data1_2,data1_3,data1_4,data2_1,data2_2,data2_3,data2_4,tag1,tag2,tag3,tag4;
  endgroup
  
  function new ();
    CovGrp = new;           // Create an instance of the covergroup
  endfunction
  
  task sample(transaction tr); 
this.tr = tr; 
CovGrp.sample(); 
endtask
endclass
  
  `endif