`timescale 1ns/1ps

module arithmetic_unit_tb;
    // Inputs
    reg [31:0] A, B;
    reg S1, S0, Cin;

    // Outputs
    wire [31:0] G;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    arithmetic_unit uut (
        .A(A),
        .B(B),
        .S1(S1),
        .S0(S0),
        .Cin(Cin),
        .G(G),
        .Cout(Cout)
    );

    initial begin
        // Initialize inputs
        A = 32'h00000000;
        B = 32'h00000000;
        S1 = 0;
        S0 = 0;
        Cin = 0;

        // Wait for global reset
        #10;

        // Test case 1: G = A (transfer), S1 = 0, S0 = 0, Cin = 0
        A = 32'h00000010;
        B = 32'h00000001; // Doesn't matter for this case
        S1 = 0; 
        S0 = 0; 
        Cin = 0;
        #10;
        $display("Test Case 1: A = %h, B = %h, S1 = %b, S0 = %b, Cin = %b -> G = %h, Cout = %b", A, B, S1, S0, Cin, G, Cout);

        // Test case 2: G = A + 1 (increment), S1 = 0, S0 = 0, Cin = 1
        A = 32'h00000010;
        B = 32'h00000001; // Doesn't matter for this case
        S1 = 0; 
        S0 = 0; 
        Cin = 1;
        #10;
        $display("Test Case 2: A = %h, B = %h, S1 = %b, S0 = %b, Cin = %b -> G = %h, Cout = %b", A, B, S1, S0, Cin, G, Cout);

        // Test case 3: G = A + B (add), S1 = 0, S0 = 1, Cin = 0
        A = 32'h00000010;
        B = 32'h00000005;
        S1 = 0; 
        S0 = 1; 
        Cin = 0;
        #10;
        $display("Test Case 3: A = %h, B = %h, S1 = %b, S0 = %b, Cin = %b -> G = %h, Cout = %b", A, B, S1, S0, Cin, G, Cout);

        // Test case 4: G = A + B + 1, S1 = 0, S0 = 1, Cin = 1
        A = 32'h00000010;
        B = 32'h00000005;
        S1 = 0; 
        S0 = 1; 
        Cin = 1;
        #10;
        $display("Test Case 4: A = %h, B = %h, S1 = %b, S0 = %b, Cin = %b -> G = %h, Cout = %b", A, B, S1, S0, Cin, G, Cout);

        // Test case 5: G = A + ~B (subtract), S1 = 1, S0 = 0, Cin = 0
        A = 32'h00000010;
        B = 32'h00000003;
        S1 = 1; 
        S0 = 0; 
        Cin = 0;
        #10;
        $display("Test Case 5: A = %h, B = %h, S1 = %b, S0 = %b, Cin = %b -> G = %h, Cout = %b", A, B, S1, S0, Cin, G, Cout);

        // Test case 6: G = A + ~B + 1, S1 = 1, S0 = 0, Cin = 1
        A = 32'h00000010;
        B = 32'h00000003;
        S1 = 1; 
        S0 = 0; 
        Cin = 1;
        #10;
        $display("Test Case 6: A = %h, B = %h, S1 = %b, S0 = %b, Cin = %b -> G = %h, Cout = %b", A, B, S1, S0, Cin, G, Cout);

        // Test case 7: G = A - 1 (decrement), S1 = 1, S0 = 1, Cin = 0
        A = 32'h00000010;
        B = 32'h00000000; // Doesn't matter for this case
        S1 = 1; 
        S0 = 1; 
        Cin = 0;
        #10;
        $display("Test Case 7: A = %h, B = %h, S1 = %b, S0 = %b, Cin = %b -> G = %h, Cout = %b", A, B, S1, S0, Cin, G, Cout);

        // Test case 8: G = A (transfer), S1 = 1, S0 = 1, Cin = 1
        A = 32'h00000010;
        B = 32'h00000000; // Doesn't matter for this case
        S1 = 1; 
        S0 = 1; 
        Cin = 1;
        #10;
        $display("Test Case 8: A = %h, B = %h, S1 = %b, S0 = %b, Cin = %b -> G = %h, Cout = %b", A, B, S1, S0, Cin, G, Cout);

        
        // Finish simulation
        $finish;
    end
endmodule
