#!/usr/bin/env bash

NO_CACHE=${1:-false}

cd 5.0
./build.sh $NO_CACHE
cd ..

docker tag caleb/varnish:5.0 caleb/varnish:latest
