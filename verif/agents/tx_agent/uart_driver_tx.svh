class uart_driver_tx extends uvm_driver #(uart_seq_item_tx, uart_seq_item_tx);
  `uvm_component_utils(uart_driver_tx)

virtual uart_driver_BFM_tx tx_drv_bfm;

uart_agent_config_tx tx_drv_cfg;

extern function new(string name = "uart_driver_tx", uvm_component parent = null);
extern task run_phase(uvm_phase phase);
extern function void build_phase(uvm_phase phase);

endclass: uart_driver_tx

  function uart_driver_tx::new(string name = "uart_driver_tx", uvm_component parent = null);
  super.new(name, parent);
endfunction

function void uart_driver_tx::build_phase(uvm_phase phase);
  super.build_phase(phase);

  `get_config(uart_agent_config_tx, tx_drv_cfg, "uart_agent_config_tx")
   tx_drv_bfm = tx_drv_cfg.tx_drv_bfm;
  `uvm_info(get_type_name(), "driver_build_phase", UVM_LOW)
endfunction: build_phase

task uart_driver_tx::run_phase(uvm_phase phase);
  forever begin
     uart_seq_item_tx tx_drv_req;
     tx_drv_bfm.tx_drv_cfg = this.tx_drv_cfg;
    `uvm_info(get_type_name(), "driver_run_phase", UVM_LOW)
     tx_drv_bfm.clear_signals();
     `uvm_info(get_type_name(), "clear_signals", UVM_LOW)
     seq_item_port.get_next_item(tx_drv_req);
     `uvm_info(get_type_name(), "get_next_item", UVM_LOW)
     tx_drv_bfm.run(tx_drv_req);
     `uvm_info(get_type_name(), "run", UVM_LOW)
	  #100ns;
     seq_item_port.item_done();
     `uvm_info(get_type_name(), "item_done", UVM_LOW)
   end
endtask: run_phase
