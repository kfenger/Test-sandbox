#!/bin/bash
set -euo pipefail
cd /opt/malcolm/Malcolm || { echo "Malcolm repo ikke funnet"; exit 1; }

# Start Malcolm. Bruk repository scripts hvis tilgjengelig.
if [ -x ./scripts/start ]; then
  ./scripts/start
else
  # fallback til docker compose
  docker compose up -d
fi

echo "Start-kommando sendt. Vent noen minutter for services å bli klare."
