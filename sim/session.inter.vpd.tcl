# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Thu Oct 19 15:30:40 2023
# Designs open: 1
#   Sim: simv
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: uart_tb_top
#   Wave.1: 51 signals
#   Group count = 7
#   Group Group1 signal count = 57
#   Group Group2 signal count = 18
#   Group Group3 signal count = 19
#   Group rx_mon_bfm signal count = 3
#   Group tx_drv_bfm signal count = 4
#   Group tx_mon_bfm signal count = 7
#   Group uart_if signal count = 18
# End_DVE_Session_Save_Info

# DVE version: R-2020.12-SP2-6_Full64
# DVE build date: Feb 19 2022 21:02:37


#<Session mode="Full" path="/home/dguzel/VIPs/uart_vip/sim/session.inter.vpd.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{109 153} {1904 1170}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 571]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
catch { set Stack.1 [gui_share_window -id ${HSPane.1} -type Stack -silent] }
catch { set Class.1 [gui_share_window -id ${HSPane.1} -type Class -silent] }
catch { set Object.1 [gui_share_window -id ${HSPane.1} -type Object -silent] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 571
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 570} {height 389} {dock_state left} {dock_on_new_line true} {child_hier_colhier 449} {child_hier_coltype 206} {child_hier_colpd 0} {child_hier_col1 1} {child_hier_col2 0} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 578]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
catch { set Local.1 [gui_share_window -id ${DLPane.1} -type Local -silent] }
catch { set Member.1 [gui_share_window -id ${DLPane.1} -type Member -silent] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 578
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 389
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 577} {height 389} {dock_state left} {dock_on_new_line true} {child_data_colvariable 336} {child_data_colvalue 109} {child_data_coltype 175} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 522]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 1796
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 522
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 1795} {height 521} {dock_state bottom} {dock_on_new_line true}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings


# Create and position top-level window: TopLevel.2

if {![gui_exist_window -window TopLevel.2]} {
    set TopLevel.2 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.2 TopLevel.2
}
gui_show_window -window ${TopLevel.2} -show_state normal -rect {{74 67} {1917 1170}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.2}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 534} {child_wave_right 1304} {child_wave_colname 265} {child_wave_colvalue 265} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}
gui_update_statusbar_target_frame ${TopLevel.2}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{+UVM_NO_RELNOTES +ntb_random_seed_automatic -cm line +UVM_TESTNAME=uart_rx_tx_test -a simv.log}}
gui_set_env SIMSETUP::SIMEXE {./simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {simv}] } {
gui_sim_run Ucli -exe simv -args { +UVM_NO_RELNOTES +ntb_random_seed_automatic -cm line +UVM_TESTNAME=uart_rx_tx_test -a simv.log -ucligui} -dir ../sim -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
gui_set_precision 1fs
gui_set_time_units 1ns
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {uart_tb_top.uart_if}
gui_load_child_values {uart_tb_top.tx_mon_bfm}
gui_load_child_values {uart_tb_top.tx_drv_bfm}
gui_load_child_values {uart_tb_top.rx_mon_bfm}
gui_load_child_values {uart_tb_top.dut_uart}
gui_load_child_values {uart_tb_top.rx_drv_bfm}


set _session_group_1 Group1
gui_sg_create "$_session_group_1"
set Group1 "$_session_group_1"

gui_sg_addsignal -group "$_session_group_1" { uart_tb_top.uart_if.i_clk uart_tb_top.uart_if.rxEn uart_tb_top.uart_if.txEn uart_tb_top.uart_if.txStart uart_tb_top.uart_if.rxDone uart_tb_top.uart_if.rxBusy uart_tb_top.uart_if.rxError uart_tb_top.uart_if.txDone uart_tb_top.uart_if.txBusy uart_tb_top.uart_if.uart_rx_sended_data_bit uart_tb_top.uart_if.uart_tx_taken_data_bit uart_tb_top.uart_if.uart_rx_sended_data uart_tb_top.uart_if.uart_rx_taken_data uart_tb_top.uart_if.uart_tx_sended_data uart_tb_top.uart_if.rxClk uart_tb_top.uart_if.txClk uart_tb_top.uart_if.uart_tx_taken_data uart_tb_top.uart_if.DATA_BYTE uart_tb_top.dut_uart.clk uart_tb_top.dut_uart.rx uart_tb_top.dut_uart.rxEn uart_tb_top.dut_uart.out uart_tb_top.dut_uart.rxDone uart_tb_top.dut_uart.rxBusy uart_tb_top.dut_uart.rxErr uart_tb_top.dut_uart.tx uart_tb_top.dut_uart.txEn uart_tb_top.dut_uart.txStart uart_tb_top.dut_uart.in uart_tb_top.dut_uart.txDone uart_tb_top.dut_uart.txBusy uart_tb_top.dut_uart.rxClk_o uart_tb_top.dut_uart.txClk_o uart_tb_top.dut_uart.rxClk uart_tb_top.dut_uart.txClk uart_tb_top.dut_uart.CLOCK_RATE uart_tb_top.dut_uart.BAUD_RATE uart_tb_top.rx_drv_bfm.rxClk uart_tb_top.rx_drv_bfm.rxDone uart_tb_top.rx_drv_bfm.uart_rx_data uart_tb_top.rx_drv_bfm.uart_rx_sended_data uart_tb_top.rx_drv_bfm.rxEn uart_tb_top.rx_drv_bfm.temp_data uart_tb_top.rx_mon_bfm.rxDone uart_tb_top.rx_mon_bfm.uart_rx_sended_data uart_tb_top.rx_mon_bfm.uart_rx_taken_data uart_tb_top.tx_drv_bfm.txDone uart_tb_top.tx_drv_bfm.uart_tx_sended_data uart_tb_top.tx_drv_bfm.txEn uart_tb_top.tx_drv_bfm.txStart uart_tb_top.tx_mon_bfm.txClk uart_tb_top.tx_mon_bfm.txDone uart_tb_top.tx_mon_bfm.txStart uart_tb_top.tx_mon_bfm.txEn uart_tb_top.tx_mon_bfm.uart_tx_sended_data uart_tb_top.tx_mon_bfm.uart_tx_taken_data_bit uart_tb_top.tx_mon_bfm.temp_data }
gui_set_radix -radix {decimal} -signals {Sim:uart_tb_top.uart_if.DATA_BYTE}
gui_set_radix -radix {twosComplement} -signals {Sim:uart_tb_top.uart_if.DATA_BYTE}
gui_set_radix -radix {decimal} -signals {Sim:uart_tb_top.dut_uart.CLOCK_RATE}
gui_set_radix -radix {twosComplement} -signals {Sim:uart_tb_top.dut_uart.CLOCK_RATE}
gui_set_radix -radix {decimal} -signals {Sim:uart_tb_top.dut_uart.BAUD_RATE}
gui_set_radix -radix {twosComplement} -signals {Sim:uart_tb_top.dut_uart.BAUD_RATE}

set _session_group_2 Group2
gui_sg_create "$_session_group_2"
set Group2 "$_session_group_2"

gui_sg_addsignal -group "$_session_group_2" { uart_tb_top.uart_if.i_clk uart_tb_top.uart_if.rxEn uart_tb_top.uart_if.txEn uart_tb_top.uart_if.txStart uart_tb_top.uart_if.rxDone uart_tb_top.uart_if.rxBusy uart_tb_top.uart_if.rxError uart_tb_top.uart_if.txDone uart_tb_top.uart_if.txBusy uart_tb_top.uart_if.uart_rx_sended_data_bit uart_tb_top.uart_if.uart_tx_taken_data_bit uart_tb_top.uart_if.uart_rx_sended_data uart_tb_top.uart_if.uart_rx_taken_data uart_tb_top.uart_if.uart_tx_sended_data uart_tb_top.uart_if.rxClk uart_tb_top.uart_if.txClk uart_tb_top.uart_if.uart_tx_taken_data uart_tb_top.uart_if.DATA_BYTE }
gui_set_radix -radix {decimal} -signals {Sim:uart_tb_top.uart_if.DATA_BYTE}
gui_set_radix -radix {twosComplement} -signals {Sim:uart_tb_top.uart_if.DATA_BYTE}

set _session_group_3 Group3
gui_sg_create "$_session_group_3"
set Group3 "$_session_group_3"

gui_sg_addsignal -group "$_session_group_3" { uart_tb_top.dut_uart.clk uart_tb_top.dut_uart.rx uart_tb_top.dut_uart.rxEn uart_tb_top.dut_uart.out uart_tb_top.dut_uart.rxDone uart_tb_top.dut_uart.rxBusy uart_tb_top.dut_uart.rxErr uart_tb_top.dut_uart.tx uart_tb_top.dut_uart.txEn uart_tb_top.dut_uart.txStart uart_tb_top.dut_uart.in uart_tb_top.dut_uart.txDone uart_tb_top.dut_uart.txBusy uart_tb_top.dut_uart.rxClk_o uart_tb_top.dut_uart.txClk_o uart_tb_top.dut_uart.rxClk uart_tb_top.dut_uart.txClk uart_tb_top.dut_uart.CLOCK_RATE uart_tb_top.dut_uart.BAUD_RATE }
gui_set_radix -radix {decimal} -signals {Sim:uart_tb_top.dut_uart.CLOCK_RATE}
gui_set_radix -radix {twosComplement} -signals {Sim:uart_tb_top.dut_uart.CLOCK_RATE}
gui_set_radix -radix {decimal} -signals {Sim:uart_tb_top.dut_uart.BAUD_RATE}
gui_set_radix -radix {twosComplement} -signals {Sim:uart_tb_top.dut_uart.BAUD_RATE}

set _session_group_4 rx_mon_bfm
gui_sg_create "$_session_group_4"
set rx_mon_bfm "$_session_group_4"

gui_sg_addsignal -group "$_session_group_4" { uart_tb_top.rx_mon_bfm.rxDone uart_tb_top.rx_mon_bfm.uart_rx_taken_data uart_tb_top.rx_mon_bfm.uart_rx_sended_data }

set _session_group_5 tx_drv_bfm
gui_sg_create "$_session_group_5"
set tx_drv_bfm "$_session_group_5"

gui_sg_addsignal -group "$_session_group_5" { uart_tb_top.tx_drv_bfm.uart_tx_sended_data uart_tb_top.tx_drv_bfm.txEn uart_tb_top.tx_drv_bfm.txStart uart_tb_top.tx_drv_bfm.txDone }

set _session_group_6 tx_mon_bfm
gui_sg_create "$_session_group_6"
set tx_mon_bfm "$_session_group_6"

gui_sg_addsignal -group "$_session_group_6" { uart_tb_top.tx_mon_bfm.uart_tx_sended_data uart_tb_top.tx_mon_bfm.txEn uart_tb_top.tx_mon_bfm.txStart uart_tb_top.tx_mon_bfm.txDone uart_tb_top.tx_mon_bfm.temp_data uart_tb_top.tx_mon_bfm.txClk uart_tb_top.tx_mon_bfm.uart_tx_taken_data_bit }

set _session_group_7 uart_if
gui_sg_create "$_session_group_7"
set uart_if "$_session_group_7"

gui_sg_addsignal -group "$_session_group_7" { uart_tb_top.uart_if.i_clk uart_tb_top.uart_if.rxBusy uart_tb_top.uart_if.rxEn uart_tb_top.uart_if.uart_rx_sended_data_bit uart_tb_top.uart_if.uart_tx_sended_data uart_tb_top.uart_if.rxDone uart_tb_top.uart_if.uart_rx_taken_data uart_tb_top.uart_if.txEn uart_tb_top.uart_if.txBusy uart_tb_top.uart_if.txStart uart_tb_top.uart_if.txDone uart_tb_top.uart_if.txClk uart_tb_top.uart_if.uart_rx_sended_data uart_tb_top.uart_if.DATA_BYTE uart_tb_top.uart_if.rxClk uart_tb_top.uart_if.uart_tx_taken_data_bit uart_tb_top.uart_if.uart_tx_taken_data uart_tb_top.uart_if.rxError }
gui_set_radix -radix {decimal} -signals {Sim:uart_tb_top.uart_if.DATA_BYTE}
gui_set_radix -radix {twosComplement} -signals {Sim:uart_tb_top.uart_if.DATA_BYTE}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 3073300



# Save global setting...

# Wave/List view global setting
gui_list_create_group_when_add -list -enable
gui_list_create_group_when_add -wave -enable
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_expand -id ${Hier.1} uart_tb_top}
catch {gui_list_select -id ${Hier.1} {uart_tb_top.uart_if}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Class 'Class.1'
gui_list_set_filter -id ${Class.1} -list { {OVM 1} {VMM 1} {All 1} {Object 1} {UVM 1} {RVM 1} }
gui_list_set_filter -id ${Class.1} -text {*}
gui_change_design -id ${Class.1} -design Sim

# Member 'Member.1'
gui_list_set_filter -id ${Member.1} -list { {InternalMember 0} {RandMember 1} {All 0} {BaseMember 0} {PrivateMember 1} {LibBaseMember 0} {AutomaticMember 1} {VirtualMember 1} {PublicMember 1} {ProtectedMember 1} {OverRiddenMember 0} {InterfaceClassMember 1} {StaticMember 1} }
gui_list_set_filter -id ${Member.1} -text {*}

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {uart_tb_top.uart_if}
gui_show_window -window ${Data.1}
catch { gui_list_select -id ${Data.1} {uart_tb_top.uart_if.i_clk uart_tb_top.uart_if.rxEn uart_tb_top.uart_if.txEn uart_tb_top.uart_if.txStart uart_tb_top.uart_if.rxDone uart_tb_top.uart_if.rxBusy uart_tb_top.uart_if.rxError uart_tb_top.uart_if.txDone uart_tb_top.uart_if.txBusy uart_tb_top.uart_if.uart_rx_sended_data_bit uart_tb_top.uart_if.uart_tx_taken_data_bit uart_tb_top.uart_if.uart_rx_sended_data uart_tb_top.uart_if.uart_rx_taken_data uart_tb_top.uart_if.uart_tx_sended_data uart_tb_top.uart_if.rxClk uart_tb_top.uart_if.txClk uart_tb_top.uart_if.uart_tx_taken_data uart_tb_top.uart_if.DATA_BYTE }}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active uart_tb_top ../verif/top/uart_testbench_top.sv
gui_view_scroll -id ${Source.1} -vertical -set 1376
gui_src_set_reusable -id ${Source.1}
# Warning: Class view not found.

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 2770646.911477 3389236.832245
gui_list_add_group -id ${Wave.1} -after {New Group} {Group3}
gui_list_add_group -id ${Wave.1} -after {New Group} {rx_mon_bfm}
gui_list_add_group -id ${Wave.1} -after {New Group} {tx_drv_bfm}
gui_list_add_group -id ${Wave.1} -after {New Group} {tx_mon_bfm}
gui_list_add_group -id ${Wave.1} -after {New Group} {uart_if}
gui_list_select -id ${Wave.1} {uart_tb_top.dut_uart.tx }
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group uart_if  -position in

gui_marker_move -id ${Wave.1} {C1} 3073300
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${HSPane.1}
}
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

