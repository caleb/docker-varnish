#!/usr/bin/env bash
set -e

if [ "${1}" == "varnish" ]; then
  if [ -z "${STORAGE_SPEC}" ]; then
    if [ ${STORAGE_KIND} = 'file' ]; then
      touch "${STORAGE_FILE}"
      chown varnish "${STORAGE_FILE}"

      STORAGE_SPEC="${STORAGE_KIND},${STORAGE_FILE},${CACHE_SIZE}"
    else
      STORAGE_SPEC="${STORAGE_KIND},${CACHE_SIZE}"
    fi
  fi

  exec bash -c \
    "exec varnishd -j unix,user=varnish \
     -F \
     -f ${VCL_CONFIG} \
     -s ${STORAGE_SPEC} \
     ${VARNISHD_PARAMS}"
else
  exec "${@}"
fi
