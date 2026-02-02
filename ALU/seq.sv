class seq extends uvm_sequence#(seq_item);

	`uvm_object_utils(seq)

	function new(string name = "seq");
		super.new(name);
	endfunction

	task body();
		seq_item s1;
		repeat (200) begin
			s1 = seq_item::type_id::create("s1");
			start_item(s1);
			s1.randomize();
			finish_item(s1);
		end
	endtask
endclass
