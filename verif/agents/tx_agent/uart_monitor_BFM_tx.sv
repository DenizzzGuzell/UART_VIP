interface uart_monitor_BFM_tx (
  input logic txBusy,
  input logic txClk,
  input logic txDone,
  input logic txStart,
  input logic txEn,
  input logic [7:0] uart_tx_sended_data,
  input logic       uart_tx_taken_data_bit
);
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import uart_agent_pkg_tx::*;

  uart_agent_config_tx m_cfge_tx;
  uart_monitor_tx proxy_tx;

  logic [9:0] temp_data;

task run();
  `uvm_info("uart_monitor_BFM_tx", "monitor_BFM_run", UVM_LOW)
  fork 
    collect_data();
  join
endtask: run

task collect_data ();
  uart_seq_item_tx cloned_item;
  uart_seq_item_tx uart_mon_req_tx;
  uart_mon_req_tx = uart_seq_item_tx::type_id::create("uart_mon_req_tx");
      forever begin
        wait(txBusy);
          repeat(m_cfge_tx.DATA_BYTE+2) begin
            @(posedge txClk)
            temp_data      = temp_data << 1;
            temp_data[0]  <= uart_tx_taken_data_bit;
          end
          @(negedge txDone)
          uart_mon_req_tx.uart_tx_taken_data  = temp_data[8:1];
          uart_mon_req_tx.uart_tx_sended_data = uart_tx_sended_data;
          $cast(cloned_item, uart_mon_req_tx.clone());
          proxy_tx.notify_transaction(cloned_item);
      end
endtask

endinterface : uart_monitor_BFM_tx

