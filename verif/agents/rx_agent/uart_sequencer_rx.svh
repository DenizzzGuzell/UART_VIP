class uart_sequencer_rx extends uvm_sequencer#(uart_seq_item_rx);

  `uvm_sequencer_utils(uart_sequencer_rx)
     
  function new (string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "rx_sequencer_constructor", UVM_LOW)
  endfunction : new

endclass : uart_sequencer_rx