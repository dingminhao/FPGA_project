# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ACTIVE_LINE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HCNTMAX" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IGNOR_EAVNUM" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INVEAV" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INVSAV" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VCNTMAX" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VCNTSTART" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VEAV" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VSAV" -parent ${Page_0}
  ipgui::add_param $IPINST -name "VSYNC_TIME" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WAIT24_VLINE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WAIT_INVLINE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WAIT_VLINE" -parent ${Page_0}


}

proc update_PARAM_VALUE.ACTIVE_LINE { PARAM_VALUE.ACTIVE_LINE } {
	# Procedure called to update ACTIVE_LINE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ACTIVE_LINE { PARAM_VALUE.ACTIVE_LINE } {
	# Procedure called to validate ACTIVE_LINE
	return true
}

proc update_PARAM_VALUE.HCNTMAX { PARAM_VALUE.HCNTMAX } {
	# Procedure called to update HCNTMAX when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HCNTMAX { PARAM_VALUE.HCNTMAX } {
	# Procedure called to validate HCNTMAX
	return true
}

proc update_PARAM_VALUE.IGNOR_EAVNUM { PARAM_VALUE.IGNOR_EAVNUM } {
	# Procedure called to update IGNOR_EAVNUM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IGNOR_EAVNUM { PARAM_VALUE.IGNOR_EAVNUM } {
	# Procedure called to validate IGNOR_EAVNUM
	return true
}

proc update_PARAM_VALUE.INVEAV { PARAM_VALUE.INVEAV } {
	# Procedure called to update INVEAV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INVEAV { PARAM_VALUE.INVEAV } {
	# Procedure called to validate INVEAV
	return true
}

proc update_PARAM_VALUE.INVSAV { PARAM_VALUE.INVSAV } {
	# Procedure called to update INVSAV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INVSAV { PARAM_VALUE.INVSAV } {
	# Procedure called to validate INVSAV
	return true
}

proc update_PARAM_VALUE.VCNTMAX { PARAM_VALUE.VCNTMAX } {
	# Procedure called to update VCNTMAX when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VCNTMAX { PARAM_VALUE.VCNTMAX } {
	# Procedure called to validate VCNTMAX
	return true
}

proc update_PARAM_VALUE.VCNTSTART { PARAM_VALUE.VCNTSTART } {
	# Procedure called to update VCNTSTART when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VCNTSTART { PARAM_VALUE.VCNTSTART } {
	# Procedure called to validate VCNTSTART
	return true
}

proc update_PARAM_VALUE.VEAV { PARAM_VALUE.VEAV } {
	# Procedure called to update VEAV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VEAV { PARAM_VALUE.VEAV } {
	# Procedure called to validate VEAV
	return true
}

proc update_PARAM_VALUE.VSAV { PARAM_VALUE.VSAV } {
	# Procedure called to update VSAV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VSAV { PARAM_VALUE.VSAV } {
	# Procedure called to validate VSAV
	return true
}

proc update_PARAM_VALUE.VSYNC_TIME { PARAM_VALUE.VSYNC_TIME } {
	# Procedure called to update VSYNC_TIME when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VSYNC_TIME { PARAM_VALUE.VSYNC_TIME } {
	# Procedure called to validate VSYNC_TIME
	return true
}

proc update_PARAM_VALUE.WAIT24_VLINE { PARAM_VALUE.WAIT24_VLINE } {
	# Procedure called to update WAIT24_VLINE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WAIT24_VLINE { PARAM_VALUE.WAIT24_VLINE } {
	# Procedure called to validate WAIT24_VLINE
	return true
}

proc update_PARAM_VALUE.WAIT_INVLINE { PARAM_VALUE.WAIT_INVLINE } {
	# Procedure called to update WAIT_INVLINE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WAIT_INVLINE { PARAM_VALUE.WAIT_INVLINE } {
	# Procedure called to validate WAIT_INVLINE
	return true
}

proc update_PARAM_VALUE.WAIT_VLINE { PARAM_VALUE.WAIT_VLINE } {
	# Procedure called to update WAIT_VLINE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WAIT_VLINE { PARAM_VALUE.WAIT_VLINE } {
	# Procedure called to validate WAIT_VLINE
	return true
}


proc update_MODELPARAM_VALUE.INVSAV { MODELPARAM_VALUE.INVSAV PARAM_VALUE.INVSAV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INVSAV}] ${MODELPARAM_VALUE.INVSAV}
}

proc update_MODELPARAM_VALUE.INVEAV { MODELPARAM_VALUE.INVEAV PARAM_VALUE.INVEAV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INVEAV}] ${MODELPARAM_VALUE.INVEAV}
}

proc update_MODELPARAM_VALUE.VSAV { MODELPARAM_VALUE.VSAV PARAM_VALUE.VSAV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VSAV}] ${MODELPARAM_VALUE.VSAV}
}

proc update_MODELPARAM_VALUE.VEAV { MODELPARAM_VALUE.VEAV PARAM_VALUE.VEAV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VEAV}] ${MODELPARAM_VALUE.VEAV}
}

proc update_MODELPARAM_VALUE.WAIT_INVLINE { MODELPARAM_VALUE.WAIT_INVLINE PARAM_VALUE.WAIT_INVLINE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WAIT_INVLINE}] ${MODELPARAM_VALUE.WAIT_INVLINE}
}

proc update_MODELPARAM_VALUE.WAIT_VLINE { MODELPARAM_VALUE.WAIT_VLINE PARAM_VALUE.WAIT_VLINE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WAIT_VLINE}] ${MODELPARAM_VALUE.WAIT_VLINE}
}

proc update_MODELPARAM_VALUE.VSYNC_TIME { MODELPARAM_VALUE.VSYNC_TIME PARAM_VALUE.VSYNC_TIME } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VSYNC_TIME}] ${MODELPARAM_VALUE.VSYNC_TIME}
}

proc update_MODELPARAM_VALUE.WAIT24_VLINE { MODELPARAM_VALUE.WAIT24_VLINE PARAM_VALUE.WAIT24_VLINE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WAIT24_VLINE}] ${MODELPARAM_VALUE.WAIT24_VLINE}
}

proc update_MODELPARAM_VALUE.ACTIVE_LINE { MODELPARAM_VALUE.ACTIVE_LINE PARAM_VALUE.ACTIVE_LINE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ACTIVE_LINE}] ${MODELPARAM_VALUE.ACTIVE_LINE}
}

proc update_MODELPARAM_VALUE.IGNOR_EAVNUM { MODELPARAM_VALUE.IGNOR_EAVNUM PARAM_VALUE.IGNOR_EAVNUM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IGNOR_EAVNUM}] ${MODELPARAM_VALUE.IGNOR_EAVNUM}
}

proc update_MODELPARAM_VALUE.HCNTMAX { MODELPARAM_VALUE.HCNTMAX PARAM_VALUE.HCNTMAX } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HCNTMAX}] ${MODELPARAM_VALUE.HCNTMAX}
}

proc update_MODELPARAM_VALUE.VCNTMAX { MODELPARAM_VALUE.VCNTMAX PARAM_VALUE.VCNTMAX } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VCNTMAX}] ${MODELPARAM_VALUE.VCNTMAX}
}

proc update_MODELPARAM_VALUE.VCNTSTART { MODELPARAM_VALUE.VCNTSTART PARAM_VALUE.VCNTSTART } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VCNTSTART}] ${MODELPARAM_VALUE.VCNTSTART}
}

