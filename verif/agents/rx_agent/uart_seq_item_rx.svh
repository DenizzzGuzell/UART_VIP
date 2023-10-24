class uart_seq_item_rx extends uvm_sequence_item;
  `uvm_object_param_utils(uart_seq_item_rx)

  //RX Interface
  rand logic rxEn;

  // Transaction Data
  randc logic [7:0]   uart_rx_sended_data;
  logic       [7:0]   uart_rx_taken_data;

  //Constructor block
  function new (string name = "uart_seq_item_rx");
    super.new(name);
  endfunction

  //Method block
  extern function void do_copy(uvm_object rhs);
  extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function string convert2string();
  extern function void do_print(uvm_printer printer);
  extern function void do_pack(uvm_packer packer);
  extern function void do_unpack(uvm_packer packer);
  extern function void do_record(uvm_recorder recorder);

endclass  : uart_seq_item_rx

//Externed methods assignment block
function void uart_seq_item_rx::do_copy(uvm_object rhs);
	uart_seq_item_rx dc;
  `uvm_info(get_type_name(), "uart_seq_item_rx:do_copy", UVM_LOW)
    if(!$cast(dc, rhs)) begin
        uvm_report_error("uart_seq_item_rx -> do_copy:", "Cast failed");
      return;
 	end
    super.do_copy(rhs);
    rxEn                 = dc.rxEn;
    uart_rx_sended_data  = dc.uart_rx_sended_data;
    uart_rx_taken_data   = dc.uart_rx_taken_data;
endfunction : do_copy

function string uart_seq_item_rx::convert2string();
  string contents;
  contents = super.convert2string();
  `uvm_info(get_type_name(), "uart_seq_item_rx:convert2string", UVM_LOW)
  $sformat(contents, "%s uart_rx_sended_data    = 0x%0h", contents, uart_rx_sended_data);
  $sformat(contents, "%s uart_rx_taken_data     = 0x%0h", contents, uart_rx_taken_data);
  $sformat(contents, "%s rxEn            = %b", contents, rxEn);
  return contents;
endfunction : convert2string

function bit uart_seq_item_rx::do_compare(uvm_object rhs, uvm_comparer comparer);
  uart_seq_item_rx t;
  `uvm_info(get_type_name(), "uart_seq_item_rx:do_compare", UVM_LOW)
  if(!$cast(t, rhs)) begin
   return 0;
  end
  return ((super.do_compare(t, comparer))                  &&
          (uart_rx_sended_data   == t.uart_rx_sended_data) &&
          (uart_rx_taken_data    == t.uart_rx_taken_data)  &&
          (rxEn                  == t.rxEn));
endfunction : do_compare

function void uart_seq_item_rx::do_print (uvm_printer printer);
        printer.print_string("Transaction Type", "data_transfer" );
        printer.print_array_header("uart_rx_sended_data",uart_rx_sended_data);
    foreach(uart_rx_sended_data[i_1])
        printer.print_field($psprintf("uart_rx_sended_data[%0d]",i_1), uart_rx_sended_data[i_1], $bits(uart_rx_sended_data[i_1]));
        printer.print_array_footer();
    super.do_print(printer);
endfunction

function void uart_seq_item_rx::do_pack (uvm_packer packer);
    `uvm_pack_int(rxEn)
    begin
        `uvm_pack_int(8);
    end
    for ( int _i0 = 0; _i0 < 8; ++_i0 )
    begin
        `uvm_pack_int(uart_rx_sended_data[_i0])
    end
endfunction

function void uart_seq_item_rx::do_unpack (uvm_packer packer);
    `uvm_unpack_int(rxEn)
    begin
        int _size = 8;
        `uvm_unpack_int(_size);
    end
    for ( int _i0 = 0; _i0 < 8; ++_i0 )
    begin
        `uvm_unpack_int(uart_rx_sended_data[_i0])
    end
endfunction

function void uart_seq_item_rx::do_record (uvm_recorder recorder);
    super.do_record(recorder);
    foreach(uart_rx_sended_data[i_1])
        recorder.record_field($psprintf("uart_rx_sended_data%0d_",i_1), uart_rx_sended_data[i_1], $bits(uart_rx_sended_data[i_1]));
    foreach(uart_rx_taken_data[i_1])
        recorder.record_field($psprintf("uart_rx_taken_data%0d_",i_1), uart_rx_taken_data[i_1], $bits(uart_rx_taken_data[i_1]));
endfunction