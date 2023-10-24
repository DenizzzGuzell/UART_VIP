class uart_driver_rx extends uvm_driver #(uart_seq_item_rx, uart_seq_item_rx);
  `uvm_component_utils(uart_driver_rx)

virtual uart_driver_BFM_rx rx_drv_bfm;

uart_agent_config_rx rx_drv_cfg;

extern function new(string name = "uart_driver_rx", uvm_component parent = null);
extern task run_phase(uvm_phase phase);
extern function void build_phase(uvm_phase phase);

endclass: uart_driver_rx

  function uart_driver_rx::new(string name = "uart_driver_rx", uvm_component parent = null);
  super.new(name, parent);
endfunction

function void uart_driver_rx::build_phase(uvm_phase phase);
  super.build_phase(phase);

  `get_config(uart_agent_config_rx, rx_drv_cfg, "uart_agent_config_rx")
   rx_drv_bfm = rx_drv_cfg.rx_drv_bfm;
  `uvm_info(get_type_name(), "driver_build_phase", UVM_LOW)
endfunction: build_phase

task uart_driver_rx::run_phase(uvm_phase phase);
  forever begin
     uart_seq_item_rx rx_drv_req;
     rx_drv_bfm.rx_drv_cfg = this.rx_drv_cfg;
    `uvm_info(get_type_name(), "driver_rx_run_phase", UVM_LOW)
     rx_drv_bfm.clear_signals();
     seq_item_port.get_next_item(rx_drv_req);
    `uvm_info(get_type_name(), "driver_rx_get_next_item", UVM_LOW)
     rx_drv_bfm.run(rx_drv_req);
    `uvm_info(get_type_name(), "driver_rx_run", UVM_LOW)
	  #100ns;

     seq_item_port.item_done();
   end

endtask: run_phase
