#!/bin/bash
set -e

if [ "$1" == "bamboo" ]; then
  exec /opt/bamboo/bin/catalina.sh run
fi

exec "$@"
