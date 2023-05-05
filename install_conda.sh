#!/bin/bash
CONDA_INSTALLER_URL="https://repo.anaconda.com/miniconda/Miniconda3-py38_22.11.1-1-Linux-x86_64.sh"
CONDA_INSTALLER_FILE="miniconda_installer_py38.sh"
CONDA_BASE="miniconda"

# Remove the existing conda
rm -rf ${CONDA_BASE}

# Install miniconda
curl -s -o ${CONDA_INSTALLER_FILE} ${CONDA_INSTALLER_URL}
/bin/bash ${CONDA_INSTALLER_FILE} -b -p ${CONDA_BASE}

# Activate conda
source ${CONDA_BASE}/bin/activate

# Setup the environment to build the tools
conda update -y conda
conda config --set auto_activate_base false
conda config --set anaconda_upload no
conda config --add channels conda-forge
conda config --add channels local
conda install -y anaconda-client
conda install -y conda-build
