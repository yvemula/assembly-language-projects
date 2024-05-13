module PriorityEncode8(in, code,z);    // 8-bit priority encoder
   input [7:0] in;          // 8-bit inputs 
   output reg [2:0] code;   // indicates the index of the most significant bit that is a 1
   output reg z;            // indicates that all input bits are 0
     // outputs are not really registered, but Verilog syntax requires reg for an "if" assignment 
 

always @(*) begin
    if (in == 8'b00000000) begin
        code = 3'b000;
        z = 1'b1;
    end else begin
        z = 1'b0;
        casez (in)
            8'b1???????: code = 3'b111;
            8'b01??????: code = 3'b110;
            8'b001?????: code = 3'b101;
            8'b0001????: code = 3'b100;
            8'b00001???: code = 3'b011;
            8'b000001??: code = 3'b010;
            8'b0000001?: code = 3'b001;
            8'b00000001: code = 3'b000;
            default:     code = 3'b000; // Default case to handle unexpected inputs
        endcase
    end
end          
endmodule