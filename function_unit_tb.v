`timescale 1ns / 1ps

module function_unit_tb;
    // Inputs
    reg [31:0] busA, busB;
    reg [4:0] FS;
    
    // Outputs
    wire V, C, N, Z;
    wire [31:0] F;

    // Instantiate the function_unit
    function_unit uut (
        .busA(busA),
        .busB(busB),
        .FS(FS),
        .V(V),
        .C(C),
        .N(N),
        .Z(Z),
        .F(F)
    );

    integer i;

    initial begin
        $dumpfile("function_unit.vcd");
        $dumpvars(0, function_unit_tb);

        // Initialize Inputs
        busA = 32'h5;
        busB = 32'h3;
        FS = 5'b0;

        // Wait for global reset to finish
        #10;
        
        $monitor("Time=%0t | FS=%b | A=%h | B=%h | F=%h | C=%b | V=%b | N=%b | Z=%b",
                  $time, FS, busA, busB, F, C, V, N, Z);

        // Begin testing
        // Arithemtic unit
        for (i = 0; i < 8; i = i + 1) begin
            FS = i;
            #10;
        end

        // Logic Unit
        for (i = 8; i < 16; i = i + 2) begin
            FS = i;
            #10;
        end

        // Shifter
        for (i = 16; i <=24; i = i + 4) begin   // 24 = 11000
            FS = i;
            #10;
        end

        // // Test ALU operations (FS[4] = 0, selects G)
        // FS = 5'b00000; #10;  // G = A (Transfer A)
        // FS = 5'b00001; #10;  // G = A + 1 (Increment A)
        // FS = 5'b00010; #10;  // G = A + B (Addition)
        // FS = 5'b00011; #10;  // G = A + B + 1 (Addition with carry)
        // FS = 5'b00100; #10;  // G = A + ~B (A plus 1's complement of B)
        // FS = 5'b00101; #10;  // G = A - B (Subtraction)
        // FS = 5'b00110; #10;  // G = A - 1 (Decrement A)
        // FS = 5'b00111; #10;  // G = A (Transfer A)

        // // Test Logic Unit operations
        // FS = 5'b01000; #10;  // G = A & B (AND)
        // FS = 5'b01001; #10;  // G = A | B (OR)
        // FS = 5'b01010; #10;  // G = A ^ B (XOR)
        // FS = 5'b01011; #10;  // G = ~A (NOT)

        // // Test Shifter operations (FS[4] = 1, selects H)
        // FS = 5'b10000; #10;  // H = B (No shift)
        // FS = 5'b10001; #10;  // H = B << 1 (Logical left shift)
        // FS = 5'b10010; #10;  // H = B >> 1 (Logical right shift)

        // Finish Simulation
        $finish;
    end

endmodule