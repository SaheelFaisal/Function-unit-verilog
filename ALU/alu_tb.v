`timescale 1ns / 1ps

module alu_tb;
    // Inputs
    reg [31:0] A, B;
    reg [3:0] Gselect;

    // Outputs
    wire [31:0] G;
    wire Z, N;
    wire C, V;

    // Instantiate the ALU module
    alu uut (
        .A(A), .B(B),
        .Gselect(Gselect),
        .G(G), .Z(Z), .N(N), .C(C), .V(V)
    );

    integer i;

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        // Initialize inputs
        A = 32'h5A5A5A5A;  // Sample hex values
        B = 32'hA5A5A5A5;
        Gselect = 4'b0000;

        // Wait for global reset to finish
        #10;
        
        // Testing
        for (i = 0; i < 16; i = i + 1) begin
            Gselect = i;
            #10;
            $display("S2=%b S1=%b S0=%b Cin=%b | A=%h B=%h | G=%h C=%b V=%b Z=%b N=%b", 
                     uut.S2, uut.S1, uut.S0, uut.Cin, A, B, G, C, V, Z, N);
        end

        $finish;
    end
endmodule
