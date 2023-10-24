package uart_seq_lib_pkg;

	import uvm_pkg::*;
	`include "uvm_macros.svh"

	import uart_agent_pkg_rx::*;
	import uart_agent_pkg_tx::*;

	`include "uart_reset_seq_rx.svh"
	`include "uart_reset_seq_tx.svh"
	`include "uart_rx_seq.svh"
	`include "uart_tx_seq.svh"

endpackage: uart_seq_lib_pkg