class test extends uvm_test;
	`uvm_component_utils(test)

	env e1;
	seq sq1;

	function new(string name="test",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		e1 = env::type_id::create("e1",this);
		sq1 = seq::type_id::create("sq1");
	endfunction

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		sq1.start(e1.a1.sr1);
		#10;
		phase.drop_objection(this);
	endtask
endclass
