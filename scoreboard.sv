`include "transaction.sv"
`include "interface.sv"

class scoreboard;

event ended;

//int correct, error;
int b1,b2,b3,b4;

bit sum;
bit cmd1,cmd2,cmd3,cmd4;
bit [0:31] exp_data1, exp_data2, exp_data3, exp_data4;
bit [0:31] op1_1,op1_2,op1_3,op1_4,op2_1,op2_2,op2_3,op2_4;
bit [0:1] exp_rep1, exp_rep2, exp_rep3, exp_rep4;
logic [0:31] port1[$];
logic [0:31] port2[$];
logic [0:31] port3[$];
logic [0:31] port4[$];

int match, correct=0,incorrect=0;
virtual calc2_if vif;
mailbox driv2scb, mon2scb;

function new ( virtual calc2_if vif,mailbox  driv2scb, mon2scb);
	    this.vif=vif;
		this.driv2scb		= driv2scb;
		this.mon2scb		= mon2scb;
		
	endfunction

	transaction tr;
	
	
task main();

	forever begin
	
	//	mon2scb.get(tr);
	//	driv2scb.get(tr);
		#1800

cmd1=vif.req1_cmd_in;
cmd2=vif.req2_cmd_in;
cmd3=vif.req3_cmd_in;
cmd4=vif.req4_cmd_in;
		op1_1=vif.req1_data_in;
	op1_2=vif.req2_data_in;
	op1_3= vif.req3_data_in;
	op1_4= vif.req4_data_in;
	#200
	
	op2_1=vif.req1_data_in;
	op2_2= vif.req2_data_in;
	op2_3= vif.req3_data_in;
	op2_4= vif.req4_data_in;/* 
		
				$display($time,"in scoreboard from: port1.1: %h,port2 :%h, cmd3: %h, cmd4: %h",op1_1,op1_2,op1_3,op1_4);
				$display($time,"in scoreboard from: cmd1: %h,cmd2 :%h, cmd3: %h, cmd4: %h",cmd1,cmd2,cmd3,cmd4);			
				$display($time,"in scoreboard from: port2.1: %h,cmd2 :%h, cmd3: %h, cmd4: %h",op2_1,op2_2,op2_3,op2_4);
				$display($time,"in scoreboard: cmd1.1: %h,cmd2 :%h, cmd3: %h, cmd4: %h",vif.req1_cmd_in,vif.req2_cmd_in,vif.req3_cmd_in,vif.req4_cmd_in);
				$display($time,"in scoreboard: port1.1: %h,port2.1 :%h, port3.1: %h, port4.1: %h",vif.req1_data_in,vif.req2_data_in,vif.req3_data_in,vif.req4_data_in);
				$display($time,"in scoreboard: port1.1: %h,port2.1 :%h, port3.1: %h, port4.1: %h",  vif.req1_data_in,vif.req2_data_in,vif.req3_data_in,vif.req4_data_in);
			//$display($time,"in scoreboard: port1.2.1: %h,port2.2 :%h, port3.2: %h, port4.2: %h",tr.req1_data_in,tr.req2_data_in,tr.req3_data_in,tr.req4_data_in);
		//				$display($time,"in scoreboard: port1.2: %h,port2.2 :%h, port3.2: %h, port4.2: %h",tr.req1_data_in1,tr.req2_data_in1,tr.req3_data_in1,tr.req4_data_in1);
	//	$display($time,"in scoreboard: cmd1: %h,cmd2 :%h, cmd3: %h, cmd4: %h",tr.req1_cmd_in,tr.req2_cmd_in,tr.req3_cmd_in,tr.req4_cmd_in); */
		b1 = op2_1[0:4];			
		b2 = op2_2[0:4];
		b3 = op2_3[0:4];
		b4 = op2_4[0:4];
		case(cmd1)
            4'b0001:
              begin
                
              
                  exp_data1 =  op1_1 + op2_1;
               
              end
            4'b0010:
              begin
                if(op1_1 >= op2_1)
                  exp_data1 = {2'b10,(op1_1 - op2_1)};
                else
                  exp_data1 = {2'b01,(op1_1 - op2_1)};
              end
            4'b0101: exp_data1 = {2'b01,(op1_1 << b1)};
            4'b0110: exp_data1 = {2'b01,(op1_1 >> b1)};
            default: exp_data1 = {2'b10,{32{1'b0}}};
          endcase
		  case(cmd2)
            4'b0001:
              begin
                
                  exp_data2 =  op1_2 + op2_2;
               
              end
            4'b0010:
              begin
                if(op1_2 >= op2_2)
                  exp_data2 = {2'b10,(op1_2 - op2_2)};
                else
                  exp_data2 = {2'b01,(op1_2 - op2_2)};
              end
            4'b0101: exp_data2 = {2'b01,(op1_2<< b2)};
            4'b0110: exp_data2 = {2'b01,(op1_2 >> b2)};
            default: exp_data2 = {2'b10,{32{1'b0}}};
          endcase
		  
		  		  case(cmd3)
            4'b0001:
              begin
                
                  exp_data3 =  op1_3 + op2_3;
                
              end
            4'b0010:
              begin
                if(op1_3 >= op2_3)
                  exp_data3 = {2'b10,(op1_3 - op2_3)};
                else
                  exp_data3 = {2'b01,(op1_3 - op2_3)};
              end
            4'b0101: exp_data3 = {2'b01,(op1_3<< b3)};
            4'b0110: exp_data3 = {2'b01,(op1_3 >> b3)};
            default: exp_data3 = {2'b10,{32{1'b0}}};
          endcase
		  		  case(cmd4)
            4'b0001:
              begin

                  exp_data4 =  op1_4 + op2_4;
                
              end
            4'b0010:
              begin
                if(op1_4 >= op2_4)
                  exp_data4 = {2'b10,(op1_4 - op2_4)};
                else
                  exp_data4 = {2'b01,(op1_4 - op2_4)};
              end
            4'b0101: exp_data3 = {2'b01,(op1_4<< b4)};
            4'b0110: exp_data3 = {2'b01,(op1_4 >> b4)};
            default: exp_data3 = {2'b10,{32{1'b0}}};
          endcase
		  if (vif.out_resp1 == 2'b01)
		  begin
		  if (exp_data1 == vif.out_data1)
begin
correct++;
end
else
begin 
incorrect++;
		end
end		

  if (vif.out_resp2 ==2'b01)
		  begin
		  if (exp_data2 == vif.out_data2)
begin
correct++;
end
else
begin 
incorrect++;
		end
end		

  if (vif.out_resp3 == 2'b01)
		  begin
		  if (exp_data3 == vif.out_data3)
begin
correct++;
end
else
begin 
incorrect++;
		end
end		

  if (vif.out_resp4 == 2'b01)
		  begin
		  		  $display($time,"so expected value %h and what we got %h",exp_data4,vif.out_data4);
		  if (exp_data4 == vif.out_data4)
		 // $display($time,"so expected value %h and what we got %h",exp_data4,vif.out_data4);
begin
correct++;
end
else
incorrect++;
end		
end
$display($time," correct :: %d , incorrect :: %d", correct, incorrect);
endtask
endclass

