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
        
        $monitor("Hselect=%b | B=%b | H=%b", Hselect, B, H);
        B = 32'h80000000; // -2147483648 (Signed)
        
        Hselect = 2'b00; #10;
        Hselect = 2'b01; #10;
        Hselect = 2'b10; #10;
        
        $finish;
    end
endmodule
