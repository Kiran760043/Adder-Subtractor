//////////////////////////////////////////////////////////////////////////////////
// Design: Test bench for Adder/Subtractor
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module test_add_sub();
    parameter N = 4;
// inputs to the DUT
    reg [N-1:0] A = 4'h0;
    reg [N-1:0]B = 4'h0;
    reg Sel = 0;
// outputs from the DUT
    wire [N-1:0]S;
    wire Co,Ov;

add_sub DUT ( .A(A), .B(B), .Sel(Sel), .S(S), .Co(Co), .Ov(Ov) );

initial
    begin
        $display($time, " << Simulation Results >>");
        $monitor($time, "A = %b, B = %b, Sel = %b, S = %b, Co = %b, Ov = %b", A, B, Sel, S, Co, Ov);
    end

initial
    begin
        forever begin
          if (A <= 4'b1111)
            begin
                if(B < 4'b1111)
                    begin
                        B  = B + 4'b0001;
                        Sel = 0;
                        #2;
                        Sel = 1;
                        #2;
                    end else begin
                        B = 4'b0000;
                        A = A + 4'b0001;
                    end
            end else begin
                $finish;
            end
         end
    end

endmodule
