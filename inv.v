// シミュレーション用ファイル
`timescale 1ps/1ps

module inv_tp;
reg [0:0] a;
wire [0:0] q;

parameter STEP = 100000;

inv inv(a,q);

initial begin
a = 1'b0;
#STEP a = 1'b1;
#STEP a = 1'b0;
#STEP $finish;
end

initial begin
$monitor( $stime, " a=%h q=%h",a,q);
$dumpfile("output/inv_test.vcd");
$dumpvars(0, inv_tp);
end

endmodule