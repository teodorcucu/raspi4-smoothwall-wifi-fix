#!/bin/bash

echo -e "Creating tmp dir"
mkdir /tmp/fix-wifi/
cd /tmp/fix-wifi/

echo -e "Cloning fixed hostapd.purple.conf from GitHub"
wget 
https://github.com/teodorcucu/raspi4-smoothwall-wifi-fix/blob/main/hostapd.purple.conf

echo -e "Backup the old hostapd.purple.conf as 
hostapd.purple.conf.original"
cp /etc/hostapd/hostapd.purple.conf /etc/hostapd/hostapd.purple.conf.original

echo -e "Remove the old hostapd.purple.conf"
rm -rf /etc/hostapd/hostapd.purple.conf

echo -e "Copy the new one to /etc/hostapd/"
cp hostapd.purple.conf /etc/hostapd/hostapd.purple.conf

echo -e "Setting up PURPLE_WIFI Variable as eth2 in 
/var/smoothwall/ethernet/settings" 
echo -e "PURPLE_WIFI=eth2" >>/var/smoothwall/ethernet/settings

echo -e "Done, reboot now"
