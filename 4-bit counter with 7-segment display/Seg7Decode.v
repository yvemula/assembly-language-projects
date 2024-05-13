module Seg7decode(       
    // Module to convert active-high 4-bit hexadecimal input to 7-segment display code.
    // The output is active low, suitable for common anode 7-segment LED displays.
    input [3:0] bin,      // 4-bit binary input representing a hexadecimal digit
    output reg [6:0] seg7 // 7-bit output for the LED segments (active low)
);

always @(bin)
begin
    case(bin)
        // Each case translates the 4-bit input to a 7-bit 7-segment display code.
        // The bit order for the segments is ABCDEFG.
        // A low bit (0) turns on a segment, and a high bit (1) turns it off in a common anode display.
        4'b0000: seg7 = 7'b0000001; // Display "0"
        4'b0001: seg7 = 7'b1001111; // Display "1"
        4'b0010: seg7 = 7'b0010010; // Display "2"
        4'b0011: seg7 = 7'b0000110; // Display "3"
        4'b0100: seg7 = 7'b1001100; // Display "4"
        4'b0101: seg7 = 7'b0100100; // Display "5"
        4'b0110: seg7 = 7'b0100000; // Display "6"
        4'b0111: seg7 = 7'b0001111; // Display "7"
        4'b1000: seg7 = 7'b0000000; // Display "8"
        4'b1001: seg7 = 7'b0000100; // Display "9"
        4'b1010: seg7 = 7'b0001000; // Display "A"
        4'b1011: seg7 = 7'b1100000; // Display "b"
        4'b1100: seg7 = 7'b0110001; // Display "C"
        4'b1101: seg7 = 7'b1000010; // Display "d"
        4'b1110: seg7 = 7'b0110000; // Display "E"
        4'b1111: seg7 = 7'b0111000; // Display "F"
        
        // The default case handles any undefined input.
        default: seg7 = 7'b1111111; // Turn off all segments (should not occur in normal operation)
    endcase
end
endmodule
