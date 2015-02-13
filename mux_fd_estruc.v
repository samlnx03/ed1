module multiplex(input seleccion, output x, input E0, E1);
    wire x;
    //assign x=seleccion?E1:E0;
    assign x=~seleccion&E0 | seleccion&E1;
endmodule
 
module mux4a1(input i0, i1, i2, i3, s1,s0, output x);
    wire w1, w2;
    multiplex U1(s0,w1,i0,i1);
    multiplex U2(s0, w2, i2,i3);
    multiplex U3(s1,x,w1,w2);
endmodule
 
module mediosum(input a, b, output c,s);
    mux4a1 SAM_C(0,0,0,1,a,b,c);
    mux4a1 SAM_S(0,1,1,0,a,b,s);
endmodule
 
module t_multiplex;
  parameter stop_time=100;
  wire c,s;
  reg a,b;
  
  initial #stop_time $finish;
  
  mediosum CTO1(a, b, c, s);
  
  initial 
    begin
      #10 a=0; b=0;
      #10 a=0; b=1;
      #10 a=1; b=0;
      #10 a=1; b=1;
    end
    
    initial begin
    $display("time,\ta,\tb,\tc,\ts");
    $display("---------------------------------");
    $monitor("%3d \t%b \t%b \t%b\t%b", $time, a, b, c, s);
    end
    
endmodule
