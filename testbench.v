module testbench;

reg clk, reset;
reg [1:0] mode;
reg [3:0] data_in;
wire [3:0] data_out;

shift_register uut(clk, reset, mode, data_in, data_out);

always #5 clk = ~clk;

initial begin
    clk = 0; reset = 1;
    #10 reset = 0;

    mode = 2'b11; data_in = 4'b1010; // Load
    #10;

    mode = 2'b01; // Shift Left
    #20;

    mode = 2'b10; // Shift Right
    #20;

    mode = 2'b00; // Hold
    #10;

    $stop;
end

endmodule
