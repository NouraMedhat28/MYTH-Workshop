module PipelineLab(
    input  wire clk,
    input  wire rst,
    input  wire bad_input,
    input  wire illegal_op,
    input  wire over_flow,
    input  wire div_by_zero,
    output reg  err1,
    output reg  err2,
    output reg  err3
);

reg err1int, err2int, err22int;
always @(posedge clk or negedge rst) begin
if(!rst) begin
  err1     <= 1'b0;
  err2     <= 1'b0;
  err3     <= 1'b0;
  err1int  <= 1'b0;
  err2int  <= 1'b0;
  err22int <= 1'b0;
end
else begin
  err1     <= bad_input || illegal_op;
  err1int  <= err1;
  err2     <= err1int || over_flow;
  err2int  <= err2;
  err22int <= err2int;
  err3     <= div_by_zero || err22int;
end
  
end

endmodule