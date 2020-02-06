
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/30 05:08:21
// Design Name: 
// Module Name: calc_simu2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module calc_simu2;
    reg[9:0] decimal;
    wire[14:0] out;
    reg CLK,RST,CE,plus,sub,multi,equal;
    
    calc uut2(
        .out(out),
        .decimal(decimal),
        .CLK(CLK),
        .RST(RST),
        .CE(CE),
        .plus(plus),
        .sub(sub),
        .multi(multi),
        .equal(equal)
    );
    parameter STEP = 20;
    always #5 CLK= ~CLK;
    
    initial begin
        CLK<=0;
        RST<=0;
        CLK<=0;decimal<=0;CE<=0;plus<=0;sub<=0;multi<=0;equal<=0;

        #100 RST<=1;

        #10 decimal<=10'b0000000010;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0001000000;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0000000001;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0000010000;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0001000000;
        #10 decimal<=10'b0000000000;
        
        #10 sub<=1;
        #10 sub<=0;
        
        #10 decimal<=10'b0000000010;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0000000010;
        #10 decimal<=10'b0000000000;
        
        #10 CE<=1;
        #10 CE<=0;
        
        #10 decimal<=10'b0000000010;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0000000010;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0000000001;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0000000001;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0000000001;
        #10 decimal<=10'b0000000000;
        
        #10 multi<=1;
        #10 multi<=0;
        
        #10decimal<=10'b0000001000;
        #10 decimal<=10'b0000000000;
        
        #10 plus<=1;
        #10 plus<=0;
        
        #10 decimal<=10'b0000000010;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0000000010;
        #10 decimal<=10'b0000000000;
        
        #10 decimal<=10'b0000000010;
        #10 decimal<=10'b0000000000;
        #10 equal<=1;
        #10 equal<=0;
        #200 $finish;
    end

    initial begin
    $monitor( $stime, " a=%h",out);
    $dumpfile("output/calc_test.vcd");
    $dumpvars(0, calc_simu2);
    end
endmodule
