class uart_seq_item_tx extends uvm_sequence_item;
  `uvm_object_param_utils(uart_seq_item_tx)

  //TX Interface
  rand logic txEn;
  rand logic txStart;

  // Transaction Data
  randc logic [7:0]   uart_tx_sended_data;
  logic       [7:0]   uart_tx_taken_data;

  //Constructor block
  function new (string name = "uart_seq_item_tx");
    super.new(name);
  endfunction

  //Method blocks
  extern function void do_copy(uvm_object rhs);
  extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function string convert2string();
  extern function void do_print(uvm_printer printer);
  extern function void do_pack(uvm_packer packer);
  extern function void do_unpack(uvm_packer packer);
  extern function void do_record(uvm_recorder recorder);

endclass  : uart_seq_item_tx

//Externed methods assignment block
function void uart_seq_item_tx::do_copy(uvm_object rhs);
  uart_seq_item_tx dc;
  `uvm_info(get_type_name(), "uart_seq_item_tx:do_copy", UVM_LOW)
    if(!$cast(dc, rhs)) begin
        uvm_report_error("uart_seq_item_tx -> do_copy:", "Cast failed");
      return;
  end
    super.do_copy(rhs);
    txEn                 = dc.txEn;
    uart_tx_sended_data  = dc.uart_tx_sended_data;
    uart_tx_taken_data   = dc.uart_tx_taken_data;
endfunction : do_copy

function string uart_seq_item_tx::convert2string();
  string contents;
  contents = super.convert2string();
  `uvm_info(get_type_name(), "uart_seq_item_tx:convert2string", UVM_LOW)
  $sformat(contents, "%s uart_tx_sended_data    = 0x%0h", contents, uart_tx_sended_data);
  $sformat(contents, "%s uart_tx_taken_data     = 0x%0h", contents, uart_tx_taken_data);
  $sformat(contents, "%s txEn            = %b", contents, txEn);
  return contents;
endfunction : convert2string

function bit uart_seq_item_tx::do_compare(uvm_object rhs, uvm_comparer comparer);
  uart_seq_item_tx t;
  `uvm_info(get_type_name(), "uart_seq_item_tx:do_compare", UVM_LOW)
  if(!$cast(t, rhs)) begin
   return 0;
  end
  return ((super.do_compare(t, comparer))                  &&
          (uart_tx_sended_data   == t.uart_tx_sended_data) &&
          (uart_tx_taken_data    == t.uart_tx_taken_data)  &&
          (txEn                  == t.txEn));
endfunction : do_compare

function void uart_seq_item_tx::do_print (uvm_printer printer);
        printer.print_string("Transaction Type", "data_transfer" );
        printer.print_array_header("uart_tx_sended_data",uart_tx_sended_data);
    foreach(uart_tx_sended_data[i_1])
        printer.print_field($psprintf("uart_tx_sended_data[%0d]",i_1), uart_tx_sended_data[i_1], $bits(uart_tx_sended_data[i_1]));
        printer.print_array_footer();
    super.do_print(printer);
endfunction

function void uart_seq_item_tx::do_pack (uvm_packer packer);
    `uvm_pack_int(txEn)
    begin
        `uvm_pack_int(8);
    end
    for ( int _i0 = 0; _i0 < 8; ++_i0 )
    begin
        `uvm_pack_int(uart_tx_sended_data[_i0])
    end
endfunction

function void uart_seq_item_tx::do_unpack (uvm_packer packer);
    `uvm_unpack_int(txEn)
    begin
        int _size = 8;
        `uvm_unpack_int(_size);
    end
    for ( int _i0 = 0; _i0 < 8; ++_i0 )
    begin
        `uvm_unpack_int(uart_tx_sended_data[_i0])
    end
endfunction

function void uart_seq_item_tx::do_record (uvm_recorder recorder);
    super.do_record(recorder);
    foreach(uart_tx_sended_data[i_1])
        recorder.record_field($psprintf("uart_tx_sended_data%0d_",i_1), uart_tx_sended_data[i_1], $bits(uart_tx_sended_data[i_1]));
    foreach(uart_tx_taken_data[i_1])
        recorder.record_field($psprintf("uart_tx_taken_data%0d_",i_1), uart_tx_taken_data[i_1], $bits(uart_tx_taken_data[i_1]));
endfunction