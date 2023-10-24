import uvm_pkg::*;
`include "uvm_macros.svh"

class uart_agent_config_tx extends uvm_object;
 `uvm_object_utils(uart_agent_config_tx)

//Bus Functional Models
  virtual uart_driver_BFM_tx    tx_drv_bfm;  // virtual driver BFM
  virtual uart_monitor_BFM_tx   tx_mon_bfm;  // virtual monitor BFM

//Configuration Properties
  int CLOCK_RATE;  
  int BAUD_RATE;
  int CLOCK_PERIOD = 1000000000/CLOCK_RATE; //Nanosecond period
  int DATA_BYTE;
  
//UVM Configuration Properties  
  uvm_active_passive_enum active = UVM_ACTIVE;
  bit has_functional_coverage    = 1;
  bit has_scoreboard			       = 1;


function new(string name="uart_agent_config_tx");
  super.new(name);
endfunction

function uart_agent_config_tx get_config( uvm_component c );
  uart_agent_config_tx t;

  if (!uvm_config_db #(uart_agent_config_tx)::get(c, "", "uart_agent_config_tx", t) )
     `uvm_fatal("CONFIG_LOAD", $sformatf("Cannot get() configuration t from uvm_config_db. Have you set() it?"))
  return t;
endfunction
  
endclass: uart_agent_config_tx