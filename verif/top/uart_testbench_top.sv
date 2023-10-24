`define RTL_IF 	   uart_if.DUT.default_cb
`define RX_DRV_IF  uart_if.RX_DRV.default_cb
`define RX_MON_IF  uart_if.RX_MON.default_cb
`define TX_DRV_IF  uart_if.TX_DRV.default_cb
`define TX_MON_IF  uart_if.TX_MON.default_cb

`timescale 1ps/1fs
//////////////////////////////////////////////
// Engineer: Deniz Guzel
// Create Date: 17/10/2023 09:00:00 AM
// Description: UVM verification of UART
//////////////////////////////////////////////

import uvm_pkg::*;
 `include "uvm_macros.svh"

import uart_test_lib_pkg::*;

module uart_tb_top;

  //Instantiation
  bit i_clk;

  uart_interface #(1) uart_if(.i_clk(i_clk));  

  uart_driver_BFM_tx tx_drv_bfm(
   .txDone 				          (uart_if.txDone),
   .uart_tx_sended_data     (uart_if.uart_tx_sended_data),
   .txEn 				            (uart_if.txEn),
   .txStart				          (uart_if.txStart)
  );

   uart_monitor_BFM_tx tx_mon_bfm(
   .txBusy                  (uart_if.txBusy),
   .txClk                   (uart_if.txClk), 
   .txDone 					        (uart_if.txDone),
   .txStart					        (uart_if.txStart),
   .txEn 					          (uart_if.txEn),
   .uart_tx_sended_data 	  (uart_if.uart_tx_sended_data),
   .uart_tx_taken_data_bit  (uart_if.uart_tx_taken_data_bit)
  );

  uart_driver_BFM_rx rx_drv_bfm(
   .rxBusy                  (uart_if.rxBusy),
   .rxClk                   (uart_if.rxClk),
   .rxDone 				          (uart_if.rxDone),
   .uart_rx_data            (uart_if.uart_rx_sended_data_bit),
   .uart_rx_sended_data 	  (uart_if.uart_rx_sended_data),
   .rxEn				            (uart_if.rxEn)
  );

  uart_monitor_BFM_rx rx_mon_bfm(
   .rxDone 				          (uart_if.rxDone),
   .uart_rx_sended_data     (uart_if.uart_rx_sended_data),
   .uart_rx_taken_data 			(uart_if.uart_rx_taken_data)
  );

  Uart8#(
    .CLOCK_RATE (100000000),
    .BAUD_RATE  (9600) 
  ) 
  dut_uart(
    .clk      (uart_if.i_clk),

    .rx       (uart_if.uart_rx_sended_data_bit),
    .out      (uart_if.uart_rx_taken_data),
    .rxDone   (uart_if.rxDone),
    .rxBusy   (uart_if.rxBusy),
    .rxErr    (uart_if.rxError),
    .rxEn     (uart_if.rxEn),

    .tx       (uart_if.uart_tx_taken_data_bit),
    .txEn     (uart_if.txEn),
    .txStart  (uart_if.txStart),
    .in       (uart_if.uart_tx_sended_data),
    .txDone   (uart_if.txDone),
    .txBusy   (uart_if.txBusy),

    .txClk_o  (uart_if.txClk),
    .rxClk_o  (uart_if.rxClk)
  );

  initial begin
    import uvm_pkg::uvm_config_db;

    uvm_config_db #(virtual uart_driver_BFM_tx) ::set(null, "uvm_test_top", "tx_drv_bfm", tx_drv_bfm);
    uvm_config_db #(virtual uart_monitor_BFM_tx)::set(null, "uvm_test_top", "tx_mon_bfm", tx_mon_bfm);
    uvm_config_db #(virtual uart_driver_BFM_rx) ::set(null, "uvm_test_top", "rx_drv_bfm", rx_drv_bfm);
    uvm_config_db #(virtual uart_monitor_BFM_rx)::set(null, "uvm_test_top", "rx_mon_bfm", rx_mon_bfm);
  end

	//Clock Generation
  initial begin
    i_clk = 0;
    forever begin
      i_clk = ~i_clk;
      #5ns;
    end
  end

  initial begin
    run_test();
    #100ns;
     $finish;
  end

endmodule:uart_tb_top