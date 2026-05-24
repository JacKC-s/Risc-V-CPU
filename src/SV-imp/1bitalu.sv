module ALU_1bit (
    // ports
    input logic A,
    input logic B,
    input logic Binvert,
    input logic CarryIn,
    input logic [1:0] OpCode,

    output logic result,
    output logic C_out
);

    logic Bfin;
    logic logical_and;
    logic logical_or;
    logic logical_xor;
    logic sum_wire;
    // Logic
    assign Bfin = B ^ Binvert;
    assign logical_and = A & Bfin;
    assign logical_or = A | Bfin;
    assign logical_xor = A ^ Bfin;

    // Adder
    assign {C_out, sum_wire} = A + Bfin + CarryIn;

    // Multiplexer
    always_comb begin

        case(OpCode)
            2'b00: result = logical_and;
            2'b01: result = logical_or;
            2'b10: result = logical_xor;
            2'b11: result = sum_wire; 
            default: result = 1'b0;
        endcase
    end

    
endmodule