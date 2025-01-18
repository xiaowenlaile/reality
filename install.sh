#!/bin/bash
# https://www.youtube.com/@xiaowenlaile
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "This script requires root privileges."
  exit 1
fi

DATA_DIR="$HOME/.xray"
PRIVATE_KEY_FILE="$DATA_DIR/private_key"
PUBLIC_KEY_FILE="$DATA_DIR/public_key"
UUID_FILE="$DATA_DIR/uuid"

mkdir -p "$DATA_DIR"
chmod 700 "$DATA_DIR"

if [[ ! -f "$PRIVATE_KEY_FILE" || ! -f "$PUBLIC_KEY_FILE" ]]; then
  GENKEY=$(xray x25519)
  PRIVATE_KEY=$(echo "$GENKEY" | awk '/Private key:/ {print $3}')
  echo "$PRIVATE_KEY" > "$PRIVATE_KEY_FILE"
  PUBLIC_KEY=$(echo "$GENKEY" | awk '/Public key:/ {print $3}')
  echo "$PUBLIC_KEY" > "$PUBLIC_KEY_FILE"
else
  PRIVATE_KEY=$(cat $PRIVATE_KEY_FILE)
  PUBLIC_KEY=$(cat $PUBLIC_KEY_FILE)
fi

if [[ ! -f "$UUID_FILE" ]]; then
  UUID=$(cat /proc/sys/kernel/random/uuid)
  echo "$UUID" > "$UUID_FILE"
else
  UUID=$(cat $UUID_FILE)
fi

CONFIG_URL="https://raw.githubusercontent.com/xiaowenlaile/reality/refs/heads/master/server.json"
CONFIG_FILE="/usr/local/etc/xray/config.json"

CONFIG_TEMP=$(mktemp)
curl -fsSL $CONFIG_URL -o $CONFIG_TEMP

TEMP_FILE=$(mktemp)
jq --arg new_id "$UUID" '.inbounds[0].settings.clients[0].id = $new_id' "$CONFIG_TEMP" > "$TEMP_FILE"
mv "$TEMP_FILE" "$CONFIG_TEMP"

TEMP_FILE=$(mktemp)
jq --arg new_key "$PRIVATE_KEY" '.inbounds[0].streamSettings.realitySettings.privateKey = $new_key' "$CONFIG_TEMP" > "$TEMP_FILE"
mv "$TEMP_FILE" "$CONFIG_TEMP"

mv "$CONFIG_TEMP" "$CONFIG_FILE"

echo "$UUID"
echo "$PUBLIC_KEY"
echo "OK"
