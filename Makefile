CONDA_BASE = "miniconda"

TOOLS = klayout netgen ngspice magic trilinos xyce

# Build a tool using its recipe
build_%:
	@conda build -q $*/
	@mkdir -p builds/$*
	@cp -f ${CONDA_BASE}/conda-bld/linux-64/$** builds/$*/

# Instal a tools using cached build
install_%:
	@conda install -y -c local $*

# Install a tool from its local build
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
	@conda deactivate || true
	@rm -rf ${CONDA_BASE}
	@rm -rf builds
