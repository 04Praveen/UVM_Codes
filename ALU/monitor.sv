class monitor extends uvm_monitor;
	uvm_analysis_port#(seq_item)ap;
	virtual intf vif;

	`uvm_component_utils(monitor)

	function new(string name="monitor",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ap = new("ap",this);
		if(!uvm_config_db#(virtual intf)::get(this,"","vif",vif))
			`uvm_fatal("monitor","vif not found");
	endfunction

	task run_phase(uvm_phase phase);
		seq_item tr3;
		forever  begin
			@(posedge vif.clk);

			tr3 = seq_item::type_id::create("tr3");
			tr3.a = vif.a;
			tr3.b = vif.b;
			tr3.sel = vif.sel;
		//	@(posedge vif.clk);
			tr3.result = vif.result;
			ap.write(tr3);

			`uvm_info("monitor",$sformatf("a=%0b,b=%0b,sel=%0b,result=%0b",tr3.a,tr3.b,tr3.sel,tr3.result),UVM_LOW);
		end
	endtask

endclass
