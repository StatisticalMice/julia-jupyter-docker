#!/usr/bin/env bash
set -Eeuo pipefail

docker build -t statisticalmice/julia-jupyter:1.6-buster .
docker push statisticalmice/julia-jupyter:1.6-buster
