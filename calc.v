
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/01/29 17:03:47
// Design Name: 
// Module Name: calc
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


module calc(out, decimal, CLK, RST, CE,plus,sub,multi,equal);
output[14:0] out;
input[9:0] decimal;
input CLK, RST, CE,plus,sub,multi,equal;
reg[3:0] count;
reg[3:0] ope;
reg[14:0] REGA,REGB;
wire [5:0] d;
assign d = dectobin(decimal);
// 最下位から0~9bit目をそれぞれテンキーの0~9に割り当て
function[3:0] dectobin;
    input[9:0] in;
        if(in[9])
            dectobin = 9;
        else if(in[8])
            dectobin = 8;
        else if(in[7])
            dectobin = 7;
        else if(in[6])
            dectobin = 6;
        else if(in[5])
            dectobin = 5;
        else if(in[4])
            dectobin = 4;
        else if(in[3])
            dectobin = 3;
        else if(in[2])
            dectobin = 2;
        else if(in[1])
            dectobin = 1;
        else if(in[0])
            dectobin = 0; 
endfunction
always @(posedge CLK or negedge RST)
    if(!RST)
        begin
            REGA <= 0;REGB<=0;count<=0;ope<=0;
        end
    else if((decimal != 0)&&(count <7))
        begin
            // 入力文字の割り当て
            REGA<=(REGA*10)+d;
            count<=count+1;
        end
    else if(plus)
        begin
            if(ope==1)
                begin
                REGB<=REGB+REGA;
                end
            else if(ope==2)
                begin
                REGB<=REGB-REGA;
                end
            else if(ope==3)
                begin
                REGB<=REGA*REGB;
                end
            else
                begin
                REGB<=REGA;
                end
            ope<=1;count<=0;REGA<=0;
        end
    else if(sub)
        begin
            if(ope==1)
                begin
                REGB<=REGB+REGA;
                end
            else if(ope==2)
                begin
                REGB<=REGB-REGA;
                end
            else if(ope==3)
                begin
                REGB<=REGA*REGB;
                end
            else
                begin
                REGB<=REGA;
                end
            ope<=2;count<=0;REGA<=0;
        end
    else if(multi)
        begin
            if(ope==1)
                begin
                REGB<=REGB+REGA;
                end
            else if(ope==2)
                begin
                REGB<=REGB-REGA;
                end
            else if(ope==3)
                begin
                REGB<=REGA*REGB;
                end
            else
                begin
                REGB<=REGA;
                end
            ope<=3;count<=0;REGA<=0;
        end
    else if(equal)
        begin
            if(ope==1)
                begin
                REGB<=REGB+REGA;
                end
            else if(ope==2)
                begin
                REGB<=REGB-REGA;
                end
            else if(ope==3)
                begin
                REGB<=REGA*REGB;
                end
            ope<=0;count<=0;REGA<=0;
        end
    else if(CE)
        begin
            REGA<=0;count<=0;
        end
assign out = REGB;

endmodule

