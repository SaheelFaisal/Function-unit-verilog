`timescale 1ns/1ps

module shifter_tb;
    reg [31:0] B;
    reg [1:0] Hselect;
    wire [31:0] H;

    shifter uut (.B(B), .Hselect(Hselect), .H(H));

    initial begin
        $dumpfile("shifter.vcd");
        $dumpvars(0, shifter_tb);
        // Initialize inputs
        B = 0;
        Hselect = 0;

        // Wait for global reset
        #10;
        
        B = 32'h80000000;
        
        Hselect = 2'b00; #10;
        Hselect = 2'b01; #10;
        Hselect = 2'b10; #10;
        
        $finish;
    end
endmodule
