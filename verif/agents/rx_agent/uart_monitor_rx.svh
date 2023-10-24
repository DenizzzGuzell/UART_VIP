class uart_monitor_rx extends uvm_monitor;

// UVM Factory Registration Macro
`uvm_component_utils(uart_monitor_rx);

// Virtual Interface
virtual uart_monitor_BFM_rx mon_bfm_rx;

// Data Members
uart_agent_config_rx m_cfge_rx;
  
// Component Members
uvm_analysis_port #(uart_seq_item_rx) mon_data_rx;

// Standard UVM Methods:
extern function new(string name = "uart_monitor_rx", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);

// Proxy Methods:
extern function void notify_transaction(uart_seq_item_rx item_rx);
  
endclass: uart_monitor_rx

function uart_monitor_rx::new(string name = "uart_monitor_rx", uvm_component parent = null);
  super.new(name, parent);
endfunction

function void uart_monitor_rx::build_phase(uvm_phase phase);
  `get_config(uart_agent_config_rx, m_cfge_rx, "uart_agent_config_rx")
  mon_bfm_rx = m_cfge_rx.rx_mon_bfm;
  mon_bfm_rx.proxy_rx = this;
  mon_data_rx = new("mon_data_rx", this);
  `uvm_info(get_type_name(), "build_phase", UVM_LOW)
endfunction: build_phase

task uart_monitor_rx::run_phase(uvm_phase phase);
  forever begin
    mon_bfm_rx.m_cfge_rx = this.m_cfge_rx;
    mon_bfm_rx.run();
    `uvm_info(get_type_name(), "run_phase", UVM_LOW)
  end
endtask: run_phase

function void uart_monitor_rx::report_phase(uvm_phase phase);
  `uvm_info(get_type_name(), "report_phase", UVM_LOW)
endfunction: report_phase

function void uart_monitor_rx::notify_transaction(uart_seq_item_rx item_rx);
  mon_data_rx.write(item_rx);
  `uvm_info(get_type_name(), "notify_transaction", UVM_LOW)
endfunction : notify_transaction
  
