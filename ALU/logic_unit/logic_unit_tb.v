module logic_unit_tb;
    // Inputs
    reg [31:0] A, B;
    reg S1, S0;

    // Outputs
    wire [31:0] G;

    // Instantiate the Unit Under Test (UUT)
    logic_unit uut(
        .A(A),
        .B(B),
        .S1(S1),
        .S0(S0),
        .G(G)
    );

    initial begin
        // Initialize inputs
        A = 32'b0;
        B = 32'b0;
        S1 = 0;
        S0 = 0;

        // Wait for global reset to finish
        #10

        // Apply test cases
        #10 A = 32'hA5A5A5A5; B = 32'h5A5A5A5A; S1 = 0; S0 = 0; // AND
        #10 A = 32'hA5A5A5A5; B = 32'h5A5A5A5A; S1 = 0; S0 = 1; // OR
        #10 A = 32'hA5A5A5A5; B = 32'h5A5A5A5A; S1 = 1; S0 = 0; // XOR
        #10 A = 32'hA5A5A5A5; S1 = 1; S0 = 1; // NOT

        // Finish simulation
        #10 $finish;
    end

    // Monitor the values of the signals
    initial begin
        $monitor("Time = %0t | A = %h | B = %h | S1 = %b | S0 = %b | G = %h", 
                 $time, A, B, S1, S0, G);
    end

endmodule