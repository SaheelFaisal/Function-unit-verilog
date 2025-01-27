module logic_unit (
    input [31:0] A, B,
    input S1, S0,
    output reg [31:0] G
);

    wire [1:0] S = {S1, S0};
    always @(*) begin
       case (S)
        2'b00: G = A & B;
        2'b01: G = A | B;
        2'b10: G = A ^ B;
        2'b11: G = ~A;
       endcase
    end
    
endmodule