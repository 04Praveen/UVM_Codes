class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard)

	uvm_analysis_imp#(seq_item,scoreboard) ai;

	function new(string name="scoreboard",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ai = new("ai",this);
	endfunction

	function void write(seq_item tr4);
		bit [4:0]exp_result;
		
		case(tr4.sel)
			2'b00:exp_result=tr4.a+tr4.b;
			2'b01:exp_result=tr4.a-tr4.b;
			2'b10:exp_result=tr4.a&tr4.b;
			2'b11:exp_result=tr4.a|tr4.b;
			default: exp_result=0;
		endcase

		if(exp_result==tr4.result)begin
			`uvm_info("Pass",$sformatf("a=%0b,b=%0b,sel=%0b,result=%0b",tr4.a,tr4.b,tr4.sel,tr4.result),UVM_LOW)
		end
		else 
			`uvm_error("Fail",$sformatf("a=%0b,b=%0b,sel=%0b,result=%0b,exp_result=%0b",tr4.a,tr4.b,tr4.sel,tr4.result,exp_result))
	endfunction
endclass
