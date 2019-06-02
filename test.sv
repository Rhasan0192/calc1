`include "environment.sv"
program test(calc2_if vif);
   
  //declaring environment instance
  environment env;
    
   // bit [1:0] count;
//    bit clk;
    
  //declaring environment instance
 // environment env;
  //my_trans my_tr;
  
  initial begin
    //creating environment
    env = new(vif);
  //  my_tr = new();
     
    //setting the repeat count of generator as 10, means to generate 10 packets
    env.gen.repeat_count = 100;
   // env.gen.tr = my_tr;
     
    //calling run of env, it interns calls generator and driver main tasks.
    env.run();
  end
endprogram