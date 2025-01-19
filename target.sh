#!/bin/bash
# https://www.youtube.com/@xiaowenlaile
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "This script requires root privileges."
  exit 1
fi

CONFIG_FILE="/usr/local/etc/xray/config.json"

TARGET="$1:443"
SN="$1"

TEMP_FILE=$(mktemp)
jq --arg new_target "$TARGET" \
    --arg new_sn "$SN" \
    '.inbounds[0].streamSettings.realitySettings.target = $new_target
    | .inbounds[0].streamSettings.realitySettings.serverNames[0] = $new_sn' \
    "$CONFIG_FILE" > "$TEMP_FILE"
mv $TEMP_FILE $CONFIG_FILE

echo "OK"
