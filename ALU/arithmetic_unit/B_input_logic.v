// Module Name: B_input_logic
// Author: Saheel Faisal
// Date: 2025-01-25

module B_input_logic(
    input [31:0] B,
    input S0,
    input S1,
    output [31:0] Y
    );

    assign Y = (B & {32{S0}}) | (~B & {32{S1}});

endmodule
