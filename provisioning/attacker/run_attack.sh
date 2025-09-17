#!/bin/bash
set -euo pipefail

# vent så Malcolm kan komme opp
sleep 30

# sørg for verktøy finnes
if ! command -v nmap >/dev/null 2>&1; then
  apt update && apt install -y nmap netcat-traditional tcpreplay || true
fi

mkdir -p /root/attacks

# 1) Portscan mot victime
nmap -sS -Pn 192.168.70.30 -oN /root/attacks/nmap_scan.txt || true

# 2) Enkel HTTP request for å generere trafikk
for i in $(seq 1 5); do
  printf 'GET / HTTP/1.1\r\nHost: 192.168.70.30\r\n\r\n' | nc 192.168.70.30 80 || true
  sleep 2
done

# 3) Replay pcap hvis tilstede
if [ -f /root/attacks/malicious.pcap ]; then
  tcpreplay --intf1=eth0 /root/attacks/malicious.pcap || true
fi

echo "Angrepsskript ferdig."
