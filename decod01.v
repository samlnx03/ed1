module decod01(
    input s0,
    input s1,
    input s2,
    output y0,
    output y1,
    output y2,
    output y3,
    output y4,
	 output y5,
    output y6,
    output y7
    );
reg [7:0] salida;
//assign y0=(~s2) & (~s1) & (~s0)

assign {y7,y6,y5,y4,y3,y2,y1,y0}=salida;

always @(*) begin
	case({s2,s1,s0})
		0: salida=1;
		1: salida=2;
		2: salida=4;
		3: salida=8;
		4: salida=16;
		5: salida=32;
		6: salida=64;
		7: salida=128;
		default: salida=0;
	endcase
end

endmodule
