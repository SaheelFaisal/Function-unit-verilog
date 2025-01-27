module arithmetic_unit (
    input [31:0] A, B,
    input S1, S0, Cin,
    output [31:0] G,
    output Cout
);
    wire [31:0] Y;

    assign Y = (B & {32{S0}}) | (~B & {32{S1}});

    assign {Cout, G} = A + Y + Cin;
endmodule