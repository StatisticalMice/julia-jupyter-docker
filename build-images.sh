#!/usr/bin/env bash
set -Eeuo pipefail

docker build -t julia-jupyter:1.5 1.5-buster/
docker build -t julia-jupyter:1.6 1.6-buster/
#docker build -t julia-jupyter:1.6-R 1.6-R/
#docker build -t julia-jupyter:1.6-custom 1.6-custom/
