//////////////////////////////////////////////////////////////////////////////////
// Design: Adder/Subtractor
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module add_sub(A,B,Sel,S,Co,Ov);
    parameter N = 4;
    input  wire [N-1:0] A;
    input  wire [N-1:0] B;
    input  wire Sel;
    output wire [3:0] S;
    output wire Co;
    output wire Ov;

    wire [N-1:0] bs;
    wire [N:0] C;

    assign bs = (Sel) ? ~B : B; //B xor 0 = B and B xor 1 = Not(B)

    assign C[0]= Sel;

    genvar i;
    generate
       for (i=0; i < N; i=i+1)
        begin : Build_adders
           full_adder COMP(.A(A[i]), .B(bs[i]), .Ci(C[i]), .S(S[i]), .Co(C[i+1]));
        end
     endgenerate

     assign Co = C[N];
     assign Ov = C[N] ^ C[N-1];

endmodule
