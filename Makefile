CONDA_INSTALLER_URL = "https://repo.anaconda.com/miniconda/Miniconda3-py38_22.11.1-1-Linux-x86_64.sh"
CONDA_INSTALLER_FILE = "miniconda_installer_py38.sh"
CONDA_BASE = "miniconda"

TOOLS = klayout netgen ngspice magic trilinos xyce

# Install miniconda
install_conda: clean
	@curl -s -o ${CONDA_INSTALLER_FILE} ${CONDA_INSTALLER_URL}
	@/bin/bash ${CONDA_INSTALLER_FILE} -b -p ${CONDA_BASE}
	@source ${CONDA_BASE}/bin/activate
	@conda update -y conda
	@conda config --set auto_activate_base false
	@conda config --set anaconda_upload no
	@conda config --add channels conda-forge
	@conda config --add channels local
	@conda init --no-user
	@conda install -y anaconda-client
	@conda install -y conda-build
	@mkdir -p builds
.PHONY: install_conda

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
	@rm -f ${CONDA_INSTALLER_FILE}
	@rm -rf ${CONDA_BASE}
	@rm -rf builds
