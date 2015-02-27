#!/bin/bash
set -e

if [ ! -z ${GCE_ACCOUNT+x} ]; then
  gcloud config set account $GCE_ACCOUNT
fi

if [ "$1" == "bamboo" ]; then
  exec /opt/bamboo/bin/catalina.sh run
else
  exec "$@"
fi
