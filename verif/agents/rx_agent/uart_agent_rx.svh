class uart_agent_rx extends uvm_agent;
  `uvm_component_utils(uart_agent_rx)

uvm_analysis_port#(uart_seq_item_rx) mon_data_rx;
uart_monitor_rx   rx_monitor;
uart_sequencer_rx rx_sequencer;
uart_driver_rx    rx_driver;

extern function new(string name = "uart_agent_rx", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass: uart_agent_rx


function uart_agent_rx::new(string name = "uart_agent_rx", uvm_component parent = null);
  super.new(name, parent);
endfunction

function void uart_agent_rx::build_phase(uvm_phase phase);
  uart_agent_config_rx m_cfge_rx;
  `uvm_info(get_type_name(), "build_phase", UVM_LOW)
  `get_config(uart_agent_config_rx, m_cfge_rx, "uart_agent_config_rx")

  if (get_is_active()) begin
  	rx_driver = uart_driver_rx::type_id::create("rx_driver", this);
  	rx_driver.rx_drv_cfg = m_cfge_rx;
  	rx_sequencer = uart_sequencer_rx::type_id::create("rx_sequencer", this);
  end
  rx_monitor = uart_monitor_rx::type_id::create("rx_monitor", this);
  rx_monitor.m_cfge_rx = m_cfge_rx;

endfunction: build_phase

function void uart_agent_rx::connect_phase(uvm_phase phase);
  `uvm_info(get_type_name(), "connect_phase", UVM_LOW)
  mon_data_rx = rx_monitor.mon_data_rx;
  if (get_is_active()) begin
    `uvm_info(get_type_name(), "rx_driver rx seqr connected", UVM_LOW)
  	rx_driver.seq_item_port.connect(rx_sequencer.seq_item_export);
  end
endfunction: connect_phase

