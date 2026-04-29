module shift_register(
    input clk,
    input reset,
    input [1:0] mode,
    input [3:0] data_in,
    output reg [3:0] data_out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        data_out <= 4'b0000;
    else begin
        case(mode)
            2'b00: data_out <= data_out;
            2'b01: data_out <= {data_out[2:0], 1'b0};
            2'b10: data_out <= {1'b0, data_out[3:1]};
            2'b11: data_out <= data_in;
        endcase
    end
end

endmodule
