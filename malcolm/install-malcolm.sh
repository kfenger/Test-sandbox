#!/bin/bash
set -euo pipefail
# Kjør på malcolm-host som root eller sudo
WORKDIR=/opt/malcolm
mkdir -p "$WORKDIR"
cd "$WORKDIR"
# last ned release artifacts (bruk release zip fra Malcolm - alternativ: clone repo)
# enkel clone (krever internet)
if [ ! -d "$WORKDIR/Malcolm" ]; then
  git clone https://github.com/cisagov/Malcolm.git Malcolm
fi
cd Malcolm
# bruk malcolm scripts for å installere
# noen Malcolm deployments leveres med scripts/start
if [ -x ./scripts/start ]; then
  ./scripts/start
else
  echo "Start Malcolm med: ./scripts/start eller følg Malcolm docs"
fi
