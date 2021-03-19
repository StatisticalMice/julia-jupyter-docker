#!/usr/bin/env bash
set -Eeuo pipefail

docker build -t statisticalmice/julia-jupyter:1.5-local 1.5-buster/
docker build -t statisticalmice/julia-jupyter:1.6-local 1.6-buster/
docker build -t statisticalmice/julia-jupyter:1.6-R-local 1.6-R/
docker build -t statisticalmice/julia-jupyter:1.6-custom 1.6-custom/
