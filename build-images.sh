#!/usr/bin/env bash
set -Eeuo pipefail

docker build -t statisticalmice/julia-jupyter:1.5-buster 1.5-buster/
docker build -t statisticalmice/julia-jupyter:1.6-buster 1.6-buster/
