class uart_virtual_sequencer extends uvm_sequencer;
	
	`uvm_component_utils (uart_virtual_sequencer)

	function new (string name = "uart_virtual_sequencer", uvm_component parent);
		super.new (name, parent);
	endfunction

	uart_sequencer_rx	rx_seqr;
	uart_sequencer_tx	tx_seqr;

endclass : uart_virtual_sequencer