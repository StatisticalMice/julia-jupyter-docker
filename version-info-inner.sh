#!/bin/bash

echo
echo $image
echo 
docker run -it --rm $image bash -c "julia -version; python --version; jupyter --version | grep lab;"
docker run -it --rm $image bash -c "conda --version; echo Debian:; cat /etc/debian_version; glances --version"
echo
