# CyberRange Malcolm sandbox - quick start

## Forutsetninger
- Tilgang til CyberRangeCZ (GUI eller API) og OpenStack-prosjekt
- openstack CLI (python-openstackclient) installert og `source openrc` utført
- SSH keypair registrert i prosjektet (svar i sandbox-definition)

## Deploy (høy-nivå)
1. Commit repo til git.
2. I CyberRangeCZ: opprett en ny Sandbox og importer `sandbox-definition.yml` (eller bruk GUI: opprett sandbox med `topology.yml`).
3. Provision sandbox — plattformen oppretter VMene (malcolm-host, attacker-vm, victim-vm).
4. SSH inn i malcolm-host:
   - last opp `install-malcolm.sh` og `start-malcolm.sh`, kjør `sudo ./install-malcolm.sh`
   - eller bare kjør `sudo ./start-malcolm.sh` hvis Malcolm allerede er installert.
5. Finn port-IDs:
   ```bash
   source openrc
   ./openstack/create_ports.sh
6. Opprett tap service og tap flow:
    # erstatt med aktuelle IDs fra steg 5
    ./openstack/create_tap_service.sh <MALCOLM_PORT_ID>
    # få tap_service_id fra `openstack tap service list`
    ./openstack/create_tap_flow.sh <VICTIM_PORT_ID> <TAP_SERVICE_ID>
7. Verifiser mirrored trafikk:
    På malcolm-host: sudo tcpdump -i <interface_for_malcolm_port> -c 50 -w /tmp/test.pcap
    Sjekk at pcap inneholder trafikk fra 192.168.70.30.
8. Åpne Malcolm GUI (Arkime / OpenSearch Dashboards) og se Suricata/Zeek/Arkime for alerts/logs.
