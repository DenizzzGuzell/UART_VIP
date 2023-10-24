class uart_rx_seq extends uvm_sequence #(uart_seq_item_rx);
`uvm_object_utils(uart_rx_seq)

uart_seq_item_rx req_rx;

function new(string name = "uart_rx_seq");
  super.new(name);
endfunction

task body();
  `uvm_info(get_type_name(), "task:body", UVM_LOW)
  #2ms;
  repeat(100) begin
    req_rx = uart_seq_item_rx::type_id::create("req_rx");
    start_item(req_rx);

	req_rx.randomize() with {req_rx.rxEn == 1;};;
	`uvm_info(get_type_name(), $sformatf("New item generation : %s", req_rx.convert2string()), UVM_LOW)
    
    finish_item(req_rx);
  end
endtask:body

endclass:uart_rx_seq
