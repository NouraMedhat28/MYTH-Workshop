module Counter (

    input  wire         clk,
    input  wire         rst,
    output reg  [4:0]   out
);

//asynchronous reset
always @(posedge clk or negedge rst) begin
  if(!rst) begin
    out <= 'b0;
  end
  else begin
    out <= out + 1;
  end
end
endmodule