class uart_reset_seq_rx extends uvm_sequence #(uart_seq_item_rx);
`uvm_object_utils(uart_reset_seq_rx)

uart_seq_item_rx req_rx;

function new(string name = "uart_reset_seq_rx");
  super.new(name);
endfunction

task body;
  `uvm_info(get_type_name(), "task:body", UVM_LOW)
  repeat(10) begin
     req_rx = uart_seq_item_rx::type_id::create("req_rx");

     start_item(req_rx);

	   req_rx.randomize() with {
	     req_rx.uart_rx_sended_data == 0;
	     req_rx.rxEn 			          == 0;
     };;

	  `uvm_info(get_type_name(), $sformatf("RX Reset Sequence Started"), UVM_HIGH)

     finish_item(req_rx);
  end
endtask:body

endclass:uart_reset_seq_rx
