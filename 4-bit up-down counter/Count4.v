// 4-bit up/down counter
module Count4(
    input clk, 
    input rst, 
    input enable, 
    input upDown, 
    output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0000; // Reset the counter
    end else if (enable) begin
        if (upDown) begin
            // Count up
            if (count == 4'b1111) // Check for wrap-around
                count <= 4'b0000;
            else
                count <= count + 1;
        end else begin
            // Count down
            if (count == 4'b0000) // Check for wrap-around
                count <= 4'b1111;
            else
                count <= count - 1;
        end
    end
    // When enable is 0, do nothing
end

endmodule // Count4
