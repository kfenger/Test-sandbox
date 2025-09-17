#!/bin/bash
set -e
if [ -z "${OS_PROJECT_NAME:-}" ]; then
  echo "Source your openstack openrc first."
  exit 1
fi

servers=("malcolm-host" "victim-vm" "attacker-vm")
for s in "${servers[@]}"; do
  echo "Ports for server: $s"
  openstack port list --server "$s"
done
