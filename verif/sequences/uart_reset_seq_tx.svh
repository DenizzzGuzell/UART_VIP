class uart_reset_seq_tx extends uvm_sequence #(uart_seq_item_tx);
`uvm_object_utils(uart_reset_seq_tx)

uart_seq_item_tx req_tx;

function new(string name = "uart_reset_seq_tx");
  super.new(name);
endfunction

task body();
  `uvm_info(get_type_name(), "task:body", UVM_LOW)
  repeat(10) begin
     req_tx = uart_seq_item_tx::type_id::create("req_tx");

     start_item(req_tx);

	   req_tx.randomize() with {
	     req_tx.uart_tx_sended_data == 0;
	     req_tx.txEn 			          == 0;
       req_tx.txStart             == 0;
     };;

	  `uvm_info(get_type_name(), $sformatf("TX Reset Sequence Started"), UVM_LOW)

     finish_item(req_tx);
  end
endtask:body

endclass:uart_reset_seq_tx
