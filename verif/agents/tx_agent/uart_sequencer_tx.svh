class uart_sequencer_tx extends uvm_sequencer#(uart_seq_item_tx);

  `uvm_sequencer_utils(uart_sequencer_tx)
     
  function new (string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "tx_sequencer_constructor", UVM_LOW)
  endfunction : new

endclass : uart_sequencer_tx