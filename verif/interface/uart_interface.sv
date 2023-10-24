interface uart_interface #(int DATA_BYTE = 1)(
	input bit i_clk
);
	bit 	    rxEn;

	bit 	    txEn;
	bit 	  	txStart;

	logic 		rxDone;
	logic 		rxBusy;
	logic 		rxError;

	logic		txDone;
	logic 		txBusy; 

	bit 	    uart_rx_sended_data_bit;
	logic 		uart_tx_taken_data_bit;

	logic [DATA_BYTE*8-1:0] uart_rx_sended_data;
	logic [DATA_BYTE*8-1:0] uart_rx_taken_data;
	logic [DATA_BYTE*8-1:0] uart_tx_sended_data;
	logic [DATA_BYTE*8-1:0] uart_tx_taken_data;

	logic 		rxClk;
	logic		txClk;

	clocking rtl_cb @(posedge i_clk);
		input 	     uart_rx_sended_data_bit;
		input 	     rxEn;

		input 	     txEn;
		input 	  	 txStart;

		output 		 rxDone;
		output 		 rxBusy;
		output 		 rxError;

		output 		 uart_tx_taken_data_bit;
		output		 txDone;
		output 		 txBusy; 

		input  		 uart_tx_sended_data;
		output 		 uart_rx_taken_data;
	endclocking

	clocking rx_drv_cb @(posedge i_clk);
		input 		 rxDone;
		output 	     uart_rx_sended_data_bit;
		output 	     rxEn;

		output 		 uart_rx_sended_data;
	endclocking

	clocking rx_mon_cb @(posedge i_clk);
		input 		 rxDone;

		input		 uart_rx_taken_data;
		input		 uart_rx_sended_data;
	endclocking

	clocking tx_drv_cb @(posedge i_clk);
		output 	     txEn;
		output 	  	 txStart;

		input		 txDone;
		input 		 txBusy; 

		output		 uart_tx_sended_data;
	endclocking

	clocking tx_mon_cb @(posedge i_clk);
		input 	     txEn;
		input 	  	 txStart;
		input		 txDone;
		input 		 uart_tx_taken_data_bit;

		input 		 uart_tx_sended_data;
	endclocking


	modport DUT    (clocking rtl_cb, input i_clk);
	modport RX_DRV (clocking rx_drv_cb, input i_clk);
	modport RX_MON (clocking rx_mon_cb, input i_clk);
	modport TX_DRV (clocking tx_drv_cb, input i_clk);
	modport TX_MON (clocking tx_mon_cb, input i_clk);

endinterface: uart_interface