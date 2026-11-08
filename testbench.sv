
`timescale 1ns/1ps

module testbench;
    reg clk;
    reg reset;

    wire [2:0] pc;
    wire [3:0] accumulator;
    wire [3:0] instruction;
    wire [3:0] alu_result;
    wire [1:0] opcode;

    processor DUT (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .accumulator(accumulator),
        .instruction(instruction),
        .alu_result(alu_result),
        .opcode(opcode)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("processor.vcd");
        $dumpvars(0, testbench);

        clk = 0;
        reset = 1;

        #12 reset = 0;
        #100;

        $display("Simulation completed successfully.");
        $finish;
    end
endmodule
