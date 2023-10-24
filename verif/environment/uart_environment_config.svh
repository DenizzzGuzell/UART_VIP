class uart_environment_config extends uvm_object;

	localparam string s_my_config_id = "uart_environment_config";

	`uvm_object_utils(uart_environment_config)

	uart_agent_config_rx m_cfge_rx;
	uart_agent_config_tx m_cfge_tx;

	extern function new(string name = "uart_environment_config");

	extern static function uart_environment_config get_config(uvm_component c);

endclass: uart_environment_config

function uart_environment_config::new(string name = "uart_environment_config");
	super.new(name);
endfunction: new

function uart_environment_config uart_environment_config::get_config(uvm_component c);
	uart_environment_config t;

	if(!uvm_config_db #(uart_environment_config)::get(c, "", s_my_config_id, t))
		`uvm_fatal("CONFIG_LOAD", $sformatf("Cannot get() configuration %s from uvm_config_db. Have you set() it?", s_my_config_id))

	return t;
endfunction: get_config
