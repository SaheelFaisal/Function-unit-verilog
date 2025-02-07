module function_unit (
    input [31:0] busA, busB,
    input [4:0] FS,
    output V, C, N, Z,
    output reg [31:0] F
);

    // Wires
    wire [31:0] G;
    wire [31:0] H;

    // Instantiate the ALU and the Shifter
    alu alu_inst(.A(busA), .B(busB), .Gselect(FS[3:0]), .G(G), .V(V), .C(C), .N(N), .Z(Z));
    shifter shifter_inst(.B(busB), .Hselect(FS[3:2]), .H(H));

    always @(*) begin
        case (FS[4])
            0: F = G;
            1: F = H; 
        endcase
    end
    
endmodule