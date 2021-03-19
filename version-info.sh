#!/bin/bash

image=statisticalmice/julia-jupyter:1.6
. version-info-inner.sh
#image=julia-jupyter:1.6
#. version-info-inner.sh

image=statisticalmice/julia-jupyter:1.5
. version-info-inner.sh
#image=julia-jupyter:1.5
#. version-info-inner.sh

image=statisticalmice/julia-jupyter:latest
. version-info-inner.sh

image=julia-jupyter:1.6-R
. version-info-inner.sh

image=julia-jupyter:1.6-custom
. version-info-inner.sh
