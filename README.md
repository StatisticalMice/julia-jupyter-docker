# Docker Images for Julia with JupyterLab

Dockerhub [statisticalmice/julia-jupyter](https://hub.docker.com/repository/docker/statisticalmice/julia-jupyter)  
GitHub [statisticalmice/julia-jupyter-docker](https://github.com/StatisticalMice/julia-jupyter-docker)

## Images

Setting JUPYTER_TOKEN environment variable sets the token for Jupyter Lab, this is standard functionality.

### Julia 1.5

`statisticalmice/julia-jupyter:1.5-buster`  
`statisticalmice/julia-jupyter:latest`

### Julia 1.6

`statisticalmice/julia-jupyter:1.6-buster`

### Layers

1. The original Julia images are built on debian:buster-slim
2. These images are built on julia:1.5-buster or julia:1.6-buster
3. Create user 'arthur'
4. Install Mambaforge
5. Install jupyterlab from conda-forge
6. Install IJulia using Julia, which configures the Julia kernel to Jupyter

Versions on 9 Feb 2021:  

|        | 1.5-buster | 1.6-buster |
|---------|-------|-----------|
| Julia   | 1.5.3 | 1.6.0-rc1 |
| Python  | 3.8.8   | 3.8.8     |
| Jupyter | 3.0.10   | 3.0.10     |
| Conda/Mamba   | 4.9.2   | 4.9.2     |
| Debian  | 10.8  | 10.8      |
| Glances | Glances v3.1.6.2 | Glances v3.1.6.2|

In addition 1.6-buster-max has:

|        | 1.6-buster-max |
|---------|-------|
| rr   |  5.4.0 |

## Julia 1.6 'max'

`statisticalmice/julia-jupyter:1.6-buster-max`

This is currently a more 'manual' image with more tools. Example commands you can run include:

jupyter lab --ip 0.0.0.0 --port 8888 

julia -e "using Pluto; Pluto.run(host=\"0.0.0.0\", port=8888, launch_browser=false, require_secret_for_open_links=false, require_secret_for_access=false)"

## Base Images

Julia [Docker official images](https://hub.docker.com/_/julia)  
Julia [language](https://julialang.org)

## Jupyter Docker Stacks

You can find the Docker images built by the Jupyter project using the following link. The `jupyter/datascience-notebook` contains Julia.

These
* have more features
* are much larger
* are based on Ubuntu

Jupyter Docker Stacks [documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/)

[![GitHub Super-Linter](https://github.com/StatisticalMice/julia-jupyter-docker/workflows/Super-Linter/badge.svg)](https://github.com/marketplace/actions/super-linter)
