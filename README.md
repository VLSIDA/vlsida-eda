# VLSIDA-EDA
Conda recipes for VLSIDA projects.


## Installing conda
Run the following command to install conda:
```
./install_conda.sh
```


## Building tools
Run the following command to build all tools:
```
make build_all
```

Run the following command to build a specific tool:
```
make build_<tool_name>
```


## Uploading to Anaconda
Create an Anaconda account to be able to upload the builds to Anaconda.
Then, run the following commands to upload a package build:
```
anaconda login
anaconda upload ./builds/<tool_name>/<tool_name>*.tar.bz2
```
