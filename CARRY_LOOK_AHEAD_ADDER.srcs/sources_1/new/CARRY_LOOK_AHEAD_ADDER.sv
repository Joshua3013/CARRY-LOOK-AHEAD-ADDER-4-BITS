`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2024 23:49:29
// Design Name: 
// Module Name: CARRY_LOOK_AHEAD_ADDER
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
//A0 SW0, A1 SW1, A2 SW2, A3 SW3
//B0 SW4, B1 SW5, B2 SW6, B3 SW7
//Cin SW8
//S0 LED0, S1 LED1, S2 LED2, S3 LED3
//Cout LED4

module CARRY_LOOK_AHEAD_ADDER(
    input logic [8:0]sw,
    output logic [4:0]LED
    );
    logic p0,p1,p2,p3,p4,p5,p6,p7,p8,p9;
    logic p10,p11,p12,p13,p14,p15,p16,p17,p18,p19;
    logic p20,p21,p22,p23,p24,p25,p26,p27,p28,p29;
    //1
    assign p0=sw[0] ^ sw[4];
    //2
    assign p1=sw[1] ^ sw[5];
    //3
    assign p2=sw[2] ^ sw[6];
    //4
    assign p3=sw[3] ^ sw[7];
    //G0
    assign p4=sw[0] & sw[4];
    //G1
    assign p5=sw[1] & sw[5];
    //G2
    assign p6=sw[2] & sw[6];
    //G3
    assign p7=sw[3] & sw[7];
    //5 s0
    assign LED[0]=sw[8] ^ p0;
    //P0
    assign p9=sw[8] & p0;
    //9
    assign p10=p9 & sw[8];
    //C0
    assign p11=p4 | p10;
    //6 s1
    assign LED[1]=p11 ^ p1;
    //P1
    assign p13=p11 & p1;
    //10
    assign p14=p13 & p9 & sw[8];
    //11
    assign p15=p13 & p4;
    //C1
    assign p16=p5 | p10 | p11;
    //7 s2
    assign LED[2]=p2 ^ p16;
    //P2
    assign p18=p2 & p16;
    //12
    assign p19=p18 & p5;
    //13
    assign p20=p18 & p13 & p4;
    //14
    assign p21=p13 & p9 & p18 & sw[8];
    //C2
    assign p22=p6 | p19 | p20 | p21;
    //8 s3
    assign LED[3]=p3 ^ p22;
    //P3
    assign p24=p3 & p22;
    //15
    assign p25=p24 & p6;
    //16
    assign p26=p24 & p18 & p5;
    //17
    assign p27=p24 & p18 & p13 & p4;
    //18
    assign p28=p24 & p18 & p13 & p9 & sw[8];
    //C3
    assign LED[4]=p7 | p25 | p26 | p27 | p28;
    
endmodule
