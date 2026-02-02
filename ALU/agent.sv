class agent extends uvm_agent;
	`uvm_component_utils(agent)

	seqr sr1;
	driver d1;
	monitor m1;

	function new(string name="agent",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(is_active == UVM_ACTIVE) begin
		sr1 = seqr::type_id::create("sr1",this);
		d1 = driver::type_id::create("d1",this);
	end
		m1 = monitor::type_id::create("m1",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		if(is_active == UVM_ACTIVE)
		d1.seq_item_port.connect(sr1.seq_item_export);
	endfunction
endclass
