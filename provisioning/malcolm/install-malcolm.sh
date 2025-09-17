#!/bin/bash
set -euo pipefail
# Kjør som root på malcolm-host
WORKDIR=/opt/malcolm
mkdir -p "$WORKDIR"
cd "$WORKDIR"

# Installer pakker hvis nødvendig
apt update
apt install -y git docker.io docker-compose

# Klon Malcolm (krever internet)
if [ ! -d "$WORKDIR/Malcolm" ]; then
  git clone https://github.com/cisagov/Malcolm.git Malcolm
fi

# Prepare persist directory (mappes til volum)
mkdir -p /opt/malcolm/persist
chown -R root:root /opt/malcolm

echo "Install script ferdig. Kjør start-malcolm.sh for å starte Malcolm."
