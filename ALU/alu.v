module alu (
    input [31:0] A, B,
    input [3:0] Gselect,
    output reg [31:0] G,
    output Z, N,
    output reg C, V
);

    // Variables
    reg [31:0] Y;
    wire S2, S1, S0, Cin;

    assign {S2, S1, S0, Cin} = Gselect;

    assign Z = ~|G;
    assign N = G[31];


    always @(*) begin
        case (S2)
            1'b0: // Arithmetic unit
            begin
                Y = (B & {32{S0}}) | (~B & {32{S1}}); // Input Logic
                {C, G} = A + Y + Cin; // Parallel adder

                // Finding the Overflow (V) bit
                V = (A[31] == Y[31]) && (A[31] != G[31]);
            end
            1'b1: // Logic Unit
            begin
                case ({S1, S0})
                    2'b00: G = A & B;
                    2'b01: G = A | B;
                    2'b10: G = A ^ B;
                    2'b11: G = ~A;
                endcase
            end
        endcase
    end 
endmodule