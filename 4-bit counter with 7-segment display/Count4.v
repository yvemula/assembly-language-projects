// 4-bit up/down counter module
module Count4(
    input clk,      // Clock input, triggers counting on the rising edge
    input rst,      // Reset input, when high, it resets the counter to zero
    input enable,   // Enable input, when high, allows the counter to count
    input upDown,   // Up/Down control input, determines count direction
    output reg [3:0] count // 4-bit output, holds the current count value
);

// The always block is triggered on the rising edge of the clock or reset
always @(posedge clk or posedge rst) begin//will always happen when this condition is met
    if (rst) begin
        count <= 4'b0000; // Reset the counter to zero when rst is high
    end else if (enable) begin // Check if the counter is enabled
        if (upDown) begin // If upDown is high, count up
            // Check for wrap-around: if count is at maximum (1111), reset to 0000
            if (count == 4'b1111)
                count <= 4'b0000;
            else
                count <= count + 1; // Increment the count
        end else begin // If upDown is low, count down
            // Check for wrap-around: if count is at minimum (0000), wrap to 1111
            if (count == 4'b0000)
                count <= 4'b1111;
            else
                count <= count - 1; // Decrement the count
        end
    end
    // When enable is 0, the counter does not change state
end

endmodule // End of Count4 module
