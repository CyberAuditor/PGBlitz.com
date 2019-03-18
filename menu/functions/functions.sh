#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################

# BAD INPUT
badinput () {
echo
read -p '⛔️ ERROR - Bad Input! | Press [ENTER] ' typed < /dev/tty
}

badinput1 () {
echo
read -p '⛔️ ERROR - Bad Input! | Press [ENTER] ' typed < /dev/tty
question1
}

variable () {
  file="$1"
  if [ ! -e "$file" ]; then echo "$2" > $1; fi
}

readrcloneconfig () {
  touch /opt/appdata/pgblitz/rclone.conf
  mkdir -p /var/pgblitz/rclone/

  gdcheck=$(cat /opt/appdata/pgblitz/rclone.conf | grep gdrive)
  if [ "$gdcheck" != "" ]; then echo "good" > /var/pgblitz/rclone/gdrive.status && gdstatus="good";
  else echo "bad" > /var/pgblitz/rclone/gdrive.status && gdstatus="bad"; fi

  gccheck=$(cat /opt/appdata/pgblitz/rclone.conf | grep "remote = gdrive:/encrypt")
  if [ "$gccheck" != "" ]; then echo "good" > /var/pgblitz/rclone/gcrypt.status && gcstatus="good";
  else echo "bad" > /var/pgblitz/rclone/gcrypt.status && gcstatus="bad"; fi

  tdcheck=$(cat /opt/appdata/pgblitz/rclone.conf | grep tdrive)
  if [ "$tdcheck" != "" ]; then echo "good" > /var/pgblitz/rclone/tdrive.status && tdstatus="good"
  else echo "bad" > /var/pgblitz/rclone/tdrive.status && tdstatus="bad"; fi

}

rcloneconfig () {
  rclone config --config /opt/appdata/pgblitz/rclone.conf
}

keysprocessed () {
  mkdir -p /opt/appdata/pgblitz/keys/processed
  ls -1 /opt/appdata/pgblitz/keys/processed | wc -l > /var/pgblitz/project.keycount
}
