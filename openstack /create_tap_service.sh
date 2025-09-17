#!/bin/bash
set -e
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <MALCOLM_PORT_ID>"
  exit 1
fi
MALCOLM_PORT=$1
# create tap service (neutron client syntax eller openstack plugin)
# two options: openstack tap service create or neutron tap-service-create depending på miljø.
if command -v openstack >/dev/null 2>&1; then
  openstack tap service create --name malcolm-tap --port "$MALCOLM_PORT"
else
  echo "Install openstack CLI (python-openstackclient) or neutron client."
  exit 1
fi
