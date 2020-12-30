#!/bin/bash

echo -e "Creating tmp dir"
mkdir /tmp/fix-wifi/
cd /tmp/fix-wifi/
echo -e
echo -e "Cloning fixed hostapd.purple.conf from GitHub"
wget https://raw.githubusercontent.com/teodorcucu/raspi4-smoothwall-wifi-fix/main/hostapd.purple.conf
echo -e

echo -e "CD in /etc/hostapd/"
cd /etc/hostapd/
echo -e

echo -e "Backup the old hostapd.purple.conf as 
hostapd.purple.conf.original"
cp hostapd.purple.conf hostapd.purple.conf.original
echo -e

echo -e "Remove the old hostapd.purple.conf"
rm -rf hostapd.purple.conf
echo -e

echo -e "Copy the new one to /etc/hostapd/"
cd /tmp/fix-wifi/
cp hostapd.purple.conf /etc/hostapd/hostapd.purple.conf
echo -e

echo -e "Setting up PURPLE_WIFI Variable as eth2 in 
/var/smoothwall/ethernet/settings" 
echo -e "PURPLE_WIFI=eth2" >>/var/smoothwall/ethernet/settings
echo -e

echo -e "Done, reboot now"
