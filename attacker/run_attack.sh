#!/bin/bash
set -e
# sleep for platform to be ready
sleep 30
# 1) portscan
nmap -sS -Pn 192.168.70.30 -oN /root/attacks/nmap_scan.txt
# 2) simple http request to generate traffic
for i in {1..5}; do
  echo "GET / HTTP/1.1\r\nHost: 192.168.70.30\r\n\r\n" | nc 192.168.70.30 80 || true
  sleep 2
done
# 3) (valgfritt) replay pcap hvis tilgjengelig
if [ -f /root/attacks/malicious.pcap ]; then
  tcpreplay --intf1=eth0 /root/attacks/malicious.pcap
fi
