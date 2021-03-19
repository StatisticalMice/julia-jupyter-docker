#!/bin/bash

image=statisticalmice/julia-jupyter:1.6-buster
echo
echo $image
echo 
docker run -it --rm $image bash -c "julia -version; python --version; jupyter --version | grep lab; conda --version; echo Debian:; cat /etc/debian_version; glances --version"
echo

image=statisticalmice/julia-jupyter:1.5-buster
echo $image
echo 
docker run -it --rm $image bash -c "julia -version; python --version; jupyter --version | grep lab; conda --version; echo Debian:; cat /etc/debian_version; glances --version"
