#!/bin/bash
# https://www.youtube.com/@xiaowenlaile
# https://www.youtube.com/channel/UCyI0W67BSnkAdzToVLH97Cg
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "This script requires root privileges."
  exit 1
fi

CONFIG_FILE="/usr/local/etc/xray/config.json"

TEMP_FILE=$(mktemp)
jq 'del(.routing.rules[] | select(.ip[] | contains("geoip:cn")))' \
  "$CONFIG_FILE" > "$TEMP_FILE"
mv $TEMP_FILE $CONFIG_FILE
chmod 644 $CONFIG_FILE

systemctl restart xray.service

echo "OK"
