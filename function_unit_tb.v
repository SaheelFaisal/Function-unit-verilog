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

        // Finish Simulation
        $finish;
    end

endmodule