#!/usr/bin/env bash
set -Eeuo pipefail

docker pull statisticalmice/julia-jupyter:latest
docker pull statisticalmice/julia-jupyter:1.5-buster
docker pull statisticalmice/julia-jupyter:1.6-buster
docker pull statisticalmice/julia-jupyter:1.6-buster-max
