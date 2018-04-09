#!/bin/bash

set -euv
DEBIAN_FRONTEND=noninteractive 
apt update
apt install -y gconf2 gvfs-bin libgnome-keyring0 gir1.2-gnomekeyring-1.0 libcurl3 apt-transport-https
FILE=slack-desktop-3.0.2-amd64.deb
wget -q -O /tmp/$FILE "https://downloads.slack-edge.com/linux_releases/$FILE"
dpkg -i /tmp/$FILE
wget https://github.com/irccloud/irccloud-desktop/releases/download/v0.6.0/irccloud-desktop_0.6.0_amd64.deb
dpkg -i irccloud-desktop_0.6.0_amd64.deb  
rm irccloud-desktop_0.6.0_amd64.deb
apt update
apt upgrade -y
rm -rf /var/lib/apt/lists/*

