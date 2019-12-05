// 加算演算子による4ビット加算回路

module adder( A, B, Y);
input [3:0] A, B;
output [3:0] Y;

assign Y = A + B;

endmodule