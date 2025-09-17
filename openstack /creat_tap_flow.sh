#!/bin/bash
set -e
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <VICTIM_PORT_ID> <TAP_SERVICE_ID>"
  exit 1
fi
VICTIM_PORT=$1
TAP_SERVICE_ID=$2

openstack tap flow create --name victim-to-malcolm --port "$VICTIM_PORT" --tap-service "$TAP_SERVICE_ID" --direction BOTH
