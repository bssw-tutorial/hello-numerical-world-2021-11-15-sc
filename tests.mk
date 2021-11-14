#
# Run for a long time with random initial condition
# and confirm linear stead-state upon termination
#
check/check_soln_final.curve:
	./heat runame=check outi=0 maxt=-5e-8 ic="rand(0,0.2,2)"

check: heat check/check_soln_final.curve
	cat check/check_soln_final.curve
	./check.sh check/check_soln_final.curve 0

check_ftcs: check

check_crankn/check_crankn_soln_final.curve:
	./heat alg=crankn runame=check_crankn outi=0 maxt=-5e-8 ic="rand(0,0.2,2)"

check_crankn: heat check_crankn/check_crankn_soln_final.curve
	cat check_crankn/check_crankn_soln_final.curve
	./check.sh check_crankn/check_crankn_soln_final.curve

check_upwind15/check_upwind15_soln_final.curve:
	./heat alg=upwind15 runame=check_upwind15 outi=0 maxt=40 ic="rand(0,0.2,2)"

check_upwind15: heat check_upwind15/check_upwind15_soln_final.curve
	cat check_upwind15/check_upwind15_soln_final.curve
	./check.sh check_upwind15/check_upwind15_soln_final.curve

check_all: check_ftcs check_crankn check_upwind15
