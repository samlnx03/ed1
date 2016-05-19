/*
    sintetizar con:   iverilog primer_test_bench.v
    simular en texto: ./a.out
    simular en graficas: gtkwave test.vcd
    
    test.vcd se genera dentro del testbech
*/

module cto(input a,b,c, output f);
	assign f=~c | a&b;
endmodule

module cto_t();
	reg a,b,c;
	wire f;

	reg [2:0] i;
	
	cto TB(a,b,c,f);

	initial #100 $finish;

	initial begin
		$display("time\ta\tb\tc\tf");
		for(i=0; i>=0; i=i+1)
			#10 {a,b,c}=i;
	end

	initial $monitor("%2d\t%b\t%b\t%b\t%b",
			$time, a,  b,  c,  f);

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,cto_t);
	 end

endmodule

