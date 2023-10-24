class uart_rx_tx_test extends uart_base_test;
`uvm_component_utils (uart_rx_tx_test)
function new(string name = "uart_rx_tx_test", uvm_component parent = null);
  super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);

  configuration_rx(m_cfge_rx);
  configuration_tx(m_cfge_tx);

endfunction: build_phase

function void configuration_rx(uart_agent_config_rx cfg_rx);
    cfg_rx.CLOCK_RATE = 100000000;
    cfg_rx.BAUD_RATE  = 9600;
    cfg_rx.DATA_BYTE  = 1;

    cfg_rx.active                  = UVM_ACTIVE;
    cfg_rx.has_functional_coverage = 1;
    cfg_rx.has_scoreboard          = 1;
endfunction: configuration_rx

function void configuration_tx(uart_agent_config_tx cfg_tx);
    cfg_tx.CLOCK_RATE = 100000000;
    cfg_tx.BAUD_RATE  = 9600;
    cfg_tx.DATA_BYTE  = 1;

    cfg_tx.active                  = UVM_ACTIVE;
    cfg_tx.has_functional_coverage = 1;
    cfg_tx.has_scoreboard          = 1;
endfunction: configuration_tx

task run_phase (uvm_phase phase);
  
  uart_rx_seq  seq_rx  = uart_rx_seq::type_id::create("seq_rx");
  uart_tx_seq  seq_tx  = uart_tx_seq::type_id::create("seq_tx");
  //rx_tx_virt_sequences rx_tx_virt_seq = rx_tx_virt_sequences::type_id::create ("rx_tx_virt_seq");
  super.run_phase (phase);
  phase.raise_objection(this, "uart_rx_tx_test");
    fork 
      seq_rx.start(m_top_env.agt_rx.rx_sequencer);
      seq_tx.start(m_top_env.agt_tx.tx_sequencer);
    join
    //rx_tx_virt_seq.start (m_top_env.virt_seqr);
    #1000ns;
  phase.drop_objection(this, "uart_rx_tx_test");
endtask
endclass : uart_rx_tx_test