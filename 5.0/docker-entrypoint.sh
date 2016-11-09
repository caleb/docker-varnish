#!/usr/bin/env bash
set -e

if [ "${1}" == "varnish" ]; then
  exec bash -c \
    "exec varnishd -F -u varnish \
     -f $VCL_CONFIG \
     -s malloc,$CACHE_SIZE \
     ${VARNISHD_PARAMS}"
else
  exec "${@}"
fi
