# UART_VIP

Verification IP of fully parameterized two agents UART

## Configuration Parameters

CLOCK_RATE               : Clock Rate

BAUD_RATE                : Baud Rate 

DATA_BYTE                : Transaction byte number

active                   : Agent active or passive enumerator

has_functional_coverage  : Agent has functional coverage

has_scoreboard           : Agent has scoreboard

Detailed description of UART can be found in :
(https://en.wikipedia.org/wiki/Universal_asynchronous_receiver-transmitter)

## Transaction
Here an example transaction between UART VIP and UART design :

![image](https://github.com/DenizzzGuzell/UART_VIP/assets/81621705/7a5c5a36-200e-4cc8-8251-8a75883e4480)


Configuration of Transaction given above is :

![image](https://github.com/DenizzzGuzell/UART_VIP/assets/81621705/781355cb-9e33-4773-956b-668c0efcc87a)

## Test Names and Results
Created test name for writing and reading at the same time is uart_rx_tx_test

Created test name for writing only is spi_tx_test

Created test name for reading only is spi_rx_test

Created test name for reseting is uart_reset_test

## Coverage
Given test above named spi_wr_test code coverage is :

![image](https://github.com/DenizzzGuzell/UART_VIP/assets/81621705/82be4fa3-6574-4191-9ea1-4a561879bb4b)

## To do 
Functional Coverage and Assertion will be added.

New RTL design will be verified. This one not works properly.

