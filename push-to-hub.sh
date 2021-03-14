#!/usr/bin/env bash
set -Eeuo pipefail

docker push statisticalmice/julia-jupyter:latest
docker push statisticalmice/julia-jupyter:1.5-buster
docker push statisticalmice/julia-jupyter:1.6-buster
