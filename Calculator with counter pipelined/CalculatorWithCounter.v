module CalculatorWithCounter(
    input  wire       clk,
    input  wire       rst,
    input  wire [3:0] val2,
    input  wire [1:0] op,
    output reg  [8:0] out,
    output reg  [8:0] counter
);

reg [3:0] val1;

always @(posedge clk or negedge rst) begin
  if(!rst) begin
    out     <= 9'b0;
    counter <= 9'b0;
    val1    <= 1'b0;
  end

  else begin
    val1    <= out;
    counter <= counter + 1;
    case (op) 
    00 : begin
      out <= val1 + val2;
    end
    01 : begin
      out <= val1 - val2;
    end
    10 : begin
      out <= val1 * val2;
    end
    11 : begin
      out <= val1 / val2;
    end 
    default : begin
      out <= 9'b0;
    end
    endcase
  end
end

endmodule