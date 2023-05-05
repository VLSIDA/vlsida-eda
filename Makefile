CONDA_BASE = "miniconda"

TOOLS = klayout netgen ngspice magic trilinos xyce

# Build a tool using its recipe
build_%:
	@conda build -q $*/
	@mkdir -p builds/$*
	@cp -f ${CONDA_BASE}/conda-bld/linux-64/$** builds/$*/

# Install a tool using its local build
install_%:
	@conda install -y -c local $*

# Build and install the tool
$(TOOLS):
	@$(MAKE) build_$@
	@$(MAKE) install_$@
.PHONY: $(TOOLS)

# Build all tools (but don't install them)
build_all: $(foreach T, $(TOOLS), build_$T)

# Build and install all tools
all: $(TOOLS)
.PHONY: all

clean:
	@rm -rf builds
