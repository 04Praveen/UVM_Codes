class driver extends uvm_driver#(seq_item);
	`uvm_component_utils(driver)
	seq_item s2;
	virtual intf vif;

	function new(string name="driver",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual intf)::get(this,"","vif",vif))
			`uvm_fatal("DRV","interface not found in config_db")
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		forever begin
		//	@(posedge vif.clk);
			seq_item_port.get_next_item(s2);
			@(posedge vif.clk);
			vif.a <= s2.a;
			vif.b <= s2.b;
			vif.sel <= s2.sel;
			seq_item_port.item_done();
		end
	endtask
endclass
