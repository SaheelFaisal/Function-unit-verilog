`timescale 1ns / 1ps

module parallel_adder_tb;

    // Inputs
    reg [31:0] A;
    reg [31:0] Y;
    reg Cin;

    // Outputs
    wire [31:0] G;
    wire carry_bit;

    // Instantiate the parallel_adder module
    parallel_adder uut (
        .A(A),
        .Y(Y),
        .Cin(Cin),
        .G(G),
        .Cout(Cout)
    );

    // Testbench logic
    initial begin
        // Display results
        $display("Time\tA\t\tY\t\tCin\tG\t\tCout");
        $monitor("%0d\t%h\t%h\t%b\t%h\t%b", $time, A, Y, Cin, G, Cout);

        // Test case 1: Add zero + zero
        A = 32'h00000000;
        Y = 32'h00000000;
        Cin = 1'b0;
        #10;

        // Test case 2: Add with carry out
        A = 32'hFFFFFFFF;  // -1 in two's complement
        Y = 32'h00000001;  // 1 in two's complement
        Cin = 1'b0;
        #10;

        // Test case 3: Add with carry in
        A = 32'h7FFFFFFF;  // Largest positive value in 32-bit signed
        Y = 32'h00000001;
        Cin = 1'b1;
        #10;

        // Test case 4: Add with no carry
        A = 32'h00000001;
        Y = 32'h00000001;
        Cin = 1'b0;
        #10;

        // End simulation
        $finish;
    end
endmodule

