module FibonacciSeries (

    input  wire         clk,
    input  wire         rst,
    output reg  [4:0]   out
);

//Intermediate signals
reg [4:0] outInt;

//asynchronous reset
always @(posedge clk or negedge rst) begin
  if(!rst || out == 'd13) begin
    out    <= 'b1;
    outInt <= 'b0;
  end
  else begin
    outInt <= out;
    out <= out + outInt;
  end
end

endmodule