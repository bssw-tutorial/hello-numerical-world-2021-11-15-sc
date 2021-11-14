# example usage:
# ./heat alpha=8.2e-10 lenx=0.25 dx=0.01 dt=100 maxt=5580000 outi=100 savi=1000 bc0=233.15 bc1=294.261 ic="const(294.261)"
PTOOL ?= visit
RUNAME ?= heat_results
RM = rm

HDR = Double.H
SRC = heat.C utils.C args.C exact.C ftcs.C upwind15.C crankn.C
OBJ = $(SRC:.C=.o)
GCOV = $(SRC:.C=.C.gcov) $(SRC:.C=.gcda) $(SRC:.C=.gcno) $(HDR:.H=.H.gcov)
EXE = heat
XFLAGS = -Iinclude -DHEAT_VERSION_MAJOR=0 -DHEAT_VERSION_MINOR=5

# Implicit rule for object files
%.o : %.C
	$(CXX) -c $(CXXFLAGS) $(XFLAGS) $(CPPFLAGS) $< -o $@

# Linking the final heat app
heat: $(OBJ)
	$(CXX) -o heat $(OBJ) $(LDFLAGS) -lm

check_clean:
	$(RM) -rf check check_crankn check_upwind15

clean: check_clean
	$(RM) -f $(OBJ) $(EXE) $(GCOV)

plot:
	@./tools/run_$(PTOOL).sh $(RUNAME)

# various test configurations
include tests.mk
