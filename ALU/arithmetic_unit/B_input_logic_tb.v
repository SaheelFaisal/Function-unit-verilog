`timescale 1ns / 1ps

module B_input_logic_tb;

    // Inputs
    reg [31:0] B;
    reg S0;
    reg S1;

    // Outputs
    wire [31:0] Y;

    // Instantiate the Unit Under Test (UUT)
    B_input_logic uut(
        .B(B),
        .S0(S0),
        .S1(S1),
        .Y(Y)
    );

    integer i;

    initial begin
        // Initialize Inputs
        B = 0;
        S0 = 0;
        S1 = 0;

        // Wait 100 ns for global reset to finish
        #100;

        #10 B = 32'hFFFFFFFF; S0 = 1; S1 = 0;  // Test case 1: S0=1, S1=0
        #10 B = 32'h00000000; S0 = 0; S1 = 1;  // Test case 2: S0=0, S1=1
        #10 B = 32'h55555555; S0 = 1; S1 = 0;  // Test case 3: S0=1, S1=0
        #10 B = 32'hAAAA5555; S0 = 0; S1 = 1;  // Test case 4: S0=0, S1=1
        #10 B = 32'h12345678; S0 = 1; S1 = 0;  // Test case 5: S0=1, S1=0
        #10 B = 32'h87654321; S0 = 0; S1 = 1;  // Test case 6: S0=0, S1=1
        #10 B = 32'hFFFFFFFF; S0 = 0; S1 = 0;  // Test case 7: S0=0, S1=0
        #10 B = 32'h00000000; S0 = 1; S1 = 1;  // Test case 8: S0=1, S1=1
        #10 $finish;  // End simulation

    end

    // Monitor output for debugging
    initial begin
        $monitor("Time = %0t, B = %h, S0 = %b, S1 = %b, Y = %h", $time, B, S0, S1, Y);
    end


endmodule
