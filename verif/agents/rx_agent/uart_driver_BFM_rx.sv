interface uart_driver_BFM_rx(
  input  logic rxBusy,
  input  logic rxClk, 
  input  logic rxDone,
  output logic uart_rx_data,
  output logic [7:0] uart_rx_sended_data, //out ile aynı 
  output logic rxEn
);
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import uart_agent_pkg_rx::*;

  logic [7:0] temp_data;

  uart_agent_config_rx rx_drv_cfg;

  task run (uart_seq_item_rx rx_drv_req);
    clear_signals();
    activate_trans(rx_drv_req);
    fork 
       drive(rx_drv_req);    
    join_any   
  endtask

  task clear_signals();
    uart_rx_sended_data = 0;
  endtask

  task activate_trans (uart_seq_item_rx rx_drv_req);
    rxEn = rx_drv_req.rxEn;
  endtask

  task drive(uart_seq_item_rx rx_drv_req);
    `uvm_info("uart_driver_BFM_rx", "driver_BFM_drive", UVM_LOW)
    temp_data           = rx_drv_req.uart_rx_sended_data;
    uart_rx_sended_data = rx_drv_req.uart_rx_sended_data;
    @(posedge rxBusy)
    repeat (rx_drv_cfg.DATA_BYTE*8) begin
      @(posedge rxClk)
      uart_rx_data <= temp_data[rx_drv_cfg.DATA_BYTE*8-1];
      temp_data    <= temp_data << 1;
    end
    @(negedge rxBusy)
    uart_rx_data <= 1;
    @(negedge rxDone);
    uart_rx_data <= 0;
    #100ns;
  endtask

endinterface: uart_driver_BFM_rx


