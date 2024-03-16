/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_example(
  input clk,
  input trigger,
  input twty_mode,
  output reg D4,
  output reg D5,
  output reg D6,
  output reg D7,
  output reg D8
);

reg [10:0] lfsr_reg = 11'd18; //seed
reg [4:0] dice_value = 5'b0;


always @(posedge trigger) begin
  lfsr_reg <= {lfsr_reg[9:0], lfsr_reg[10] ^ lfsr_reg[1]};
  if(!twty_mode) begin
    dice_value <= (lfsr_reg[2:0] % 6) + 1;
  end
  if(twty_mode) begin
    dice_value <= (lfsr_reg[4:0] % 20) + 1;  
  end
end

always @* begin
  D4 = dice_value[0];
  D5 = dice_value[1];
  D6 = dice_value[2];
  if(twty_mode) begin
    D7 = dice_value[3];
    D8 = dice_value[4];
  end
end

endmodule

