class uart_base_test extends uvm_test;
  `uvm_component_utils (uart_base_test)

function new (string name, uvm_component parent = null);
  super.new(name, parent);
endfunction

  uart_environment        m_top_env;
  uart_environment_config m_env_cfg;
  uart_agent_config_rx    m_cfge_rx;
  uart_agent_config_tx    m_cfge_tx;

function void build_phase (uvm_phase phase);
  super.build_phase (phase);
  `uvm_info(get_type_name(), "build_phase", UVM_LOW)

  m_top_env = uart_environment::type_id::create ("m_top_env", this);
  m_env_cfg = uart_environment_config::type_id::create("m_env_cfg");

  m_cfge_rx    = uart_agent_config_rx::type_id::create("m_cfge_rx");
  m_cfge_tx    = uart_agent_config_tx::type_id::create("m_cfge_tx");

  configuration_rx(m_cfge_rx);
  configuration_tx(m_cfge_tx);

  if(!uvm_config_db #(virtual uart_driver_BFM_rx)::get(this, "", "rx_drv_bfm", m_cfge_rx.rx_drv_bfm))
	`uvm_fatal("VIF CONFIG", "Cannot get() BFM interface RX drv_bfm from uvm_config_db. Have you set() it?")
  if(!uvm_config_db #(virtual uart_monitor_BFM_rx)::get(this, "", "rx_mon_bfm",m_cfge_rx.rx_mon_bfm))
	`uvm_fatal("VIF CONFIG", "Cannot get() BFM interface RX mon_bfm from uvm_config_db. Have you set() it?")
  if(!uvm_config_db #(virtual uart_driver_BFM_tx)::get(this, "", "tx_drv_bfm", m_cfge_tx.tx_drv_bfm))
  `uvm_fatal("VIF CONFIG", "Cannot get() BFM interface TX drv_bfm from uvm_config_db. Have you set() it?")
  if(!uvm_config_db #(virtual uart_monitor_BFM_tx)::get(this, "", "tx_mon_bfm",m_cfge_tx.tx_mon_bfm))
  `uvm_fatal("VIF CONFIG", "Cannot get() BFM interface TX mon_bfm from uvm_config_db. Have you set() it?")

  m_env_cfg.m_cfge_rx = m_cfge_rx;
  m_env_cfg.m_cfge_tx = m_cfge_tx;

  uvm_config_db #(uart_environment_config)::set(this, "*", "uart_environment_config", m_env_cfg);
endfunction

function void configuration_rx (uart_agent_config_rx cfg_rx);
    cfg_rx.CLOCK_RATE = 100000000;
    cfg_rx.BAUD_RATE  = 9600;
    cfg_rx.DATA_BYTE  = 1;

    cfg_rx.active                  = UVM_ACTIVE;
    cfg_rx.has_functional_coverage = 1;
    cfg_rx.has_scoreboard          = 1;
endfunction

function void configuration_tx (uart_agent_config_tx cfg_tx);
    cfg_tx.CLOCK_RATE = 100000000;
    cfg_tx.BAUD_RATE  = 9600;
    cfg_tx.DATA_BYTE  = 1;

    cfg_tx.active                  = UVM_ACTIVE;
    cfg_tx.has_functional_coverage = 1;
    cfg_tx.has_scoreboard          = 1;
endfunction

endclass : uart_base_test
