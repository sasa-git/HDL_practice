// 反転回路

module inv (IN, OUT);
    input IN;
    output OUT;

    // 内部で使用する信号線
    wire IN;
    wire OUT;

    assign OUT = ~IN;
endmodule