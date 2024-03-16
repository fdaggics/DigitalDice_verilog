`default_nettype none `timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg trigger;
  reg twty_mode;
  wire D4;
  wire D5;
  wire D6;
  wire D7;
  wire D8;

  // Replace tt_um_example with your module name:
  tt_um_example user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .trigger(trigger),
      .twty_mode(twty_mode),
      .D4(D4),
      .D5(D5),
      .D6(D6),
      .D7(D7),
      .D8(D8)
  );

endmodule
