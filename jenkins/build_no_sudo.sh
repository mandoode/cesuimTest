#!/bin/bash
set -x

cd ..

if docker build -t "cesium" .
then
    echo "docker image built with success..."
else
    echo ERROR: Failed to make docker image. 1>&2
    exit 1 # terminate and indicate error
fi

docker images

