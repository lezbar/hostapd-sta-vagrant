#!/bin/sh

apt-get install -y build-essential iw

wget http://www.kernel.org/pub/linux/kernel/projects/backports/stable/v4.4.2/backports-4.4.2-1.tar.xz
tar xJf backports-4.4.2-1.tar.xz
cd backports-4.4.2-1

cat > defconfigs/mac80211_hwsim <<EOF
CPTCFG_CFG80211=m
CPTCFG_CFG80211_WEXT=y
CPTCFG_MAC80211=m
CPTCFG_MAC80211_LEDS=y
CPTCFG_MAC80211_MESH=y
CPTCFG_WLAN=y
CPTCFG_MAC80211_HWSIM=m
EOF

make defconfig-mac80211_hwsim
make
make install

reboot