class uart_agent_tx extends uvm_agent;
  `uvm_component_utils(uart_agent_tx)

uvm_analysis_port#(uart_seq_item_tx) mon_data_tx;
uart_monitor_tx   tx_monitor;
uart_sequencer_tx tx_sequencer;
uart_driver_tx    tx_driver;

extern function new(string name = "uart_agent_tx", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass: uart_agent_tx


function uart_agent_tx::new(string name = "uart_agent_tx", uvm_component parent = null);
  super.new(name, parent);
endfunction

function void uart_agent_tx::build_phase(uvm_phase phase);
  uart_agent_config_tx m_cfge_tx;
  `uvm_info(get_type_name(), "build_phase", UVM_LOW)
  `get_config(uart_agent_config_tx, m_cfge_tx, "uart_agent_config_tx")

  if (get_is_active()) begin
  	tx_driver = uart_driver_tx::type_id::create("tx_driver", this);
  	tx_driver.tx_drv_cfg = m_cfge_tx;
  	tx_sequencer = uart_sequencer_tx::type_id::create("tx_sequencer", this);
    `uvm_info(get_type_name(), "tx_sequencer created", UVM_LOW)
  end
  tx_monitor = uart_monitor_tx::type_id::create("tx_monitor", this);
  tx_monitor.m_cfge_tx = m_cfge_tx;

endfunction: build_phase

function void uart_agent_tx::connect_phase(uvm_phase phase);
  `uvm_info(get_type_name(), "connect_phase", UVM_LOW)
  mon_data_tx = tx_monitor.mon_data_tx;
  if (get_is_active()) begin
    `uvm_info(get_type_name(), "tx_driver tx seqr connected", UVM_LOW)
  	tx_driver.seq_item_port.connect(tx_sequencer.seq_item_export);
  end
endfunction: connect_phase