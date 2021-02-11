module TB();

  ////////////////////////    Clock reg       ////////////////////////
  reg CLOCK_50 = 1'b0;
  reg rst;
  reg en_forwarding;


  ARM_Module ARM(CLOCK_50,rst,en_forwarding);

  initial repeat(1500) #100 CLOCK_50 = ~CLOCK_50;

  initial begin
    rst = 1'b1;
    en_forwarding = 1'b0;
    #500
    rst = 1'b0;
  end

endmodule
