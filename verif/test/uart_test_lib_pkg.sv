package uart_test_lib_pkg;

	import uvm_pkg::*;
	`include "uvm_macros.svh"

	import uart_agent_pkg_rx::*;
	import uart_agent_pkg_tx::*;
	import uart_seq_lib_pkg::*;
	import uart_environment_pkg::*;

	`include "uart_base_test.svh"
	`include "uart_reset_test.svh"
	`include "uart_rx_test.svh"
	`include "uart_tx_test.svh"
	`include "uart_rx_tx_test.svh"

endpackage: uart_test_lib_pkg