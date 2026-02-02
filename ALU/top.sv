`include "uvm_macros.svh"
import uvm_pkg::*;

`include "design.sv"
`include "seq_item.sv"
`include "seq.sv"
`include "interface.sv"
`include "seqr.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "coverage.sv"
`include "env.sv"
`include "test.sv"

module top;
logic clk;
intf vif(clk);

always #5 clk = ~clk;

initial begin
	clk=0;
end
initial begin
	uvm_config_db#(virtual intf)::set(null,"*","vif",vif);
end
alu aa(.a(vif.a),.b(vif.b),.sel(vif.sel),.result(vif.result));

initial begin
	run_test("test");
end
endmodule

