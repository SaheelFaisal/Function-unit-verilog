module shifter (
    input [31:0] B,
    input [1:0] Hselect,
    output reg [31:0] H
);

    always @(*) begin
        case (Hselect)
            2'b00: H = B;
            2'b01: H = B << 1;
            2'b10: H = B >> 1; 
        endcase
    end
endmodule
