class uart_monitor_tx extends uvm_monitor;

// UVM Factory Registration Macro
`uvm_component_utils(uart_monitor_tx);

// Virtual Interface
virtual uart_monitor_BFM_tx mon_bfm_tx;

// Data Members
uart_agent_config_tx m_cfge_tx;
  
// Component Members
uvm_analysis_port #(uart_seq_item_tx) mon_data_tx;

// Standard UVM Methods:
extern function new(string name = "uart_monitor_tx", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);

// Proxy Methods:
extern function void notify_transaction(uart_seq_item_tx item_tx);
  
endclass: uart_monitor_tx

function uart_monitor_tx::new(string name = "uart_monitor_tx", uvm_component parent = null);
  super.new(name, parent);
endfunction

function void uart_monitor_tx::build_phase(uvm_phase phase);
  `get_config(uart_agent_config_tx, m_cfge_tx, "uart_agent_config_tx")
  mon_bfm_tx = m_cfge_tx.tx_mon_bfm;
  mon_bfm_tx.proxy_tx = this;
  mon_data_tx = new("mon_data_tx", this);
  `uvm_info(get_type_name(), "build_phase", UVM_LOW)
endfunction: build_phase

task uart_monitor_tx::run_phase(uvm_phase phase);
   mon_bfm_tx.m_cfge_tx = this.m_cfge_tx;
   mon_bfm_tx.run();
  `uvm_info(get_type_name(), "run_phase", UVM_LOW)
endtask: run_phase

function void uart_monitor_tx::report_phase(uvm_phase phase);
  `uvm_info(get_type_name(), "report_phase", UVM_LOW)
endfunction: report_phase

function void uart_monitor_tx::notify_transaction(uart_seq_item_tx item_tx);
  mon_data_tx.write(item_tx);
  `uvm_info(get_type_name(), "notify_transaction", UVM_LOW)
endfunction : notify_transaction
  
