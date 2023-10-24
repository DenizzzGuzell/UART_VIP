dir_verif	  := ../verif
dir_design 	  := ../design

dir_agents    := $(dir_verif)/agents
dir_interface := $(dir_verif)/interface
dir_rx_agent  := $(dir_agents)/rx_agent
dir_tx_agent  := $(dir_agents)/tx_agent
dir_env 	  := $(dir_verif)/environment
dir_seq 	  := $(dir_verif)/sequences
dir_test 	  := $(dir_verif)/test
dir_tb 	   	  := $(dir_verif)/top

COVERAGE ?= yes

VLOG 		  = vlogan
VLOG_SIM_OPTS = -nc -sverilog -full64 -ntb_opts uvm-1.1 +define+UVM_HDL_MAX_WIDTH=128 +define+ASSERT_ON
VLOG_RTL_OPTS = -nc -full64

VCS 		= vcs
VCS_OPTS 	= -nc -full64 -sverilog -ntb_opts uvm-1.1 -debug_access+all+f -lca -Mdir=LIBS/csrc +warn=all +vcs+vcdpluson -sva_bind_enable

SIMV_OPTS = +UVM_NO_RELNOTES +ntb_random_seed_automatic -gui

TEST_NAME ?= uart_rx_tx_test
#Tests are given below ::
#TEST_NAME ?= uart_reset_test
#TEST_NAME ?= uart_rx_test
#TEST_NAME ?= uart_tx_test

ifeq ($(COVERAGE),yes)
	VCS_OPTS+=-cm line
	SIMV_OPTS+=-cm line
endif

clean_run : clean compile_sim compile_rtl elab test
fast_run  : compile_sim compile_rtl elab test
only_sim  : test

compile_sim:
	mkdir LIBS
	$(VLOG) $(VLOG_SIM_OPTS)

	$(VLOG) $(VLOG_SIM_OPTS) +incdir+$(dir_rx_agent) $(dir_rx_agent)/uart_agent_pkg_rx.sv
	$(VLOG) $(VLOG_SIM_OPTS) +incdir+$(dir_tx_agent) $(dir_tx_agent)/uart_agent_pkg_tx.sv
	$(VLOG) $(VLOG_SIM_OPTS) +incdir+$(dir_seq) 	 $(dir_seq)/uart_seq_lib_pkg.sv
	$(VLOG) $(VLOG_SIM_OPTS) +incdir+$(dir_env) 	 $(dir_env)/uart_environment_pkg.sv
	$(VLOG) $(VLOG_SIM_OPTS) +incdir+$(dir_test) 	 $(dir_test)/uart_test_lib_pkg.sv

	$(VLOG) $(VLOG_SIM_OPTS) $(dir_rx_agent)/uart_driver_BFM_rx.sv
	$(VLOG) $(VLOG_SIM_OPTS) $(dir_rx_agent)/uart_monitor_BFM_rx.sv
	$(VLOG) $(VLOG_SIM_OPTS) $(dir_tx_agent)/uart_driver_BFM_tx.sv
	$(VLOG) $(VLOG_SIM_OPTS) $(dir_tx_agent)/uart_monitor_BFM_tx.sv

	$(VLOG) $(VLOG_SIM_OPTS) $(dir_interface)/uart_interface.sv

	$(VLOG) $(VLOG_SIM_OPTS) -timescale=1ns/10ps ${dir_tb}/uart_testbench_top.sv

compile_rtl:
	$(VLOG) $(VLOG_RTL_OPTS) $(dir_design)/BaudRateGenerator.v
	$(VLOG) $(VLOG_RTL_OPTS) $(dir_design)/Uart8.v
	$(VLOG) $(VLOG_RTL_OPTS) $(dir_design)/Uart8Receiver.v
	$(VLOG) $(VLOG_RTL_OPTS) $(dir_design)/Uart8Transmitter.v
elab:
	$(VCS) $(VCS_OPTS) uart_tb_top -l comp.log

test:
	 ./simv $(SIMV_OPTS) +UVM_TESTNAME=$(TEST_NAME) -l simv.log

clean:
	rm -rf AN.DB csrc simv* ucli* LIBS *.log 64





