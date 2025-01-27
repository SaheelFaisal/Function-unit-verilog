// Module Name: parallel_adder
// Author: Saheel Faisal
// Date: 2025-01-25


module parallel_adder(
    input [31:0] A,
    input [31:0] Y,
    input Cin,
    output [31:0] G,
    output Cout
    );

    assign {Cout, G} = A + Y + Cin;

endmodule
