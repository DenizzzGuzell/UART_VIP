class uart_tx_seq extends uvm_sequence #(uart_seq_item_tx);
`uvm_object_utils(uart_tx_seq)

uart_seq_item_tx req_tx;

function new(string name = "uart_tx_seq");
  super.new(name);
endfunction

task body();
  `uvm_info(get_type_name(), "task:body", UVM_LOW)
  #2ms;
  repeat(100) begin

    req_tx = uart_seq_item_tx::type_id::create("req_tx");
    start_item(req_tx);

	req_tx.randomize() with {req_tx.txEn == 1; req_tx.txStart == 1;};;
	`uvm_info(get_type_name(), $sformatf("New item generation : %s", req_tx.convert2string()), UVM_LOW)

    finish_item(req_tx);
  end
endtask:body

endclass:uart_tx_seq
