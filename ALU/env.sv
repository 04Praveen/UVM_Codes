class env extends uvm_env;
	`uvm_component_utils(env)

	agent a1;
	scoreboard sb1;
	cov c1;

	function new(string name="env",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a1 = agent::type_id::create("a1",this);
		sb1 = scoreboard::type_id::create("sb1",this);
		c1 = cov::type_id::create("c1",this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		a1.m1.ap.connect(sb1.ai);
		a1.m1.ap.connect(c1.analysis_export);
	endfunction
endclass
