#!/usr/bin/env bash
set -Eeuo pipefail

docker build -t statisticalmice/julia-jupyter:1.5-buster .
docker push statisticalmice/julia-jupyter:1.5-buster
