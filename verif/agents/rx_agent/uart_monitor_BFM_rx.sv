interface uart_monitor_BFM_rx (
  input bit rxDone,
  input logic [7:0] uart_rx_sended_data,
  input logic [7:0] uart_rx_taken_data
);
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import uart_agent_pkg_rx::*;

  uart_agent_config_rx m_cfge_rx;
  uart_monitor_rx proxy_rx;

task run();
  uart_seq_item_rx cloned_item;
  uart_seq_item_rx uart_mon_req_rx;
  uart_mon_req_rx = uart_seq_item_rx::type_id::create("uart_mon_req_rx");
  `uvm_info("uart_monitor_BFM_rx", "monitor_BFM_run", UVM_LOW)
  @(negedge rxDone)
  uart_mon_req_rx.uart_rx_sended_data = uart_rx_sended_data;
  uart_mon_req_rx.uart_rx_taken_data  = uart_rx_taken_data;
  $cast(cloned_item, uart_mon_req_rx.clone());
  proxy_rx.notify_transaction(cloned_item);
endtask: run
endinterface : uart_monitor_BFM_rx

