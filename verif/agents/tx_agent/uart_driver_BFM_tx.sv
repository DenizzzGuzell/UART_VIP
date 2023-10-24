interface uart_driver_BFM_tx(
  input  bit   txDone,
  output logic [7:0] uart_tx_sended_data,
  output logic txEn,
  output logic txStart
);
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import uart_agent_pkg_tx::*;

  uart_agent_config_tx tx_drv_cfg;

  task run (uart_seq_item_tx tx_drv_req);
    clear_signals();
    fork 
       drive(tx_drv_req);    
    join_any   
  endtask

  task clear_signals();
    txEn    = 0;
    txStart = 0;
  endtask

  task activate_trans (uart_seq_item_tx tx_drv_req);
    txEn    = tx_drv_req.txEn;
    txStart = tx_drv_req.txStart;
  endtask

  task drive(uart_seq_item_tx tx_drv_req);
    `uvm_info("uart_driver_BFM_tx", "driver_BFM_drive", UVM_LOW)
    activate_trans(tx_drv_req);
    wait(txStart && txEn);
    uart_tx_sended_data = tx_drv_req.uart_tx_sended_data;
    @(negedge txDone);
  #100ns;
  endtask

endinterface: uart_driver_BFM_tx