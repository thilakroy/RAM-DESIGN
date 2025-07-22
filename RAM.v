
module SyncRAM (
    input clk,
    input we,                  // Write Enable
    input [2:0] addr,          // 3-bit address for 8 locations
    input [7:0] din,           // Data input
    output reg [7:0] dout      // Data output
);

reg [7:0] mem [0:7];           // 8x8 RAM

always @(posedge clk) begin
    if (we)
        mem[addr] <= din;      // Write data
    else
        dout <= mem[addr];     // Read data
end

endmodule