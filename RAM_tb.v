module SyncRAM_tb;

reg clk;
reg we;
reg [2:0] addr;
reg [7:0] din;
wire [7:0] dout;

SyncRAM uut (.clk(clk), .we(we), .addr(addr), .din(din), .dout(dout));

// Clock Generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    we = 1; addr = 3'b010; din = 8'hA5; #10;  // Write 0xA5 to address 2
    we = 1; addr = 3'b011; din = 8'h3C; #10;  // Write 0x3C to address 3
    we = 0; addr = 3'b010; #10;              // Read from address 2
    we = 0; addr = 3'b011; #10;              // Read from address 3

    $finish;
end

endmodule
