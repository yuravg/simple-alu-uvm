MAKE = make --no-print-directory

export ALU_HOME = ${PWD}/../..
export RTL_HOME = ${ALU_HOME}/rtl
export DV_HOME  = ${ALU_HOME}/dv

VLOG_COV = +cover=sbceftx
VLOG = vlog $(VLOG_COV) -incr -sv +acc -timescale 1ns/1ps +incdir+$(UVM_HOME)/src
VOPT = vopt

VSIM_MODE = "-c"
VSIM_UVM = +UVM_TESTNAME=$(TEST) -l simulate.log +UVM_NO_RELNOTES
VSIM = $(if $(findstring -c,$(VSIM_MODE)),\
vsim -c $(VSIM_UVM) -coverage $(DUT)_tb_opt -do "coverage save $(COV_DB) -onexit; run -all; exit",\
vsim -gui $(VSIM_UVM) -coverage $(DUT)_tb_opt -do "coverage save $(COV_DB) -onexit; source ./wave_$(DUT)_tb.do; onfinish stop; run -all; wave zoom full;" &)

SEED   = 1
TEST   = alu_test
DUT    = alu
COV_DB = simv.ucdb

.PHONY: all compile opt simulate waveform coverage clean

all: compile opt simulate

compile:
	$(VLOG) -f $(DV_HOME)/tb/alu.f $(OPT)

opt:
	$(VOPT) $(DUT)_tb -o $(DUT)_tb_opt

simulate:
	$(VSIM)

waveform:
	$(MAKE) simulate VSIM_MODE=-gui

coverage:
	vcover summary $(COV_DB)

coverage-detail:
	vcover report -details $(COV_DB)

coverage-vsim:
	vsim -cvgperinstance -viewcov $(COV_DB)

clean:
	@rm -rf *.log *.rpt
	@rm -rf *~ work *.wlf* questa.tops transcript *.vstf wlft??????
	@rm -rf regression
