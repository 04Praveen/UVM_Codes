class seq_item extends uvm_sequence_item;
	randc bit [3:0]a;
	randc bit [3:0]b;
	rand bit [1:0]sel;
	bit [4:0]result;

	`uvm_object_utils_begin(seq_item)

	`uvm_field_int(a,UVM_ALL_ON)
	`uvm_field_int(b,UVM_ALL_ON)
	`uvm_field_int(sel,UVM_ALL_ON)
	`uvm_field_int(result,UVM_ALL_ON)

	`uvm_object_utils_end

	function new(string name="seq_item");
		super.new(name);
	endfunction

endclass


