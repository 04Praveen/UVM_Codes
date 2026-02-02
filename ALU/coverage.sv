class cov extends uvm_subscriber#(seq_item);
	`uvm_component_utils(cov)
	seq_item tr5;
	covergroup cg;
		cg_a: coverpoint tr5.a{
			bins low_range={[0:5]};
			bins mid_range={[6:10]};
			bins high_range={[11:15]};
			}
		cg_b: coverpoint tr5.b{
			bins low_range={[0:5]};
			bins mid_range={[6:10]};
			bins high_range={[11:15]};
			}
		cg_sel : coverpoint tr5.sel;

		cg_result: coverpoint tr5.result;
	endgroup

	function new(string name="cov",uvm_component parent);
		super.new(name,parent);
		cg = new();
	endfunction

	function void write(seq_item t);
		tr5=t;
		cg.sample();
	endfunction

	function void report_phase(uvm_phase phase);
		super.report_phase(phase);
		`uvm_info(get_type_name,$sformatf("cg=%0.02f%%",cg.get_coverage),UVM_LOW)
	endfunction

endclass
