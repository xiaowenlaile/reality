#!/bin/bash
# https://www.youtube.com/@xiaowenlaile
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "This script requires root privileges."
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

apt -y update
apt -y upgrade
apt -y install curl unzip jq nano

if command -v ufw &> /dev/null; then
    ufw disable
elif command -v iptables &> /dev/null; then
    iptables -F
    iptables -X
    iptables -P INPUT ACCEPT
    iptables -P FORWARD ACCEPT
    iptables -P OUTPUT ACCEPT
    iptables-save > /etc/iptables/rules.v4
fi

echo "OK"
