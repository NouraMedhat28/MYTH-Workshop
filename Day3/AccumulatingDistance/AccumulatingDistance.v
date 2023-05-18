module AccumulatingDistance(
    input  wire        clk,
    input  wire        rst,
    input  wire [3:0]  a,
    input  wire [3:0]  b,
    input  wire        valid,
    output reg  [7:0]  total_distance
);

reg [4:0] c;
reg [8:0] squared_a, squared_b;
reg [9:0] squared_c;

always @(posedge clk or negedge rst) begin
if(!rst || !valid) begin
  total_distance <= 'b0;
  squared_a      <= 'b0;
  squared_b      <= 'b0;
  squared_c      <= 'b0;
  c              <= 'b0;
end
else if (valid) begin
  squared_a      <= a * a;
  squared_b      <= b * b;
  squared_c      <= squared_a + squared_b;
  c              <= $sqrt(squared_c); 
  total_distance <= total_distance + c;
end

end
endmodule