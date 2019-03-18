#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705 - Deiteq - Sub7Seven
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
function gcheck {

edition=$(cat /var/pgblitz/pg.edition)
if [ "$edition" == "PG Edition - GDrive" ] || [ "$edition" == "PG Edition - GCE Feed" ]; then
gcheck=$(cat /opt/appdata/pgblitz/rclone.conf 2>/dev/null | grep 'gdrive' | head -n1 | cut -b1-8)
  if [ "$gcheck" != "[gdrive]" ]; then
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  WARNING! - Must Configure RClone First /w >>> gdrive
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

NOTE: You must deploy PG Move or PG Blitz in order to use the backup
function. GDrive configuration is required to move data!

EOF
read -n 1 -s -r -p "Press [ANY] Key to Continue "
echo
bash /opt/pgblitz/menu/tools/tools.sh
exit
  fi
else
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  WARNING! - Backup is Only for GDrive / GCE Editions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

NOTE: If backing up your files, they are located at the folllowing
location: /opt/appdata

You're on OWN because it's too complex for PG to standardize a backup.
Example, you may have a second hard drive, may store it to the same
drive, a NAS... (kind of hard to account for all the situations).
Think you get the idea!

EOF
read -n 1 -s -r -p "Press [ANY] Key to Continue "
echo
bash /opt/pgblitz/menu/tools/tools.sh
exit
fi
}

# Menu Interface
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🚀 PG Tools Interface Menu
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[1] PG Patrol
[2] PG Scan   [Not Ready]
[3] PG Trakt
[4] PG Hetzner iGPU / GPU HW-Transcode
[5] PG DNS changer 
[6] Personal VPN Service Installer
[7] System & Network Auditor
[8] TroubleShoot ~ PreInstaller
[Z] Exit

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

# Standby
read -p 'Type a Number | Press [ENTER]: ' typed < /dev/tty

  if [ "$typed" == "1" ]; then
  bash /opt/pgblitz/menu/pgcloner/pgpatrol.sh
  bash /opt/pgpatrol/pgpatrol.sh
elif [ "$typed" == "2" ]; then
  bash /opt/pgblitz/menu/pgscan/pgscan.sh
elif [ "$typed" == "3" ]; then
  bash /opt/pgblitz/menu/pgtrakt/pgtrakt.sh
elif [ "$typed" == "4" ]; then
  bash /opt/pgblitz/menu/hetzner/pghetznerigpu.sh
elif [ "$typed" == "5" ]; then
  bash /opt/pgblitz/menu/pgdnsswitcher/pgdnschanger.sh  
elif [ "$typed" == "6" ]; then
  echo 'vpnserver' > /var/pgblitz/type.choice && bash /opt/pgblitz/menu/core/scripts/main.sh
elif [ "$typed" == "7" ]; then
  bash /opt/pgblitz/menu/network/network.sh
elif [ "$typed" == "8" ]; then
  bash /opt/pgblitz/menu/tshoot/tshoot.sh
elif [ "$typed" == "Z" ] || [ "$typed" == "z" ]; then
  exit
else
  bash /opt/pgblitz/menu/tools/tools.sh
  exit
fi

bash /opt/pgblitz/menu/tools/tools.sh
exit
