#!/bin/sh

#NUM_CLIENTS=10
#sudo modprobe mac80211_hwsim radios=$NUM_CLIENTS
rm /var/lib/apt/lists
mkdir -p /var/lib/apt/lists/partial
mkdir -p /var/lib/apt/archives/partial
rm /var/cache/apt/archives
mkdir -p /var/cache/apt/archives/partial
apt-get update
apt-get install -y hostapd wireless-tools
