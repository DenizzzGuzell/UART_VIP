`uvm_analysis_imp_decl(_rx)
`uvm_analysis_imp_decl(_tx)

class uart_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(uart_scoreboard)

  uvm_analysis_imp_rx#(uart_seq_item_rx, uart_scoreboard) rx_mon;
  uvm_analysis_imp_tx#(uart_seq_item_tx, uart_scoreboard) tx_mon;

  uart_agent_config_rx scr_cfg_rx;
  uart_agent_config_tx scr_cfg_tx;

  uart_seq_item_tx transactions_tx[$];
  uart_seq_item_rx transactions_rx[$];

    //RX variables
    logic [7:0] uart_rx_sended_data;
    logic [7:0] uart_rx_taken_data; 

    //TX variables
    logic [7:0] uart_tx_sended_data;
    logic [7:0] uart_tx_taken_data; 

    //communication configurations
    int CLOCK_RATE;
    int CLOCK_PERIOD;
    int BAUD_RATE;
    int DATA_BYTE;

    int rx_err_count;
    int tx_err_count;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "build_phase", UVM_LOW)
    super.build_phase(phase);

    if (! uvm_config_db #(uart_agent_config_tx) :: get(this, "", "uart_agent_config_tx", scr_cfg_tx)) begin
       `uvm_fatal (get_type_name(), "Didn't get CFG object of TX at Scoreboard!")
    end
    if (! uvm_config_db #(uart_agent_config_rx) :: get(this, "", "uart_agent_config_rx", scr_cfg_rx)) begin
       `uvm_fatal (get_type_name(), "Didn't get CFG object of RX at Scoreboard!")
    end

    rx_mon = new("rx_mon", this);
    tx_mon = new("tx_mon", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "connect_phase", UVM_LOW)
    super.connect_phase(phase);
  endfunction: connect_phase

  function void write_tx(uart_seq_item_tx req_tx);
    transactions_tx.push_back(req_tx);
  endfunction

  function void write_rx(uart_seq_item_rx req_rx);
    transactions_rx.push_back(req_rx);
  endfunction

  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    CLOCK_RATE   = scr_cfg_rx.CLOCK_RATE;
    CLOCK_PERIOD = scr_cfg_rx.CLOCK_PERIOD;
    BAUD_RATE    = scr_cfg_rx.BAUD_RATE;
    DATA_BYTE    = scr_cfg_rx.DATA_BYTE;
    `uvm_info(get_type_name(),$sformatf("Configuration variables:: CLOCK_RATE:%d, CLOCK_PERIOD:%d, BAUD_RATE:%d, DATA_BYTE:%d",CLOCK_RATE,CLOCK_PERIOD,BAUD_RATE,DATA_BYTE),UVM_LOW)

    forever begin
      uart_seq_item_rx trans_rx;
      uart_seq_item_tx trans_tx;
      
      wait((transactions_rx.size() != 0) || (transactions_tx.size() != 0));
      if ((transactions_rx.size() != 0) && (transactions_tx.size() != 0)) begin
        trans_rx = transactions_rx.pop_front();
        trans_tx = transactions_tx.pop_front();  
        fork 
          scoreboard_rx(trans_rx);
          scoreboard_tx(trans_tx);
        join

      end else if ((transactions_rx.size() != 0)) begin 
        trans_rx = transactions_rx.pop_front();  
        scoreboard_rx(trans_rx);

      end else if ((transactions_tx.size() != 0)) begin
        trans_tx = transactions_tx.pop_front();
        scoreboard_tx(trans_tx);
      end
    end
  endtask: run_phase

  task scoreboard_rx (uart_seq_item_rx trans_rx);
    uart_rx_sended_data = trans_rx.uart_rx_sended_data;
    uart_rx_taken_data  = trans_rx.uart_rx_taken_data; 
    if(uart_rx_sended_data == uart_rx_taken_data) begin
        `uvm_info(get_type_name(),$sformatf("RX Transaction Passed!"),UVM_LOW)
    end else begin
        `uvm_error(get_type_name(),$sformatf("RX Transaction Failed!"));
        rx_err_count++;
    end      
  endtask : scoreboard_rx

  task scoreboard_tx (uart_seq_item_tx trans_tx);
    uart_tx_sended_data = trans_tx.uart_tx_sended_data;
    uart_tx_taken_data  = trans_tx.uart_tx_taken_data; 
    if(uart_tx_sended_data == uart_tx_taken_data) begin
        `uvm_info(get_type_name(),$sformatf("RX Transaction Passed!"),UVM_LOW)
    end else begin
        `uvm_error(get_type_name(),$sformatf("RX Transaction Failed!"))
        tx_err_count++;
    end      
  endtask : scoreboard_tx

  virtual function void check_phase (uvm_phase phase);
    if(rx_err_count + tx_err_count > 0) begin
      `uvm_error(get_type_name(),$sformatf("TEST Failed! Errors occured :: RX = %d || TX = %d",rx_err_count,tx_err_count))
    end
  endfunction : check_phase

endclass : uart_scoreboard
