# VLSIDA-EDA
Conda recipes for VLSIDA projects. Our Anaconda repo is [here](https://anaconda.org/vlsida-eda).


## Installing conda
Run the following command to install conda and setup the environment to build the tools. This
shouldn't interfere with any existing conda installation you may have.
```
./install_conda.sh
```


## Building tools
1. Make changes to the tool's recipe. `meta.yaml` defines the required packages and `build.sh` is
run to build the tool after cloning the repo specified in `meta.yaml`.

1. Activate the conda environment with the following command before using the Makefile:
    ```
    source miniconda/bin/activate
    ```

1. Run the following command to build the tool. This will build the tool and copy the tarball to
`builds` directory. However, it doesn't install the tool on the activated conda environment.
    ```
    make build_<tool_name>
    ```

1. If conda throws an error when building the tool, you need to identify the issue and fix it.
Usually `meta.yaml` has missing/wrong requirements or `build.sh` doesn't follow the instructions to
build that version of the tool.

> **Note**: You can run the following command to install the tool after building it:
> ```
> make install_<tool_name>
> ```

> **Note**: You can run the following command to build AND install the tool:
> ```
> make <tool_name>
> ```

> **Note**: You can run the following command to build all the tools:
> ```
> make build_all
> ```


## Uploading to Anaconda
Create an Anaconda account to be able to upload the builds to Anaconda. Then, run the following
commands to upload a package build:
```
source miniconda/bin/activate
anaconda login
anaconda upload ./builds/<tool_name>/<tool_name>*.tar.bz2
```
