#!/usr/bin/env bash

NO_CACHE=${1:-false}

docker build --no-cache=$NO_CACHE --tag=caleb/varnish:5.0 .
