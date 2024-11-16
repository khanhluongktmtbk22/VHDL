`timescale 1ns/ 1ns
module btl_tb;
reg [6:0] received;
wire [3:0] data;
wire [2:0] error;
hamming_decoder a1(received, data, error);
initial
$monitor("time %t: data3=%b,data2=%b,data1=%b,data0=%b\n",
$time,data[3],data[2],data[1],data[0]);
initial begin 
received=7'b1011000;
#5 received=7'b0010101;
#5 received=7'b1000011;
#5 received=7'b1110110;
end
initial #50 $stop;
endmodule