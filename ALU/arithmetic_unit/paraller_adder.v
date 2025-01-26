// Module Name: paraller_adder
// Author: Saheel Faisal
// Date: 2025-01-25


module paraller_adder(
    input [31:0] A,
    input [31:0] Y,
    input Cin,
    output [31:0] G
    );

    assign G = A + Y + Cin;

endmodule
