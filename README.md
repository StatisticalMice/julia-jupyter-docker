# Docker Images for Julia with JupyterLab

Dockerhub [statisticalmice/julia-jupyter](https://hub.docker.com/repository/docker/statisticalmice/julia-jupyter)

GitHub [statisticalmice/julia-jupyter-docker](https://github.com/StatisticalMice/julia-jupyter-docker)

## Images

### Julia 1.5

`statisticalmice/julia-jupyter:1.5-buster`

`statisticalmice/julia-jupyter:latest`

### Julia 1.6

`statisticalmice/julia-jupyter:1.6-buster`

### Layers

1. The original Julia images are built on debian:buster-slim
2. These images are built on julia:1.5-buster or julia:1.6-buster
3. Install wget
4. Create user 'arthur'
5. Install Miniconda3
6. Install jupyterlab from conda-forge
7. Install IJulia using Julia, which configures the Julia kernel to Jupyter

Versions on 4 Feb 2021:
Julia       1.5.3 / 1.6.0-beta1
Python      3.8.5
jupyter lab 3.0.7
conda       4.9.2
Debian      10.7

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
