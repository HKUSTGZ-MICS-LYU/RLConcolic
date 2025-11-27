module b01 (
  input clock,
  input reset,
  input [2:0] in,
  output reg out
);

reg [7:0] a;
reg [7:0] b;
reg [1:0] state;

always @(posedge clock) begin
  if (reset) begin
    a <= 0;
    b <= 0;
    out <= 0;
    state <= 0;
  end else begin
    // 增加 'a' 的路径 / Path to increment 'a'
    if (in == 0) a <= a + 1;

    // 增加 'b' 的路径, 但有一个陷阱
    // Path to increment 'b', but with a trap
    if (a < 4) begin // << TRAP!
      case (state)
        0: if (in == 1) state <= 1;
        1: if (in == 2) begin
             b <= b + 1;
             state <= 0;
           end
      endcase
    end
    
    // 目标分支 / Target branch
    if (a > 5 && b > 6) begin
      out <= 1; // << TARGET
    end
  end
end

endmodule