module blinky (
  input  clk,
  output led1,
  output led2,
);
  reg [26:0] counter = 0;

  always @(posedge clk) begin
    counter <= counter + 1;
  end

  assign {led1, led2} = counter[26:25];
endmodule
