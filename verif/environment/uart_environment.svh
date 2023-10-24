class uart_environment extends uvm_env;
  `uvm_component_utils(uart_environment)

  uart_agent_rx agt_rx;
  uart_agent_tx agt_tx;

  uart_scoreboard scb;

  uart_environment_config m_cfg;
  
  //uart_virtual_sequencer virt_seqr;

  function new(string name="uart_environment", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    `uvm_info(get_type_name(), "build_phase", UVM_LOW)

    if(!uvm_config_db #(uart_environment_config)::get(this, "", "uart_environment_config", m_cfg))
		`uvm_fatal("CONFIG_LOAD", "Cannot get() configuration uart_environment_config from uvm_config_db. Have you set() it?")

    uvm_config_db #(uart_agent_config_rx)::set(this, "agt_rx","uart_agent_config_rx", m_cfg.m_cfge_rx);
    uvm_config_db #(uart_agent_config_tx)::set(this, "agt_tx","uart_agent_config_tx", m_cfg.m_cfge_tx);

    uvm_config_db #(uart_agent_config_rx)::set(this, "scb","uart_agent_config_rx", m_cfg.m_cfge_rx);
    uvm_config_db #(uart_agent_config_tx)::set(this, "scb","uart_agent_config_tx", m_cfg.m_cfge_tx);

    //virt_seqr = uart_virtual_sequencer::type_id::create ("virt_seqr", this);

    agt_rx =uart_agent_rx::type_id::create("agt_rx", this);
    agt_tx =uart_agent_tx::type_id::create("agt_tx", this);

    scb    =uart_scoreboard::type_id::create("scb", this);

  endfunction
    
  function void connect_phase(uvm_phase phase);

    super.connect_phase(phase);
    `uvm_info(get_type_name(), "connect_phase", UVM_LOW)

    //virt_seqr.rx_seqr   = agt_rx.rx_sequencer;
    //virt_seqr.tx_seqr   = agt_tx.tx_sequencer;
    //`uvm_info(get_type_name(),"connect_phase, Connected virtual sequencers to agents",UVM_LOW);   

    agt_rx.rx_monitor.mon_data_rx.connect(scb.rx_mon);
    agt_tx.tx_monitor.mon_data_tx.connect(scb.tx_mon);
    `uvm_info(get_type_name(),"connect_phase, Connected monitors to scoreboard",UVM_LOW);
  endfunction
    
endclass : uart_environment
