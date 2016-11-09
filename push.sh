#!/usr/bin/env bash

cd 5.0
./push.sh
cd ..

docker push caleb/varnish:latest
docker push caleb/varnish:5.0
