#!/bin/bash
set -e
# Forutsetter at install-malcolm.sh er kjørt eller Malcolm finnes i /opt/malcolm/Malcolm
cd /opt/malcolm/Malcolm || exit 1
# Start Malcolm (kan ta mange minutter)
if [ -x ./scripts/start ]; then
  ./scripts/start
  echo "Malcolm startet. Følg logs med ./scripts/logs"
else
  echo "Ingen start-script funnet. Sjekk /opt/malcolm/Malcolm"
fi
