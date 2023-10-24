package uart_environment_pkg;

	import uvm_pkg::*;
	`include "uvm_macros.svh"
	
	import uart_agent_pkg_rx::*;
	import uart_agent_pkg_tx::*;
	import uart_seq_lib_pkg::*;

	`include "uart_environment_config.svh"
	`include "uart_scoreboard.svh"
	`include "uart_environment.svh"

endpackage
