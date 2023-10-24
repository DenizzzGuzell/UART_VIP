class rx_tx_virt_sequences extends uvm_sequence;
	`uvm_object_utils (rx_tx_virt_sequences)
	`uvm_declare_p_sequencer (uart_virtual_sequencer)

	function new (string name = "rx_tx_virt_sequences");
		super.new (name);
	endfunction : new

	uart_reset_seq_rx	reset_seq_rx;
	uart_reset_seq_tx 	reset_seq_tx;
	uart_rx_seq			rx_seq;
	uart_tx_seq			tx_seq;
	uart_virtual_sequencer virt_seqr;

	task pre_body();
		reset_seq_rx = uart_reset_seq_rx::type_id::create ("reset_seq_rx");
		reset_seq_tx = uart_reset_seq_tx::type_id::create ("reset_seq_tx");
		rx_seq 		 = uart_rx_seq::type_id::create ("rx_seq");
		tx_seq 		 = uart_tx_seq::type_id::create ("tx_seq");
	endtask : pre_body

	task body();
		fork 
			reset_seq_rx.start (virt_seqr.uart_sequencer_rx);
			reset_seq_tx.start (virt_seqr.uart_sequencer_tx);
		join
		fork
			rx_seq.start (virt_seqr.uart_sequencer_rx);
			tx_seq.start (virt_seqr.uart_sequencer_tx);
		join
	endtask : body