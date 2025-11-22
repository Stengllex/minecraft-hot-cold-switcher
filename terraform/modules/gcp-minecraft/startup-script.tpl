#!/bin/bash
set -e

apt update -y
apt install -y openjdk-17-jre-headless screen

mkdir -p /opt/minecraft
cd /opt/minecraft

# Placeholder - user should upload their server files manually or via CI/CD
echo "Minecraft server placeholder running on: ${server_name}" > /opt/minecraft/README.txt

# Autostart logic (disabled for now)
# screen -dmS mc java -Xms2G -Xmx4G -jar server.jar nogui


