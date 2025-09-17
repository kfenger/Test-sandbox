# Malcolm sandbox for CyberRangeCZ (Metode A - GUI mirroring)

## Forutsetninger
- Admin i CyberRangeCZ
- Repo gjort tilgjengelig for plattform (Git URL)
- SSH public key enten i variables.yml eller som Keypair i GUI

## Steg for deploy
1. Pushe dette repoet til Git (privat eller offentlig som plattform aksepterer).
2. I CyberRangeCZ: Importer sandbox-definition (peker på repo URL).
3. Opprett pool fra definisjon (malcolm-pool). I pool/networking: aktiver **Traffic Mirroring / Monitoring**:
   - Source: lab-net (eller victim-vm)
   - Destination: malcolm-host
   - Direction: BOTH
4. Velg Keypair/SSH (bruk variables.yml eller GUI Credentials).
5. Start et sandbox-instance fra pool.
6. Verifisering:
   - SSH inn på malcolm-host (`10.50.10.10`), kjør `ip a` og `sudo tcpdump -nn -i <monitor-iface> -c 50`.
   - Åpne Malcolm GUI: Arkime / OpenSearch Dashboards for logging/alerts.

## Hvor legge egne filer
- `variables.yml`: legg din `ssh_public_key`.
- Egne PCAPs: enten last opp via CyberRangeCZ som 'files to copy' eller plasser URL i attacker/cloud-init for wget.

## Feilsøk
- Hvis ingen trafikk: sjekk pool/networking mirroring aktivert i GUI.
- Hvis Malcolm ikke starter: sjekk `docker` logs på malcolm-host.
