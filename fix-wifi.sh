#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

echo -e "${RED}Creating tmp dir${NOCOLOR}"
mkdir /tmp/fix-wifi/
cd /tmp/fix-wifi/
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e

echo -e "${RED}Cloning fixed hostapd.purple.conf from GitHub${NOCOLOR}"
wget https://raw.githubusercontent.com/teodorcucu/raspi4-smoothwall-wifi-fix/main/hostapd.purple.conf
cd /etc/hostapd/
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e

echo -e "${RED}Backup the old hostapd.purple.conf as hostapd.purple.conf.original${NOCOLOR}"
cp hostapd.purple.conf hostapd.purple.conf.original
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e

echo -e "${RED}Remove the old hostapd.purple.conf${NOCOLOR}"
rm -rf hostapd.purple.conf
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e

echo -e "${RED}Copy the new one to /etc/hostapd/${NOCOLOR}"
cd /tmp/fix-wifi/
cp hostapd.purple.conf /etc/hostapd/hostapd.purple.conf
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e

echo -e "${RED}Setting up PURPLE_WIFI Variable as eth2 in /var/smoothwall/ethernet/settings${NOCOLOR}"
echo -e "PURPLE_WIFI=eth2" >>/var/smoothwall/ethernet/settings
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e

echo -e "${RED}Add /usr/sbin/wifi start purple to /etc/rc.d/rc.sysinit${NOCOLOR}"
cd /etc/rc.d/
sed -i '$d' rc.sysinit
echo -e "/usr/sbin/wifi start purple" >>/etc/rc.d/rc.sysinit
echo -e "exit 0" >>/etc/rc.d/rc.sysinit
echo -e "${GREEN}DONE.${NOCOLOR}"
echo -e
echo -e "${GREEN}Reboot now!${NOCOLOR}"
